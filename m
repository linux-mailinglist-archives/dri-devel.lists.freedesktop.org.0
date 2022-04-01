Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 897E44EEBCB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 12:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D9610E058;
	Fri,  1 Apr 2022 10:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143EF10E058
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 10:48:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so3238640wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oJkMxMbwxEJasoZlU3TxOexkvpR/xRpBOL5jB5OeKsI=;
 b=n6J4GKYqo32zfnvoBEflZ/pHPRtY5/OtPYELnVlZAGyiF3Op3VAwLta9DInyQbumcy
 2P0sIHx5NiFMJGl+on4wU9mXTHTXkM6e8u1g55Ukz8vuDIKup21ztoFxcOZhjHV5gxuo
 9/pSGfwyUEPhqcByQMj5KWTwrcAkYDsdarGgLVoEeKgZWtJQscJHipcCaQK8QVU0bMN7
 /5wtFoE1e+9VtnNlWEQ9JhE2FqrV4TGtuQj5GKzG++vKxtRbCHN6m/puu69+cOTVj6Hk
 JT21G45vA0HIw5ypHPFWvPM3M2cBzbGk4aGjx1CNIgL1BnwSrqk/NMORvkHJHFZyx61P
 Nf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oJkMxMbwxEJasoZlU3TxOexkvpR/xRpBOL5jB5OeKsI=;
 b=5s3fK0BzKNuZz4j8ou8AT5estgvNnuoNGMDmimiuHuP7x3TzHabs0HjLfgC0GnI2dm
 t0XK/J7TULEX2/pxXZTPmydW7HZsVP1qBRLd1yoVQ7QkkZWgin4RuBPph9svLlTpAKOz
 TKtDdMarynBRKamsJMLjio+nl2vSOlBOUsT1zD1vzOvv6225M/QA7XUAK+0PMJWbi79s
 YVYIeSmsV2jEDWriIn2qSBomYVkIkGLKqGR0U+eirrYn1Q7vl7mwNbF3USjYxIq4aHsD
 TlF6O5IY9dyUYC4DCa8yL3XhoMQ1FGOwWI04S29T210+4137Mzbs/dlQ052Uvp34iHEc
 VMGw==
X-Gm-Message-State: AOAM533+qJXogUD816lgtDFJVo3qxNDThWZTI4VmUDd+/2KopB94fgew
 +OdS1Gp8tR6/jz7CD79Ykl1IOg==
X-Google-Smtp-Source: ABdhPJxNae5mtOUlcJ11V8CEEAmEBmIr/8nL58kA+6KZML9ebn7Mi62K14UfN7s2QyBaj6CiP7Da7Q==
X-Received: by 2002:a1c:4e02:0:b0:38c:8a10:e899 with SMTP id
 g2-20020a1c4e02000000b0038c8a10e899mr8210755wmh.125.1648810108632; 
 Fri, 01 Apr 2022 03:48:28 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b0038cfb1a43d6sm1584746wmr.24.2022.04.01.03.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 03:48:28 -0700 (PDT)
Date: Fri, 1 Apr 2022 11:48:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/amdkfd: Create file descriptor after client
 is added to smi_clients list
Message-ID: <YkbYelifDo4zCf/x@google.com>
References: <20220401104451.1951544-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401104451.1951544-1-lee.jones@linaro.org>
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

On Fri, 01 Apr 2022, Lee Jones wrote:

> This ensures userspace cannot prematurely clean-up the client before
> it is fully initialised which has been proven to cause issues in the
> past.
> 
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
> 
> CAVEAT: This patch is completely untested
>         I can't seem to find a configuration strategy to compile test this
>         allyesconfig and allmodconfig do not appear sufficient
> 
> v2: Also remove Client from RCU list in error path
> 
>  drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 24 +++++++++++++--------
>  1 file changed, 15 insertions(+), 9 deletions(-)

Please ignore this re-submission, script error.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
