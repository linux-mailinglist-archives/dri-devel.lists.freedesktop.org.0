Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3FA96A741
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 21:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A19910E0C6;
	Tue,  3 Sep 2024 19:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AR8qg2oU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB5010E0C6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 19:19:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A4034A43DE3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 19:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA7DC4CECA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 19:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725391192;
 bh=KqQE3iCy7S3bFdUawYBf51xOtDYqglawuE1j3xjb2Iw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AR8qg2oUbWcbxrnqfbP00Cl27m7+NaU4Z4M9ALEjxqtVia6hg6EJvBRm1jXaOJNXf
 N4xbYzgYjMdX2oBRva4ZYuiFAyCe07hF1JIY9eu4vrMKrDMLdI6R9BTRcNS9jj46HW
 I1ik4iPkFxOis5/RgsnLihR4eVJ3Fo8SKP/JxMZiA6F80yoDGdam5ZWH0NWsXOPtt4
 Vz1iLnjW2FoE3a+uIWtpD9SqYIdzHo983xlYPEqzcECXxJDBkGSXCzR1LmxH9PNp+D
 zenkQCdRpbMEBJyWcSBOfw1/pKnBihUJ8njwiyHPTskyBpSyxX/64XJ0fbQ+Bb2jkV
 rIw/ZavbuIPUw==
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-533488ffaddso7088144e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 12:19:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YzHGR/gyL30jzTUNcuEk28dTTYJKgyTxPEDKdr4Ke9xG3bOR6Vm
 DdGYUdLLTMQ0cDNYe/9FdlQ0IYbsxO/jNv9Jz+rKl24ktgkzZ5g5QqqfZ2ThZRM523/rJnUCUnr
 4m2aKVDrbq9TJnkkU/fSrAeAISA==
X-Google-Smtp-Source: AGHT+IGu8zU7mK4faIuJr3BtHKdZbZYxXscd1afke7A7tMmPBPXatjZnrJ1uoa5WM9CxkZQJTeBZA3Q0dpVPjkk8DtQ=
X-Received: by 2002:a05:6512:3c81:b0:52c:e012:efad with SMTP id
 2adb3069b0e04-53546af9ffdmr10588452e87.12.1725391190502; Tue, 03 Sep 2024
 12:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240731191312.1710417-12-robh@kernel.org>
In-Reply-To: <20240731191312.1710417-12-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Sep 2024 14:19:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKvA0Uw7uqpmdMP7Z4mL3Qsmay5Fqb4M97s=QsBW_Nxyg@mail.gmail.com>
Message-ID: <CAL_JsqKvA0Uw7uqpmdMP7Z4mL3Qsmay5Fqb4M97s=QsBW_Nxyg@mail.gmail.com>
Subject: Re: [PATCH] drm: vc4: Use of_property_present()
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 31, 2024 at 2:13=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Use of_property_present() to test for property presence rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Ping!

>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index d57c4a5948c8..049de06460d5 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2211,7 +2211,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4=
_hdmi)
>         struct device *dev =3D &vc4_hdmi->pdev->dev;
>         struct platform_device *codec_pdev;
>         const __be32 *addr;
> -       int index, len;
> +       int index;
>         int ret;
>
>         /*
> @@ -2234,7 +2234,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4=
_hdmi)
>         BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) !=3D 0);
>         BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) !=3D 0);
>
> -       if (!of_find_property(dev->of_node, "dmas", &len) || !len) {
> +       if (!of_property_present(dev->of_node, "dmas")) {
>                 dev_warn(dev,
>                          "'dmas' DT property is missing or empty, no HDMI=
 audio\n");
>                 return 0;
> --
> 2.43.0
>
