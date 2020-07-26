Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7F22DD60
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 10:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026776E0EC;
	Sun, 26 Jul 2020 08:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942596E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 08:57:16 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id m16so6598572pls.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 01:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZP6JsF3L+gDvWgHfD54eIIL78/CR3lRmnvV/akntuxo=;
 b=KKEnX2zyJ6WkI8ZbudaqCNi0gmqCxgGR74WNSBQn1L5ax2cCLiA4yIxbco/HI8MUEe
 /PWnKwGDsY2c4uH3zi7/nNB2V3aKPytCWS3gguyLYHNVQT1thhG25x7sp1KJBmraHmWh
 r2sGLen+0xjKZxb2J9K7oQ7IQTnWzz/b9jq+n5oVOF4ZUSMy7sb+cvXakBzJiyN9vdHk
 95zej/S8i0suWDfeg2ZLV5uLS4Jra1N01tVcu5BP/zccUYoirpfeAzo0J+39lI9zaKge
 bTvoPhu6kDIHbJ0suV41LNBb51EIHmjXorPfaKxRbwIbXMp03ES7a/6jD50ayrnFh81h
 Kerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZP6JsF3L+gDvWgHfD54eIIL78/CR3lRmnvV/akntuxo=;
 b=SzYMFTemWmmIZ0unVnGifkwvXWezMDfdf8gfWZQWrwzcXwZPS9fj6a13Tc3mVa94vR
 yIRA8XzkuVTgAn1ObPhbhwlPrlSA1h8w+cIQdusHhgHCwhPz/JZrOVNA9tIO1JpLoaG3
 2o6rjDii0BPsy//d5kQvRceFBb8wQNiO6d0p833KY7q3MyHznEekKVBCW+roX984HSXf
 2RAtEyQQim2Jod5IGCgX6Z/5CN99GB8zM3hL+Ebz6Z4+xLMvaGVR23rcHnX9syyEtLz3
 lBb3YYihSMEeDNOsE93RYmPfASFBJVVePXRMAfGENhUGe0ZioMJ9RFxbpU2RimNYm+Ho
 UoMg==
X-Gm-Message-State: AOAM533Cj5JiXxmINU1SxDsay4+QfIuUfFDvbrzE1D+x/WQerExh/P0X
 ue5tmHiNFMlC5tHF2StkIJl3JmkKhtkceoy34nE=
X-Google-Smtp-Source: ABdhPJz/011v164prAx72VNLA4uAtxCJ1iLFgTJpcujNZYr5oVQ2I6rVwrYZrx3eEti8ZKJeynfcAEuaKvMiXDR5oRA=
X-Received: by 2002:a17:90a:498b:: with SMTP id
 d11mr14007458pjh.129.1595753836222; 
 Sun, 26 Jul 2020 01:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200726052047.9856-1-gaurav1086@gmail.com>
In-Reply-To: <20200726052047.9856-1-gaurav1086@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 26 Jul 2020 11:57:00 +0300
Message-ID: <CAHp75VcL9sT-Ff6FND1v5pWUF=Ey7MXE61uB5Ae3HMpJaOYaUg@mail.gmail.com>
Subject: Re: [PATCH] [video/fbdev] mbxfb_remove: fix null pointer dereference
To: Gaurav Singh <gaurav1086@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 26, 2020 at 8:26 AM Gaurav Singh <gaurav1086@gmail.com> wrote:
>
> Function mbxfb_debugfs_remove() accesses fbi->par without NULL check,
> hence do the NULL check in the caller mbxfb_remove().

...

> @@ -1012,11 +1012,10 @@ static int mbxfb_remove(struct platform_device *dev)
>
>         write_reg_dly(SYSRST_RST, SYSRST);
>
> -       mbxfb_debugfs_remove(fbi);
> -

>         if (fbi) {

Can you explain how this is NULL on ->remove()?

I bet this check is simply redundant. But you have to check and update
commit message accordingly.

>                 struct mbxfb_info *mfbi = fbi->par;
>
> +               mbxfb_debugfs_remove(fbi);
>                 unregister_framebuffer(fbi);
>                 if (mfbi) {
>                         if (mfbi->platform_remove)


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
