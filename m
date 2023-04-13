Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8866E0E12
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 15:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D563710E342;
	Thu, 13 Apr 2023 13:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D4910E342
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 13:08:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f45377dcc7so179905f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681391320; x=1683983320;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jLoclJUyhJUs3t9HEwpkULEyIVk1z3GNEgREpdph5TY=;
 b=WR8nlnbAolhrmolAasbtyU31sw2rzDBCA7YC2JHdwqRuA3GY/kNhp37VKKOc/rOSNE
 xg1kYQmwhrMYeE+0BKVYT7IoVImE10E1Ajj22Mpac+QOBUp/idpNyE2IE0bLIsUecBdE
 GletgOAOamyrQoSj5UTXvULAzzkDbAG0SKjg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681391320; x=1683983320;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLoclJUyhJUs3t9HEwpkULEyIVk1z3GNEgREpdph5TY=;
 b=Pos2SR9USCtEkEc9kcuXc5KI783gX+Sy7NH5lO2B4jAZv6Jx9LUkZOSk1K5qqW6+pm
 0+pMXDeP1C9h6i/povXjn78aiCasV7QApNqUZ86V9P8dMYSwQyElbgcQN0Vp1T3o7SfL
 16LQ2RAu3QnXZn+yoSxhCiIk7ZLdUM/CmyV3MGYuHOdHOZR9Y70NwJsL4h/W1/Ppq8bR
 oQjVHxilpivVkjh7bRUlA3NmVJXd9VvrecFs24CJSR0ZQqZLEtBRpaylqwFzSu7WsCCj
 n5y8aiXfHLVwDpR7YZlCncZ1SoN6ErOhWWn5PnKAON/qNyxrPNxbKo2KXj53uCtkQfdP
 6vfA==
X-Gm-Message-State: AAQBX9djP3y+78SHtdzrBi24t7DE2JH6elljFv00zmoRgMqPoU1Uoyu7
 CyjK00mTM/ni/lEao0lLfYfFrQ==
X-Google-Smtp-Source: AKy350YcAOMm6Y0Lvru2wl5OrfKR1vJgtJo6T7FO3gZxLpHR3phM6n+jW9cl/jUbQDt+ZhkvVYSreg==
X-Received: by 2002:a05:6000:ce:b0:2d3:1c7d:a3a3 with SMTP id
 q14-20020a05600000ce00b002d31c7da3a3mr1267663wrx.7.1681391319971; 
 Thu, 13 Apr 2023 06:08:39 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 x17-20020a5d4911000000b002e55cc69169sm1276396wrq.38.2023.04.13.06.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 06:08:39 -0700 (PDT)
Date: Thu, 13 Apr 2023 15:08:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <ZDf+1Sl/PHB4VYNu@phenom.ffwll.local>
References: <877cugckzu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cugckzu.fsf@intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 10:13:57AM +0300, Jani Nikula wrote:
> 
> Hi Dave & Daniel -
> 
> One DSI fix, stable material.
> 
> drm-intel-fixes-2023-04-13:
> drm/i915 fixes for v6.3-rc7:
> - Fix dual link DSI for TGL+
> 
> BR,
> Jani.
> 
> The following changes since commit 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d:
> 
>   Linux 6.3-rc6 (2023-04-09 11:15:57 -0700)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-04-13

Pulled, thanks

> 
> for you to fetch changes up to 6b8446859c971a5783a2cdc90adf32e64de3bd23:
> 
>   drm/i915/dsi: fix DSS CTL register offsets for TGL+ (2023-04-11 11:41:57 +0300)
> 
> ----------------------------------------------------------------
> drm/i915 fixes for v6.3-rc7:
> - Fix dual link DSI for TGL+
> 
> ----------------------------------------------------------------
> Jani Nikula (1):
>       drm/i915/dsi: fix DSS CTL register offsets for TGL+
> 
>  drivers/gpu/drm/i915/display/icl_dsi.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
