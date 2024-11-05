Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B479BD6CA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 21:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3E310E421;
	Tue,  5 Nov 2024 20:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XXz9sYuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D28E10E421
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 20:11:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D620AA43947
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 20:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CA1C4AF09
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 20:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730837476;
 bh=pUzCR3wb1F7ue7zroROqvIhqYN1kgGH2ohUVUIxI92U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XXz9sYuJAc4SoRb4zZkyF0KvE/yHoI0xQkdEbHA6ow3GEKjSVUwRKuQU9qhHd10Go
 KIQDVnr1vWd3cKDCdwiZoee3H8dH8y/vNgGgh5I+K/zQi+EQXEVIiJFDN5m71YZ94o
 FA2U4VVHpUfvPW9+4ftAPCfo/iENEjhdGwE9RqPbbBvasCmgkrppresShuEIq56FHf
 efbvVMtBaOUUTeEiaZutIlHNqeM+w3WNxkhhwpV57ZhSyLgfGpZjODmw8iXGAqhDPX
 mtC5ESnnwJKKXrPMTZRlXzQVQm8a7JbMCZF9x/tajIU7yrFmvCdSFfAgj4A+xL1B1E
 1et6S3vYGoPXQ==
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e29327636f3so5133571276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 12:11:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgv5OPEViQizYuLeP+34jnMT5VklXn+tUnIK1okrFKK9MCsdAbd/vuM9M3xrJ96JYoddEfO9yzfZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy04b5TIvPecejz/DFi97N0PNXzdLLVShuqtH7Rbf8rYtrWw5P7
 UaRrskBN64Kd8NwfyeLTXyOQFftRrHwnStKWOgW+UZ5+7UrvEMIiGrgTznikBKOhz4ydut7WTMO
 4Q4sThrmJqLbYG6t6+b8D8o5tVg==
X-Google-Smtp-Source: AGHT+IGjBrKey81nl3nx8kOyR1h49mszjJqU8gpqGeS0+ZBCji4nxidLWF6J3Nufn1F4QsUGN28RJnR1wt8dJZyfAgc=
X-Received: by 2002:a05:690c:6e03:b0:6e2:1bba:ed4c with SMTP id
 00721157ae682-6ea64af4defmr187913797b3.17.1730837475817; Tue, 05 Nov 2024
 12:11:15 -0800 (PST)
MIME-Version: 1.0
References: <CGME20240919151130epcas1p10a885b3364250f5ff4e06975cfef13e4@epcas1p1.samsung.com>
 <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <000001db2c1c$12e86c50$38b944f0$@samsung.com>
In-Reply-To: <000001db2c1c$12e86c50$38b944f0$@samsung.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Nov 2024 14:11:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL62AvDEu3pmRLoV=2yFbHr_DfwsubtHbFS6cwXEhngHw@mail.gmail.com>
Message-ID: <CAL_JsqL62AvDEu3pmRLoV=2yFbHr_DfwsubtHbFS6cwXEhngHw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
To: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Fri, Nov 1, 2024 at 12:08=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen P=
latform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:
>
> Hi Kaustabh Chakraborty,
>
> Sorry for late.
>
> > -----Original Message-----
> > From: Kaustabh Chakraborty <kauschluss@disroot.org>
> > Sent: Friday, September 20, 2024 12:11 AM
> > To: Inki Dae <inki.dae@samsung.com>; Seung-Woo Kim
> > <sw0312.kim@samsung.com>; Kyungmin Park <kyungmin.park@samsung.com>; Da=
vid
> > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Krzysztof
> > Kozlowski <krzk@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> > Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; Rob Herr=
ing
> > <robh@kernel.org>; Conor Dooley <conor@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org; linux-arm-kernel@lists.infradead.o=
rg;
> > linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; Kaustabh Chakraborty <kauschluss@disroot.or=
g>
> > Subject: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
> >
> > This patch series aims at adding support for Exynos7870's DECON in the
> > Exynos7 DECON driver. It introduces a driver data struct so that suppor=
t
> > for DECON on other SoCs can be added to it in the future.
> >
> > It also fixes a few bugs in the driver, such as functions recieving bad
> > pointers.
> >
> > Tested on Samsung Galaxy J7 Prime and Samsung Galaxy A2 Core.
> >
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > ---
> > Kaustabh Chakraborty (6):
> >       drm/exynos: exynos7_drm_decon: fix uninitialized crtc reference i=
n
> > functions
> >       drm/exynos: exynos7_drm_decon: fix suspended condition in
> > decon_commit()
> >       drm/exynos: exynos7_drm_decon: fix ideal_clk by converting it to =
Hz
> >       drm/exynos: exynos7_drm_decon: properly clear channels during bin=
d
> >       drm/exynos: exynos7_drm_decon: add driver data and support for
> > Exynos7870
> >       dt-bindings: display: samsung,exynos7-decon: add exynos7870
> > compatible
>
> I will apply all except for the two patches below,
> [PATCH 2/6] drm/exynos: exynos7_drm_decon: fix suspended condition in dec=
on_commit()
> [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add exynos7870 c=
ompatible

Now we have a warning in linux-next that samsung,exynos7870-decon is
not documented.

Please apply the binding patch. Or let me know if it missed 6.13 for
DRM tree and I'll apply it.

Rob
