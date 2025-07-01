Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E7DAEF616
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 13:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E83610E597;
	Tue,  1 Jul 2025 11:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxGCbSNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F9210E590
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 11:05:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561AkVPb024877
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 11:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZogMt6KKsiaz5/xedtL9aHF64V+0fejV+AuVX29tpF8=; b=HxGCbSNYdM9dEslB
 SjttVn99Amwenu1R7wnkDaKhJaGda/8kM8YFf53/KU128vsYXxNaf/6p19urg5Hm
 mYCDLIZ9YNp0bV30kTJ+Rt4Foy0l704s9vQWadf1pTdTdPoXhVRtrebwpprrgpCi
 UY3DodkPK3T9pc+OLDNmF4JSjRfRTeHRljUvYejXugYVPq2SzWPo2HounfW42x9K
 v188gBN9G0wwqxoqbexRfJGHSn+RRnABE9Pa5gYXip7lwwcUgs+8NTYf5SI0+Mbu
 YEfwZlOmCdqKzcOvF6RoyxB1GUM8rC9ES7eG3VmqFoaRNnK+/03UvbjwbEYabwFJ
 l02HNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8020ghr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 11:05:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d44ff55c98so615729785a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 04:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751367943; x=1751972743;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZogMt6KKsiaz5/xedtL9aHF64V+0fejV+AuVX29tpF8=;
 b=RpzJAn29pohwZQNhmzZbmihT/zG3t3geyMOQbmQimNDr6J1IXqsdzX42TPOjqHuMIY
 x5F1sFpWgZC6AXoooS9bhgAxAzZ6oYITZ3PA87psBDyxCgZmQIYUULiiTWDiJjSDxdmB
 sUe4aIHWxuMqtvazjCeOnX1mcv5TmYWuw0kkuRTCKYBT0XfbSwneVG+J4FJ1yn2reL++
 E/oqeVyv3WJVJTb9IpoRwX2gqzQAyOXJM2MgptdY52uGbcYtXrGuBZRutQf7jBxXW3Wx
 OgJk8wA+2QEU1cfVFMsQvCZkUx1QpZjXyFIH1OCMRam9/PgAMHxGQ0Gau7ghxyJ6PxYs
 KEJw==
X-Gm-Message-State: AOJu0YyWSDTcu3ptIXIIAiW+BG2FfGSWuqcSKyPb4a+LXJRM7zPQqS4N
 RDg1xtP7RntOqfpQPkRg9nKRgNKBKQY2oDtyD0aD09yMVnJduxtQEOBsLH0ULwomd/zWfQcwglP
 8klfan+V1Ar/3oDkCB4ePUCfWPZeEIip1qDPBT5SpFxXQLrQX2KbalwI27o3226qHU71jj38=
X-Gm-Gg: ASbGncvrRGUwxI2y73WRhJGTgxOozXcN/w/49HEWjkvHCWXhcbfyiaKB0M3xzK4TJdK
 g9STaWE1Zp0288P79GXYg24oBRVR3Fgq30AmU5ab8h2sVDAg+hxg9Oh1/ExDNvMi/ylssK/QfxH
 XetdtIm0adAvZyN5K3y6UT9f0+FE9UTHauVlF47MJv9YVsd7Su7gazsrncl/AkVjELCd41flrzu
 qJkd+R/F6knMvi1msUQGVPt+rxPKrfB3AMoZDcRYo63Kpk+Ba9Fcze/TaQoepRvRMBXDLyLh2c1
 doe5gapV4kLpaAjFvkNSM83hnFt/IHohapj1nicLaFqwwe1xL0ad2adDdtxUDYuxL+YISEbxfc+
 NOjEpv3Bl5l5yGchQiaQdy05Eq9QXH44Pr7k=
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7d44398f399mr2458869985a.55.1751367943273; 
 Tue, 01 Jul 2025 04:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkaK5r4kmwq1bTXLA+Z1Z3MCVlUfECWUH1iOnueMEvJSOkDSVRInqR72D3IhCu8jIVuwHmSw==
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7d44398f399mr2458863485a.55.1751367942731; 
 Tue, 01 Jul 2025 04:05:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b24048dsm1783299e87.28.2025.07.01.04.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 04:05:41 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 05/19] drm: Allow the caller to pass in the format
 info to drm_helper_mode_fill_fb_struct()
Message-ID: <t6yywwa4z42d3knc3ihr4d4hzenhtzm5noln5y57uwzlotdkxq@6neoszj33sgx>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-6-ville.syrjala@linux.intel.com>
X-Proofpoint-GUID: YRcDtq8V3lYqgsQ9R8-HA3BoDd0KB4qo
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6863c108 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=p4Kof4svB8ImVrqtDUEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YRcDtq8V3lYqgsQ9R8-HA3BoDd0KB4qo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OCBTYWx0ZWRfX6xQ2/D9nkp7N
 kldB1FjeQw6Db0fU+QWeyg95Imu+0JiC+M5WX6PZzsnBvwanOiV7L2Pf5big0UaMkHno7SD//Vo
 Xj7YEtoKNavbdhTc5lxYIe1liNYTH9MO8/9uSKUJY6ZRD3X7OIdw1xi8vVwG4pAFQNNxkOMaw+7
 /A9/B/57m9cQoVXHBVhaU5erqv+ShyRRariUCa6McUWxms6Fi0QOAwNHFt2UzJMz9wjg2i3Hs6G
 NmYqWFbpWzgrgmmHOUCH8yor39HJycJVdrdDY5ZYlCTNl++vnv6iYUT9w6nHNkeRGO2oMfrA5tA
 xXu2sTMRPNtBwN85xpACDkHfXg1F/gDVyhVPXolNwZHnlqBhSwOXhQQxfvtDgDktaoMEnLebdJn
 XX3FoFGOrP7+nhZij7zxQ3YeRT3BDvJ+M4JEXNhCsrb2nIeAGvj2oeDhuZshbvEUWX8sVArY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=664 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010068
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

On Tue, Jul 01, 2025 at 12:07:08PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Soon all drivers should have the format info already available in the
> places where they call drm_helper_mode_fill_fb_struct(). Allow it to
> be passed along into drm_helper_mode_fill_fb_struct() instead of doing
> yet another redundant lookup.
> 
> Start by always passing in NULL and still doing the extra lookup.
> The actual changes to avoid the lookup will follow.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
