Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229372ECDB9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 11:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499456E429;
	Thu,  7 Jan 2021 10:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0277F6E429
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 10:25:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d26so5057965wrb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 02:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q5rvJkUeSBWhWwRAjIIx0QNaxhxPrEELieTOExEn4A8=;
 b=DSmEF/phZV5xTxSq0Py9r74S4FG8kD9oOwTXNS6ld56odxXcnPOh3tqOc0b0I55B1w
 pyX9X7wNRQYNd68MizOQhaXIlP4EvLOtpDuxCviFIKEtUsQsyNjotgSYJyTCNHMxNBpe
 Bw3v2hM0jJK88vGMvuh7snyzCSCHN9oJfPwrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q5rvJkUeSBWhWwRAjIIx0QNaxhxPrEELieTOExEn4A8=;
 b=Az4QUYT9mNm1JkzGEXuvaTRybCkZFYWQuWjEKaX5NBrwxrAiikIovZmeI+QfmJiC91
 +kjV84z7eg/sHxKEXHeIyPusAI0Xop0BjtLSzeFFusG8T74RyDVBS8Ug2Sc5rM35FZM0
 I7gm3ybjXRczFeZIBWKR/Gf03VDJJeMSIY9beSgRXf48Onvt2/WPWqM6u6JyQdsOOW+n
 Oc8LtEYfsa48DtUGwDf0dbx+ZxJXM0fsWuevh1TaBNdtQzOIFRD1xti3vjtNgpJ6pyvg
 +DBEPUSdfWIMR+x7TmcOLzkL3h+z5PDhfeY+JKF6uOOjtX6tizr3TGH1p5pS1y7ONpvu
 tO5A==
X-Gm-Message-State: AOAM5304mqbtK6DYAVgUalVsBDR+eO9jXy/NLNKKQofkSlLAv8R6H0Bc
 tOZ4PLEZVfcvs9f7Z8pnFpcyWA==
X-Google-Smtp-Source: ABdhPJyAS4VHEtVVG2+JNwiSDBi0GTELHKagTLLOvmzAMb1KZrVTnsQzxliZLmFhOs/gmAABP/3ySw==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr8265466wru.197.1610015143611; 
 Thu, 07 Jan 2021 02:25:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n11sm8251915wra.9.2021.01.07.02.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:25:42 -0800 (PST)
Date: Thu, 7 Jan 2021 11:25:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [GIT PULL] drm/imx: fixes and drm managed resources
Message-ID: <X/bhpVdoNaTQ/Gnd@phenom.ffwll.local>
References: <c745fc1596898932c9454fd2979297b4242566a2.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c745fc1596898932c9454fd2979297b4242566a2.camel@pengutronix.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 04, 2021 at 06:10:31PM +0100, Philipp Zabel wrote:
> Hi Dave, Daniel,
> 
> this PR includes the drmm encoder/plane/crtc allocation functions and
> converts the imx-drm driver to use them.
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/git/pza/linux.git tags/imx-drm-next-2021-01-04

Pulled, thanks. Daniel

> 
> for you to fetch changes up to 16da8e9a7767ac77720f49bfa870def61a250cda:
> 
>   drm/imx: ipuv3-crtc: use drm managed resources (2021-01-04 12:59:34 +0100)
> 
> ----------------------------------------------------------------
> drm/imx: fixes and drm managed resources
> 
> - Reduce stack usage in ipu-di.
> - Fix imx-ldb for compile tests.
> - Make drm encoder control functions optional.
> - Add drm managed variants drmm_encoder_alloc(),
>   drmm_simple_encoder_alloc(), drmm_universal_plane_alloc(), and
>   drmm_crtc_alloc_with_planes() for drm_encoder_init(),
>   drm_simple_encoder_init(), drm_universal_plane_init(), and
>   drm_crtc_init_with_planes(), respectively.
> - Update imx-drm to use the new functions for drm managed resource
>   allocation, moving initialization from bind to probe where possible.
> - Fix imx-tve clock provider leak.
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       drm/imx: depend on COMMON_CLK to fix compile tests
> 
> Lee Jones (1):
>       gpu/ipu-v3/ipu-di: Strip out 2 unused 'di_sync_config' entries
> 
> Philipp Zabel (19):
>       drm/encoder: make encoder control functions optional
>       drm: add drmm_encoder_alloc()
>       drm/simple_kms_helper: add drmm_simple_encoder_alloc()
>       drm/plane: add drmm_universal_plane_alloc()
>       drm/crtc: add drmm_crtc_alloc_with_planes()
>       drm/imx: dw_hdmi-imx: move initialization into probe
>       drm/imx: imx-ldb: use local connector variable
>       drm/imx: imx-ldb: move initialization into probe
>       drm/imx: imx-tve: use local encoder and connector variables
>       drm/imx: imx-tve: move initialization into probe
>       drm/imx: imx-tve: use devm_clk_register
>       drm/imx: parallel-display: use local bridge and connector variables
>       drm/imx: parallel-display: move initialization into probe
>       drm/imx: dw_hdmi-imx: use drm managed resources
>       drm/imx: imx-ldb: use drm managed resources
>       drm/imx: imx-tve: use drm managed resources
>       drm/imx: parallel-display: use drm managed resources
>       drm/imx: ipuv3-plane: use drm managed resources
>       drm/imx: ipuv3-crtc: use drm managed resources
> 
> Zheng Yongjun (1):
>       gpu: drm: imx: convert comma to semicolon
> 
>  drivers/gpu/drm/drm_crtc.c              | 125 ++++++++++++++++++++++-------
>  drivers/gpu/drm/drm_encoder.c           | 113 +++++++++++++++++++++------
>  drivers/gpu/drm/drm_mode_config.c       |   2 +-
>  drivers/gpu/drm/drm_plane.c             | 134 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/drm_simple_kms_helper.c |  14 +++-
>  drivers/gpu/drm/imx/Kconfig             |   1 +
>  drivers/gpu/drm/imx/dw_hdmi-imx.c       |  95 ++++++++++------------
>  drivers/gpu/drm/imx/imx-ldb.c           | 109 +++++++++++++++-----------
>  drivers/gpu/drm/imx/imx-tve.c           | 109 +++++++++++++-------------
>  drivers/gpu/drm/imx/ipuv3-crtc.c        | 131 ++++++++++---------------------
>  drivers/gpu/drm/imx/ipuv3-plane.c       |  69 ++++++++--------
>  drivers/gpu/drm/imx/ipuv3-plane.h       |   3 -
>  drivers/gpu/drm/imx/parallel-display.c  |  93 +++++++++++-----------
>  drivers/gpu/ipu-v3/ipu-di.c             |   4 -
>  include/drm/drm_crtc.h                  |  33 ++++++++
>  include/drm/drm_encoder.h               |  32 +++++++-
>  include/drm/drm_plane.h                 |  42 ++++++++++
>  include/drm/drm_simple_kms_helper.h     |  24 ++++++
>  18 files changed, 712 insertions(+), 421 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
