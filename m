Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED9AE3C4B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 12:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF4310E34F;
	Mon, 23 Jun 2025 10:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjBId7ON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBEB10E34F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:29:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3e3tm028819
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oY/pEWq8UWiPBmqLuAws8oKnQaTNtbux5pP95n03QU0=; b=HjBId7ONNyjlnNsw
 7eNy0GZ3RTUo3xMwHCo3sI0pFTLsQVU1EIVwu0BEeLM/fVHJMGn5PgW3efklQJeU
 FXAjOvrFDw5DsWKzluzWxOUv0aNGFFLjslmKRK13Us7Hbhyc3C/CHzETATTxi1nI
 Mnfd4KeKtvacmWcOpFofySjSh1+fvf380VIzBZLpsn86q1zg/tt3v64/ja5BH3pR
 65a/lEUqK9TA8ZiBQQ8ECSEXKEyTWPk9GKjcP0ZP6Ks6QJ/uhc5Jpyuq1W9oR1rV
 60AJrYfHL2uW/CHQA3w2GJnVRQFlJiS5xdGSl6/KGLwqhwgM7GpsQ0gC7NRyKKjQ
 v9mzwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k12xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 10:28:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d09a3b806aso103250685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 03:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750674534; x=1751279334;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oY/pEWq8UWiPBmqLuAws8oKnQaTNtbux5pP95n03QU0=;
 b=e1z70yozZ+BrFBIpmc3Ll9HxQWe5E6bvOUiSftmQOXHMfVSwWaBZ34pS6lA67l2dBA
 6dnMxFIbIHvq983+x5CWAh1GQC5gmOenoEbNX+vzPUTFeVEzaPir1PJaEESeNa5EpDFS
 Mj5zGF1ss8xZ+vgWcTs9UvGqUIPVxQ9sNKn7jreSikLpCVy6EkkNarWtEfl96J5B/3mt
 v1o5+7aT4iHYcm/NXxUYi6XWIzoWlsVbaxDoAux05v5g2wwxqGW/Ppefc9dHNIoM42Jv
 M+fZ9RRlCyyoYJUiDFTOrA8eZgFT8ML/O7g+3yJKDj9BZ8ltDVaOfZ/QTWWYlOqwOxvt
 uhsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIEeK3MMBxmWUNtM2MtFesbK7MvmX1T6lfQQCrhSGc4ArWQ3zj6F1T/MxsaYaiw+5YDh2rwyAa6b8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFcJPBwGwZMb8CJbqKUuPqipC6/usMvF7JhJ6UekJJINm6i44t
 GHstaFo2tulVGZdhJD4AACCQKA3C2GvDj9ZSHOZPagNziW9kZUkRTqEHXpeu0DnTQQeq/3T94sj
 EpQV2NzF1jeZx1hTwJRViI5TdS+zvK9ZMb3ZikL8B+/zi8Ety2XUcrkKA5uV6/SujbrggJfs=
X-Gm-Gg: ASbGncumMKw/ciwVynNnzX5Bhkvwh2iAavGzxVelm6w98zp34YaajA7vqmaR9ix/8iZ
 Vcvuy2BzvaxUy4OyP/nmCYUYKIs1V32tnIA+cFuQ6JJPmATNrdDAl+IqbD9C8vfCVv/vHnclqst
 i3eyvZQQvVbAE9UcDhxnFJicdclv20jmKgCrUqeAe7/FMK1cAoGTnE54VXv7MFVOET6an7vpaH8
 Vepj8e/U17j9gj/Yo0DrtyNNslBV7j2Y2SNmSW9nuXGbR74EWJvv2AT6SARwT9+cQD4GubrsJ19
 vGX18QdKF+Go9IQt/NQoVXrnXxIU1BZRyXrMWKowzZ0T6YRVG7LtP0H0NHmwPaxbo7U5pCc+ye2
 qTT0=
X-Received: by 2002:a05:620a:2788:b0:7d3:c688:a587 with SMTP id
 af79cd13be357-7d3f98cc900mr531990185a.4.1750674534113; 
 Mon, 23 Jun 2025 03:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7wkVQmwGEb5hIUCiShyOZhpRs68AVT/j2EwCWKmfhZrzHdWrHzOcRxuA1TNuM80/duXn3mA==
X-Received: by 2002:a05:620a:2788:b0:7d3:c688:a587 with SMTP id
 af79cd13be357-7d3f98cc900mr531988985a.4.1750674533599; 
 Mon, 23 Jun 2025 03:28:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0a06ed21bsm14139366b.29.2025.06.23.03.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 03:28:53 -0700 (PDT)
Message-ID: <09bf24d7-2998-4a15-9b9e-ba476fc08a90@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250622133820.18369-4-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=68592c66 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=O7bdSeR8FQjTShd0N1gA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eMVbEQMk8D4rSzFNz7iqz33uKkqWmZd1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MiBTYWx0ZWRfX/WmxxsFlHK+3
 ltk/fae9kbp6FN8p0aadb7sa03VeBVbjCiQLI6jW72jtcR6rIxJV1+egKKY6VOwBrj4fxy78UUZ
 cbnfbGSPQdzFH2bY6lhJXaZLych1y/MU5gDSNqTIHTmMFYj7u1xZLMxtehO3WZFYi1dyKuDUpQ/
 Lt9+jxXhPVWVZPbzWsgmO8i4dWiCox19CQBYRlxBkj20ahN8vERmkEKktuOOIB7V+BY5re6xgG9
 CAKn5GDKLpMeNzcIgyz/CEZ4mT9G1LXfryqzLoxhX+zRBiKNG5LEJFplChKD4jyBhe0FxDFOAyx
 DOIhgqzIiTKG49IatLgDB3kd/rHB39nT+MLm+RPmZrCusQ864wqlV3Hxvn7Xfa83re+YJmw3941
 UclirkCgAO0ye/iYumaPE/ork7QCuTA1w9r5vd6YwFnyiO8j/VgK3VA7WF9eENTIWT0IbvdA
X-Proofpoint-GUID: eMVbEQMk8D4rSzFNz7iqz33uKkqWmZd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230062
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

On 6/22/25 3:38 PM, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. Add changes to support
> GDSP remoteprocs.

Commit messages saying "add changes to support xyz" often indicate
the problem or the non-obvious solution is not properly described
(which is the case here as well)

[...]

> +static int fastrpc_get_domain_id(const char *domain)
> +{
> +	if (strncmp(domain, "adsp", 4) == 0)

if (!strncmp(...)) is the common syntax, although it's obviously
not functionally different

> +		return ADSP_DOMAIN_ID;
> +	else if (strncmp(domain, "cdsp", 4) == 0)
> +		return CDSP_DOMAIN_ID;
> +	else if (strncmp(domain, "mdsp", 4) == 0)
> +		return MDSP_DOMAIN_ID;
> +	else if (strncmp(domain, "sdsp", 4) == 0)
> +		return SDSP_DOMAIN_ID;
> +	else if (strncmp(domain, "gdsp", 4) == 0)
> +		return GDSP_DOMAIN_ID;

FWIW, other places call it G*P*DSP

[...]

> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -18,6 +18,14 @@
>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>  
> +#define ADSP_DOMAIN_ID (0)
> +#define MDSP_DOMAIN_ID (1)
> +#define SDSP_DOMAIN_ID (2)
> +#define CDSP_DOMAIN_ID (3)
> +#define GDSP_DOMAIN_ID (4)
> +
> +#define FASTRPC_DOMAIN_MAX    4

What are these used for now?

>  /**
>   * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
>   * @FASTRPC_MAP_STATIC: Map memory pages with RW- permission and CACHE WRITEBACK.
> @@ -134,10 +142,9 @@ struct fastrpc_mem_unmap {
>  };
>  
>  struct fastrpc_ioctl_capability {
> -	__u32 domain;
>  	__u32 attribute_id;
>  	__u32 capability;   /* dsp capability */
> -	__u32 reserved[4];
> +	__u32 reserved[5];

This is an ABI break, as the data within structs is well, structured

Konrad
