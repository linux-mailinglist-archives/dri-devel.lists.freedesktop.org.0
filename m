Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55DFB3C8B8
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 09:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEEC10E237;
	Sat, 30 Aug 2025 07:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="Q/NDUGX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9131F10E238
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 07:30:45 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4b31201d331so16598911cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756539045; x=1757143845;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
 b=Q/NDUGX8MvyOOMI9lxWBjsdc0aAyT/g9dUlb+hMAcgZGtQ+x3I/UfULYGZijftueJC
 Y4EVBZ8jMzgPZrCsJ8mWNYulTfJggK4oMmI/or97zuHyYvWBRMLDqxNa637JFqqnEMcI
 QigrAUio9GIe98feRAB6hc3RI/8JEKd+UmL2Z5alu/0E2BsWnzMguTZNtAL4vAmqUjS7
 6/Rdi5oLIErXpWs5ZihnUFFVrSFnGDeK1md6Eqjr4stxtVr1jPnF7HKKnTS4f6g1D0vq
 b8MXmpOTWEwS6Vm7HlqTQ9sUmhKJ5OIHbc9gak/lWTiJnLMNnuPvyMOvYEq+m6i8P3+z
 4RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756539045; x=1757143845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
 b=Pyaz5+0Ui4DPFTZkMSQHp9Vo8SOLgk71byxIpxv50mTzqmQiTt68g0EkSvLcMzWxhx
 VOPhO9rC0axlM/izJXpak+na2kl+tH3vhQNqv1fY9aq/rC+/tUM+WdT7L4qXtUogBADm
 Tvaxn/iZvJPx6rTZqbpTqnesYBSsao5bI65xcgLRChf+db3KbJNKcGNHGaREzzvo43Hf
 bvcy85XlxQp7mQIyPgH28sH3YhHBuvnqpw3xfminCZlqfAaaKeuy5oxrrHEad2Xi6JGT
 AOMa3w5pKR+Eo79u7hoW4bGV5GUIEApMRnTIGqpRm9+3ZEhRdIjvu7muSmz8B/rWW9dD
 BH6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwt23eDDnjNOZzcnmzVgwLbUcCVf1lAHi6YSGKmMl6uX8gt4zkMaRHNIWiiXNhtFIa2CrR17YnG+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdXQm5pH3qcyTxcIytsGkMtiqVStI8eOZ206Qq+k72xGVaZXdV
 LTqzGPupxRn6JAgpeQGEqiZQmCcrHVGcNPPCct54slO3veDgGstikG5S1xqFVBmcFBVwbg8I5pY
 Lcb00M4uoZMRr0gKTExyKU4m4UQSzKXjrdmjUmA7p9g==
X-Gm-Gg: ASbGnctr1zRmyXNjRP7pC3Yj2lKTLjnyArMj2T1/px3SwOt6St3oGSkHiTZEW8aC3aA
 iu2pK8GT2ckcmB7pdy56WbF8mj5/tvsEH5v0JAOkV//POq02IN0Zct2PcX22fF8GQ9uYZGamdFe
 uOOVN8kMLxi7XwpCyJTGnOHnLK+DLV59zcS7Z2kUx04fhpvVYBI8rzRSNXOV4nwSD8sMZbykyIh
 e6HQQ==
X-Google-Smtp-Source: AGHT+IGOnM65THr0nrJ2LPLTiMMlk+HvsXaVUyczPlRtZjJ7WLdbodWtVaS7JfPnD9Na2PcQiHxYrYNu+VnO9BqbaFo=
X-Received: by 2002:a05:622a:1448:b0:4b1:103b:b67a with SMTP id
 d75a77b69052e-4b31b9c3777mr22814681cf.32.1756539044617; Sat, 30 Aug 2025
 00:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:33 +0200
X-Gm-Features: Ac12FXzpE91ILUTwZS_ZwZMq6UoPhvxeYv_akLo7dKmrA-yDSe19rsUZejc4hcM
Message-ID: <CAPj87rPSqJoJnUoP11qzWXuqvYPb_=vP-5-p7SEVA6JCfcYCuA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.

Reviewed-by: Daniel Stone <daniels@collabora.com>
