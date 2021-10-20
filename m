Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896AC4343C7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 05:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B3A6E0AC;
	Wed, 20 Oct 2021 03:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CAC6E0AC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 03:18:02 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id b15so1931861qkl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 20:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6iJYDVLjsvklhkB8c9DS9a2c0Jh+LbYNPXRZM+lUHyU=;
 b=dlknk3fvHcefbDwA7M7vdCrCxkeLeNWx6O+1vztgPe7LjMcpUWKOopTdVBv7hrfaR9
 1ZC3hB6rb0/edHB7evPnZM8kRP+4u9PqwGx0Yl5AjxDb1Vk7FQCw4r/cTI6I4d8xj+Yz
 dBH6gjgYRJO99GlFZC5l9L5CTCnjUrQl3cm98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6iJYDVLjsvklhkB8c9DS9a2c0Jh+LbYNPXRZM+lUHyU=;
 b=GZwte26uGxTIL/iLCHPpcaSh8oVgEZwduYd/rYn3h0IubJTlpvrm8yeGCufk5Ubpjw
 gnaS65OlXKC9Qi3Q9ZyNbt2GUxi1roQ4qgRa8aVp8TwyJVEBFOAPn9w3QTKEqaS43ncG
 xX/H42GZdoWlFR2u1sWKeFRg65pe2o8YTIU75SoC2BUaSC+TH8z464qVsEOAeEmIz+Ep
 0JgxDXaN0WUU5FmbnW/uVE8O2Obt73ICvS+kOI6mTP/rUzZ2qqzagLYmzPH6+AYIgaOR
 p4DVROFZ8phrZ7L1tZeu9c52i0B/ivufTPk4eR4OtHCCVV7h5oQgbr+L9kqWyL3NPtsD
 oj/w==
X-Gm-Message-State: AOAM532W7R5uWq2/WEt2JCc4UmgIp16F2ozwkQPmrzqI1oFp5PrwLNCn
 a0uh7f4n2/Q9jWTOdidt9fZityVzK/mkoIqd
X-Google-Smtp-Source: ABdhPJywTAVEwgedf6pqjpwngCSVjERf844WiCtFFxoBxSrYF1kiCK99o1XHD4fHrFKahOgyWEBHgw==
X-Received: by 2002:a05:620a:4304:: with SMTP id
 u4mr2851947qko.525.1634699881068; 
 Tue, 19 Oct 2021 20:18:01 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id b13sm428850qtq.69.2021.10.19.20.18.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 20:18:00 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id r184so9088368ybc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 20:18:00 -0700 (PDT)
X-Received: by 2002:a25:2d65:: with SMTP id s37mr43305821ybe.511.1634699879553; 
 Tue, 19 Oct 2021 20:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211019175932.1.I96669f75475cbb0ae1749940217876aa8991b703@changeid>
In-Reply-To: <20211019175932.1.I96669f75475cbb0ae1749940217876aa8991b703@changeid>
From: Sean Paul <seanpaul@chromium.org>
Date: Tue, 19 Oct 2021 23:17:22 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJKayd=qeZ2yU+AnT06K4nop45AP2bjdPDLNZOTwaxbHQ@mail.gmail.com>
Message-ID: <CAOw6vbJKayd=qeZ2yU+AnT06K4nop45AP2bjdPDLNZOTwaxbHQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Fixup drm-misc website link
To: Brian Norris <briannorris@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Oct 19, 2021 at 9:00 PM Brian Norris <briannorris@chromium.org> wrote:
>
> https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html gives
> HTTP 404, and https://drm.pages.freedesktop.org/maintainer-tools/
> redirects to freedesktop.org now.
>
> Let's save people the pain of figuring that out.
>

Nice catch!

Reviewed-by: Sean Paul <seanpaul@chromium.org>

(fwiw)

> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 100d7f93a15b..811d8d3e35fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6158,7 +6158,7 @@ M:        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>  M:     Maxime Ripard <mripard@kernel.org>
>  M:     Thomas Zimmermann <tzimmermann@suse.de>
>  S:     Maintained
> -W:     https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
> +W:     https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     Documentation/gpu/
>  F:     drivers/gpu/drm/*
> --
> 2.33.0.1079.g6e70778dc9-goog
>
