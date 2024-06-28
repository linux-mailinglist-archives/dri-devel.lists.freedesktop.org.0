Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BC91B33E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 02:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5438910E1DA;
	Fri, 28 Jun 2024 00:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="VhABoAIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1C210E1DA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:17:38 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-379c2d0a7bbso3490935ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 17:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719533858; x=1720138658;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnM2FwovgrQogO5x3uloG9tQo9wPv4O5SS6GjjUuiVU=;
 b=VhABoAIFKrgfAAQ4Y0Kr/ZIgL2OEDgm6JpOA+icHZusOB4EfzPOKaIfXHn3iTcA7S/
 A7CmbAqPoSWwkrlXvXw4c5QEeMzFHwb1uYI+8i6eUz4LkWnyeOSlFaV/pV6thN/ANdam
 JAhFv5acJ6BrDkrmKrnRCZLVMqwiDbjutJrisjuxRwHbmcJ2OHjmeSPkQ/72djJ5IN62
 r2TAnVW5YfTg9OgB9Cukdbi8QD+hJzWP+T29bIj4CV8Z3V0Iq2LJRcbib3/qq7J5Q9td
 1UdaFhaPuCW3G7vPHc++kM9a6BT0Ks6ftSFjM+XncYR5zE2E8yvLBbZuJxN9ASmsjoDB
 3shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719533858; x=1720138658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnM2FwovgrQogO5x3uloG9tQo9wPv4O5SS6GjjUuiVU=;
 b=fRcViSelGsvL5FAz/aOuRFDgyt1xBi2bDFO37uQ2Vrk+UZDlm8M2jyY8C7a+aDylaU
 vPimM+j7lSicSM+DN2Xydoyjx+9MPFjumPPTCeOZxb0ZOvCfuVzJwtCvlbQtBi0oqyYe
 bgjcM1cFVzhXD6nGv0WO3OjyWVRjHkdKqszf7bIowDjlOxIfICYXKoaCetoD3VwueMrp
 fj67isJjpX2wpr5s+tU45TY7Iou+tRAk6j6V4Y4ZIT618uyjTBKtfSLB2q9c7yqestmj
 UHjBBVeHDBKtbmK1a089ukLMty78MREepifkciYiovOVU55wok6+5wAmuB9nlSj8xn1l
 YJbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh2tlFaSvvwfaPdSvIfyQZav/O9oo4ZN+5e6NzkTrMMicwxZ8UCqqFOzrapTm9WGKZIjjZouaA4ANqc3yTEnC3hNh0L0JscfmPBcwhm8I1
X-Gm-Message-State: AOJu0Yxq8+XPd86zgcy4fBEnt4DY0r6iXmOq+HJrxoT6GdnpJxBNrrLn
 aIDXZ5dH/YQ3//KJzTGbjpKKYCmTSPAtcLBCWVbTK7Rp8U5/Sq/hmv2j6iANljBbJhSGkl+2HgK
 HE4r78l/nxO23W7GfJ9fFkFgCro+jtfgjnmpZ
X-Google-Smtp-Source: AGHT+IHyRGLJvkEBIGRGo1vbnj9QgLJ7fr7zj3XE934AAsCrW0MPZKLToa3TeWyQKmD6e+YZZIirW5gMIfQOtuRKdx8=
X-Received: by 2002:a92:c265:0:b0:375:dd94:29f with SMTP id
 e9e14a558f8ab-37b26171927mr758175ab.0.1719533857696; Thu, 27 Jun 2024
 17:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240627203057.127034-1-mattschwartz@gwu.edu>
 <20240627203057.127034-2-mattschwartz@gwu.edu>
 <19ca1a46-6a74-4eec-9e84-0092faaee7a1@amd.com>
In-Reply-To: <19ca1a46-6a74-4eec-9e84-0092faaee7a1@amd.com>
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
Date: Thu, 27 Jun 2024 17:17:27 -0700
Message-ID: <CAD9O9Dp89CprZFMn=ysduPmUTkmJ5y6qDw18X9pLr7=ChoD0Uw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm: panel-orientation-quirks: Add quirk for Valve
 Galileo
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Schoenick <johns@valvesoftware.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>, 
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
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

On Thu, Jun 27, 2024 at 2:28=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> On 6/27/24 16:30, Matthew Schwartz wrote:
> > From: John Schoenick <johns@valvesoftware.com>
>
> Since this patch is from John, you would need his S-o-b in here as well
> (assuming you have his permission to add it).

This patch will be pending approval from them in that case. The panel quirk
follows the same structure as the Steam Deck Jupiter revision, but the quir=
k
has only been signed during merges by people who were not the original auth=
or.
Link: https://gitlab.com/evlaV/linux-integration/-/commit/b90ac393

>
> >
> > Valve's Steam Deck Galileo revision has a 800x1280 OLED panel
> >
> > Suggested-by: John Schoenick <johns@valvesoftware.com>
> > Link: https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf88b3=
5a8cf6978afbbd55c80d2d53f4f
> > Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
> > ---
> >   drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/g=
pu/drm/drm_panel_orientation_quirks.c
> > index 3d127127e7cb..ac8319d38e37 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -427,6 +427,13 @@ static const struct dmi_system_id orientation_data=
[] =3D {
> >                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> >               },
> >               .driver_data =3D (void *)&lcd800x1280_rightside_up,
> > +     }, {    /* Valve Steam Deck */
> > +             .matches =3D {
> > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
> > +             },
> > +             .driver_data =3D (void *)&lcd800x1280_rightside_up,

Unless I get a S-o-b, is authoring a different DMI check the only solution
to get a functioning panel quirk upstreamed for the Galileo revision?
Not quite sure how I'd maintain conformity with the existing Jupiter
quirk while also writing something original here.

> >       }, {    /* VIOS LTH17 */
> >               .matches =3D {
> >                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
> --
> Hamza
>
--
Matt
