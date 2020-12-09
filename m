Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC1B2D3772
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2064389938;
	Wed,  9 Dec 2020 00:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B95389938
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:15:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g185so17633wmf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ljBtQolw/fSCvWvCfsGfzj3Tx3q5ClxzHfhBpA/Uyt4=;
 b=CLJf6yIL6mEMOL3978I4oWSOnMEU4fVaokClcSl2zOqxLVG1V/nYnHLHoWCpP9xav6
 Hq8VfudGPyr9P/BYzKoOH7m9hpOAVHIVX0VpMic9bjjC4r2byOOTJlsgeHcskELJZ6T7
 OPiPtlelUCoDP99rGEmRtYINu+Pnj6hKLYtec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ljBtQolw/fSCvWvCfsGfzj3Tx3q5ClxzHfhBpA/Uyt4=;
 b=ib9IryKQKRW8Lvyi6VlQ9qwOvxSotyPDqmxuDYv00rsgi9LmiVBqGP4PddHdW+Vyml
 kkft1acX918Kv5nIXWyB+KyaOQQcueyoQWNCrTy6JKDpbHyPCpM7ZlrJLzsYr0n3AF/d
 MBuMHeVcNk/An7PNpy2v6jo1NoNzIIXU9rt1wwjPxAdiw2WTLDvEBn7GA3ipSWx48nbC
 GuIrDqZ4fI3E0kJEnz2wCAVBemZ9Sjw2TQMFRgnyOcNBf7L54bp7YLtjg8AeEfLn+ELW
 qZll3kUa8Iqft8qSGR968I2+hBH5xObi850x3z6YPaWSwf9sfzHam3Kq73ZOk8hpTi3/
 ra5Q==
X-Gm-Message-State: AOAM530vA4YQPHHRLsFc1xdj4jxs6XyelaT6pWL8HkmC9bDOIjf8MRgG
 dPBkZ8ANj3VlpUq6oCCLPX9RXQ==
X-Google-Smtp-Source: ABdhPJwj/NmhwyAG8fYm8zoidilZCfCdaOIrJXec5sWPcHC/ofGkvo3LjPuyR9ELahcTOAhVHSIqWg==
X-Received: by 2002:a1c:df85:: with SMTP id w127mr20297wmg.166.1607472922065; 
 Tue, 08 Dec 2020 16:15:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h15sm913327wrw.15.2020.12.08.16.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:15:21 -0800 (PST)
Date: Wed, 9 Dec 2020 01:15:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH drm/hisilicon 0/3] support reading resolutions from EDID
Message-ID: <20201209001519.GG401619@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
 tzimmermann@suse.de, kraxel@redhat.com, alexander.deucher@amd.com,
 tglx@linutronix.de, dri-devel@lists.freedesktop.org,
 xinliang.liu@linaro.org, linux-kernel@vger.kernel.org
References: <1607045326-47771-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607045326-47771-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org, kraxel@redhat.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 04, 2020 at 09:28:33AM +0800, Tian Tao wrote:
> patch #1 add a new file to implements i2c adapters, #2 read the
> resolution from the edid, if that fails, set the resolution to fixed.
> patch #3 update the destroy callback function to release the i2c adapters.
> 
> Tian Tao (3):
>   drm/hisilicon: Support i2c driver algorithms for bit-shift adapters
>   drm/hisilicon: Features to support reading resolutions from EDID
>   drm/hisilicon: Releasing Resources in the Destroy callback Function

Just fyi, something with your patch submission got mangled. This one
doesn't seem to have any follow-up patches, the previous one had a
selection of unrelated bugfixes.
-Daniel

> 
>  drivers/gpu/drm/hisilicon/hibmc/Makefile         |  2 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  | 21 ++++-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c  | 98 ++++++++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 45 +++++++++--
>  4 files changed, 157 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
> 
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
