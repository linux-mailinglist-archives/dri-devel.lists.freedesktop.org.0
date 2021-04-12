Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0EE35C5F0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 14:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B506E53C;
	Mon, 12 Apr 2021 12:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E246E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 12:12:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o20-20020a05600c4fd4b0290114265518afso6731599wmq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LptbleWykRjwV8Nj9LpseiFoEQQ9lAey2RZIBBdtNOI=;
 b=g18GLshhhTVKd2/KAhSGm8rgPUepn+fNmnUo/8Myljr4yUsOFwr2iFCH/jU7sUqm98
 7kcZebBDFYdwhNteNdn4PrfceXLIdjZxxIYJjqZzvu+BUWLSVKnRgfEZqp8wbpIaKQ6c
 RI9CZpHobChuj2+jLL8hKlBoRHOkeVQ1UiNSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LptbleWykRjwV8Nj9LpseiFoEQQ9lAey2RZIBBdtNOI=;
 b=rDg1Q2Oump60grYPGbFBYFQ4rRn0QZu6UuwWHT2HerJk/Nn+6h1QAPOEuWHQV/bzMt
 Y5tCCcJek72pTOCzktfT9G3DVO9rdn3wzLsmuZkxsqmxHijOa2tgF7Kw3cUiX6zUy5rL
 koOwLvwbaSiSC2/IPCVv766KFASgA+w8vme603XBHMRMX5SmsoVQu8wNQSmvL5ksxeK5
 Z2567UXu4GesLFjBw4QR/XKxw3io/Ep3GymBMpKi76i/f518GX9+Bd6/eWEFgv/5jqn7
 +D035V2Ex4nrG79Ww7wOAeu0uoWHM5P/CrOSRuuT1+POnPsb+F7inVMyyD4cSpbB4Vl8
 OzzA==
X-Gm-Message-State: AOAM530AS01LvFpa61rkL8YmKISmByF6e0hgmmBwoWAeW6Y70tx3csvq
 O0Hnshvla6DtNh++Uix19kDXqw==
X-Google-Smtp-Source: ABdhPJylEDt7Z+ZyMBj3GjIexybBB4ALeVyswrb5sk7qXrp1btZh2OZONAlM4G9QU0RLN5iLDGT/rg==
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr26380949wmc.3.1618229522176; 
 Mon, 12 Apr 2021 05:12:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k16sm16652243wro.11.2021.04.12.05.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:12:01 -0700 (PDT)
Date: Mon, 12 Apr 2021 14:11:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH] gpu: drm: Replace bare "unsigned" with "unsigned int"
Message-ID: <YHQ5D25KQ+3uADNo@phenom.ffwll.local>
References: <20210412105309.27156-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412105309.27156-1-fmdefrancesco@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 12:53:09PM +0200, Fabio M. De Francesco wrote:
> Replaced the type "unsigned" with "unsigned int" because it is
> preferred. Issue detected by checkpatch.pl.

Huh, I didn't know that, TIL.

> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks for your patche, merged to drm-misc-next for 5.14.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 5b4547e0f775..46dceb51c90f 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1302,8 +1302,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  	struct drm_crtc_state *new_crtc_state;
>  	struct drm_connector *conn;
>  	struct drm_connector_state *conn_state;
> -	unsigned requested_crtc = 0;
> -	unsigned affected_crtc = 0;
> +	unsigned int requested_crtc = 0;
> +	unsigned int affected_crtc = 0;
>  	int i, ret = 0;
>  
>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
