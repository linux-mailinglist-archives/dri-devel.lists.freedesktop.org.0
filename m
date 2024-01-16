Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057B382EF92
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84E710E002;
	Tue, 16 Jan 2024 13:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B812410E002
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:14:50 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5eefd0da5c0so100610357b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 05:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1705410829; x=1706015629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgTAJrFpfpXZ14LoeYBV9hYTfaqdy6WXEoOHL8FEBp0=;
 b=G6nMmd7pYlrTZn5UNGOpiLD7c77UTM05twoogdcyT4klGldzJ9hfu/lSKCr2RwOR8j
 znQAJ13uyHjFcNdl+GC9Hhx7v/NT1cwYRJcqbCudBSLAKUmcVIAx/1No9UWcuMqxbjCU
 YvKm3xMm0Tuo8sb2NyIEyWyBJq6A12sGIfZ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705410829; x=1706015629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UgTAJrFpfpXZ14LoeYBV9hYTfaqdy6WXEoOHL8FEBp0=;
 b=lHNRwawB2/hMMNP1IKMnuHuDcH2V7IqRS/ay28uQLJCcuuiFxx1Fg6NAMbZOEFKWOw
 TLEmOHYANYZjqTya1sI7Xo+hk7uxSX8VDmhmbQr+FUOBlLJA6VIJpRy9AAMFBC095bu7
 0hOe0RHFzvfo/pwZrKzp++uBmaAeHomrjFRXVTtBTbdig76D7vlBNht2rsflG3Pe2qJc
 4drQburX1qtMPj05u+GpltYn/+97DfFQHIz+bVQcknrFnYYVz62K5iHbkAWYY4G4dihO
 XGPSjrMLGttQjrIESjXrqaGrXUHhAyNPI+tg94dPFFtHc0LtFpQNnug/MHou6xwCGw23
 +pkw==
X-Gm-Message-State: AOJu0Yz8tKmGtdYPmuMV3Xk69AqmJEiqwHz2nYXRxqUYtcqI/VyirLsy
 DYXGKQfigpYv89gJRP1ol98BISWTqbrdriXfwUWjFq8KFLKSiw==
X-Google-Smtp-Source: AGHT+IEvdpYZdLrjqLdLASniLaW/kxSkHhZUqkufoy5Z1zACRc4GGJ9S1JofmV/XOTAVZvZZlMpmt5VXIRxTmGkzFoQ=
X-Received: by 2002:a81:400f:0:b0:5f7:d06c:7464 with SMTP id
 l15-20020a81400f000000b005f7d06c7464mr4994438ywn.61.1705410829635; Tue, 16
 Jan 2024 05:13:49 -0800 (PST)
MIME-Version: 1.0
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
 <20240116114235.GA311990@toolbox>
In-Reply-To: <20240116114235.GA311990@toolbox>
From: Andri Yngvason <andri@yngvason.is>
Date: Tue, 16 Jan 2024 13:13:13 +0000
Message-ID: <CAFNQBQz3TNj_7BSmFw4CFMNuR4B+1d+y3f058s+rzTuzdYogqA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property as
 setting for userspace
To: Sebastian Wick <sebastian.wick@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Werner Sembach <wse@tuxedocomputers.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

=C3=BEri., 16. jan. 2024 kl. 11:42 skrifa=C3=B0i Sebastian Wick
<sebastian.wick@redhat.com>:
>
> On Mon, Jan 15, 2024 at 04:05:52PM +0000, Andri Yngvason wrote:
> > From: Werner Sembach <wse@tuxedocomputers.com>
> >
> > Add a new general drm property "force color format" which can be used
> > by userspace to tell the graphics driver which color format to use.
>
> I don't like the "force" in the name. This just selects the color
> format, let's just call it "color format" then.
>

In previous revisions, this was "preferred color format" and "actual
color format", of which the latter has been dropped. I recommend
reading the discussion for previous revisions.

There are arguments for adding "actual color format" later and if it
is added later, we'd end up with "color format" and "actual color
format", which might be confusing, and it is why I chose to call it
"force color format" because it clearly communicates intent and
disambiguates it from "actual color format".

[...]
> > @@ -1396,6 +1404,15 @@ static const u32 dp_colorspaces =3D
> >   *   drm_connector_attach_max_bpc_property() to create and attach the
> >   *   property to the connector during initialization.
> >   *
> > + * force color format:
> > + *   This property is used by userspace to change the used color forma=
t. When
> > + *   used the driver will use the selected format if valid for the har=
dware,
>
> All properties are always "used", they just can have different values.
> You probably want to talk about the auto mode here.

Maybe we can say something like: If userspace does not set the
property or if it is explicitly set to zero, the driver will select
the appropriate color format based on other constraints.

>
> > + *   sink, and current resolution and refresh rate combination. Driver=
s to
>
> If valid? So when a value is not actually supported user space can still
> set it? What happens then? How should user space figure out if the
> driver and the sink support the format?

The kernel does not expose this property unless it's implemented in the dri=
ver.

This was originally "preferred color format". Perhaps the
documentation should better reflect that it is now a mandatory
constraint which fails the modeset if not satisfied.

>
> For the Colorspace prop, the kernel just exposes all formats it supports
> (independent of the sink) and then makes it the job of user space to
> figure out if the sink supports it.
>
> The same could be done here. Property value is exposed if the driver
> supports it in general, commits can fail if the driver can't support it
> for a specific commit because e.g. the resolution or refresh rate. User
> space must look at the EDID/DisplayID/mode to figure out the supported
> format for the sink.

Yes, we can make it possible for userspace to discover which modes are
supported by the monitor, but there are other constraints that need to
be satisfied. This was discussed in the previous revision.

In any case, these things can be added later and need not be a part of
this change set.

[...]

Regards,
Andri
