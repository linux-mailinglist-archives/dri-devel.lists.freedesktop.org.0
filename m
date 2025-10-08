Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36561BC6504
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4D810E8B5;
	Wed,  8 Oct 2025 18:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwPc2PKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E451810E8B5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:40:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HTI012814
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UiT3NrhTXsOL+mLqzQf+cdCZ
 y5nzolk3LPjCkdb6l2M=; b=AwPc2PKjdpxLnlw1/jffYKBgSBaaZQ9AOZzAX/qn
 h0G3YDONRztkv+UX06/kgefHxHTH76N7KjS/VK9hY8bLS2dcIUnc/pwG1eYpxjfc
 Up6NJiD9OQeHV35fbYAoXdYNPncMlOZpBBGz/dPjGcW6Yne5zywrvrIVZW+QtEi/
 QoK+ehKUbv04quFhODUxnZIbw/+9/Eyg8Whs6xl10MWWGsT1U0+X63r0h/WzOgZn
 WVyVsLul4l2xmBYTXlfyUlNb1qTqOj0qgd+9RMDiQPK5XC2Iy1yCIV9aQvHvkgm1
 TWWGeTit9zB9kVhmriq7RIn1gtg5+05RE3VbTKZlkY1WKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j08qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:40:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4db75c7fa8dso4374601cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759948811; x=1760553611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UiT3NrhTXsOL+mLqzQf+cdCZy5nzolk3LPjCkdb6l2M=;
 b=DyQFAfRoUcGksOXRrvcE0iFUsLeCqJbHYYU/JrjVqt+R5rZxqS9VLZJrsLk7peH3Il
 LfKnqUAnogAGbyOkuZ0w6kMlXGdec1SfzXsrD1p0AtqVkIvbfiRBBHk3z5JHh5/tJBkl
 Wt4a873oSk/ppmdSkaPKBEY3h0+9RdYohvbwoPMUgDU3gA8XqqnTrOluY7LePYOFzh57
 hndbko2l2AZ1We1FSkAWOMkT7ISEE8fRwRFW1yOP3JOynNKbInaE7n2kK4Do5wwe4ds9
 2pTdvVvUudaxCW1hjhACWXcerIv1LquN7OsY4TCuUXGJdqPjsqc6bDqKcwWhgP2gul1y
 41uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmiry6L4uMv1j5rlOj+JKaeYnVm5AZGZ+xs217Lun5pBU4HIwWQmD4NGEyy61KflXsghmpTw4rt60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8UEFTAc1B3DN9pUJLsjWJSEk+8xlFhB/SIMUdOPTsn1RMJyGe
 SWW3fdTE/daKL4wmwLdQxE7HBnJYzKkf5zqPNb9M8OwuBhom+WVBctrXwFegScW6JWW+HW2sgrL
 PbrdB/n5K21+vpGe/0H/tkuObsSbjypcUwijtAzjT1kd3AkC5UIR+20ogfr7nYjgVqkCxYxE=
X-Gm-Gg: ASbGncvLUpnJsycbU5nyW+XV2G6fMiSpLHhnOrl/+r0GLXQ/i14+4oHLD6XeFT5NVIq
 xWsJpVSDkLKxvqFLvGF8q60ii7l4v4Y2EVL6ODxTDlT1Xj48BmfGMb3fe0O5SAfner5j7JKDMtI
 uqZHmPj35cogj3IPK/rQkqu1hhhdjaCZxlkhqoryjEZpM5LERxkLMGuNgGENTvtwM2vigYL1QiR
 PcLoK6MvrmlXzMeKrrsqIIYqvsSpueuNoo6jR8zdHKvsabDv6Sl3+GDWDANmFyCyKYx6MkYXaRv
 oGEyp0DWybxU80smYIH79QycYYuSSpp1FMVN6oIpRuyl6vl/VZt09HB5IPJ7zyJU/PdU0jjT6O9
 J6B/kBQSyBnqjvXI2KnZ3xBL5+J65KALdaI1zjdwtbgR7BJCGwjHaccqPPg==
X-Received: by 2002:a05:622a:996:b0:4d0:cf85:9f9b with SMTP id
 d75a77b69052e-4e6ead54473mr65102041cf.46.1759948810942; 
 Wed, 08 Oct 2025 11:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI5B2XZljG4oOKO3AfTzTqlvSbaPEHBPtyXj4hrP/UU5eo568Viqbds0+vMLw0ny5GnHT4tg==
X-Received: by 2002:a05:622a:996:b0:4d0:cf85:9f9b with SMTP id
 d75a77b69052e-4e6ead54473mr65101621cf.46.1759948810424; 
 Wed, 08 Oct 2025 11:40:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ac20da8sm250800e87.47.2025.10.08.11.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:40:09 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:40:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 04/16] drm/bridge: Switch private_obj initialization to
 reset
Message-ID: <lkqjoldgevvo3zcmc2px6tqmgxznma4xfsipqcituwnz4ggaum@ye2eyfbinytn>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-4-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-4-805ab43ae65a@kernel.org>
X-Proofpoint-GUID: 7VZ_P9yJ75k5Y1NVIuSuS_6OZaSg2Of2
X-Proofpoint-ORIG-GUID: 7VZ_P9yJ75k5Y1NVIuSuS_6OZaSg2Of2
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e6b00c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=X3hUXv4obAWQg-54axYA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+6heKRBuyg9N
 02XzDCUjzR+4cYg1+ikq/IgqLgDPKjjveQ2P4OPn4qKyp2FYeaFo7BLaNDquRdLCrQGskqnX4JV
 S1L0Sygh+6AfboXgOT8lMZTXvyz9RtLGxMWV/3yePs3gNwCog7gFyGm3bOGXtBpIomCFuKdFh+6
 9lN6+26j8vJ5Lvm1EyIaFVeGMF+pLPcPAzsA5yiGmLmh3JhQ4rzOoB9Nm/5LqE0Cg7PIt9mPYJJ
 FXUC33iC8wASzGDeno8nl4sIG3D/CcFUw+1LmCS0seg+ab3JDTwrWkHBK58UwhRiZwWT/0784Dt
 nHc4Vufi19bpMu5QWyJO6tsSIGMnwT1dxY6hs6/NEMa03lY4KWj0WXdQYD7BI+6zIWVdxCFckFH
 iFJGoy8SAS4AVMP1EXtIAubMfEcWLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 02:04:02PM +0200, Maxime Ripard wrote:
> The bridge implementation relies on a drm_private_obj, that is
> initialized by allocating and initializing a state, and then passing it
> to drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a reset implementation, let's migrate this
> instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> @@ -462,30 +476,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  		ret = bridge->funcs->attach(bridge, encoder, flags);
>  		if (ret < 0)
>  			goto err_reset_bridge;
>  	}
>  
> -	if (drm_bridge_is_atomic(bridge)) {
> -		struct drm_bridge_state *state;
> -
> -		state = bridge->funcs->atomic_reset(bridge);
> -		if (IS_ERR(state)) {
> -			ret = PTR_ERR(state);
> -			goto err_detach_bridge;
> -		}
> -
> +	if (drm_bridge_is_atomic(bridge))
>  		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
> -					    &state->base,
> +					    NULL,
>  					    &drm_bridge_priv_state_funcs);

This is now very idiomatic, I like it!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
