Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B70AEC92F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 19:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C1610E002;
	Sat, 28 Jun 2025 17:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWCES6a9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C8510E002
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:02:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SCKqT7009671
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Xj48wCGbKF6Pk72+CEinz5Ni
 1UPAQdUCNNhFshACoN8=; b=aWCES6a9PNuvJBf8I1GOUboxLb+dsJ3NMbLdhhZw
 EojeEV0V0W0CyJA8cS+gClV2ZJyTGiM77oAsGGaJxaefrs4coLq2F5sPlQVQWSkx
 2lpeVsJItlLfePj9RYkU/DOdEL/4M7O591yU2I4hTz+O4JpUcBozkwQx2Rq6OZgZ
 VrA2sghSVGUI6tTJmwXysHSIT6zaWDiJE0KR266LlD59nAbENwlrSneJG+p3zhyf
 oldGDtI5e2uXZwibIqQhIE/8Zt7WtNYvInH42A8XHJH3rLjUhDhT7CTJUNlGPsIC
 d6Of7lW6Y9fJMR3AVrt/SLVUMhPzj3ZnfngOfMLwkDpU/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s98vr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:02:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d3d3f64739so222246485a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 10:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751130175; x=1751734975;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xj48wCGbKF6Pk72+CEinz5Ni1UPAQdUCNNhFshACoN8=;
 b=VhNNkzZHzqkCIYRgnaBb+HtsMK51h1jKA6JCDGWWXaGS3pqUweS+50ObeqRZizOWDh
 8sBut2Ar5q6CoHIoBvL0InQtho0lGtvMHuRCMDDkHaKV0Cd9jhFyJwZ3X9OcI3cX3r49
 2qCz/DzAHtFtMystZKzReB7JAuODzUEmDNmidLj1HrKh9dZ0NitdILeEuBFlcbFHRT16
 RUgZI8afE2NTTPZYRYI96u0553rPhg/KIFsZCFComR2sfCrPJIe+ngfowSHL7Pv7PZT+
 Qhi3hvo2TJ6uK+4x8gkKxzU7I5Vx/DVuO4ijwbNBBXQ8TbQTKxdmf8mVX8i1iRpfdRJr
 yzMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN77yr5p3Ycu7Q6u6vNjiK5yVXolHKWYWIiofE0IVlvVBZLfqVf68gGwILX2mdiA1M5RJs5Q6TcEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwelhRJMfcJJ221BWaQlAWqH5/nAQW46EeVODAr3/3R+yMuHiw
 9h5bqM0tYfBFH3aW9aWT/I71HL4/24h51GUKmsXu2fHDfhmUc9LXb7jDF/38BJ6Wp7ooFs9/gMX
 6g5tsZ8M5gyP+bCdBmzePMfgszfwo3+3m/i/1W91RNYbarz4elWi0odfMNRgAdqSLOxV7n+s=
X-Gm-Gg: ASbGncvaTGHI63Q2wkXkRkIMfkbC0+4P4r/QKv3y8N3FkJTl79AeeOD0orN1jngHfL/
 NyGm+h2YtPD00/78SbsnvO1BcQzslVZMdLY3PLl28UVHdR1TNrNOgNk0YIwtHNKDhUHjyyUNEum
 gVtbbEp3udA9xBz5xOr5idXuh9VssWERV3zGRF7qrzEHli9U+MRkXKgJd+h3YyHshO+NBorajQe
 J/MxzjroQPSYRCFBcELOFh55CpgMU4TgZ41eDqCDBRY0NrEMCNqGp89wURcEZ5FcRJALTxriWM+
 YMa9y6fhLe3G3uPcHQmtU9eOC0CEDNQxGzHDk+mtJoMwJna0I7/ohp7BV1utSS0C6++LNPXPHkN
 3erk5j6zxNDoZeFf87ZvL9gqcJQoagd4cg6w=
X-Received: by 2002:a05:620a:46a1:b0:7d3:b094:d212 with SMTP id
 af79cd13be357-7d443990ae5mr1065893685a.51.1751130175070; 
 Sat, 28 Jun 2025 10:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY9eY2qjJG5GC1z2t+E/qTvaYQxv7sH6/mlQPjsokwBuEJDcnaEoFuKASuBnrgaF+wIVxjjw==
X-Received: by 2002:a05:620a:46a1:b0:7d3:b094:d212 with SMTP id
 af79cd13be357-7d443990ae5mr1065888985a.51.1751130174550; 
 Sat, 28 Jun 2025 10:02:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2f01ac0sm8375661fa.101.2025.06.28.10.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 10:02:53 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:02:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 04/10] drm/hisilicon/hibmc: fix the hibmc
 loaded failed bug
Message-ID: <hpqbr2xngohjb2kyauwz5gctb7dglvu5tsmapbazy5hbjtho2v@lmkptdfeej7z>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-5-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-5-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68602040 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=Yqf8pivnL-G9Aq_Wef0A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: V4dOwd8Ze4a096UMzjK7bPkvlHH5xkSg
X-Proofpoint-GUID: V4dOwd8Ze4a096UMzjK7bPkvlHH5xkSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MiBTYWx0ZWRfX45De/phAhk/+
 Tbl19tWbayUuXzJUbKBWc/LQfg0lNf0fvToNnp7lAwW5FUrIUzmdvYiEM/8ELAa58frSqSFITK0
 2gEgt0uXi/MjmtZyiQz9H2LL6BvDXKMa7YdgQFCD55Ees0gpnGAZOum3WWDIekOOh3Z2E4HieTg
 jeclpvM8l9/ZYe0r/xge8B0gH3ElEEd/BK7tIn6eLcKQHlVzfswhNXdpAxhnTboOZKy9UzVI+Ht
 iPccRsgDI1/JA2pxqSVzleoh36IF0d0we0LyVE6VDJ7+ww0aMFVLvPDt6gVfvpUu5Ah/0lSSbIS
 yz8lPmX8ENRXFt5tuGO7T2UwJ6DnjCyGtOjLa3MZt/sBfnIywzV/7SUNo+yHKXTerKkuW06V9rl
 s2eJuFA4rAg6VIQ1ZX0U7wrU9KP/fn6OR9SoH1oeV79vRafikLH+40fzxwWMhIkC2Wmfwunx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=740
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280142
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

On Fri, Jun 20, 2025 at 05:30:58PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> When hibmc loaded failed, the driver use hibmc_unload to free the
> resource, but the mutexes in mode.config are not init, which will
> access an NULL pointer. Just change goto statement to return, because
> hibnc_hw_init() doesn't need to free anything.
> 
> Fixes: b3df5e65cc03 ("drm/hibmc: Drop drm_vblank_cleanup")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
