Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A43ADBBD
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 22:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293376E071;
	Sat, 19 Jun 2021 20:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDC96E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 20:44:00 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id c11so19127127ljd.6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 13:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8GbMbqcQNUFvLy7t/rqOVL6WYkEUAA9eyNxHIfi2L94=;
 b=frwKhwlYwORDL90TK5zmJRbWkD2Py/0Uq5CFEXhAasiTywccZx9UJHn0NHo40MWJmb
 tK3jqsOvFXawKzSghYMnb0wGnkn4ZqjBBxZXYnyaV64AtO0rU5aQygcwI7xUD09W5rMl
 cmTxNx6x0AGBNV8qdDi7nDWSRiJFdDqzbcF0xtsHTHQCETUTG3jXGVQZIXU5/Rfdug2n
 FrXIV0hNa3Atx9mt0PWVzBRx8bGGQJ7cg4iQethA5nb7YOBzRHnztmUDc/psuchbTW76
 iShl8BKFIrneAWojK6BKwI+uQLhXzf8nWcG5qfq3YTPhdnp/uGyaPswSD09rG/hNiUoO
 qrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8GbMbqcQNUFvLy7t/rqOVL6WYkEUAA9eyNxHIfi2L94=;
 b=DKJAL8IXKJ5ip3Pmfp00dkHIUbOtvbuOBckdSwMGAx5cpWmGgxhvDngCxt9VkwB7+Y
 yrPjcqvqXl9l2MKa/c6XvxrVutZl05PDsORYglDy8CW3AejV0U7wCQSqByOIOmMCYI2O
 Gr26jy9zFCpMCpNlcl+XdR8rihVpjLWo9+7tqDruiFLteV4JHOQb13PKE2J1+qxZCNXW
 JyYWhKKpdegCp8aJSB9jEbcLaACVStOnuR/JXnLMnL6pQJEH+PxBT0SHmoXxT7IZlJpd
 aIQaecfwF5TgbpaviPuXXiU2LJ8nfCBZFAmisdBIEGXzGQJAvC5HICb528OsgZkHjzPg
 VFjA==
X-Gm-Message-State: AOAM5312dB55s8NOmTlzErkHIv/8HA40po/b8WrfwCkR9ZTca0emzy6u
 0F3Y+b59m3Q5YopIRN2zTyqwszxVN4PNcH2o0H0=
X-Google-Smtp-Source: ABdhPJwSkGENbChwA2P/eGQlExYm0gQQR8dt6/aMVCK5PKYVPF5tvRKmaD8UwMXFCywmsWxNgbZP6GjBY63+y5hdeZM=
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr14977906ljp.24.1624135438613; 
 Sat, 19 Jun 2021 13:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210618183524.590186-1-colin.king@canonical.com>
 <20210619134025.GH1861@kadam>
In-Reply-To: <20210619134025.GH1861@kadam>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sat, 19 Jun 2021 22:43:47 +0200
Message-ID: <CAMeQTsaN-GYzix6X18bWxKY1L13bTrUUYDmp6tFdvaERZEj=3g@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500/oaktrail_lvds: replace continue with break
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 19, 2021 at 3:40 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jun 18, 2021 at 07:35:24PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently a loop scans through the connector list checking
> > for connectors that do not match a specific criteria. The
> > use of the continue statement is a little unintuitive and
> > can confuse static analysis checking.  Invert the criteria
> > matching logic and use a break to terminate the loop once
> > the first suitable connector has been found.
> >
> > Thanks to Patrik Jakobsson for explaining the original
> > intent of the code and suggesting this change.
> >
> > Addresses-Coverity: ("Continue has no effect")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/gpu/drm/gma500/oaktrail_lvds.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > index 432bdcc57ac9..8541dcf237eb 100644
> > --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > @@ -113,8 +113,8 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
> >
> >       /* Find the connector we're trying to set up */
> >       list_for_each_entry(connector, &mode_config->connector_list, head) {
> > -             if (!connector->encoder || connector->encoder->crtc != crtc)
> > -                     continue;
> > +             if (connector->encoder && connector->encoder->crtc == crtc)
> > +                     break;
> >       }
> >
> >       if (!connector) {
>
> This test is wrong/impossible.  It should be:
>
>         if (list_entry_is_head(connector, &mode_config->connector_list,
>                                head)) {

Right, we should be back at the head if no match was found. Actually,
when looking closer, we should use drm_for_each_connector_iter() when
walking the connector list together with proper locking.

-Patrik

>
> regards,
> dan carpenter
>
>
