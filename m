Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00975AE4A6F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4B110E42A;
	Mon, 23 Jun 2025 16:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xaN2OiaN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B095210E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:18:34 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so2426961f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750695513; x=1751300313; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8P4BKlF0L91nBpuIvtJw81/Y/F3X1v/6aoitvWQlibo=;
 b=xaN2OiaNC0T+/HsStt6j8GJ1Uu1mA3HAX29CvfCuzYnUMluuquWgbS2M0I8Y76d9wB
 DtbI7SNZr6yFfiM9pa7oLskua3fpIU6zmks/JcCKi6I9TZiUbV4WHhy/vlS83yHKZajw
 XVXp4pBKhgiOKz5wk1VGeq1UD/rGNuGDZL3gjT8H3CmSiH0H9ktAplR2cXDZkn86DLYt
 HXzHfMU9q/PZXhrIZdpZhavQb/aN+O4AtfWdbuMh82cER9PgrJeQuQrQIpZHK5pwCj7t
 Q1p5PQrJuz5JdWNTxNNXrYGb5c97qSTZICDyb8VgVoKGEZQDmX5ImM4HOsrwTCiqwiiu
 Xn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750695513; x=1751300313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8P4BKlF0L91nBpuIvtJw81/Y/F3X1v/6aoitvWQlibo=;
 b=RXdgHbyA7kiD5fuCHtgR01XTEuokkHbwrLSfuVtn3PgNZPn/3z+O3GaLVEdE7m9DHb
 +XZROGFfgXEyBBL38oUXfSUef2AfFXaAxznY73klyZsIna0TeqWT7ZZLfbWcVDt+yHv1
 7qZxXFNNA7vngofdHLzWzSFv7YQtsRSKQ1hZL9tVLvOYiE6lMMci746m0Cu2vZpu03VZ
 jIV7tW3+Fmxwn+s4XPV9t9ALMZcAqmOOFiDC+XC7gUZbAiCcfb4Si7HRHBN101OMTy1h
 wGDnTZwGxb93x3XRHqNU8yPjDklye8TusR6K21EXSo3KUjaZUMZVVy+1gt7m1NTu1JXR
 P2sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU6GuHi70m6mfWzZasvikVuWdFFnxx/DBiJR9v1Ba+BCQHXVpt543eFuREsT2qCcmgm6dEFODhNks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6v5QzlN8Ls6dLlldB0qwlBHkjLSLnL6mf3lHwCF3XYpP1X9o4
 kkDFQjbp7cqrL3FkbzZMWQw4H2dwNYfcpIBwqfYb0WGvPPFMMeWN4akpixZH9UTYULw=
X-Gm-Gg: ASbGnctX+Bne9J8kOGq5MN4RGl3HsbSTP6f38n1MR3y+WqmL0YoLYggRgiDMB0wjgrt
 GY1ILrPtfHJPe+IeECZ2s/8FMCED3sHEpklazBSh5Xnp4vlnbMeuypLKmZUsPdTS6AX6JEAiD7M
 hAs/oyswvO1xg1yVYOyKfLTugLjAVcpLzlw0T6I/H4l1gwbp4q87O2DNwA7TL3PnidhlTnrEqfF
 8HZY4cbdPr9UFOT/+pfGZh8FGHXV9HT5uuarYMGsM2qYuDDCbOwtmC8hGG5soW7sM+jlcsesVn/
 Wzzo4tPOmYF+jgE40ChKn0vWhdYriha3f/Im7BPAck9UF+SVEis65I7+eHuuncEHmRdqlvKeIQ=
 =
X-Google-Smtp-Source: AGHT+IGRAHfzz02yaZCUQ4NgxRMmn6Ic0SvW0VIh60ro1+UYsZHIgHMHFSGMA6Pf56q88UTsOQG+Ig==
X-Received: by 2002:a05:6000:2882:b0:3a5:23c6:eeee with SMTP id
 ffacd0b85a97d-3a6e71ddb32mr130435f8f.21.1750695513111; 
 Mon, 23 Jun 2025 09:18:33 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b3ca:db17:bc4f:ae5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d0f1054bsm9701697f8f.9.2025.06.23.09.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 09:18:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:18:27 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <aFl-U-QX4T6retMq@linaro.org>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
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

On Thu, May 29, 2025 at 10:40:12AM +0800, Xilin Wu wrote:
> On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <lumag@kernel.org>
> > 
> > The MSM DisplayPort driver implements several HDMI codec functions
> > in the driver, e.g. it manually manages HDMI codec device registration,
> > returning ELD and plugged_cb support. In order to reduce code
> > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > integration.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > support. Present DRM HDMI Audio support has been written with the HDMI
> > and in particular DRM HDMI Connector framework support, however those
> > audio helpers can be easily reused for DisplayPort drivers too.
> > 
> > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > has to manually (and correctly) implement the get_eld() and plugged_cb
> > support.
> > 
> > Implement necessary integration in drm_bridge_connector and provide an
> > example implementation in the msm/dp driver.
> > ---
> > Changes in v7:
> > - Dropped applied patches
> > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > 
> > Changes in v6:
> > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> >    callbacks to the drm_bridge interface (Maxime)
> > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > 
> > Changes in v5:
> > - Rebased on top of linux-next, also handling HDMI audio piece of the
> >    MSM HDMI driver.
> > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > 
> > Changes in v4:
> > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> >    HDMI driver.
> > - Drop outdated comment regarding subconnector from the commit message.
> > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > 
> > Changes in v3:
> > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> >    (Laurent, Maxime)
> > - Dropped the subconnector patch (again)
> > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > 
> > Changes in v2:
> > - Added drm_connector_attach_dp_subconnector_property() patches
> > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > ---
> >   drivers/gpu/drm/msm/Kconfig         |   1 +
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> >   drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> >   drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> >   6 files changed, 31 insertions(+), 170 deletions(-)
> > 
> 
> This change breaks DP audio on the qcs6490 platform, tested on kernel
> next-20250528.
> 
> [    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
> [    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> dai_count 0
> [    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> Missing hw_params
> [    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> Invalid parameters
> [    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with driver
> hdmi-audio-codec failed with error -22
> [    0.370536] [drm] Initialized msm 1.12.0 for ae01000.display-controller
> on minor 0
> 
> Manually reverting this change solves the problem.
> 

Try applying the following patch, the current code in next/mainline is
broken and de-references some wrong memory. Probably pure luck that it
ever worked during testing. :/

https://lore.kernel.org/dri-devel/20250620011616.118-1-kernel@airkyi.com/

Thanks,
Stephan
