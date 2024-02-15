Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7638562CB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D3410E738;
	Thu, 15 Feb 2024 12:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y0UMQMog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE6710E738
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:13:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so411672f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 04:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707999208; x=1708604008; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ztKOJXZUQlmom6xQKGWtUiTuW3B1WQBrh5Kjye/DMFE=;
 b=Y0UMQMogAyE1qGREmt+Rqpxl4DqEimgrn3YZL5gvgWcBVg5kGWvWyWr+BBoxqd4+Ig
 vH57zSd2zS+EuvSjpgPOpTgglt5QUfiErkYq3p9nTlXan3cp/a8ANq8oaA6gIcpVRD8x
 n3h1m68qqoO99Jhj2A5q52Oy8GTm3wvkrSIhoINcSIPAzrE/gOy32heyeEKrl3HpftpX
 KFoEDefI4W6dPbfqZ0XOvwJtHhCI9MPv0SLF/Wx87QJGQ/1W7M5J00nK8RDsiAp0NFXi
 uy1OZi2oJ+i74hdxacRYbjfxwYujiB6iybuDqYl+yd0mKz/kLVSihyg1Idfr95dIww4k
 marw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707999208; x=1708604008;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztKOJXZUQlmom6xQKGWtUiTuW3B1WQBrh5Kjye/DMFE=;
 b=R673fxqRn1Akng+Xz6s0G72f5nYr/IXcRjoLikUPASsJdlg/t0KbIE74AiWqQ17Dj0
 BzdKcM8iZjg6VkBLjBYEWnX6tQrJ9NxevyW8rkmxmRtFvG15gM2ivt/AUCLSdV4s4wPj
 PGNT3NlPsHZ1HsiSpFQKiaTmJyDVBQ8dqP2r92PyrtvUEvLK+NgqwcIiON4Qd+qvn/Y3
 OhtozsYAClVeS466DpN0HSeZU7TOZpqw6A7ADlDtvWsUPJb9Hchi2EpjuYFoqMI+gzND
 ALvAEurI0N1K8XA5dUgc+T3oOqi0yzvSehmwaE7R6VByLGgg8Z5jIM2Dw2jkpduhSDuW
 iECQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxRNfw4E0FcekAksA4wISb/3kmFKEQ3rxoQ97Uhj32Rbyq/TaP5+OMXlt6GxqjRVka7YBSOKxMrATSVo30zL970HodP/JtzO/3KIu1/T2t
X-Gm-Message-State: AOJu0Yxw7gopvjWNSaEF6PYCGETHLEcThrrzTc3d40GNQabfX+6x+WeU
 gu3j5liiS7mDBQ1ikbqAkUj2ySnuyuqAFBtBppt07XwirgAbR3I5XEb0HpdWWBE=
X-Google-Smtp-Source: AGHT+IG3P5/6JWNhRAZMxDeU3U+UujVMo6057seoNpz5jKX5VhBBtJ3zIzJ42dclINgr2k0ttUEtXg==
X-Received: by 2002:adf:f489:0:b0:33b:49db:c719 with SMTP id
 l9-20020adff489000000b0033b49dbc719mr1501651wro.39.1707999208004; 
 Thu, 15 Feb 2024 04:13:28 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a5d6543000000b0033b583ba5e0sm1591192wrv.92.2024.02.15.04.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 04:13:27 -0800 (PST)
Date: Thu, 15 Feb 2024 12:13:26 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/10] backlight: Replace struct fb_info in interfaces
Message-ID: <20240215121326.GL9758@aspen.lan>
References: <20240212162645.5661-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212162645.5661-1-tzimmermann@suse.de>
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

On Mon, Feb 12, 2024 at 05:16:33PM +0100, Thomas Zimmermann wrote:
> Backlight drivers implement struct backlight_ops.check_fb, which
> uses struct fb_info in its interface. Replace the callback with one
> the does not use fb_info.
>
> In DRM, we have several drivers that implement backlight support. By
> including <linux/backlight.h> these drivers depend on <linux/fb.h>.
> At the same time, fbdev is deprecated for new drivers and likely to
> be replaced on many systems.
>
> This patchset is part of a larger effort to implement the backlight
> code without depending on fbdev.
>
> Patch 1 makes the backlight core match backlight and framebuffer
> devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
> drivers and remove unnecessary implementations of check_fb. Finally,
> patch 10 replaces the check_fb hook with controls_device, which
> uses the framebuffer's Linux device instead of the framebuffer.

I won't reply individually but I also took a look at the patches for
the combo devices and it all looked good to me from a backlight
point of view.

However I don't want to drop Reviewed-by: on them since it risks those
bit being mistaken for an ack and merged ahead of the patch 1...


Daniel.
