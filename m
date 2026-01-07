Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E4CFE258
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2003410E5E3;
	Wed,  7 Jan 2026 14:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldoPIHBj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALYznvo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB0B10E5E3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 14:05:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607CsRqe2239351
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 14:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /dYPUxZoqHhXGVsRsNUTNCnu3BPPm6di+RgA5mKj+Cc=; b=ldoPIHBjr0J4Kklj
 EQjEnUa8ADWp9M7lYVVQn39SuIKTOBnYVM+rnhq0BcizUeNc5pmtXvvvucdhRNAL
 eLxUu+pIDjBKo1JXCE8V/3aLZyN0sLl1eo3vDPGBP0ZXoNHe4C8wWTKIRBmUPYiz
 vtWqBRa4AGMmBRui9uWMmpfJRTq4sCzHEdUOXDKybVXNwysnyfblEcjA8X5P88Fr
 MQoS57S+Yp4tigvLlL7s9r+aw6edTjYIRzjjypt8NOpCHMCL8EzS5dHw2wvyhAhT
 O/KByy83gabv1tWoPgonqHidobYG5nOyzvr51B/ABKtXH6cbaenHnlrpKUFunK30
 gc0uaw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg06ky-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 14:05:40 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-646c87dca90so604447d50.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 06:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767794740; x=1768399540;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/dYPUxZoqHhXGVsRsNUTNCnu3BPPm6di+RgA5mKj+Cc=;
 b=ALYznvo52JU0g6bs/PBjgNPVQ7wZgNgmJrgnPLmFD4X299Hrxi6DgwVXnfizvHe/q1
 FNgzVBy+9SmqKtic1Jq/LY3cHA9pd1OlYZq7MrMBu/617wL4qunV39hlXEMjE0ZOm7DN
 vgm/i3K3+jlX3bGK8dI6am3Zsol6BtD4ZaI/RqNJKG5/k1WT/vX7aTUb+mZe7B5tqY/z
 Hbjmq4yaJBxRtsAai5kKvUmHbCZQ9vJbFIWGKLoGqHmgduH0dejMsQoQEX7dx1d8/rb6
 qB4GPmh8vmXI8oFZNW2fHjNeZVL4kMDgkrMIkjhfYjwf9C4SioBeKZux8YkQHHUtY8GE
 R7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767794740; x=1768399540;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/dYPUxZoqHhXGVsRsNUTNCnu3BPPm6di+RgA5mKj+Cc=;
 b=k7abin8gk572fMksSn6HP1cXh0ikezY7YmXVfI6Ls4IohlrD0ptIzUDGGagUZ/bb3v
 eMAAsrg7gD7x3bXWrHNLF5GHLPZsTRdqoS8yvpmEJnuIh+zrfI6mr4/HNt/JYtanEzMk
 Fv0q5mDJHbAomVTYyoDuLsLlvAp6jCGKRku9OOwqDv6vGwoP8rtTySjaSudPSpDoEssV
 hfulpgne24/j7v1H1f+eIqDlhrt9T8RlsVis4DMN53Zv9T5jy5Pd6FEj8tTZ99iGyMi9
 kxMNniveSDgnykncpfdoVuqMzCABE4t/FgjMhLfLFTuB6cSpTBn4CRSmhOUw4ZuIW3Ud
 JgeA==
X-Gm-Message-State: AOJu0YxjPtoKQaJW7CkjU6PQBOGdck0OAiVgIzli+a8GX7mECMZjHQio
 ShgCxLtuBBe33SOaKdNhDP/lUxh+oDrQ8Phj+0M0seUtdFLd8p1T+/1wjoBZwSEyxnrPHlKcFDc
 r2jDNcGlyJBA6sRtCYd4kvysuynz2tDNq3rv66sNaGhj7J7C6TcJjw1sS3gjwZ5u9KioqyqQ=
X-Gm-Gg: AY/fxX5YEBz9+R6HyIm3bnX+jixz54u1mo1RetcPo+/I8jQ9IT7i1azMVC2XrbBVAC2
 qJQ0wz6Xx/Ne8M60jqBTUftCzj5pHm7f2VAWBT0rDZHnzo2gqdpR7XDMCc+cjTLYgK/dL/qEXtq
 7fBLOgIg2Xmu6lF37SxCTF2OglKARtSK7UmTkxC2a3sGNXdPUYuhndrC6IhsXeaq2pnTese5QKQ
 rjGJaeP4Sw4cFsZtisCJ9yt9fsI9D0HQyPs/QWVipARpDBbc6YqnS1Sb4JrCPrwv1WaIUOaxCV9
 RhQuE3ynaWRP99sV/RpeQGHcjKgPUBJd9yFe52+VjeaOYBF9jRqULMWrKL6a3K9ylgy78FrVoYA
 zofzXO8zYy8xjIajXcxoWXupJoYjWXbqvdbeq4LOc/eEHBKW9INKOUXV2Icq8jawgw6Q=
X-Received: by 2002:a05:690e:161c:b0:63f:b410:e8d with SMTP id
 956f58d0204a3-64716c7da8cmr1450657d50.6.1767794740183; 
 Wed, 07 Jan 2026 06:05:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuk8dtNnNc7djajDkI2qFNJzxGYcVWgt4Hwy4aMZohg0n1wAnt/4mZtVfjRdh0tsRspfFjoQ==
X-Received: by 2002:a05:690e:161c:b0:63f:b410:e8d with SMTP id
 956f58d0204a3-64716c7da8cmr1450573d50.6.1767794737711; 
 Wed, 07 Jan 2026 06:05:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a27c755sm527241966b.18.2026.01.07.06.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 06:05:36 -0800 (PST)
Message-ID: <990bc3d5-40d7-46c8-9e14-192aac7fd2cc@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] backlight: qcom-wled: Support ovp values for PMI8950
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-2-5e52f5caa39c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-pmi8950-wled-v1-2-5e52f5caa39c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 15xXBDAV1_nleN293zi41OBceU6hjpcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwOSBTYWx0ZWRfX8VG2OtcH6nMd
 WhnrbufEvDhAct5OealRhsAPUDV3FGZ/fhL/BuTK79ACbQLoKU9XCs6xowVFxjtMVJ3VudkdIr0
 mpuYdgrboQTe5BsJHD+D95eiTLRqahpC41SjT1RYr+Pl8DCc624q5r6SKkujJSGza5lnvUuX0Pe
 wLIIU2f5XKJC20t9ZyxICr/9XsYw6I6n3CyCt65xHT4h5RL7EKHOf9xy0Nn7q7cZA/Ckedo/P2N
 UXaas0eSWXUb+BIzuhkevquoQqPAn5XHRkxHid4y2wnlN5wGykN8566G3RO1o+KSV4f65NsPtVt
 dAWRUAS8RypTZXcjQHURm/akG4evFrF0wPLqLOYuGkQ2E0wZflPx6lSM33zrLxAnPLeDBpYhmpL
 zfloo/PIzcTy6bMxcterBIVEHVNRaz3vaGrVVGKv/s4dzPTPsTE3c+o2RaXjrWiNUtTNtH6QA5M
 cfdheSH6pqQ4DjO7IkA==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e6834 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=M3M7KMW9Y1EPzfeyKr8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 15xXBDAV1_nleN293zi41OBceU6hjpcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070109
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

On 1/7/26 2:31 PM, Barnabás Czémán wrote:
> WLED4 found in PMI8950 supports different ovp values.
> 
> Fixes: 10258bf4534bf ("backlight: qcom-wled: Add PMI8950 compatible")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

>  	case 4:
> -		u32_opts = wled4_opts;
> -		size = ARRAY_SIZE(wled4_opts);
> +		if (of_device_is_compatible(dev->of_node, "qcom,pmi8950-wled")) {
> +			u32_opts = pmi8950_wled4_opts;
> +			size = ARRAY_SIZE(pmi8950_wled4_opts);
> +		} else {
> +			u32_opts = wled4_opts;
> +			size = ARRAY_SIZE(wled4_opts);
> +		}

I really don't like how this driver went about abstracting parsing
all of that, but that's not your fault

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
