Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632CCB205A3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD40010E431;
	Mon, 11 Aug 2025 10:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCgSXoXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F61410E431
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:36:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBmq029216
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=THBO3Ht6NQgUDeA8sx/NDTH/
 SHFPOK+ez6KiHqIf758=; b=ZCgSXoXwxACGoxz5slStTGYzUoW024sR1/qxOGY3
 bwvghtj9Wa2fgvS/D5rLFQPz1rDU50j8kAuNQLZ6boWvIo0BEtaVGOImPiwL1DDx
 2U/SJRru2AmJPjpkEauj1opJ/mrJcyx77UwAkC9kcNrcqD05vMIB8CMPV9sHEqrn
 jfGb0HUsk812wD6iHfJ35jmQnHNraks+f+hRrYHbPb1eKYq/e7bwJxOZHF4sTZlI
 JuWyw8nQ+7NnGdsElSd547SBqwC1Q7AWZ3eG9mhMTiQOtE9tpY1KLLoxuVTI5Ca3
 zjzWZHG2WymBkExvB+yQYK+XVwBwMhOBL1BASqKNiikeCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbytp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:36:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4af1a20cbcfso111360461cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908566; x=1755513366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THBO3Ht6NQgUDeA8sx/NDTH/SHFPOK+ez6KiHqIf758=;
 b=HOLBmUZzPr3FjWQGh1RBTaEmKKEK5ZEd4GD5IyNHfCMyjM2Yep+yuA6zcLXP0yktzu
 5Buebr+VIy8MqolccEN8ALAWlmoCmiayRhD1M1NFxxxW6KVS0xWeBETg24bz8JLYvQVL
 EtdykzYA2tfnQuI4+aCEBwyZMmuTgjhg85DOJU/wzwMmvrA/SDwl1qmRnklB4wYg6NET
 6M95rr2AICo4Noi1Am7idA4ZR+z/aVLBMvenkPzzrHjUBalHzNWMb5E5KQ45Dfe++JP+
 sqZde8CIr8bZIEuKAcTC+fTHiVK5XI4FnNwSAH78Ij6KNaGKNuBgOnugwUTVFyDv4HzG
 yrMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXizv+AU/uRGTpstJ3SPMJJZKszYy3T6lc7cX824wl5AfLGhD9/wLEEIetzrkAJY5wDpsGEeGj0Exs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCiUADpoE9XfO2inzzrViZic15ALz51nOYpAt3bQY5we1kWNV4
 GtrkGTaAgSG0zsustnJwoVtLm1+uGWuswjDywrIHnQWCDGGT+gSVixT0EfBCkOvOUZZSHbzR73+
 fP9fNgAl3Ed8dDW9l3qpyKA2fyTJkuF8X2tY/9XoL24RdqTeg7mUgBqoemkw909TdG8jqffQ=
X-Gm-Gg: ASbGnct4fjbdM4IvamXwlHOFNen7yGIWhILgWYnGYcc7Ao/c3L8hv0/w2XjxD/ImBs3
 m44kGlYm7dCes5BXmkQIu4ImzvKzDuxydb8+YLx4zwbkLVpY3qDYrMX1m1v8AeoX9sPLQ3TWyl+
 dKYFfw0KbeFPeTs3t6wSg+Y76m7OVTIHeWX5h4OiLChU9MlvXZHGxivmDTfiVXIdoq7yVJxYA66
 lady4KXV9b4EpBA+ZNshhMMHtJQg2s7eGX5y7jJG7hvcxhuK/4eroKwDNr/9J1wh6ZsexsYX6Av
 ZLs/oQy6Nq4Q9QR92W4ZV2ctiKoYk+YnXSExSipasVlsqz1iTpT7HB0GR+UUX6rKSkoEtVDJKQY
 jcyp+Mtkc6bQRkjfFOthH0pd9/s6te01taNiERYrUyg2yVBRsgVZv
X-Received: by 2002:a05:622a:28e:b0:4ae:fcf0:be94 with SMTP id
 d75a77b69052e-4b0aed448b3mr160849421cf.24.1754908565675; 
 Mon, 11 Aug 2025 03:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw7HtgnbrmY5IK3DxlGzc/b7uNHN6VMIXvm5Uhzn47fOPoo6rohuiiCW0D4J13E9SUX5IOMw==
X-Received: by 2002:a05:622a:28e:b0:4ae:fcf0:be94 with SMTP id
 d75a77b69052e-4b0aed448b3mr160849231cf.24.1754908565258; 
 Mon, 11 Aug 2025 03:36:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88ca6274sm4249936e87.140.2025.08.11.03.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:36:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:36:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate()
 to determine_rate()
Message-ID: <ycnscnqj5nkoaqlvtmvgmr3yixx2nyhlah5lchhjbhdkrodo6c@ugkj43u7mvvi>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX8U+DnFHpfP84
 JFSlzKpw1Wr0V73oFZiJGcH0E+yMfD9Oy8TlUoFzEbWO+0yjarapdhTZd2M7Exz1G80iBcyw3ET
 Ra/FXWbBFhLQS/zvgv6gZwvxO/fVQazwsxHTrbDAIdyBVfR2Ppc6LFfU1HvonzVbAfHE4wWoUOs
 SS+6Dmw+cttd0C8GqseZc/w/xIgteuAsFdT6qKpJUOUk5acXDCYMYcLk4nNj+Uw5h6ebVgkXOvW
 pMGUsIOIRNWhThj8HlZUxA1wj2XbhVxArDtYkW3cOAyAS+RVADiQlLxwVCSSTIVZYoAcQePe+AL
 QeHpK0hmxVMBuLabyJBxY5b0clIzJLBHQJ66vG7LNFDKlc1fuxptZa/tNqNCk3oSODO2Iim0vu6
 1Tos2a0I
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c797 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: SUCW98-zixuLtPItNoj6JRV5iGPwh1wX
X-Proofpoint-ORIG-GUID: SUCW98-zixuLtPItNoj6JRV5iGPwh1wX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035
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

On Sun, Aug 10, 2025 at 06:57:31PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
