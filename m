Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D6873AD0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EBB1132B9;
	Wed,  6 Mar 2024 15:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z7AnoUSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7571132B8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:37:31 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56759dc7ea6so4727064a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 07:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709739449; x=1710344249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1/Yc+IAFEUXc5d7chyPtNMhHboxhzwpw49Grb8KD50=;
 b=Z7AnoUSDXxAf1Yl4fYztQWrCjIxbM1Ol6nSPVCo3H9Jc4MOUmwNSpVyFjvd7Ak+FLv
 56KvOQIFM9yGXWRlLWXR6A5WfwZEgQXNu9lPjF+xwBp74hvRsxlyCmagSWgtU+Qn/zKN
 1uP/3oM3KJT84rd/oDuFdCuTc+YnV4sfUxseEd3I1hi9Ip4hI/AG811Uz/gOIyuyMDLT
 TaF4gv181qxC8wQawD8T1EjUYfIM5wISyanjCUPpaZzTYbaDS2n9nYGNFkB4GKjxXe4k
 sA9oOD5X7T5lE7kzqWtd0dCi2qCu5/xJQZJU88IWETchowMZzCCooKGVcpMQnLSGfz0A
 buUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709739449; x=1710344249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u1/Yc+IAFEUXc5d7chyPtNMhHboxhzwpw49Grb8KD50=;
 b=wWjfAA+roEnf8tcc34brtAajD/5LJSW2gjWIWKtk/pjJgfw8z4sAzdbeKVWFdlN6+r
 WlI0YyQmSiMLhKL6hCwCbc9bG3BopmgCCalgEv4wW9cPv7spYMc5rrHGQhxKyrBvcNnK
 aazyArLBQdDSLqd7/VLzqT6/oNDzxB11D2j6VlGSd3eIIqGxbvhrPql355SnGB4li8h8
 How6iD9MZ8rhBJrqOJyPbCzFcMGl3+vib6SNWM2dRi5IdfMKPfE7jacxjkvB6nC9U8PM
 ZGcnh4JYrxb1yxIIuxZ5egmDdQ4aoIbm41HtDxRf2wlIbV6D2jGx1tiVuK+IYsdEaeMt
 Rfqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHNoXErhJjqGA9zQoxNczy4JiKsehq59uVcASua4XMRqwPrz9hfqaQTZDOa1wZXiuGkvw6vbhzcfTYPo4RIGw7sJs8/NILVpFiSK7JAKVk
X-Gm-Message-State: AOJu0YyuLpeVb6b8aT5GgL5VodvZ83BE4UWLLnF5kSjLJcJ0p+ZB4m1S
 8Z4lPeyXbRGuzms2vKlx8ZIV3zSuWvRfo+y8wHSS2qcKiu5mVQIO98YZmeD+DxwBBZV77HKexXS
 LWe1R6VyvqB0rH+xQpntjiWYZirg=
X-Google-Smtp-Source: AGHT+IFPBo/wgUiW7TE1+MYYfswg9itE4B5nwKJcVcwSilfEDgdHUVhvIZwW0ZUMtglS+OrSGmle1I+8sszEi1RcBKA=
X-Received: by 2002:a05:6402:c02:b0:567:e280:6411 with SMTP id
 co2-20020a0564020c0200b00567e2806411mr1467481edb.15.1709739449054; Wed, 06
 Mar 2024 07:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
 <60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de>
 <CAF6AEGs2zCP1SWPzxz4v2CU--yyEsN0+PS3dKM1nOuGyVkCpLg@mail.gmail.com>
 <ZeiGi4l1lL_fYJ69@intel.com>
In-Reply-To: <ZeiGi4l1lL_fYJ69@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 6 Mar 2024 07:37:16 -0800
Message-ID: <CAF6AEGs1ce2xzuo3xEO+xgj+0iCi59nM8AiTwBfEhwZZ2w6Vww@mail.gmail.com>
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

On Wed, Mar 6, 2024 at 7:06=E2=80=AFAM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Mar 06, 2024 at 06:49:15AM -0800, Rob Clark wrote:
> > On Wed, Mar 6, 2024 at 4:18=E2=80=AFAM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> > >
> > > Hi,
> > >
> > > sorry that I did not see the patch before.
> > >
> > > Am 27.02.24 um 23:19 schrieb Douglas Anderson:
> > > > Even though the UDL driver converts to RGB565 internally (see
> > > > pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 for
> > > > compatibility. Let's add ARGB8888 to that list.
> > >
> > > We had a heated discussion about the emulation of color formats. It w=
as
> > > decided that XRGB8888 is the only format to support; and that's only
> > > because legacy userspace sometimes expects it. Adding other formats t=
o
> > > the list should not be done easily.
> >
> > OTOH it is fixing a kernel change that broke userspace
> >
> > > >
> > > > This makes UDL devices work on ChromeOS again after commit
> > > > c91acda3a380 ("drm/gem: Check for valid formats"). Prior to that
> > > > commit things were "working" because we'd silently treat the ARGB88=
88
> > > > that ChromeOS wanted as XRGB8888.
> > >
> > > This problem has been caused by userspace. Why can it not be fixed th=
ere?
> > >
> > > And udl is just one driver. Any other driver without ARGB8888, such a=
s
> > > simpledrm or ofdrm, would be affected. Do these work?
> >
> > Probably any driver where ARGB8888 is equivalent to XRGB8888 (ie.
> > single primary plane, etc) should advertise both.
>
> To me that seemes likely to trick userspace developers into
> assuming that ARGB is always available, and then when they
> finally try on hardware that doesn't have ARGB it'll just
> fail miserably.

I think that ship has sailed already, at least for any drivers that
previously silently accepted ARGB8888

BR,
-R

> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
