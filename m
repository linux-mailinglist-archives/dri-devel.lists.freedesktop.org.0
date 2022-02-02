Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A324A7436
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1599A10E2BE;
	Wed,  2 Feb 2022 15:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E1F10E309
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:05:08 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id t14so29270786ljh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 07:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=zGAcEl5zSbDsGaRdTk3xOxAdBMyz853R9ybuFrbrUe8=;
 b=jStWXkATdsbkE3n4Nr46atX2F1K4ZanuB8lCDQJ4p/b1+AHcdvD86KaYRm1bAHkyJw
 AiHxqz98X0ZNGKItIVe/Aq5pbhWMIzeKnTgOaK1k5Sz5K9miHRfpJ8M5pxXIFwTmdDTz
 gKEOW4EiTuwI+1R+zwpe5k9vBL2N4L2RuT4JSRjRAZ3a8KVWzHSVClpHPdEHsq08wPhH
 Y9p1d1rQJ6/wxDx7oqb+lSuOk2zpbkMrFqszjsh6Bs6jPbD8VlDFbt8g52e5aW0iRyqQ
 KldHeeb8LV/PQT8urJ1yhxMhI1/W44MfISox2cTI45VqzbFIlhOkne24S/KRRfs6z/eu
 Nxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=zGAcEl5zSbDsGaRdTk3xOxAdBMyz853R9ybuFrbrUe8=;
 b=4rYxNX6+uWbkHwk67uMsWzkWUIsqo5RCeHa87oVmbG4Y0t86QMi5S36kyqRy7j/VwH
 XtaIVe2+UUPQodsdzY81+pJJyiCxubcrVhG4sRNsZqe32zMNOA9RoHnWP9K/pC/1/a33
 +1zAMLuyF0oBryBlAER2qf3aV7BreaGeC+exarR2DNICrGhXOnZ5/W/G53cgKL47nyJd
 JVo25pvzkfpx75V2s1h7BFOEP9BhQdu6IXCxN3glDlzKeB9ulxkpFqV/XnzBqrJJCkRS
 ZYuiaD7go639I9zjOkCTfcwKidzr+xpTaWUbbjXJt2ZBJj3fjJRuZ0OrGIpKmEm2KYHv
 e45A==
X-Gm-Message-State: AOAM533rS6MmDsQSpyunWMN/ujvHs27SeU5TzYswpQxaF71pAi97zctq
 YDW3sM+YdppuraO6MR6SC7k=
X-Google-Smtp-Source: ABdhPJwB12Rph8wmFejGOBUmlgO7ed9XOy/Rkl5Th4ZwDST48HpDD1i8xNNU2iPPOZN70Slbo8qXMQ==
X-Received: by 2002:a2e:3102:: with SMTP id x2mr19669295ljx.211.1643814306787; 
 Wed, 02 Feb 2022 07:05:06 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j5sm1485618ljo.137.2022.02.02.07.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 07:05:06 -0800 (PST)
Date: Wed, 2 Feb 2022 17:04:55 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
Message-ID: <20220202170455.3eece5a3@eldfell>
In-Reply-To: <c6100ec3-b511-17cf-c542-e124c14fb334@tronnes.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com>
 <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
 <4966d03e-ee0c-5130-3819-05a90a8f6d06@suse.de>
 <c6100ec3-b511-17cf-c542-e124c14fb334@tronnes.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WjkHlZCIIXSuY/pBxDvwVSo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/WjkHlZCIIXSuY/pBxDvwVSo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Feb 2022 10:45:42 +0100
Noralf Tr=C3=B8nnes <noralf@tronnes.org> wrote:

> Den 02.02.2022 10.14, skrev Thomas Zimmermann:
> > Hi Noralf,
> >=20
> > since you're here, I'll just hijack the discussion to ask something only
> > semi-related.
> >=20
> > IIRC the gud driver doesn't update the display immediately during atomic
> > commits. Instead, it instructs a helper thread to do the update. What's
> > the rational behind this design? Is that something we should adopt for
> > other drivers that operate over slow buses (USB, I2C, etc)? Would this
> > be relevant for the ssd1307 driver?
> >  =20
>=20
> Async flushing is only necessary on multi display setups where there's
> only one rendering loop for all the displays. I saw what tiny/gm12u320.c
> did and Hans gave me the rationale. The SPI drivers run flushing inline.
> Info on the gud wiki:
> https://github.com/notro/gud/wiki/Linux-Host-Driver#asynchronous-flushing

Hi,

please also consider that userspace may throttle to the KMS pageflip
events. If the pageflip event is immediate from submitting a flip, that
could mean userspace will be repainting in a busy-loop, like 1 kHz.
However, I remember something about virtual KMS drivers doing exactly
this, and there being something that tells userspace to throttle itself
instead of depending on pageflip completions. I just forget how that is
supposed to work, and I'm fairly sure that e.g. Weston does not behave
well there.

Unfortunately, the pageflip event is also what synchronises FB usage.
Once flipping in a new FB completed, the old FB is free for re-use.
But, if the kernel is still copying out from the old FB, userspace may
partially overwrite the contents, temporarily leading to an incomplete
or too new image on screen. Do you have anything to prevent that?


Thanks,
pq

--Sig_/WjkHlZCIIXSuY/pBxDvwVSo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmH6nZcACgkQI1/ltBGq
qqf/fA/9GWEbIffTcEQ1bgTLS1bvxOSJHl23hNSsG+SZKOAWl4xRyKbPxAxUlXST
dHeg56RX0psfejXIy0/u8b1+kFtoW2fGgrDSpVyHWVJS0CThcjLvjA7/VU5JaYBm
6TQNDvHe1sT8d00XsNaTOXJ4MQm1EhC1YOguoqr74a84ixVrvEbYxmfF58wX6uVi
4Kq2As+831fH1iGlTPULBLpjK0pJdlVM+LfCZjCR8IjznaPIvH8qle9QJDjriRE2
IBqc0zw0HwSCUTs5k68oltjvFVNfEiVLWQISK8CK1Mnw29CKWkeowbx76RzsTx2U
qSIxwkS3JnpzBVOQIw83i74GzMcJK78a4PGWQc2BP1Zdr5XXx1CjDG4V5i/oj7LS
V4sfIIi29esJ6wb1C0wAoxNHKA1FxI9QFqhiIXaD5R7pTeM+ysnh0Iqh/42KMOSA
CfSMbTBIs2oP0YzoUh+tLU1FEwfpW7LQBci32EujuUsQggcGWRvtI6Y2b8+L+a4F
Nnojdf5BrB0Ggq22LvfctgUze+DY6OdDQz0Y12e7QPAHlrErLLAeqp560Z8SwNYP
86sq8TOgfN094rp4jwdmuYr1Kn73Lxe6kuHgwwwaF/xDfTM+0gjnYqfogzCVDC4W
Uj2Ry8T8pGajGwsMSiWOM9hutqO4UXuaJ04+T6qY3otLIXhxuDo=
=V1N6
-----END PGP SIGNATURE-----

--Sig_/WjkHlZCIIXSuY/pBxDvwVSo--
