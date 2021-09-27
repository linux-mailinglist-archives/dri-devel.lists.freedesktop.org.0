Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C764198D3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 18:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7458489FBC;
	Mon, 27 Sep 2021 16:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FBC89FBC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 16:23:46 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y8so16331910pfa.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GrJG+rwDoaYG7HFW8GCZPuZNJMWLA/Q3Bhmee7Qx6+Q=;
 b=nDkeCEeP/JnEXHtclCNjpgccysiO9z5+1qsvWdza+YdXdRzWVM8VpwMJOqaWO8Lv6f
 yVgyPZxKBFT/xMah8M5RXQr04lLRWPPD18RH7rfUumFbV2eXqu49oskx5rqJNLRaoy26
 Gu5A9XBRje0GDqgHWZv2XPw/ycZqDy/v8Lf3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GrJG+rwDoaYG7HFW8GCZPuZNJMWLA/Q3Bhmee7Qx6+Q=;
 b=UN1sw+9gtWVaP13adOizSnCypXS1NXr9ryQ5kUHpkNfTdWVKT4F3rosDIcz5Dr2Nwq
 DsNX4bsk6MXcDH4YhOth8KCsTv7adX9Gt3n+r+5aJSfDL0X9Svaa2Ep+AWFKE0AP9WxL
 zDWt84NqviESzXJfjPPZn47jKmCsMdUBRm0jC7asO2ONQvkf00QZW3Ug/p1zmscx3NxL
 n4YdeFr9rDQDLMj52yjh+rG1InBo4gVMmuFcxDDeyW/dHfR6rg0h6HWizF+DtNgAFBNg
 hanKDxbnze+xYwcFQ3Rpuh6nFrWJHH86/A3z6TzHCxadDoqZ5sbf5BjeKF6Su/HBWMP6
 vRgw==
X-Gm-Message-State: AOAM5311MZEvp88osl8MYKieuHSGUr9hADoYfAb7nMW5p+b5Semwpwhp
 6JFUTqZTT1GISNJKriKfDuUhMw==
X-Google-Smtp-Source: ABdhPJxgip2RoIeiUy0OKwHW6HRCTe1Y1Iw84My0njAXIF+cR6eK9S/VGJsCSQIsay9o/bzTXSvBZA==
X-Received: by 2002:a62:8688:0:b0:44b:38cd:c2b8 with SMTP id
 x130-20020a628688000000b0044b38cdc2b8mr790332pfd.12.1632759826508; 
 Mon, 27 Sep 2021 09:23:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w18sm18561806pff.39.2021.09.27.09.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:23:46 -0700 (PDT)
Date: Mon, 27 Sep 2021 09:23:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
Message-ID: <202109270923.97AFDE89DB@keescook>
References: <20210927142816.2069269-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927142816.2069269-1-arnd@kernel.org>
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

On Mon, Sep 27, 2021 at 04:28:02PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With CONFIG_FB=m and CONFIG_DRM=y, we get a link error in the fb helper:
> 
> aarch64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
> (.text+0x10cc): undefined reference to `framebuffer_alloc'
> 
> Tighten the dependency so it is only allowed in the case that DRM can
> link against FB.
> 
> Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> Link: https://lore.kernel.org/all/20210721152211.2706171-1-arnd@kernel.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for fixing this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
