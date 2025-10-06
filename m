Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1128BBD557
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 10:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF87510E342;
	Mon,  6 Oct 2025 08:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSSvtF+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD6F10E29F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 08:28:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LrltK017280
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 08:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fySFI0+vB4C2jZwTubej+JIBaPURTzcto53v2iuju/0=; b=JSSvtF+EV+lEe3aW
 HdCNglBweJ7uJXfNoYT/GyNTNvVOLaG6JqNdCqvQUqx6Bg1onQwFvG0S5V7hN6qy
 GWU9oH5N+kPsFyQJiGypl4mFosNXvRl8peDSkz1GAVJnm67uQ5y2g7ZOMzTnCg7v
 6L6OZssRWfcWLOFZS9EOsajv5bHTQbTCKWPn6DEJgUzSCNMYPxurMTWd/E1CsKlm
 SFnr2dXyIeb8dEar1Agjt33dL3+DABK9vL0Ogl/A/OH2gw8gf7boUqOH091S+a9r
 MY7GinrPiCmEgvNkRYtSygH49dtSf/0q65Xr0Ifqw4OGNNsIcWRjDwQIaxRdbEaq
 gmdhlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6u8qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 08:28:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-853f011da26so154715785a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 01:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759739332; x=1760344132;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fySFI0+vB4C2jZwTubej+JIBaPURTzcto53v2iuju/0=;
 b=DKp5QkTwO7zM0kwc6RtNl8vSwcAtwj/L4NaAPcWq2RTufB3+7eznFoq9VbOccpfpRS
 8Bu3YILDK0jkboWJzdxUM/m7WDF2LkAGeLtr7zEc1tPqrjmAA9Bme03boq7QYVuIA98a
 cF5M8HnfJezFqwl2PAdj3hRUSQOtWOtPvNKqFEitRC9i2UI+B+VsWtGBtA0tOXSgaXYv
 5Hr0ZoR2FT9w7S+nDs87TDx8h598z820HlT0iO7sjPisZ/iBrKn05G7BkQ8kA3iCJIj2
 mQehuI9XtWzgM02tB+pDbL6dXy92lweQKQHWNglixeuO+CfwePXkqtbZh2J4CePX7qzU
 5SNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHKt63GW1rF22v74p4NwYbdyZhW1naJE0ChRTeYrKzjURgwjwdstyp8MRiUzVVcl8TDygmWbhili0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9XCKDb6zF3CloI2OxCsBVRx0yYZD1LL3/3mmJPr6LYSytmHDK
 Yakez5Nf7HmS34IpKLRbzQUgQY9BL5U/7bA8eTRWuVIOJWc41SiedffDdf2LgNQgA6H4z6wZZ0a
 n7u3aPVArQdtv6zSagvkS325TYmUakbuUE3izZwoQ9BOvi2swy2797QbYk/faVv9zGPPiiY4=
X-Gm-Gg: ASbGncufMrHfsRbmp7s7NjQ/QmqwBVrgfm+wmAVhpRQyELB5f8q6dcLy9JmpUTBVSAc
 kOKT/KJMUMmKn+Jgs0XsDLzijbWFYBT2JF8Vbl4/zx7rLEQXVfXbM+B/CkIhlxQNavDmDg8VEeD
 BaoIBa0rq+e2WoYlhHlhDmP8+S2ZRh8Y1RtbNAMyMbOj1AvkDNRIw2oBQl/YyXrvGhIgGhsWVM0
 WeReWueqlkpO2/xaeahqsiBQ5jXQBt0Y9UEtAAIY/GtbIRIZxu9zyA5h1fQvjEeg0UWe3zVIwWF
 Pe1Mcb8P1+cxQqqwsctmj0BnIZ7u0jU3crOAZHFbqdQClWHoIRstlQb/JXzu0FPvw8SJWgNxQW4
 47ryfK+aLKO14BOSePNJrjjfHQAg=
X-Received: by 2002:a05:620a:28cc:b0:855:b82a:eba5 with SMTP id
 af79cd13be357-87a342f8541mr1018833585a.2.1759739332416; 
 Mon, 06 Oct 2025 01:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExpG1GPi83h7oEKjeN5OxS64YtQ149fVac/bi4Nb1qP6pl8aEItSm3iduplFbNPRMuPJyo9Q==
X-Received: by 2002:a05:620a:28cc:b0:855:b82a:eba5 with SMTP id
 af79cd13be357-87a342f8541mr1018831185a.2.1759739331800; 
 Mon, 06 Oct 2025 01:28:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83f6csm1105339366b.31.2025.10.06.01.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 01:28:51 -0700 (PDT)
Message-ID: <565924dc-84d4-40cc-8826-5143338cca21@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/dsi: add DSI support for QCS8300
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-6-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006013924.1114833-6-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e37dc5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=rHxuBsFVyQJAZ78EHecA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lfHv6Kw_6sg-T67e0kcsARSUJY_YFtGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX3IvH76D+shZx
 bLI4DIvtSCgf6FZMgaSGje19sKy7Un6BBuIv0AFtRXFTB9QMY4Adb/jP5pneh03l2lHaFU8wO6l
 q7eCilkyw8Chhb6vwjZQA7YqfjoD6IDo7E4cU2w1Z6mmohwXmstdQMjCKmuRurSbPsyy1L8Xxhm
 rkAl3rEVWmvyI3wBj5gduN52IznilFv6IbmcAyI5ahkC4IA3laiA/Ydv7poRJpupDWO6Fh4PobF
 dliuveU9GhQ2enX/L658VUy9ax8h5vTjtGldHtFZSKf/g3ClVpfCDQ/QfeqI3p9W5PTM+3n19pR
 cGNT+3kn893sQFTGXGlMgu+8THBEpR7zrlZ9ENPRdc9jIeSCyP7zcV7YPrS+3H/ZStHXhldGHMX
 WhWedSiUceE/qQQVFcELjgHuD8/zhQ==
X-Proofpoint-ORIG-GUID: lfHv6Kw_6sg-T67e0kcsARSUJY_YFtGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
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

On 10/6/25 3:39 AM, Ayushi Makhija wrote:
> Add DSI Controller v2.5.1 support for QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index fed8e9b67011..b60384ea0b32 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -226,6 +226,17 @@ static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
>  	{ .supply = "refgen" },
>  };
>  
> +static const struct msm_dsi_config qcs8300_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = sa8775p_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sa8775p_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000},

"{ 0xae94000 },"

But there is no need to introduce this ops (vs 8775), if the secondary
IO base is never requested, it will simply be left unused

Konrad
