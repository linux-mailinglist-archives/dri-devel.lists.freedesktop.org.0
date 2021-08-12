Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFBF3EAC1D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 22:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B364E6E483;
	Thu, 12 Aug 2021 20:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED016E47E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 20:51:27 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id y3so8491250ilm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ZW1F160xjgvVTZH6mN2PNrOraONDIFvuUTyJLurpfM=;
 b=mcBwEpGRXaT0MgQ7pqa8NiL7Eb3vyTjw2YOg+6dGn9Dme8SMPucCFOd+dRZqUifC/R
 d2+8wvhoNy3C2lGIE26gMla0F0ENG43CwsQYhufGzIw+yHP05VNXyeyJW2B2NF9judO4
 QNjkeLLrZ65wZuclJ+lnOHSUMDMPB1yLDzu1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ZW1F160xjgvVTZH6mN2PNrOraONDIFvuUTyJLurpfM=;
 b=uG+QtI4JPZnWhn2ojKYh+kB/fmFGJoCQsaUF+bpam1fKv1m51PvrEUf5tr/oBbuURF
 erZds+bqWZgZ+yfkCUen/+hgUbqfTTH726no3VHQhkTY8ZicNfhAX/J1VPjweI7FPt0S
 qKmMejFlCl5+HYA7NlFFzQo8rCYFi2upsQUNsYNTSWAVW7G4Xdt7zcETqAhi3T0FFZqF
 0hWS9q16ITBoV54f5+YSWFCbf+tyhDUK/ez850ZRLmjEdHrx7rCkCJmGzIHDzyqMwvI8
 cycO+FbPqZNHIpSyQ/xFnPGcakaEECJjKVxc4PsiOCSn1hBkVnCFG23oPCAwPw7ByLwo
 pwEQ==
X-Gm-Message-State: AOAM530Zy9EziR6FLeU7nXm+ixLZkXgeMJTJqiBDoDKDQJWjrG/8ao2R
 B7Sw7LjFTt0K9WldX2YRPlV9iOI4I6r5tA==
X-Google-Smtp-Source: ABdhPJyhgnS18wyxWZZfzckskhQTNcpYSFaFdlNXGFZfrPXBqe+lGpWUhz3SXR4abMqI/468m/J4Hw==
X-Received: by 2002:a92:d586:: with SMTP id a6mr327624iln.283.1628801486241;
 Thu, 12 Aug 2021 13:51:26 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id w10sm1847666ioc.55.2021.08.12.13.51.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 13:51:25 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id s184so10313990ios.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:51:25 -0700 (PDT)
X-Received: by 2002:a05:6602:713:: with SMTP id
 f19mr4618750iox.140.1628801484808; 
 Thu, 12 Aug 2021 13:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210723150944.528c10af@canb.auug.org.au>
 <20210723053418.fizdbfnu4if2hs5x@pengutronix.de>
 <CAMuHMdUCWdys_Xgh0wSuUX9coNFEics6rwnRWrx8f=OW0AYHEA@mail.gmail.com>
In-Reply-To: <CAMuHMdUCWdys_Xgh0wSuUX9coNFEics6rwnRWrx8f=OW0AYHEA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Aug 2021 13:51:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WxwVQ5o3C8QkRe4BQwhQMimme1tX_2x-+Vw-BRm5D9jA@mail.gmail.com>
Message-ID: <CAD=FV=WxwVQ5o3C8QkRe4BQwhQMimme1tX_2x-+Vw-BRm5D9jA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
 Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Aug 10, 2021 at 5:13 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> On Fri, Jul 23, 2021 at 7:35 AM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Fri, Jul 23, 2021 at 03:09:44PM +1000, Stephen Rothwell wrote:
> > > After merging the driver-core tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > drivers/gpu/drm/drm_dp_aux_bus.c:106:13: error: initialization of 'vo=
id (*)(struct device *)' from incompatible pointer type 'int (*)(struct dev=
ice *)' [-Werror=3Dincompatible-pointer-types]
> > >   106 |  .remove  =3D dp_aux_ep_remove,
> > >       |             ^~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/drm_dp_aux_bus.c:106:13: note: (near initialization f=
or 'dp_aux_bus_type.remove')
> > >
> > > Caused by commit
> > >
> > >   aeb33699fc2c ("drm: Introduce the DP AUX bus")
> > >
> > > from the drm tree interacting with commit
> > >
> > >   fc7a6209d571 ("bus: Make remove callback return void")
> > >
> > > from the driver-core tree.
> > >
> > > I applied the following merge fix patch.
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Fri, 23 Jul 2021 14:58:25 +1000
> > > Subject: [PATCH] fix for "drm: Introduce the DP AUX bus"
> > >
> > > interaction with "bus: Make remove callback return void"
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/gpu/drm/drm_dp_aux_bus.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/drm_d=
p_aux_bus.c
> > > index e49a70f3691b..298ea7a49591 100644
> > > --- a/drivers/gpu/drm/drm_dp_aux_bus.c
> > > +++ b/drivers/gpu/drm/drm_dp_aux_bus.c
> > > @@ -67,9 +67,8 @@ static int dp_aux_ep_probe(struct device *dev)
> > >   *
> > >   * Calls through to the endpoint driver remove.
> > >   *
> > > - * Return: 0 if no error or negative error code.
> > >   */
> > > -static int dp_aux_ep_remove(struct device *dev)
> > > +static void dp_aux_ep_remove(struct device *dev)
> > >  {
> > >       struct dp_aux_ep_driver *aux_ep_drv =3D to_dp_aux_ep_drv(dev->d=
river);
> > >       struct dp_aux_ep_device *aux_ep =3D to_dp_aux_ep_dev(dev);
> > > @@ -77,8 +76,6 @@ static int dp_aux_ep_remove(struct device *dev)
> > >       if (aux_ep_drv->remove)
> > >               aux_ep_drv->remove(aux_ep);
> > >       dev_pm_domain_detach(dev, true);
> > > -
> > > -     return 0;
> > >  }
> >
> > This looks right.
> >
> > Greg provided a tag containing fc7a6209d571 ("bus: Make remove callback
> > return void") at
> >
> >         git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-cor=
e.git tags/bus_remove_return_void-5.15
> >
> > (see https://lore.kernel.org/lkml/YPkwQwf0dUKnGA7L@kroah.com).
> >
> > It would be great if this could be merged into the drm tree with the
> > above diff squashed into the merge commit.
>
> +1.

I looked at trying to do this but I think it's beyond the scope of
privileges that I'm granted as a drm_misc committer (not a drm_misc
maintainer). Adding the official maintainers [1].
Maarten/Maxime/Thomas would this be something you could do?

[1] https://drm.pages.freedesktop.org/maintainer-tools/repositories.html

-Doug
