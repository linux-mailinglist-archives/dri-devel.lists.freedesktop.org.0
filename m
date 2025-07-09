Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C42AFF1C1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE2E10E35B;
	Wed,  9 Jul 2025 19:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cv4D78Ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C96610E35B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:25:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Coj61014430
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Jul 2025 19:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LxJmEoIV/L+emefvsrdmnd313iEFnFzJl4/I7Di1mus=; b=cv4D78Ud1X3h/gCs
 qPMaz+TMm9VS3DqFYLrBAG6epgV7AnecF3VKdYafxnq96U7AvPb/Byy6ohPh8nKA
 dQgUz8NI44qwhmy5kw9rdwcNIzb+AFXLESYBSLjEfFsAJvyXIJYRAi2oz0AU0C+d
 ynxwrAJgUO1lRJZ3HjzWZ+nb/vWFjjv7WkEJp7jlNLznJzOs0pAUlS7aWrN0AFxh
 MXM6hd8lJsUfzK4/WJroEX9eLavgIqZLx8B1jpReiJPX1KiQk9sN/YBfw4/kv2Bl
 o6GMXRPVDe203Sar8X8p50i/mATIj3PkrixRVGhNjdBkaMmvJi8wUNbh+VsuV1+K
 DZmPmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b134x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 19:25:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d09a3b806aso4056585a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752089131; x=1752693931;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LxJmEoIV/L+emefvsrdmnd313iEFnFzJl4/I7Di1mus=;
 b=EqRzBhgqroq1CR6gX5Znnke2c2/PPE773gdORurH8vN1YSw9wJXaoVl0Ygg1BRlvz6
 GXxOzUmhQu6sN7jHRE0zqkveDiSLbxdNTaifOKBUGMKrT4ImLOXAflVG61Aae3gCnew/
 m7YZAL9ncMDQwMS1wGNw1F1BrsfTQj/ewGp/uIz/zAT+5Hi1y3+nfsS1dbiIfOy8PCKb
 KL2DKtvh+3XOEkNz8L+3lRIAitknf9UvamUkuGLygU2Vkij1e3KTd55wuffQC4TbXDUR
 LvMiEZE2MH0xuXwI2rJgAmHObkA6lT7UnU2iVZn9XlACUZ5ls3skboTq/huSF2Zqm/PC
 hYtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHsHE47ef7v2PUYZjAKbYw9x6B/LtABZxhFqkJRZSFpiOiOJ7Aqyw70Ffp2VHTeystbbBZl80kGTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2HeAKPFon9nipmX5NLawpPH6/weUQFOx3FbVUldxUv1WFPA92
 mvufh98VzoIHyGux//KPMGAEQV9+kYoqbH3n3vKJx3Xjarb1ARy6y2eiIE4l7k5WR88s+ti37T6
 rzbw5KC6J3ZUZQv9USkaU693C+3HZwXajRJmwcFiTibpmfh84YM8lJ0rIABm06gk2Om7fIhE=
X-Gm-Gg: ASbGncvsmO6hTY0MjKBaqrR5tI5xAWM3SBpHX4Kh4gmQKuOGX2H8uMIz5+uTSRpr9Lz
 h7VHTBku3HAXSgpr6RET/oog+DF+pQuvp7PaP9jACSy6e2aQ14gtEtSpjt3H44+3qZLkJfDPmfw
 rZ/MpPyiElFzqfGlMb1/7CHmAa5Io7r3Bmq8OJEUVGX+cLqsCsEMA/xSb8P6vx7o6tj10Lr9o1S
 2GtUi3+6Z+04oGf4tWDi+oXMcjxO4LNSr9+C+rYPJ6Arn7EQ9nCRd9Lh7dEwK2/D8ChYNDi5KEr
 G2pSzjPqnvIKNtMVz6eHmkXe90AVxHO527A894DdU9djncsAdzOWWcPxlM8fZoJLC22XU6S1S5q
 wpO8=
X-Received: by 2002:a05:620a:4396:b0:7d4:5cdc:81e2 with SMTP id
 af79cd13be357-7db8a26a97amr207084085a.13.1752089131448; 
 Wed, 09 Jul 2025 12:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF0lD4eFqC8H6SYk9QlZhxremi9oqzguzRcKWuEh7z55IS83KvKx0SZBgDPwxIqBeKKCCbcQ==
X-Received: by 2002:a05:620a:4396:b0:7d4:5cdc:81e2 with SMTP id
 af79cd13be357-7db8a26a97amr207081385a.13.1752089131024; 
 Wed, 09 Jul 2025 12:25:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b5e7c2sm1159545866b.148.2025.07.09.12.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 12:25:30 -0700 (PDT)
Message-ID: <f5ea9bc1-7617-4573-a10e-3499161a7819@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 21:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] misc: fastrpc: Cleanup the domain names
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
 <20250709054728.1272480-4-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709054728.1272480-4-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686ec22d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=UMl6nZT6BRNR5OdSVxkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE3NCBTYWx0ZWRfXwXXG2G7Mym3l
 8cxheqR/8Ycoj/ty6gFEOyhG+MGBkNBrCSXwT+AQB/QOFAWXdP9oa8+9dlBmZSUGmy8k5dyUY2O
 ldk3mX5o4Y5AcFeqOn/lyzsODriDfrgfPmSINeGD0YDg/Aam5Y/r/A44XEqloM4ZOKdyqGxgxh0
 ZqaispPWNiIvcm0i2wzV3lgCYvca53F4156k0IngAQuNjp5icKYxWBjYhenBZbPYaKKZ4Lz6Mby
 y+MLOIVK5OGdbmxXDiyFLiziq7ju+fYlMdpqB1FGmmd8OoeDB42BI7p2QMFiJK7jnXUAMexs4FU
 GR8D+szOqvj0H80wmBh/1XSLUFquJw3UqhxniZwdLlrpgJZfv069KoLl9yXO5C6KNvmyawAXJka
 zUkoXD2faCb2Wl/+CFS37AidTVizkkwlwu8OakjnXTJ7WCqA8q2FypcMXqN5/LBIN+4Uttes
X-Proofpoint-GUID: 58C04n1ZTtHT3ThD6UcwSuPqXej-AhkX
X-Proofpoint-ORIG-GUID: 58C04n1ZTtHT3ThD6UcwSuPqXej-AhkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090174
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/25 7:47 AM, Ling Xu wrote:
> Currently the domain ids are added for each instance of domains, this is
> totally not scalable approach. Clean this mess and create domain ids for
> only domains not its instances.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---

[...]

> @@ -2330,21 +2323,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
> +		/* Unsigned PD offloading is only supported on CDSP */
>  		data->unsigned_support = false;
> -		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
>  			goto err_free_data;
>  		break;
>  	case CDSP_DOMAIN_ID:
> -	case CDSP1_DOMAIN_ID:
>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
> -		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, true, domain);
>  		if (err)
>  			goto err_free_data;
>  
> -		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
> +		err = fastrpc_device_register(rdev, data, false, domain);
>  		if (err)
>  			goto err_deregister_fdev;
>  		break;

Taking a step back, do we realistically need these checks at all?
I would assume that there is a layer of security on the DSP side
that would disallow running code in unsigned PDs on e.g. the ADSP.

What happens if one skips them and attempts doing just that?

Konrad
