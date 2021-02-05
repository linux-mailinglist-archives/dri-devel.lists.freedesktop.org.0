Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4D73113DD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 22:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011E56F4F5;
	Fri,  5 Feb 2021 21:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358376F4F6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 21:48:28 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id d1so8290044otl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 13:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Myi+FPtqdhmCRGtvUQRPlV0jT+RrPtESC3AjeVRvbg=;
 b=eC9kB4a0zNfmjxF2GTa7/iPip18RksRG3N5wWZ5SO1JQZe9K/wF4qqPray7ex919OI
 t+tp9kXmieLVbXRxK2+JkQQDfBQ7qrCcDPjv892pP0Pm9Opne2wsFWOgNQ9fiIbaKohg
 74D35sOMSr9T35Hijh1VZY9iv0qSmYcBVjy6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Myi+FPtqdhmCRGtvUQRPlV0jT+RrPtESC3AjeVRvbg=;
 b=fIIzHyRpuRDLnYnxOat5doue+K9MmfInFBnwVFrM+/MrGk/2PQ/GtqK0bzRVeRXOR5
 n6Z2icq6TC2ePgR61c9AjWJxUNPGhIvhuQVnAPzIW0gY3qCa298CHIxol3ms9zClG5KD
 /ctsPS7PGsENJSoWW1/cQoOJXr/ehbK24hlavhnlWpVVaip6ZLMH8MImi68d07aAFpF8
 rwJLB4A14X+4qzUZLiy4BML/Vw9r8yRwroK+f22Qtov6IRmi9GCKHrVieWAKeKkLkJ8m
 cNQ8gfcR1mcsO4Q1b98b52FnWhuAqv8+HawXygJMupbTFI1yOZ9DvNnSiOKvEwKvY3vU
 ZAKw==
X-Gm-Message-State: AOAM533WKDlwWfF7HSJJZ5ghRgbIslcPumUnsrSsrfnLi5N/LScbMBoU
 FjyZJsgYbZGh/HSIMyBviFktBYIMhDgfGuvVfwbAMQ==
X-Google-Smtp-Source: ABdhPJzO4wsgNsPeCXBIM+TjlTPuvZslxQG5o19ZlJ38I+bykaN07telVVm1okiylG5taJfGzcXqFg1phGT31X4akVA=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr4982641oth.281.1612561707504;
 Fri, 05 Feb 2021 13:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205210610.29837-1-chris@chris-wilson.co.uk>
 <161255976138.12021.9385501710085642237@build.alporthouse.com>
 <202102051319.E5D8B4528D@keescook>
 <161256053234.12021.17815864250035077266@build.alporthouse.com>
In-Reply-To: <161256053234.12021.17815864250035077266@build.alporthouse.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 5 Feb 2021 22:48:16 +0100
Message-ID: <CAKMK7uHmG-WaYrLyHfcbJJ_LhKA2dOdvBAYKaAyD-s6W0TgRjg@mail.gmail.com>
Subject: Re: [PATCH v2] kernel: Expose SYS_kcmp by default
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 10:28 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Kees Cook (2021-02-05 21:20:33)
> > On Fri, Feb 05, 2021 at 09:16:01PM +0000, Chris Wilson wrote:
> > > The subject should of course be changed, as it is no longer being
> > > enabled by default.
> >
> > "default n" is redundant.
>
> I thought being explicit would be preferred. There are a few other
> default n, so at least it's not the odd-one-out!
>
> > I thought Daniel said CONFIG_DRM needed to
> > "select" it too, though?
>
> Yes. We will need to select it for any DRM driver so that the Vulkan/GL
> stacks can rely on having SYS_kcmp. That deserves to be handled and
> explain within drm/Kconfig, and as they are already shipping with calls
> to SYS_kcmp we may have to ask for a stable backport.

Oh I dreamed and thought it's part of this patch already. So v3 with
matching subject to enabled it for drm?
-Daniel

>
> > Otherwise, yeah, this looks good. Was the
> > export due to the 0-day bot failure reports?
>
> Yes.
> -Chris



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
