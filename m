Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19F41D6CF8
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 22:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50126E133;
	Sun, 17 May 2020 20:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234AB6E133
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 20:51:54 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id v192so1916576vkd.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HuJ2WLYv0zRF8B+JPGkCpiPdwwFOt5uR5j693RaNj3Y=;
 b=JipvGWULyStoofw+6xu8c14wXP3TOgoQCoBBKvc2UZLUZeXHa18E/tYOUXXGhW9RHW
 DK/AbH4jnyPiA3mT/zpWhR8ceUTHvZD1Mw+qZf71v1Awc6HYtH43SHMFDGmTHALdCUZs
 QZ5EdaM5SZHqsDAKk265QPpwvo46j7SdYEwCnrY7AdOFHv92Ur6QNrAlx3KZmG0EGdeO
 VQkhxc6MuAp3FUak1aZIIfZbI5TVVZrC2g46ER4djFYLT88Ehg7mZO2nlfQp7L1Lrjdn
 G9cpx4hnc5G5xtOodSF4Be1Hhfgy/Tz0W02x9RbPPRJ+7LdS2v47Ll6E+wiz2VLDg/89
 6K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HuJ2WLYv0zRF8B+JPGkCpiPdwwFOt5uR5j693RaNj3Y=;
 b=UNvYgvpR45aCtw+L053mk80n3nPxrJmNsI/H7AtcJVPOOX3jTJmNYOyqzkjdFt7fTo
 xzJGzB38M/1/u5NlU5e6Csnkl7bxv+dHw7mi7KnUUIO9ygL0/FrZck/moOv6OMC85IEE
 A7mMCOSebP/+IxFcH9wzbtzdjU6Ujt5fBbfxoufSg4Epd8U854n2Hr2C4sCrhZOwlpwI
 VqVVEHxfNaPQQDQ0YQpRpplD6d3pgSyen87cCrw2qGQpiLyxFjQ7CPn9D09YyBC8wuHk
 xCsV7Vss02yFvHhwM6WHwEwPQb3CApafkYARAu+cG9CW9CMBKnmoUd0GbHWIkbn6+XL6
 b6Yg==
X-Gm-Message-State: AOAM531IvYfhiIu+UMduSBnVr9NQJ9fxRVyZxv2WzKtBG4F9I/2/N7vT
 jGs48v7BNvLMW4R1aZeqf6JH9FNgvYvixi5aaqI=
X-Google-Smtp-Source: ABdhPJyroSesHyhfefpRkqqmdlF3nopOpEIHN5Rcry0Zx6awK9qbE7fm6K9HDpVvKmYR2ffCB5bU9JvxCqr774k0cyQ=
X-Received: by 2002:a1f:908b:: with SMTP id s133mr9150573vkd.38.1589748713323; 
 Sun, 17 May 2020 13:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <87shgq8qh9.fsf@nikula.org>
 <20170817104307.17124-1-m.tretter@pengutronix.de>
 <87mv6y8lup.fsf@nikula.org>
In-Reply-To: <87mv6y8lup.fsf@nikula.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 17 May 2020 21:49:04 +0100
Message-ID: <CACvgo52u6pVjA5SjSf6E6aXWuvhb5t=VDcndd+P7Oyup676Obw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/debugfs: fix plain echo to connector "force"
 attribute
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Aug 2017 at 12:34, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Thu, 17 Aug 2017, Michael Tretter <m.tretter@pengutronix.de> wrote:
> > Using plain echo to set the "force" connector attribute fails with
> > -EINVAL, because echo appends a newline to the output.
> >
> > Replace strcmp with sysfs_streq to also accept strings that end with a
> > newline.
> >
> > v2: use sysfs_streq instead of stripping trailing whitespace
> >
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
Seems like this fell through the cracks. Pushed to drm-misc-next.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
