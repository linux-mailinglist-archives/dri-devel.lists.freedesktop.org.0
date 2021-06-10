Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15D3A223B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 04:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8423A6E42D;
	Thu, 10 Jun 2021 02:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13CE6E42D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 02:19:58 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id c18so10774454qkc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8uDPH+DyrrwT4lbSphWmCoG1hpViWuQ2w27mykBkFVc=;
 b=Njm7S8vwHEU8y8WEPunSiOxdB85MAQChH0JJOqrIkLcXEISqthVv8toHTTIoj3mQck
 IJi0bhlcQlSbtjo9RCsyYEFqB+HrRD+5LGngi9NSS6HQKRUkpRpZjG84dohQK4yqgtyD
 e7rbI5g9mHtNqwoVWZ5n7XwNz/8043AM2adPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8uDPH+DyrrwT4lbSphWmCoG1hpViWuQ2w27mykBkFVc=;
 b=TjIMC6h0tEyvLJRgpT9N7XssHxVZiOwalXh47XGiXV/nFov16RiXabI/WgoVnNUnMe
 qnSX7lzEwwJeLRHclRAVMfiq+uyjSUiAuHfDFUVn3UzYLzoaj6eIjdp5IrhGtCfSzRZf
 OQGGG7oPN3H41EzF49xONpJtHiq6U+Zi12V3ozHavf2Ht2m6XQT4TVRagJCKhOhbSNJ7
 uLCjktuasZe/EcBI2IahhVJ9Ql5RkjQs/dsqsAiIz2dCDcf38y7PVSLG06mPGt18zika
 R/s+gS5JKJwHL4zfXNAT4nav+GO6UVAB9cGGHD3akCtp/vN7dNGStOq6PsJkxtqm3GwC
 a+ZQ==
X-Gm-Message-State: AOAM533ypQutTMBeCy/JFu2J5ZngzwAtQFFAB1rq0b/Lc3LV92czCn+m
 vWRpGHMQRqHSWFoMVfckXE+8ELFS2EFGNhiCKqE=
X-Google-Smtp-Source: ABdhPJw3IL4mazrZgUhwP9U38MSzT4sS5dTjdzlKcKDRF2J3YiqUCreyiGkPK4H66++NDELboZAPF03DLAnk3a6VVQs=
X-Received: by 2002:a05:620a:1485:: with SMTP id
 w5mr2678230qkj.66.1623291597799; 
 Wed, 09 Jun 2021 19:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210608103833.598348-1-joel@jms.id.au>
 <CAK8P3a00xuEAKTHrCDw52M-YPJUphSU8bYayW9P_xyNDsTsNzg@mail.gmail.com>
 <3877ae18-dbda-242a-60b2-f73734f8ba03@xs4all.nl>
 <CAK8P3a18EdBKQdGDOZc9cPKsf=hY8==v2cO0DBE_tyd82Uq-Ng@mail.gmail.com>
In-Reply-To: <CAK8P3a18EdBKQdGDOZc9cPKsf=hY8==v2cO0DBE_tyd82Uq-Ng@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Jun 2021 02:19:45 +0000
Message-ID: <CACPK8XcXABRKMRq95+w+TNW8NNccd0otoK5uRBSPca535yq7rA@mail.gmail.com>
Subject: Re: [PATCH] ARM: config: Refresh mutli v7
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Jun 2021 at 09:30, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jun 8, 2021 at 6:49 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > On 08/06/2021 18:14, Arnd Bergmann wrote:
> >
> > Right now it is inherent to the driver. It is probably possible to drop support
> > for video overlay devices if CONFIG_FB=n, but it is not something I have time
> > for. It's just a test driver (albeit a very useful test driver), so it is no
> > big deal if it is disabled when CONFIG_FB=n.
>
> Ok, thanks for the reply, makes sense.
>
> I checked what other consequences there are if we disable CONFIG_FB
> and CONFIG_DRM_KMS_FB_HELPER=y in all the defconfigs now,
> as the patch from Kees did.
>
> It appears that the only other arm32 framebuffers that remain are
> FB_EFI=y, FB_WM8505=y, FB_MX3=m and FB_SIMPLE=y.

FB_SH_MOBILE_LCDC on arm32 too.

> As long as simplefb, efifb and xenfb are needed though, we probably
> want CONFIG_FB=y anyway and leaving VIVID=m with the dependency
> does not cause problems until those are all turned into drm drivers.

I will go ahead with this for the v7 defconfig.

Cheers,

Joel
