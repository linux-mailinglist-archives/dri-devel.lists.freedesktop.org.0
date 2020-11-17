Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981362B6DFE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 20:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2394F89F33;
	Tue, 17 Nov 2020 19:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC03B89F33
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:02:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h2so4330874wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aB3RzbF3m+Z6/FqXxyXIhr+Vt8dqXl3DQEjdVHMAUy0=;
 b=bjFj8+TPtQ91/C4v+b7Q3YX2K36GbTX82dI9b4XJJyTVGANQGMae74PG7x4101XdKE
 YsUWmw7CIPHamCogS+tsfuM3qEL0q4Ur1cJaA/GPPBhNVajADE4yS0DE4HLaVGjSmAzC
 3MYk/b8xWFtlxRwxIOvSUvuA385V+kiL1S4dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aB3RzbF3m+Z6/FqXxyXIhr+Vt8dqXl3DQEjdVHMAUy0=;
 b=QuK+N+dZNEEnkIJmj50bg34hou8n8jiumcMeLVp9lgFd+EySBAAspaDOkN/PJbnX74
 7B/J5LUddJGMGchEQhM4x0vLvPyE7DrECAQFbUWJx3IXqP2GVBYKC0Fzecc2nfoWSXNb
 g6S1T+9Jh4pdSf7H55aHB1tmHviFG6PwgdwwdXFVXVKK1FYJaVAq7fRtAEmqMxgsS9Mj
 sm7mZZYeTs5BU7VZOtx8EvI5jT+7hxT3YjmInvZn6RsvAgm7kPB+kKdlwwlh9PCC3995
 3qcla02/ivwfT9QfTe6zsa4btb7qZLBKfxRWcMepwhO/jWiC0hKDWaUA8/YnB+qDbZlF
 kV1w==
X-Gm-Message-State: AOAM533uV3UPowdF8iv2CSKcG+n23GyyNTIcY1/JwyeymhgiCrII40j+
 V2px3IvUD5+g0UPd09sRUDTGYg==
X-Google-Smtp-Source: ABdhPJy33P35zG5c/C2euGoTdmYRuFwy2hKncNNGdVb5M/FEMoYCCXo0rdgmO/wiGFMvk6EwL//oAQ==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr542288wml.174.1605639754375;
 Tue, 17 Nov 2020 11:02:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v19sm5020653wmj.31.2020.11.17.11.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:02:33 -0800 (PST)
Date: Tue, 17 Nov 2020 20:02:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 21/42] drm/nouveau/nvkm/core/firmware: Fix formatting,
 provide missing param description
Message-ID: <20201117190231.GQ401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-22-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116174112.1833368-22-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 05:40:51PM +0000, Lee Jones wrote:
> ... and demote non-conformant kernel-doc header.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'subdev' not described in 'nvkm_firmware_get'
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fwname' not described in 'nvkm_firmware_get'
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'ver' not described in 'nvkm_firmware_get'
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_get'
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:106: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_put'
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>

Ben fyi I smashed this into drm-misc-next, seemed trivial enough to not be
a bother.
-Daniel

> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> index 8b25367917ca0..ca1f8463cff51 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> @@ -58,9 +58,10 @@ nvkm_firmware_load_blob(const struct nvkm_subdev *subdev, const char *base,
>  
>  /**
>   * nvkm_firmware_get - load firmware from the official nvidia/chip/ directory
> - * @subdev	subdevice that will use that firmware
> - * @fwname	name of firmware file to load
> - * @fw		firmware structure to load to
> + * @subdev:	subdevice that will use that firmware
> + * @fwname:	name of firmware file to load
> + * @ver:	firmware version to load
> + * @fw:		firmware structure to load to
>   *
>   * Use this function to load firmware files in the form nvidia/chip/fwname.bin.
>   * Firmware files released by NVIDIA will always follow this format.
> @@ -98,7 +99,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, const char *fwname, int ver,
>  	return -ENOENT;
>  }
>  
> -/**
> +/*
>   * nvkm_firmware_put - release firmware loaded with nvkm_firmware_get
>   */
>  void
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
