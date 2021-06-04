Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181B239B5B3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 11:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44A96E0C2;
	Fri,  4 Jun 2021 09:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB556E0C2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 09:15:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so5185388wmq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=0iAE1eXsi7Ags0kCh2NQ+Xw4BO7hibZ8156NIUiiC9Y=;
 b=jXU7UgrylnRUSGeCbfj1NxKE31gatksb608K/jN+nlg9LYwbeaeTZoAwcju45NWPNL
 Dll+M8tntKovKq1yobA2cANrzCfOGfHj9DvwCTVs43XpI723jBuZkYsrqBolUZlPSvA4
 1LH0u8TTFb6ZSwQUY/IReeDHz11/L/zgeWokY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=0iAE1eXsi7Ags0kCh2NQ+Xw4BO7hibZ8156NIUiiC9Y=;
 b=f8Inl2qFCelXF5xMQK2hSYtqGsva7qbmUQTQZLmJ1/7IfVhIrl1n8FrEAkTWeCHwoJ
 hrWsFHyAWVHq7ZRg31ybXfqdz+3w8/KR7cEiDoCDUx18R3izhTx20vU55+hXngkx+OmU
 854/3TJawJtyxwSrqe7bR4LGpmLEeJpa4mQCR81O+g9DV77mmwEYSpzKQDteNGgfjM3i
 U7n2SffGwytbrzpRX76tlD6Ig2fOdi8bFwqFieneK5J71INRDt+CP1q2Fg0B7ni4RQIK
 J7c6GipSC/tF1E1bvJyG6Ly4P+H8hU2EB9spiehxmgmzllvXf7TMDNeGszzXSarQU/Ji
 NZ9Q==
X-Gm-Message-State: AOAM530ewEhHXff22SSWhPdm/KlmaDezst0AQFvyRvtWuc/DQIm63OeO
 C6LPS7lqFnQAccunIvZfPsmqLQ==
X-Google-Smtp-Source: ABdhPJyTtG/bEVOcLkvg2qjVHIyuSghlJN1mBim4VUqjG8axFLCZdSqoqLk9+jMvv7gN3CG7HSk3Bg==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr2640565wmi.117.1622798115481; 
 Fri, 04 Jun 2021 02:15:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o17sm5681880wrp.47.2021.06.04.02.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 02:15:15 -0700 (PDT)
Date: Fri, 4 Jun 2021 11:15:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
Message-ID: <YLnvIYKduzv56YAA@phenom.ffwll.local>
Mail-Followup-To: Linus Walleij <linus.walleij@linaro.org>,
 Kees Cook <keescook@chromium.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
References: <20210604014055.4060521-1-keescook@chromium.org>
 <CACRpkdZEQ+C7tSppcJ83Go70CaBLe4XYKBqYqJfZWAYq-H2+wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZEQ+C7tSppcJ83Go70CaBLe4XYKBqYqJfZWAYq-H2+wA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Kees Cook <keescook@chromium.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 09:44:59AM +0200, Linus Walleij wrote:
> On Fri, Jun 4, 2021 at 3:41 AM Kees Cook <keescook@chromium.org> wrote:
> 
> > VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
> > pl111 is modular. Update the Kconfig to reflect the need.
> >
> > Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")
> 
> Yeah that doesn't work, thanks for fixing this!
> 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> > -       depends on VEXPRESS_CONFIG
> > +       depends on ARM || ARM64 || COMPILE_TEST
> > +       depends on VEXPRESS_CONFIG || VEXPRESS_CONFIG=n
> 
> That's the right solution,
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Since I screwed up already, care to also push this to drm-misc-next?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
