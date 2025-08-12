Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665FCB21DC1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 07:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6B210E596;
	Tue, 12 Aug 2025 05:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjfgSUic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB04F10E598
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:59:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJqe8P008272
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UVs1qOUwwZ9Ygbyop1f7a1vL6vie0gD3Yyv8YMlSSUg=; b=JjfgSUicPYhkaNMH
 ta2JmlpPCCMD7Nf8UnH93O46VdDpISPs86GqyO4AXno7PTVVdKGd0s9gzw8grMKa
 YtXrbqCmURAsIkJTK4hnGDJtDJZKUlkrMgAqwggCB0/Oyi0aoSXAI8srDYa1AqI6
 2IKrDcOw1xHqxWcW8RHBx9CiHvoB9OzIFOFLOLZVjJHkKNAv5hB+JZqLnzqwkBQL
 1GxKrXH6TpWkslxGINc1KqfJP7H/24TJaNGAc4rWht4OdZFiuPqb9UYnQ9F3etfx
 yudSr4l3RQI+OcUsDef+akAwr3VMf2d7tFANHZPKYv/j+N0/5xG3UkEDDCFGxfn2
 Tlf2Hw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjjtcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:59:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-243049e6e1dso1163975ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754978371; x=1755583171;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UVs1qOUwwZ9Ygbyop1f7a1vL6vie0gD3Yyv8YMlSSUg=;
 b=SEzOLd/cAgkOslLAj96WfS6LCWtHVQNeUBMOQ+zjfhAKIR9dcMOClKnvSvHj1RHLeQ
 LTo9uuz7yyJbkyiqZavLmVGg5xkdcITkhwaMkPrL00MOt9yPRzkaC98P3A4svZ/nZoBV
 atx7g9qvv7RgRHMoykNupbaD2GYLGaHk8rcNddJMs3cB3IP6+Eo9kxMcyeNIKCWcJOtp
 czg2AMSWaRNpmhq1kT6y6oWzhbqwpXIPotZt9F2aEyEajY6JDX1WPtlZJf4l3OkCP/M7
 yx3NXmbi2b5yuTkT3zXUlPuHDbXGAwCAx3N5JjluzjELVfVy2OjKdLyoFwbNCG0tdNVa
 6lbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5fhOHRuk150mC1Lm6mcKhuPHcmvTBEomkqJG0QCRLtApRVc5K0K5o4ca+AdxOPXVTViGydDj5oyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKZi9a6F5WJRLUfgBZfzMdbQBYrsNBTFWbub2oTV7LuRTsoML7
 bxJF0+1dj2oU5pe/20LE7rGfYI2qi+0k3GWKkXlbCGcQIeQviPSQeFQa5tFjNULmOH9kSYDwHhb
 5U+b8hfW/InMZkxU2YvB2ieJrzZdUG4IZZ3FcDexujAPAu5R+x6ekxVEszbOPBF5E+5vBJmk=
X-Gm-Gg: ASbGnctm7vEAVxUppGvcjOiM8VJKd+nBVGvhU8DoLIwBHvbD8JoJyprkbNQtXRp3D8D
 2CHUR9yGs1k54x705zYP3LoKSF8rZ8Sq8K0pEeqV7OEfZpta21OXtAsa3o9WgBaBIv3fgd4T8Le
 KZ+ST1mY9l93cbjq8j12bRKCLwa7DGglyI8HecQkMS9wzwJIZVdxTawjL0wkNYj5YBnG5mAWARv
 ZRqCxf1RYUeoKGGMkr8EEfZ5O1JzuwRQSIL/IMWkOeAa7srSlxst/LRMd7S2xq/aHLs3knLEabZ
 EZ73s1xMTEkGadGp+3DK5VRmBOgZ8l2TW6GzEufbHJh0Vo10OQuIq3FRgnF7uxqqW2YFWtU=
X-Received: by 2002:a17:903:3b8c:b0:240:3909:5359 with SMTP id
 d9443c01a7336-242c222c92cmr223933815ad.40.1754978370742; 
 Mon, 11 Aug 2025 22:59:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn6qxc6dEvtwqsdAG3FWWRuYtHLzpWr8RjIwuXy8tAJXkzisuhVTlP6xpTp/Z157QjqC6fXw==
X-Received: by 2002:a17:903:3b8c:b0:240:3909:5359 with SMTP id
 d9443c01a7336-242c222c92cmr223933365ad.40.1754978370317; 
 Mon, 11 Aug 2025 22:59:30 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899b5bbsm286877015ad.128.2025.08.11.22.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 22:59:29 -0700 (PDT)
Message-ID: <beba23d3-b7e6-4368-b2bc-b802bde4166c@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:29:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] misc: fastrpc: add support for gdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-6-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-6-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX19L8keWWlGWm
 SyNu2o8Xb5Rp1wQql/qqfS6uvfZEMB9OGsQiYoSHgW8RTnD+PHONvPyav+n7GcHuFV/ghB3HFgG
 oV35IcaiT1Y/aTbQQ7gFp1HWfanytQGkiuOwrgkcSIFA5NvuzqcD4BSbpDocNTgfcIizwSZSvY1
 ZcDhULrpjF9uWvZS2e58RJbFOdzvBhwZapgaHryznsMt724EE70uooJt/72wgQQ3Sviy3oebvAC
 ZB3xZ/WjFJDoXV1r7YEMmTONQ4qdZbUvU3kBqzMgC4wpjjgtom7+o5r11HOVVZk5kqZMyGo5cay
 o8h6ThrbM3AiQoHWADTUrqws+nbKHipVt/AOHXTbp3zYaRA1YLKgHAUWgUYOh7Le6+Hx8h9n15K
 XTHdxvgq
X-Proofpoint-GUID: PRzyC2R6-DedsqUi9oYWn0H9XjtCvRSA
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689ad844 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=OU-qGZapnvjOigiI56EA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PRzyC2R6-DedsqUi9oYWn0H9XjtCvRSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
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



On 7/16/2025 6:58 PM, Ling Xu wrote:
> Some platforms (like sa8775p) feature one or more GPDSPs (General
> Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
> a FastRPC implementation, allowing code execution in both signed and
> unsigned protection domains. Extend the checks to allow domain names
> starting with "gdsp" (possibly followed by an index).
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 85b6eb16b616..d05969de406e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -27,6 +27,7 @@
>  #define MDSP_DOMAIN_ID (1)
>  #define SDSP_DOMAIN_ID (2)
>  #define CDSP_DOMAIN_ID (3)
> +#define GDSP_DOMAIN_ID (4)
>  #define FASTRPC_MAX_SESSIONS	14
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
> @@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
>  		return MDSP_DOMAIN_ID;
>  	else if (!strncmp(domain, "sdsp", 4))
>  		return SDSP_DOMAIN_ID;
> +	else if (!strncmp(domain, "gdsp", 4))
> +		return GDSP_DOMAIN_ID;
>  
>  	return -EINVAL;
>  }
> @@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
>  	case SDSP_DOMAIN_ID:
> -		/* Unsigned PD offloading is only supported on CDSP */
> +		/* Unsigned PD offloading is only supported on CDSP and GDSP */
>  		data->unsigned_support = false;
>  		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
>  			goto err_free_data;
>  		break;
>  	case CDSP_DOMAIN_ID:
> +	case GDSP_DOMAIN_ID:
>  		data->unsigned_support = true;
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>  		err = fastrpc_device_register(rdev, data, true, domain);

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


