Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E6C7B8E2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 20:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BCD10E037;
	Fri, 21 Nov 2025 19:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbgTHNzJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViZp9ykD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A9710E037
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 19:37:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALDZaoD1637295
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 19:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=; b=GbgTHNzJxiwG60iv
 HD8Gv99UTBNl69R4AODx+UGk6mt+6wpw2haFRQ6B/Iy2Azv8g+1Dd/2vI+k2yfm2
 HK6ahk4COUcOSugalgcpu4tVnjc1uuz9CRRCWf/Vne2GtHxEekthmW/UCg8jAPPP
 9A7KmqHkBDjmAT4H9wgH2DRMNb9UAEd40a754DnAH6yzIBbGHoTZG3FXeY7dazkd
 aB22WCqJxmcDtD9LEpvB1MhnJDnzSbLBnhzMVv2r6wA6oGItQ4NwGI2XGYs8Ue14
 EiPP30qKK51ZCZnnHOV8r6+b0ZNCEhNOOMPKvF/yxi//lHBV3F1jVAlS4uC68qK2
 2kn1/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagauwuh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 19:37:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b222111167so61050185a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 11:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763753833; x=1764358633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=;
 b=ViZp9ykDYQswzL4UEN0Dlu81D+9ZS9kb4XWhuHMo/uI+X82V+IVVwQMYHdQgla+sLn
 s8Qj7itxJqeipbmwLLrbnvxW1eqlUau+Y9qpreEm1ncOYwOpPMV5e0DnJoYN1rd3T2nY
 FDYri+O0eweWmdn8XWvYjAwPOXnpY86cbvSmQwvPwiFjYWk57zcIdcMTEWfnjXjiz0CC
 le82rgV9WkA05b26JKiTj9uvXzFpxk32wsgsY6BYs5rYuYwTS5Dpqu/tQoiD56LbiECp
 atM5VTsR9dQUp+N75ApTUEwMO5yGGcrt720zjtys0PhK/6Q+zGwP21MvB/a3pdbh0Msf
 XZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763753833; x=1764358633;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=;
 b=ToIzHVEUgD1VWomug5/IOZUMSafYi1vBjWJIZGnVEgvBZzIfo+leZjJQnBn73NL1+E
 8YHrNzEqszSW4nXb5M4RmBr8hqz0F+knItCzdVr/ScVwRS1Ehg4o3Eor9hnG04FrRTsb
 MsGfBULEtavaSd4GiTlZPQYu/o+dxtci5hXh7onAXXhL0umVPVzoyfUYWGzpBBoTSlsi
 qb1t3C/4PdyDnx/SeTCoZQbJEeiRGbZ3o2pWClLCgEzdQ0xKDcEYuUoR6pWSFWQRlHUM
 m1ehIP18J6TaN66oEFwveegWFLuPdxf3OY3qsEkI16aVpCjFIjX/ByICNT/CfVzcBza6
 mzWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxCJIrHeWzchvtgExB3i6+upHFLjSyrp3H81wODAonzpBkxqMwgLHpy/3VSLmb55BG2/0AcoWHJ2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCr1GEIedftoAsX+/+fhBWy5ItVo4lKYm9TmLx1IzLni71xxWs
 P8tPAJxN8biTvmyiLWI4iTTE4j6LvUriFhczMz7PoAwlHyjZtUFuFB6I5tgUTRFF6ZA2JQp+w6+
 vOz+ygrg+QZ6KxCOn8Cbunq6mG3HjtJp6FGN4FvLOD/+Zx2QUtXsLimaqJ1zIH0LGbGbnLmI=
X-Gm-Gg: ASbGnctS1w+Em2CC9ZoinWBAlf7C0XmIbRdPycGMxgG1Kqdm+H2w0tn8wp8CPpqyxpT
 iQek8MtrDjWJJk4fFDPTIgv6pb6vUY0gbMmkPRYUYgCi/2edfnym4571fhEBCO+kYUhZFG5/ktY
 UAQ/Mg6cO1D04CS9dRdtDvl/pdcMNT9Qvhd0+qHLKSYTFNCTQZbsWe597Vtc/3M/HlFKHlk/OjI
 bst7NPCt5lXAiAOHV8xn8AFumQ/e5c09+L8Ts2arJBU8Jr//e653doZuiu8RaN1kgSscDRSJNg2
 XcvIxnQ11e367ajyHMHiD3sXSTCx2QPFGYli6/s7675u93kX3AQ8VqOz8clnzjSeU/8hJDa7/Sv
 T2dfZ6scC3devOtRG+300Z9lxJlLc/ITX2pdczcw29sAo7wZLsQm352cwjfQSz8yDMIU=
X-Received: by 2002:ac8:5fd3:0:b0:4ed:6e12:f576 with SMTP id
 d75a77b69052e-4ee5b768c8dmr26806891cf.8.1763753832693; 
 Fri, 21 Nov 2025 11:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFASboIZYJmm1OIOATNZpv9Q582GAZ36afE2oDGOITF9wMwkr/HHLieiHtkGicM6auQB02NRw==
X-Received: by 2002:ac8:5fd3:0:b0:4ed:6e12:f576 with SMTP id
 d75a77b69052e-4ee5b768c8dmr26806481cf.8.1763753832074; 
 Fri, 21 Nov 2025 11:37:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453642d3e1sm5088292a12.18.2025.11.21.11.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 11:37:11 -0800 (PST)
Message-ID: <5984c06a-6914-4e76-ac15-e28b6928b593@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a2xx: add A225 entry to catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=6920bf69 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5GMbN-XtZ7FmluJEMAwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0OSBTYWx0ZWRfX0zkypXVh0LNU
 XI4sPKDd0aPuHAn0EAA57UZPkxEvrS10hgfzC6pwWbC0V+pkLNGV4MLF5x4qDWyRPk+VqHUaGKU
 dX9SbW0zUtF8c+NpCIwfnaZaJfhldNGIk67uPuFFnYZmSOVjOMctejaEWFcXeCdlc6YBPqNpdz1
 baGp3KGkxz+l15x6Os16SeB1vRHPei3pmugsvIXQo7z7ZM6OHJCZueQzLz8uCR/JjD2kDGBUO72
 hhDHe+YgehcmhDSRY4zfNfxC7mKGigvjvioUpFtY5/w1FFyVnJMCV1aUo5yXBt6IZwG2xc+G5xG
 cD6x3aADrz/RgaXsZlVtm5JBJjqPjhheBRl4lcmgMbdeToG4djLMK9e9WWP3TxEQzHD0b//jM3f
 jzfLlFR2e1SvNiZrU3y5CzpcMCAohA==
X-Proofpoint-ORIG-GUID: yA8rUmjSt5qTiblepc7px4F3n9TI6bA1
X-Proofpoint-GUID: yA8rUmjSt5qTiblepc7px4F3n9TI6bA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210149
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

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> Add catalog entry for Adreno A225.6 as present on MSM8960v3. Most of the
> pieces were already contributed by Jonathan Marek in commit 21af872cd8c6
> ("drm/msm/adreno: add a2xx"), but weren't enabled because there was no
> GPU entry.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
