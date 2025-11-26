Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6ECC8C101
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F1D10E6EE;
	Wed, 26 Nov 2025 21:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEl/yGbC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OnVdE8NF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C107710E6EE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:42:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQB3vU51668276
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=z+WPrqph3VWDf+dS1LJJ1KlR
 DwYS2bbPcyS/oPhvXlc=; b=GEl/yGbCRUI/c6OQ8IPSjWdNvZXV91TguQT5Y6aw
 PcDDhC5scY/y7LgUKz24x2muKP5S/mYwvC8lYOEnoncCvbwXdqjoUsE2NbXdR/jz
 FDPDpCB9o3SUKKPH8tCkY/jHh0DR5TS77wP/DxSO3XXu09ceQn88dELmbY0sOYIc
 HRaHz2Ut3sJUHivN9lqE8ADjYG2WYLh/XbmpChF9m76oY18Px/pRaWlrDvjCmL/8
 KDWElglI16o3+Hp+CsE5ssTRU29PmAUGTtdGXpfyVRVmAbxJQP5wfVzCXbYBQcNV
 pFGawcgkSYkGLFzJ5ytdsieRRB5WSpmpD8O6rll9+aS+kQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmsnph-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 21:42:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b234bae2a7so48680085a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764193364; x=1764798164;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z+WPrqph3VWDf+dS1LJJ1KlRDwYS2bbPcyS/oPhvXlc=;
 b=OnVdE8NFMsYYePotQ0s3qhLWpPILLEJ2awyNX52aHNPCfipX3jPvEbaMxli9DcsQ7h
 d9v+h0DLyiLoXOMqXfYV4MUukU3THvBDINvmOCThiwEqlxXzQiT/c4/QCuebVtu29LDa
 t0C2qndZwoMX5gP8WVJRLPXlsL2fOvKLd2ZUIkq2SJ5YYcs9O91pWAYlMqfKprrgkOe7
 u3xGCQPElcgnQ1/D1cbvId6Saq7jZMyEg79CRN8hHF5YWcQf7C/y4a2BCaJN4qpwPAx2
 CRjuDO6iHxTEIUmZnMtWa/fmntHNPUFHpqAYJmHDfRCOCMiKlUXwDZyYI4btaHdPUEhd
 NSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764193364; x=1764798164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+WPrqph3VWDf+dS1LJJ1KlRDwYS2bbPcyS/oPhvXlc=;
 b=P7xiYFRULXy+5Vt7W+W6O9sB84lUfo3qPrdc9G53uU2/PRrmKlF7QETnIXg6Otri6D
 iyl1p4EyC3rEXExPuWgTz75OthGwsDCcDdW+bQ7bxaOeXVj54h7JfKa+gBG9FA/OHItF
 ctui1VuyRksYBDILLEI4DjQf1uKtPzisFeIjmlj+CKMP5JEVDcjrmOpdkFvofWq5kwK9
 JGSOzvRiyzVGKZCGqlDgYuOIdSLGI1RXoyaPOO6r1ICKTLkSiev2KnEDQB0DFnJWBDJ6
 VLD0Wb/PhV1UkIydJJ9l9B0m4Z5A5esw2W7f39V8RqTIu8S7bw+VJymMg+0K7uwFmEo8
 ifhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURCLncY1tXxNSjqQAONoyftRM1X8yqZJpi580sI3ELvgCzQMwrgqKcGTNvw6d4oQNtL8wA1Yrwle8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+Me1J/QVaRM7VZUbaXowgLlb1HiGDxUemRzebbJV3x8USvyWi
 I7KsJy/2c1OG6i6RMHbsjEFYVqyrJdAEFDJtR3JmbkkbXYavXxuMiZ4yj6GjzYTo8jGkezimYXh
 4aHrcnX8kO5WBO1K4zGGUOHDeNDBgwALCee3nuLyEUJ8xj8uqWL9zogyAZ60QJt1i99SQdbc=
X-Gm-Gg: ASbGncvnmYVff9bx56lJfUuQnkTIsN/WsRTJV0UpgwI+iNHDRbISubXKoYtPmBBbMtg
 tfF8IW86hxgcqh5CRE3iMjfXPUiq/L/62UjqWcvbMlJ7nL6wHTdTbU8jkkKxGwbup3XthD7uny0
 dol5LDU36SZNSFIEM6VEfiMMzv1E3O5pZfW37SB9UtxnFPRaAkjJUEXZyTPxeLP7DITVVxq487Y
 qeMSzGu8c+pMqBhRlM934sx3mWNgFeQqTQwwwAH1+k52/Nn4EUIQj3fFYZuezMKT13JUkgfOZaP
 zukn0177sYY/Er3h+ifLP4py4KJOgZGJEnGwECwGr8HkSeUSp3hBlPOujS8MOABH5GRAYpC0b6t
 zcUK3lpqFRPqqCg99Qe7vxx2zBnGls7DYU+/0IT9h+x1vRXdQc1WnSU4FZFN1nQQJHAbPsPciDk
 pHZw+5gKeHyvWWTqphos+PF9I=
X-Received: by 2002:a05:620a:28d2:b0:8b2:dd7b:cc8a with SMTP id
 af79cd13be357-8b33d469758mr2883988885a.75.1764193363994; 
 Wed, 26 Nov 2025 13:42:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH2vVGd+GcWOMX+Re4xb1YF/CKD+k9Z5kHfJEow6wWU+/bNxqvRsyFDVIN+UdpwQznY75zxQ==
X-Received: by 2002:a05:620a:28d2:b0:8b2:dd7b:cc8a with SMTP id
 af79cd13be357-8b33d469758mr2883985685a.75.1764193363526; 
 Wed, 26 Nov 2025 13:42:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37cc6b59ef2sm41430281fa.16.2025.11.26.13.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 13:42:41 -0800 (PST)
Date: Wed, 26 Nov 2025 23:42:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: add PERFCTR_CNTL to ifpc_reglist
Message-ID: <c5t3ae5ip2eoxrxv34ssudf3det73nht2ug6o6ia5lawy2ws7d@jafvcijp5hjg>
References: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=69277455 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RUpeJWWRx64e7F2V8Y0A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3NiBTYWx0ZWRfX+a8ZIWeBelrH
 uKMt7P1XYHwxl3bIa4FnNn2AVSgsejspJ0AB6Si074ri07Kg+MgzdD9stpuTIvTAYIPsk0TbwcU
 FDPrNvWWA5k09hG15YmNSLUkoBZ+6o/i5f0D6FH7xpR6JIJz8J8UJc+FSjy8u6zA2Jed5W4ZQv6
 fX5ffT9rdaU2zc5BrJdZhZ8UIC6jCgIuZ2Y1ei1rrYznCWSsX2z//QQxPW5pf1x9jzUXk6SSJWt
 P9hzhlV5l9PXt6e1sKlPQkL2/qUiFeVqL0BSdETjPX5EiY941MBHWNZGpRnbI6nz+jD8WIix1hV
 DlMt9nHO3yMkhP7KtIZx1byusxLDiThqulh0ikDUlbUTMRbezq+PAqFXsYInVZtcjoOce55D/YM
 dySGY9zvOoE+xUM+O01PTUvsTNTqLg==
X-Proofpoint-GUID: -lFsdHidCKWFjihcmqhDOQi_1wqND8nd
X-Proofpoint-ORIG-GUID: -lFsdHidCKWFjihcmqhDOQi_1wqND8nd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260176
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

On Wed, Nov 26, 2025 at 10:31:30PM +0100, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Added Fixes tag

Cc: stable@vger.kernel.org

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> - Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
