Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF761C63CA9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 12:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80E410E35C;
	Mon, 17 Nov 2025 11:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="myGhlPJQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PT5nfZpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A810E1C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:25:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHAKN1a3932608
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DWoPim49AaUbsvQ7OBAsCz7JIUC8pQiq8bzO11oAofg=; b=myGhlPJQcQUN3m1f
 vhojFWveibAK/5N+ThHxznofkP3OsfaU/11houm4nMWY/8HtezzeDju5KtsPBkBj
 g2+1qjNG3lv4H5aEFCD8eF0prlhl6bs7i5YBdiKMGnSJbYBLVML9NGFw6XvgwbuK
 NX9LSNOihJGx69/rcggKgGvDbaq3WgRN6m8nUGn0FIVPe9iKgfESWu3e7AuSfrSJ
 l1nsjZIW6bvAFjW/eNACObI0w98R7naQ2AkKMFh0TZEuPEK27QkMiiuGLgXetXbe
 IulyK68xizJoMCBi0/LRLO9og/AW7LpvMoSvcYXFiyfWYMyogyIzXsQU5TuO0NDT
 EM5+1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v905f2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:25:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4edaa289e0dso21169501cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 03:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763378740; x=1763983540;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DWoPim49AaUbsvQ7OBAsCz7JIUC8pQiq8bzO11oAofg=;
 b=PT5nfZpyRqvAN06aKD5sF7QCTvSySaX0QaZ/vX4uQCcTHvMpVVzGUahdTtfmjL0jPR
 whdn9aEcoq4WV0WGTcqkbXfjwkn+oHs6n+fDNvxkw41F4kf3lu+P+Koh6OVvi8IricNl
 b4Ug3Q3oZ80KsxZRm2rfOUNfTnVzv+L8JitUIaKgZriOVmBN0vxkHr3VMLghTSQgA8bm
 XkAFlePbxI1dV4lrgw8qcManX+BBvAV5J9ZOpJaaLzfWUS7ScNY4EsDt2WLsKGHP+5Pc
 U28ZOuK2ykWnKIG77K6CI5lVq3kBLyp6LreKHto2A8sN8aPE3p+tHiVit2vlfX763xdX
 N9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763378740; x=1763983540;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DWoPim49AaUbsvQ7OBAsCz7JIUC8pQiq8bzO11oAofg=;
 b=FwvpJcVx1n8XrwhweKAiqTa/tl+4msNLCyQU8rqG2/y1DinqHK6y8jfdoQCSp5DQJl
 0Sj3sXUUS0FCA3sR2e/rmKkABIpKcCvgAS51QzXHrluAGyqY8S9U+jHKUJw/+ZM3iJt3
 b5gzkH1PMNC6R6MiE2lGAi5/kXu3ZihM5IfTQkyXQfBBoN71XuN7fM5Blmi6G0b4R8ft
 n/yV0sm/8hpFmf17Wp4q3QFmZ3j0d8bayd9/OZIPBhIad+Be65tayOGgIGzPlvDcHRgu
 k2A2qWVd87wjy9EjInK3CmsgRm4e9atcoGXE2zFm1/rA4w28V+2sp4+UD7K0PFrFz3y5
 Vw5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPxtR/2QsbV+MmVX0RiITFrUc2ICOv56vGQFl8K/INrynNOPCPaEVYY3z4+DKHP+kaVojXm+A2t9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQEW+SR40B3uyt8nXK8E+WMUboEFfJ7AmWMZim0RhYRtiMoPD+
 0bVnKN9kVOVaOd60V6ASYALvLWaKsfwCYod2WPatrPVHahuFKIiW7O6HQhtTTxK1a4la45YYyDl
 JVWO2P6OPH5NYzL8kEAWSBHaeoNmNN4YhSl1zu2FZbj3PmLHgmsv1cPSV6cgiWMQu8BPZXO0=
X-Gm-Gg: ASbGncsnxKaKcosU/Bf8LZTWeOXhb5Q2dElynem5AbFL5/XRR8YZWtEtHHyTgkDnAGS
 TKlw6V0jnaELHwiVQwQPFM+eTVKYNOGGmIz1tYCAPrK2ibLIv7Kbmp8IhP0Ud1kooVnShl9b9X+
 +EcYpnUhg6uv2VbVX1giZZxzY1pwk9YaTBEnRUA9W5YFVelxl75vhQJBToRZmnVVWmsBYsRltwA
 GPP6P2GOBohIxxurKKrld1CYdFdU5wVhCh8m7+Sr3GCv/pehaRFNj+FSUYSRYdGLZLaZj5k4DzR
 zlPH/CcU8nI5GhEGWPufNoF61GkvxFjp+J/YNFf6K+Migh7Gp8wuiwXQZ8RCiauvufoG8DoOQ2V
 5XRFxMtyXNoqJRB1oJt8GXXDbz8b7NvpiLD8zvLNWqKNRzuRXartZPv9G
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4ee087ee1c8mr52470711cf.8.1763378740428; 
 Mon, 17 Nov 2025 03:25:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb4Ps3dPzCqOHGYfilA8tMKme1OEdnyPVxzwMviUQvqScJt0idpN8FF+7TPF+Fjwwa4wsGQg==
X-Received: by 2002:a05:622a:4f8d:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4ee087ee1c8mr52470441cf.8.1763378739967; 
 Mon, 17 Nov 2025 03:25:39 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d839esm9776968a12.8.2025.11.17.03.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 03:25:39 -0800 (PST)
Message-ID: <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Federico Amedeo Izzo <federico@izzo.pro>
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _cY5dGZ0SHaSDakLxw1tMyY9dbuk8Pq1
X-Proofpoint-GUID: _cY5dGZ0SHaSDakLxw1tMyY9dbuk8Pq1
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691b0635 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JlwW-Zz180dxR8tk6I0A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA5NiBTYWx0ZWRfXyo3sIGi+wShk
 /wpoz2FbDaHWIJhOnHi4KpuviIMO7wPByfAPf/i51W4bE70WOMGV6qRVn+OJiM00ys9FvWEPrP3
 tvwHvueCtPxZpE8PrMIhkZllZeKDh+GeTMFQOx+GE1wDx9FxbEk8xhFky2sbDIgsqcoYrCeNZEh
 YqngJa1jIhPP6u42zMpZQMbK0A4OGM/crsDiM5tMlsazazaMK4zhzye0z7xQsNuw38b30WLHe8r
 msi12KaeQKGVe+3Udha0KJIlngwsYgh1+J6IPv/WDTZt1leXuSkr63hrnNBnGC6lbEbuieW3Yfw
 vBszxIXKcHFFUWPrb6PpyeTO4GIfU/0f+6mzhWSdtBmDKVJzi0+hRW6NO/wyy3a/Sq3yX8eqOYh
 MdWYMpz73kYDJDPUaxwWvkGXUz8yDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170096
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

On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
> IGT reported test failures with Gamma correction block on SC7180.
> Disable GC subblock on SC7180 until we trage the issue.
> 
> Cc: Federico Amedeo Izzo <federico@izzo.pro>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Most likely I will squash this into the GC patch
> ---

Peeking at downstream, 7180 and 845 should have the exact same GC
(v1.8).. it seems like there's an attempt to program it through
REGDMA instead of regular reg access. Not sure if it's actually
necessary or just an optimization

What tests are exactly failing? I couldn't track it down on FDO GL

Konrad
