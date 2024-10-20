Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D844E9A5474
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 15:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D9C10E2BD;
	Sun, 20 Oct 2024 13:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XPANJnA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740BB10E2BD
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 13:57:06 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fb498a92f6so40454011fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 06:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729432624; x=1730037424; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O3d49rBoiN5wy+WZ1KPN1f6wcIO3VQTEw3clZT7OmJo=;
 b=XPANJnA4MdY2gbV12GXph++xXYySf/QE9NX/4LYAp0J3cabW75NsAoEIO7zSJTTlzL
 EPkB4eO57EkYmNG9vj31ew/DHs1qWUuM23IhH3DlmW9Dt+FJwHo31/uyIm1P7vhKqNHE
 JL2EP9H4Ri9Jqt5qzQP5dVW/39hZ2zjcjuwOhKnkRW0rLBLoPZo6VzdQLXKjdxa/FOut
 ieE75tnRDRd5NMOj3Y+UQ+AO75wKlZj8gvBBrmdq4BuYzLWQdhY72MF/FLTh8QGqrLKm
 GCs0rV+UUHLp65i90E6Vtc4BVvyjG5okwSx+SGPXuHjfa8VnvVcwcopaDgYDtEM2LBZc
 H9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729432624; x=1730037424;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3d49rBoiN5wy+WZ1KPN1f6wcIO3VQTEw3clZT7OmJo=;
 b=RmQugOVtRbQE1iFOoGYK5DekxEkCc4RBznN8bSkN3+a+HcXtN0I0158lAg6MffwVlm
 XbrVzWptgFwxs4Nh6M37LfHs3OC2k6oPrBLxBAyEcrshUknj+/yS3ddIp3Fbr50ryBub
 YOE4jeziP5rR1jP8S87VpDlBsz7tb107x1mTKxCsJ3YDuoVxe/mRtl+0ayAA2ArLYSUX
 r61s0qz1gt8Q8o8h/fPdA4gr97i45sVhJULwjiP5vCTsOEiRIHLacapyL6ayARNpnE7d
 bhUVxIu7Fas2m+J7tBQMfauqGbL0DIVEzrU6jUyC0r/ncmaa6TF+92Hg5Xfn1rFGLT2p
 HTbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRbHc3yJN3rc2PKUiizOk1X/cfoOXKZkbXGllmVVLAcBPH/Eb8jiVLBlztDYBueTNS8CbHUep2Ymg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9y216Dnf5JxM9UX7A5RtGDGxBbNMLywo9cKvxpjh3mjuUU/3H
 sj4Gvlt4Os0aU3hNOI3hCAx2Oa8WmME7D96qXTtvUBWJ4j4pomGYRVDJJsBbB3E=
X-Google-Smtp-Source: AGHT+IGhj7gVRiVovdTClhWIItAKdcIzorRVBXk7eo6paSV+KVr0WEnvWmVLY27F3Mev3fjNEnnjdQ==
X-Received: by 2002:a2e:f12:0:b0:2f3:a06a:4c5 with SMTP id
 38308e7fff4ca-2fb831e953emr30661331fa.29.1729432624471; 
 Sun, 20 Oct 2024 06:57:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb9ad907a2sm2384691fa.71.2024.10.20.06.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 06:57:03 -0700 (PDT)
Date: Sun, 20 Oct 2024 16:57:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>
Subject: Re: [PATCH v6 00/10] drm/bridge: it6505: fix HDCP CTS fail items and
 add MCCS support
Message-ID: <e6ksqhssu55ox4ffzyko7fsahvk6i6aoj4jo2rbe2gv6sclvzp@elpidkcflh3s>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
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

On Wed, Oct 16, 2024 at 03:54:12PM +0800, Hermes Wu via B4 Relay wrote:
> This is a v6 patch-set.
> 
> There are lots of failure items while running HDCP CTS using UNIGRAF DPR-100.
> In Order to fix those failures, HDCP flow needs to be changed.
> 
> The DisplayPort AUX protocol supports I2C transport.
> In Order to support MCCS via the aux channel, the aux-i2c operation is added.
> 
> v5->v6:
> 	-keep the commit message wrapped at 72-75 chars.
> 	-[10/10] fix return variable being used without being initialized

I have reviewed the patches that I could review, but I lack deep HDCP
knowledge, so I can not review patches 5, 6, 8, 9. Hopefully somebody
else can step up.

> 
> v4->v5:
> 	-add more messages for changes.
> 	-[2/10] modified AUX transfer data size judgment.
> 		change for-loop to do-while.
> 	-[7/10] change for-loop to do-while.
> 	-[9/10] change wait timer with timer_after()
> 
> 	links:
> 	https://lore.kernel.org/all/20240926074755.22176-4-Hermes.Wu@ite.com.tw/
> 	https://lore.kernel.org/all/20240926075134.22394-1-Hermes.Wu@ite.com.tw/
> 
> v3->v4:
> 	-split changes  into patches.
> 
> v2->v3:
> 	-split aux read  KSV function to a patch.
> 	-[1/3] new in v3
> 	-[2/3] add description of patch
> 
> v1->v2:
> 	- ignored.
> 
> Hermes Wu (10):
>   drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
>   drm/bridge: it6505: improve AUX operation for edid read
>   drm/bridge: it6505: add AUX operation for HDCP KSV list read
>   drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
>   drm/bridge: it6505: fix HDCP Bstatus check
>   drm/bridge: it6505: fix HDCP encryption when R0 ready
>   drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
>   drm/bridge: it6505: fix HDCP CTS compare V matching
>   drm/bridge: it6505: fix HDCP CTS KSV list wait timer
>   drm/bridge: it6505: add I2C functionality on AUX
> 
> Change-Id: Iad0c056d72abf2655081357cf40c3b0d3df916b5
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Hermes Wu (10):
>       drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
>       drm/bridge: it6505: improve AUX operation for edid read
>       drm/bridge: it6505: add AUX operation for HDCP KSV list read
>       drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
>       drm/bridge: it6505: fix HDCP Bstatus check
>       drm/bridge: it6505: fix HDCP encryption when R0 ready
>       drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
>       drm/bridge: it6505: fix HDCP CTS compare V matching
>       drm/bridge: it6505: fix HDCP CTS KSV list wait timer
>       drm/bridge: it6505: add I2C functionality on AUX
> 
>  drivers/gpu/drm/bridge/ite-it6505.c | 334 ++++++++++++++++++++++++++++++------
>  1 file changed, 277 insertions(+), 57 deletions(-)
> ---
> base-commit: b8128f7815ff135f0333c1b46dcdf1543c41b860
> change-id: 20241015-upstream-v6-9f4b015fecf7
> 
> Best regards,
> -- 
> Hermes Wu <Hermes.wu@ite.com.tw>
> 
> 

-- 
With best wishes
Dmitry
