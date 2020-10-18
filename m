Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47F291E04
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 21:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC4B6E896;
	Sun, 18 Oct 2020 19:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80976E896
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 19:51:08 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id x7so10952383eje.8
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 12:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Axoep6mzwCJeogoILJ1LCqCxktp9YF81NRKU9qyj8RU=;
 b=WZ/KCVzt+quYHMQn6+Gt7phkbUyXK1kCEBS31x9CLzhHI2wx8Cmuouorq2yxbLspge
 sY6jssnRnemqCdkaUCvxi9SCf8Jc8f9+Nw5Chn6tK0edBaIjspOYZ0CcprnRLR7iwS3K
 zDpkkC63KHMFrfxeFsEK1nPwNJDlCxUihCTgLAAFZP5Cg2pZ9wqzoGCFZyYuAxbI8wth
 RDyLMq0Rg4cAKj7HDYTHzYyMJLZY7jY8zkd8b2ijQMgKdSb/tadpnswAwc3Qao2xyN2p
 hYhy3Xu230RhfKxP7PDHEg8P14n9DimuDUL9HYmdlV89gYuiHqVjHwSremyi7FpVvWsT
 2H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Axoep6mzwCJeogoILJ1LCqCxktp9YF81NRKU9qyj8RU=;
 b=mCz75/oHyWtwucCpSnfwLB8BP5qsPl/P9N3IsvRx8I8gWb8foWca2xfAMkT/3V+FMj
 RWY20DSf096vP6/QZUFfRnSGHYI4CDbMNhUrMXrvfymLyQPP6eE0yET6y+ZD+M1WRoLF
 y0nA7MKWkFmBQWLFOCEtOHFwn+piwANBY2syFa/Lua4r0S/N3f57gYG3SG9tkcQ0m3Yp
 u1N7uHi7d2lG0qsiLL09A36EgXTVBJbudMKU9cRvxG4yvdal7CYSGvwqFRt+fQrUQMrH
 Hjb9T8HV7ki8pxdOMkYeFnEsYT8gBux9s8cPJcKVHtWFbHgiMpMKaCEUTJqYWiMB1jMv
 LQQQ==
X-Gm-Message-State: AOAM530EDNUfDIh0tkv/a/2BTdNe4QAgGS1lgfyCiWiO3+dRSX1JJnwm
 c+cYQEAykg8do8LnFkHTP55Fjo1irFXuUnYyPwU=
X-Google-Smtp-Source: ABdhPJxX1ILaJlpeeqk+Qg/a7DT3ekC0GQrYO+ePgSwdeziowwxEqI/jV9odnqLGqTVRcb7nXiKyX6+Mu2VHkUnKZog=
X-Received: by 2002:a17:906:38c9:: with SMTP id
 r9mr14819854ejd.9.1603050667266; 
 Sun, 18 Oct 2020 12:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
In-Reply-To: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 19 Oct 2020 05:50:56 +1000
Message-ID: <CAPM=9txi-M3uGmYP91F-OacUus_ZuWV81LBqbAXQS-_E-uWOfg@mail.gmail.com>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
To: Kevin Brace <kevinbrace@gmx.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Oct 2020 at 05:15, Kevin Brace <kevinbrace@gmx.com> wrote:
>
> Hi Dave,
>
> It is a little urgent, so I am writing this right now.
> As usual, I pulled in DRM repository code for an out of tree OpenChrome DRM repository a few days ago.
> While going through the changes I need to make to OpenChrome DRM to compile with the latest Linux kernel, I noticed that ttm_bo_init_mm() was discontinued, and it was replaced with ttm_range_man_init().
> ttm_range_man_init() has a parameter called "bool use_tt", but honestly, I do not think it is functioning correctly.
> If I keep "ttm_tt_create" member of ttm_bo_driver struct null by not specifying it, TTM still tries to call it, and crashes due to a null pointer access.
> The workaround I found so far is to specify the "ttm_tt_create" member by copying bo_driver_ttm_tt_create() from drm/drm_gem_vram_helper.c.
> This is what the call trace looks like without specifying the "ttm_tt_create" member (i.e., this member is null).

cc'ing Christian,

I can't remember if we did this deliberately or if just worked by
accident previously.

Either way, you should probably need a ttm_tt_create going forward.

Dave.

>
> _______________________________________________
> . . .
> kernel: [   34.310674] [drm:openchrome_bo_create [openchrome]] Entered openchrome_bo_create.
> kernel: [   34.310697] [drm:openchrome_ttm_domain_to_placement [openchrome]] Entered openchrome_ttm_domain_to_placement.
> kernel: [   34.310706] [drm:openchrome_ttm_domain_to_placement [openchrome]] Exiting openchrome_ttm_domain_to_placement.
> kernel: [   34.310737] BUG: kernel NULL pointer dereference, address: 0000000000000000
> kernel: [   34.310742] #PF: supervisor instruction fetch in kernel mode
> kernel: [   34.310745] #PF: error_code(0x0010) - not-present page
> . . .
> kernel: [   34.310807] Call Trace:
> kernel: [   34.310827]  ttm_tt_create+0x5f/0xa0 [ttm]
> kernel: [   34.310839]  ttm_bo_validate+0xb8/0x140 [ttm]
> kernel: [   34.310886]  ? drm_vma_offset_add+0x56/0x70 [drm]
> kernel: [   34.310897]  ? openchrome_gem_create_ioctl+0x150/0x150 [openchrome]
> . . .
> _______________________________________________
>
> The erroneous call to  "ttm_tt_create" member happens right after TTM placement is performed (openchrome_ttm_domain_to_placement()).
> Currently, OpenChrome DRM's TTM implementation does not use "ttm_tt_create" member, and this arrangement worked fine until Linux 5.9's drm-next code.
> It appears that Linux 5.10's drm-next code broke the code.
>
> Regards,
>
> Kevin Brace
> Brace Computer Laboratory blog
> https://bracecomputerlab.com
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
