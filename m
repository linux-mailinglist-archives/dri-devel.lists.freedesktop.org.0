Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DCAA6E0F5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 18:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9522310E4A4;
	Mon, 24 Mar 2025 17:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bohYlGM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBA710E4A4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 17:36:11 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-549b159c84cso5247034e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742837765; x=1743442565;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xp/mYAZ5gqhGD9OWZTBxPKEU2bLqN7FiRjLIC0aFwts=;
 b=bohYlGM6VvaMub1YTekmpOSkFmFCpq9IQkbRbVjHOzr0O1qfMPm3VwAiTLQs7KOq5h
 v84psOFf/RR3jaepjN5fRzfyw5WyDGsKsgfMZcLWAj0a/iSsGOaP/4P3tBHNRaN7z+Q9
 dMaJKsv1ylGsoF8tuEMVOPusCY3Zherfjjr+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742837765; x=1743442565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xp/mYAZ5gqhGD9OWZTBxPKEU2bLqN7FiRjLIC0aFwts=;
 b=V9atcm1F8iNVMGEW7L9UZIQThHsjJjWSc/7vx4Mb1B+g9+vNMTUsWop69xSqKcuB/p
 GFnFJ1bV8v0OvvbhVE06/JgDKNn1G1y8lORJ8Wi3g1i8S0iT1Zgho04ppzHj+RwdG4cw
 v+pj0F04GZrF53u0X29R7+bCD5Rogm9+5KMgpdXClwduV9HB4u/ER+6x0OkDdTlxuTiX
 b+7gPiDFGc+dDm9oiyRffuD5bluNl/IR89zJLxrEqf4J9FCJeUt9ee6BO0DEUEVgknat
 6XlQPwiMDL1U0hScqSxpfAxRwI/ekhbZHCa4s1cxV+GDVg11Mx/nwBUuz+j2THdF7QHU
 rRJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa1zD9chJ3bIGyE/ULQYBlmCCy7PkdSqVlWxdCVhFuL1NtqIdgHTQy4g6ocUjNTBCKpTVJPhibvMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyiKsSZZ/vs3c4eN2J8CKYifGsmh6c5TM4IaSBxSHMZikR73Qa
 UHKtBMivQRss6rOi4tHaPp8C/SrWGQGpXWWuF+epxEKRQDiAvqDI9TJqRE40iecEgNCSeqE3Zm4
 Sxh9n
X-Gm-Gg: ASbGncut10cdUgHrzvVCy0MeW3r7iZb6dS5mvOuvOa3vu+azhfV3GE78yRzz1/qeVqh
 qER6TQAH9jJ462tvoEm/jbdhpQJH7vp1QAhiKPe7VKsQCx15Z3jcSeYJBq6cfdKpPtxDzgn5n77
 ifkksZulvAXLV0i35w0x5cZ7sAAxThOq/qShSxwd1WJDzbGM+tedrOzNViozGfdU+OsrPhwLVwc
 q18W/6cVa2GbV67U2QOKPlFvIwRHNUALod1wyAkyGAXvOW/m2rxQ5aVn+V/piRvhts8+YliQQfr
 XhfWt9S1WPSvSuLDZ4dH8tEPOIHAm14C4o/6NnB392ZkS9J00QIFB2rIjXnCnrftDUVXRroBdy+
 AOl78ykVpEy/876ZmSUM0giw=
X-Google-Smtp-Source: AGHT+IELURrX/NDp77tSgqXrY6ONT1gtafGgP9rBofa+O7AhT5dp1QhIUgyjWC67t3pW7KidH8cDyg==
X-Received: by 2002:a05:6512:b22:b0:549:8d16:7267 with SMTP id
 2adb3069b0e04-54ad647995cmr4224262e87.10.1742837765207; 
 Mon, 24 Mar 2025 10:36:05 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad651211csm1241528e87.227.2025.03.24.10.35.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 10:36:03 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30bfc8faef9so48174501fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 10:35:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUeZQJ5G62Newrl0I0BU/pLd0jSDDoFHbCjPl8m9EzXR0OBe8aD6lbMHICx09P7qc9GeLq0k+faAk4=@lists.freedesktop.org
X-Received: by 2002:a05:651c:231d:b0:309:1fee:378d with SMTP id
 38308e7fff4ca-30d7e2398admr41507831fa.19.1742837759121; Mon, 24 Mar 2025
 10:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com> <Z9ne78KhxfKYgnh_@ninjato>
 <20250324164025.GK5113@pendragon.ideasonboard.com>
 <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
 <20250324173055.GA18359@pendragon.ideasonboard.com>
In-Reply-To: <20250324173055.GA18359@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 10:35:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=P76a8VbncXjELERSDmRgGJfNR8y0wU-9cPRSDt+rFA@mail.gmail.com>
X-Gm-Features: AQ5f1JqxLmxOXE4XNtbYSEesCJwFtkmCixq6z4UHEEUD3xY2NjRuZrRvnk3IDZA
Message-ID: <CAD=FV=X=P76a8VbncXjELERSDmRgGJfNR8y0wU-9cPRSDt+rFA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Mon, Mar 24, 2025 at 10:31=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Mar 24, 2025 at 10:17:05AM -0700, Doug Anderson wrote:
> > On Mon, Mar 24, 2025 at 9:40=E2=80=AFAM Laurent Pinchart wrote:
> > > On Tue, Mar 18, 2025 at 10:00:31PM +0100, Wolfram Sang wrote:
> > > > Hi Laurent,
> > > >
> > > > > > Read out and check the ID registers, so we can bail out if I2C
> > > > > > communication does not work or if the device is unknown.
> > > > >
> > > > > What's the advantage of that, what are you trying to guard agains=
t ?
> > > >
> > > > That a random chip at address 0x2c will be used.
> > >
> > > Is that really a problem ? That would only occur with a broken DT, is=
 it
> > > worth guarding against a development-time issue with a runtime check
> > > that will increase boot time for every user ?
> >
> > FWIW, this can also happen simply due to broken / damaged hardware. If
> > a board gets stressed and causes a pin to become disconnected or if a
> > regulator ages and stops providing power then we can also end up in
> > this state. Getting a nice obvious error at probe when the device
> > isn't responding at all can make problems like this much easier to
> > debug.
>
> I'm not fully convinced it's worth it, compared to an error at runtime,
> and especially given that there are way more pins than supplies or
> SCL/SDA that could suffer from a similar issue. I won't block the patch,
> but I think it's overkill.

FWIW, Wolfram's previous patch [1] did check it at runtime without a
dedicated i2c transfer. The problem was that it only handled one of
the sub-AUX-devices and left the other sub-AUX-devices dangling. Many
of the sub-AUX-devices didn't need to talk to the chip at probe time
so there wasn't a good way to make the "probe" fail for them. ...so in
this situation you'd end up with every GPIO operation or PWM operation
failing and the device would still exist. It didn't seem ideal to
me...

[1] http://lore.kernel.org/r/20250314224202.13128-2-wsa+renesas@sang-engine=
ering.com
