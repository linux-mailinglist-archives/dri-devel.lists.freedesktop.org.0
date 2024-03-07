Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CEA8745B8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 02:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DF5113670;
	Thu,  7 Mar 2024 01:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ho7IJr34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2FA113670
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 01:39:37 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d3fd0e6832so2943821fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 17:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709775575; x=1710380375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g3QXNsXc4pbyWagxE+E+WBrsLyAj39ySKirLt5REkOI=;
 b=Ho7IJr34R08AmGdaUX3uC+4i++kAhMyvTtIZgYe206IP1zozorZd5MNNEbqLZBu2rn
 NhuImQMcFBTuL+j7HVjlp7P4YNp2l1TSQXlwsE+Na0rVkiFxt9hd+VBac8Km+0b/nEbK
 ftlYAFiWz70Uom2utGavw0ipOC8O5ie8ZoP+fuL5YkVX+NogYEv0tB0N+q5Aw5fItENj
 p6InNXDXewE5alYVyJYSv4iibIC3wCCMQXTPkPGAILczKTPXZh+08NgWI1woX+t25nQV
 YlmgSxMqt24rRExXzgpVJQyRfQ1eb5l7AP5gAqSJK4yqQ9ZRefiU3hbFBAdBno5tAbBx
 HSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709775575; x=1710380375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g3QXNsXc4pbyWagxE+E+WBrsLyAj39ySKirLt5REkOI=;
 b=XVrUJ/j0s0OC4qDpzS4y0yqyV2Z3jN9sYhvHeQPxuo+eCx+pTorxoqUulyGcPLGHcr
 VAtD4quPgl7Y8ptDkFlLWfWH4Kf6ry7QGzdiX6liQfpqpQMHKFCGPbxdwU1z4er33QNW
 gPIESu5JQExbhjF6aQWoPc/bYXLTN61HJlyq1UszBNNvPQz9jDHrXKrYmknS/1VKhZw4
 6o5zskkGCwU92IbCQTi+OVlhzNd6KTYEDhy9BX5eCGrw5PxxvlFeutlTJ2ZCx5eThrqk
 JfrMp/DQNVdmnmRDhuc//+wJGEmkJPIOV+g/YUWCuyo3qw6dutRa7A8OC9+jwpOsn/8y
 m8pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbqja3agb+J6cdQV3E8w6VM7GFAfWaEi6jYUgMu35JLWnM+R76waE+4SANKGYz+381aPkp6q08Bnh01SKrcVutnHVIHVOqJXIl80qjZbel
X-Gm-Message-State: AOJu0Ywp+u9Sp6BwFd59cC7mNJBjt+ZL51ZMShdgShMQxobIhKTZDr40
 xKJlTimab+NDtTR/KOhwxAwEs77BltJOH6qLGZ1mC1OIHTw6DwTqT+6L6pMO031P50S9v/Ue+1r
 XQpcteo3iYCLouedBuq5U+k0l64s=
X-Google-Smtp-Source: AGHT+IEYEHVj3nb4kRCZcQZDkCMShKzbuAM8uVmrXcumu0XaDmz6dW4wpGa5HO7Cs3zMl+/xQvrYnakhGewj59tjVU0=
X-Received: by 2002:a2e:b615:0:b0:2d2:9a8b:f45e with SMTP id
 r21-20020a2eb615000000b002d29a8bf45emr393672ljn.14.1709775574668; Wed, 06 Mar
 2024 17:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
 <60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de>
 <CAF6AEGs2zCP1SWPzxz4v2CU--yyEsN0+PS3dKM1nOuGyVkCpLg@mail.gmail.com>
 <ZeiGi4l1lL_fYJ69@intel.com>
 <CAF6AEGs1ce2xzuo3xEO+xgj+0iCi59nM8AiTwBfEhwZZ2w6Vww@mail.gmail.com>
 <Zej7HOLVOAMtWvrn@intel.com>
In-Reply-To: <Zej7HOLVOAMtWvrn@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 6 Mar 2024 17:39:21 -0800
Message-ID: <CAF6AEGvp9Z5axmjwjC7iJKm3NcOg9-8eL-Z86b4ZjBbMfv0HKw@mail.gmail.com>
Subject: Re: [PATCH] drm/udl: Add ARGB8888 as a format
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
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

On Wed, Mar 6, 2024 at 3:24=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Mar 06, 2024 at 07:37:16AM -0800, Rob Clark wrote:
> > On Wed, Mar 6, 2024 at 7:06=E2=80=AFAM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Wed, Mar 06, 2024 at 06:49:15AM -0800, Rob Clark wrote:
> > > > On Wed, Mar 6, 2024 at 4:18=E2=80=AFAM Thomas Zimmermann <tzimmerma=
nn@suse.de> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > sorry that I did not see the patch before.
> > > > >
> > > > > Am 27.02.24 um 23:19 schrieb Douglas Anderson:
> > > > > > Even though the UDL driver converts to RGB565 internally (see
> > > > > > pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 fo=
r
> > > > > > compatibility. Let's add ARGB8888 to that list.
> > > > >
> > > > > We had a heated discussion about the emulation of color formats. =
It was
> > > > > decided that XRGB8888 is the only format to support; and that's o=
nly
> > > > > because legacy userspace sometimes expects it. Adding other forma=
ts to
> > > > > the list should not be done easily.
> > > >
> > > > OTOH it is fixing a kernel change that broke userspace
> > > >
> > > > > >
> > > > > > This makes UDL devices work on ChromeOS again after commit
> > > > > > c91acda3a380 ("drm/gem: Check for valid formats"). Prior to tha=
t
> > > > > > commit things were "working" because we'd silently treat the AR=
GB8888
> > > > > > that ChromeOS wanted as XRGB8888.
> > > > >
> > > > > This problem has been caused by userspace. Why can it not be fixe=
d there?
> > > > >
> > > > > And udl is just one driver. Any other driver without ARGB8888, su=
ch as
> > > > > simpledrm or ofdrm, would be affected. Do these work?
> > > >
> > > > Probably any driver where ARGB8888 is equivalent to XRGB8888 (ie.
> > > > single primary plane, etc) should advertise both.
> > >
> > > To me that seemes likely to trick userspace developers into
> > > assuming that ARGB is always available, and then when they
> > > finally try on hardware that doesn't have ARGB it'll just
> > > fail miserably.
> >
> > I think that ship has sailed already, at least for any drivers that
> > previously silently accepted ARGB8888
>
> Perhaps. Although I don't actually understand what kind of weird
> userspace people are running if it somehow expects ARGB to be there,
> but only for some specific kms drivers. Is said userspace really
> somehow checking which kms driver is present and then just ignoring
> the pixel format list exposed by the driver? Or is it just some
> super hw specific thing where they can just assume a specific kms
> driver?

I think chrome compositor (as in CrOS) always just picks ARGB8888
because, on devices that support overlays/underlays, it will use
underlays in some cases.  Yes, lazy, and a userspace bug.  But this
worked previously until commit c91acda3a380 ("drm/gem: Check for valid
formats"), so it seems to me like a clear case of kernel breaking
userspace.  I don't think we really have a choice other than to allow
ARGB8888.

A lot of drivers like simpledrm will never encounter the chrome
compositor, so it is ofc an option to leave them as-is until someone
reports a regression, which is maybe unlikely.  I suppose udl is a
special case because it can show up anywhere.

BR,
-R

> Anyways, adding ARGB to even more drivers seems like a terrible
> idea to me.
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
