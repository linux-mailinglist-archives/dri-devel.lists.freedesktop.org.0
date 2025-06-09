Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97987AD257B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 20:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5883010E417;
	Mon,  9 Jun 2025 18:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CwAw4tLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F48E10E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 18:23:36 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ad89c32a7b5so744195266b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749493415; x=1750098215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CW/d3YTjSFycjX6/LB8McvZq17h6mxN+2rNQt6R27Hc=;
 b=CwAw4tLHPghk7VMdoGKqRK4lLbpF8L5lNCTLgKB1drXNy2neuFEPqyCjqDJNvMNsHG
 q8J4lMUp+qjU/+pHvEH3qWL2EVvPjinGXhxCHemY6iZ+r7sIHutUA5yF4/5BVsYDyqqX
 I3oDkH9qwmKzcBQHdmWEz8oBRsuUL0Mf+FYW2gz0sw9vBwlWyqwGblzWAGGsybvTdDwp
 UBY1ZMgHeTjdqJWoxPTy31FgCnJ+1YTAgdemU91EP6LvCz4AGSDfVT52APFnvvt0OdUL
 aq7f/6YkM/0gDJBkZBLyiFfxIR6jZORXJ70FxYVzjsxYuiz5zoXwrItYR/ZZWZBuoPWX
 3p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749493415; x=1750098215;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CW/d3YTjSFycjX6/LB8McvZq17h6mxN+2rNQt6R27Hc=;
 b=gGkRBqXgcTfALdRfI+r5gNCnZ6K4jeG/LK/zVLsQbESDAw6ZZ6FiXrIQcXUH0BkQB8
 oos4R0Wp77NAuVNdgJ72nWjiW2jlcTkXAjsG14bfisE08/7MvUJTnumKE63LJSx63VD1
 FjsJqSshatKVL0PVZFobSBzqRZ/801O/1MfAsOgsmTs5UA3NejDmQNgY215hPtiRnlfo
 Cyi68hmLdMatBaKcCqyQfKgmOSFzEh/QBv9t2U0mSCuhzGlvaxoEalI1oVDOLEBoa9C0
 Y5VrvQ0Xy87LJhoASdCMSck9DpNUMYlR6RF4DcaDDv4foIhkkahP50SXpTWH804VLwHv
 WVNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbvHhi4k7ptVzd/6YA/m7tBEoO8zNE4wkm8I4uGSr7icEhkw1Zf+Dl8JshrHui6uRcQT/801Hr0Rg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNM4oluNzs/JTCA1rk5HpJyLfDJPuKeFxloPY04mub4jDC+4r2
 SL8Lalueg32ejmeTJUTdm2MZIN7bZ+RDaSC7wssP8uF1XAQYkAhusJjouRxUWMUgIGacmpbURmA
 Gl+hsQ1SLy/s1nMztjMoW2bF/6ZuxOPk=
X-Gm-Gg: ASbGnctcdWibICM0MKeBVa/e+gY9M2aZjJJyJFMM8R89IZWkFISY42SXRNt+uNXjCZY
 zvFOpvdraql7fAG0buvWWMLLFEV8DiSEWxX4qFOiZFNOxsfHHqYGNrKZFFsdu088yHRXEmdUqoh
 rmaeQK32h2adxK9osFyPTlHutDSwZ7t4puSac0Mn+3VWW6GOTIE6aZnGcSmR2ntoGwRj/1x+8jr
 4hxWw==
X-Google-Smtp-Source: AGHT+IFtV58+b7TdEn169blBTSTg97IoZAMWiVqeKLwKeXRa9wvFaPoz+n0HH+xJYo631uo3xl7Wtx01TrmgPDB7kbo=
X-Received: by 2002:a17:907:1b16:b0:adb:469d:221f with SMTP id
 a640c23a62f3a-ade1aa15864mr1341933766b.31.1749493414544; Mon, 09 Jun 2025
 11:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
 <aDz-Pq4eMAYmzqsJ@archie.me> <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
In-Reply-To: <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Mon, 9 Jun 2025 14:23:24 -0400
X-Gm-Features: AX0GCFtT5VtTHa-jojzi8kLV9z5EuWYa1-xJcEXWWcyNlt2BE-xhusWO-NpDrzU
Message-ID: <CAC0Z3JupfeHHrfj7ZeQ3E-1+E9jBrd9SPBn-eJUjEMN6iMB3aw@mail.gmail.com>
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
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

Should I go ahead make the diagram more detailed or just add the links
in 'Slides and articles' & 'Conference talks'  to the existing
diagram?

Best regards,

On Wed, Jun 4, 2025 at 10:37=E2=80=AFAM Simona Vetter <simona.vetter@ffwll.=
ch> wrote:
>
> On Mon, Jun 02, 2025 at 08:28:30AM +0700, Bagas Sanjaya wrote:
> > On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> > > Add an overview diagram of Linux DRM architecture for
> > > graphics and compute to introduction.rst
> > >
> > > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > > ---
> > > <snipped>...
> > > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/i=
ntroduction.rst
> > > index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec=
52a45d0f3f4561424e0 100644
> > > --- a/Documentation/gpu/introduction.rst
> > > +++ b/Documentation/gpu/introduction.rst
> > > @@ -14,7 +14,45 @@ including the TTM memory manager, output configura=
tion and mode setting,
> > >  and the new vblank internals, in addition to all the regular feature=
s
> > >  found in current kernels.
> > >
> > > -[Insert diagram of typical DRM stack here]
> > > +Overview of the Linux DRM Architecture
> > > +--------------------------------------
> > > +::
> > > +
> > > +        +-----------------------------+
> > > +        |     User-space Apps         |
> > > +        | (Games, Browsers, ML, etc.) |
> > > +        +-----------------------------+
> > > +                      |
> > > +                      v
> > > +        +---------------------------------------+
> > > +        |    Graphics APIs   |   Compute APIs   |
> > > +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> > > +        +---------------------------------------+
> > > +                |                   |
> > > +                v                   v
> > > +        +---------------------+  +-----------------------+
> > > +        |  User-space Driver  |  |    Compute Runtime    |
> > > +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> > > +        +---------------------+  +-----------------------+
> > > +                |                   |
> > > +                +--------+----------+
> > > +                         |
> > > +                         v
> > > +                +-----------------------+
> > > +                |   libdrm (DRM API)    |
> > > +                +-----------------------+
> > > +                          |
> > > +                          v
> > > +        +-------------------------------------------+
> > > +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> > > +        |     nouveau, etc.)                        |
> > > +        +-------------------------------------------+
> > > +                |                       |
> > > +                v                       v
> > > +        +----------------+     +-------------------+
> > > +        | GPU Display HW |     | GPU Compute Units |
> > > +        +----------------+     +-------------------+
> > > +
>
> I'm a bit late to the party, apologies. I'm not sure how much use there i=
s
> in an extremely simplified diagram like this, least because it's really
> incomplete and leaves out the entire display and compositor side.
>
> My idea was that we'd instead link to the large pile of introductory and
> overview talks further down in this file, if people want to get an
> overview over what drm does.
>
> If you want I guess you could add some links to the relevant wikipedia
> pages, I think they also do a fairly decent job of explaining the big
> picture.
>
> Thanks, Sima
>
>
> > >
> > >  Style Guidelines
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> >
> > The patch LGTM, thanks!
> >
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> >
> > --
> > An old man doll... just what I always wanted! - Clara
>
>
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
