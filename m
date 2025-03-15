Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF44A632B9
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 23:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496A710E2A6;
	Sat, 15 Mar 2025 22:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4t26SKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3DB10E2A6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 22:43:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FKXX9A001145
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 22:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3Sgyz07YUw5IhHZAiYm3pn7c
 6RPv9zndIT5Q8z9bYZc=; b=W4t26SKj6Xd2ad8Atax36DYu+oiuCSuZOxSPptcw
 hqkk47bzIWcAb8hm7JnZK6iquycRWVLobdEG0XRi3wt30BVxbUPPs/3y4wsmW74k
 9/9BZi8ps24aBtz+RdjyrQtOepFPtWW+bMx9O0gktX8elA+Dj9vadLylbU/dWCJj
 mCPgcfmVHln4l/7F7hf7SeAURqc5+b36zsUXOA/veX6oeUESEa/f8n8FGz4knn6A
 9m2RKfI+vNv6KqmRUfIYinQswO3EztBQsSSfHbWeGm4CKTtRb9hSfm9qzhO1RwCO
 lxu/ovSJjC7zPBInXzs1K9rhAJ3eZPI0Sng0Ku/jveqJ9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2u9s92x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 22:43:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c0922c5cfdso575180285a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 15:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742078634; x=1742683434;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Sgyz07YUw5IhHZAiYm3pn7c6RPv9zndIT5Q8z9bYZc=;
 b=WIaJWge0lkUmEbbJ0MLS4nrDjgnKSdc3J6ssJlLn0U6rsrzwd/63OesZC4fc+0lYur
 9DDy1UTaFLxIFJ1FGcyLWA/cMpfb9SFfUOBSHQmizpbiH2LjyI/ZB7RClGo1xAoGFRfG
 Njj0CVc8XAC8kcrJgbFoHDrERVpjVFo5dkzdJfiXxGt1zTVFemuT8tDpYJELWoORAIVE
 ic0Phgty7g4+MTm5DDcc5WLsKcZAWJUnVC7hcbU++TtsrVdeyFeFpMdvJvm8QBBlLX+l
 YdkrUrKeEPdxtdMy9Dw5RwF1wwKiDEw/406ND1o8AMDUbS31bJ5jTgM2+nsTA5Nngni0
 8Ndg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIPUW0pFt/XQQ0+251lYkWk1kDXyalU0TrPKHJwMj1AZKSryfdGMgnHGUfJNnz5/1LIW8txNQljgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk8a6AgTlTc5FpMCzIpGz1Orsy/8YZTcQwi8OT6Sv8/a24mDfM
 kDTzRLcBC/UImT8j858SVQRlxw8pBPxpXmqzzqaSGubkYkthCFxGp2jeoYcGQb0ueEgvdnJnGpJ
 t0+bHNCsPQoj+DsTuGJTY66VX0N+7SnJu4MsVtP32ERvVWUdhkROoHD/qwv203QMxC1k=
X-Gm-Gg: ASbGncuYWrvkL60ZUhYyVn8tOdqZYwEoGz++sRqM5Bfa60vRYfZ8vUS03xBSEzQTpQ2
 HpU2MtAAv1mfUJOgFxcjYbe437RMaYEnK3LhJDezgfhghyB+bDQ+E1tGBHV/p8Qk9LfoC2k4IEP
 Jcb3fB6UapsrRxUl/YNdXbX6DhYYG6LgUJy+YxaUGkmu0SVcfm59GqULJebF5Q0EVwXzJGTW8lm
 tu0jIoHdJ2jeIK1XwwE2jFRyTq95Kk4gnKVuItSQs0WXn9yu3tdidq7O8iehRegxaXtUrXtTkdp
 EnQnK7ttdkgRAXC3VF3//VKUSAKfjm4Dqri8SmoSScvS2Vu05uU3D+yLRIpi4GtuMPKRNb1U3o0
 ALig=
X-Received: by 2002:a05:620a:4004:b0:7c5:4750:92ff with SMTP id
 af79cd13be357-7c57c79b8fdmr1035978885a.7.1742078634256; 
 Sat, 15 Mar 2025 15:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo3K7nMi5i8BuubjPzchuT4O6D5B6pZcY0s3dDHcojhqSo8OGwIpIFifMUSVhVfdlxr8gFlQ==
X-Received: by 2002:a05:620a:4004:b0:7c5:4750:92ff with SMTP id
 af79cd13be357-7c57c79b8fdmr1035976685a.7.1742078633940; 
 Sat, 15 Mar 2025 15:43:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864e9csm924638e87.121.2025.03.15.15.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 15:43:51 -0700 (PDT)
Date: Sun, 16 Mar 2025 00:43:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
X-Authority-Analysis: v=2.4 cv=JsfxrN4C c=1 sm=1 tr=0 ts=67d602ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=LDBv8-xUAAAA:8 a=O1LN-3MKiCKZpL0Be2MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: eGB9jmbomCp2u_hGk_DiMnL-AW7azpd9
X-Proofpoint-ORIG-GUID: eGB9jmbomCp2u_hGk_DiMnL-AW7azpd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=730 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503150167
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

On Sat, Mar 15, 2025 at 09:15:11PM +0100, Wolfram Sang wrote:
> Do not create a custom directory in debugfs-root, but use the
> debugfs_init callback to create a custom directory at the given place
> for the bridge. The new directory layout looks like this on a Renesas
> GrayHawk-Single with a R-Car V4M SoC:
> 
> 	/sys/kernel/debug/dri/feb00000.display/DP-1/1-002c

Would you rather create a subdir using the bridge name (ti_sn65dsi86)
rather than dev_name? I don't know if we have an established practice.

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> * switch from 'client->debugfs' to DRM 'debugfs_init' callback
> * remove RFT because tested on hardware
> 
-- 
With best wishes
Dmitry
