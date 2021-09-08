Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA5403584
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 09:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0CF6E150;
	Wed,  8 Sep 2021 07:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290706E151
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 07:36:15 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id p15so1959356ljn.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=o/VoJvWuPVlxJiTqir+EO4k/QwNOn1gsnrn9IbwP1PA=;
 b=aBnMYeKzYH/MW0Rnney0B153BAX5s7SwUa3k8iFrRu9x1fmsP8qYMcPJW9Ag1kJNTJ
 HB2UscA0+jNLll2of0pXN54VNzbEJzdYhQURgHitJnOUaMivrLi5cXX8yNrYjVXs/m1z
 hdQ2Vbs+p48ojlLLWiRNRKVsnTx/JxPUeLk6FUIrB0Dk3bu8e/Rk02qE9sf7LD0MmYdz
 Y3mXzBxnYFNf2kaF77jmZmYzbijodiKPmU0Hf9nakO/ViA970IMdV986bIGKpA6ko096
 i8y3SkWuHNhJGPXGpVLOyhL5YL6DY3AW0Q+51tHNSEg3iqtJIncNSuygXqJDJHRvUUvv
 PxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=o/VoJvWuPVlxJiTqir+EO4k/QwNOn1gsnrn9IbwP1PA=;
 b=VR9Rw5r7qPTI+oe4G+XNGGiYvdtotp4Ede0WtUsOiY6LDi1fpzj8ZKf1JnlJ8fJ4eP
 sz12jKUgxS1bXbJX3iEOzoo5PE079G/dW6cva6G6pmH+YfQvHwNrwwA4FsPcxJKFfZsH
 NnuyLZULdpOTIv0l35TV8jG7NsazzMdhqVsdo5GaJqUwscdkZBFTvcb9oUwSjor5EjSR
 WjUXduSYpEyNWuAdYE5d9tyR3WOYr2OfrDXY6WWGfzp9JSURL3YrSp313ebblxfX1MYE
 O/60UMRg1whMRkyTkRqwv03kgzHahuQyCNpPWaJAZxVRY72UorLTXiiTRIIg5nOvopmY
 uoNw==
X-Gm-Message-State: AOAM531qJKDGOdxD0antg8j9zgt8haMY1PLpN1d9IB4xUGLaZGIm/Ai/
 MVbJpYBtsXmrtod3NNzDBNQ=
X-Google-Smtp-Source: ABdhPJwhSFCwjbYLJoPBWQP3eLfbrXhDXhWHRl92jK98wZPDYvPsdk1NcI8BWVS0tzAfDHcKGbMiOg==
X-Received: by 2002:a05:651c:1057:: with SMTP id
 x23mr1691350ljm.377.1631086573388; 
 Wed, 08 Sep 2021 00:36:13 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l3sm114832lfk.245.2021.09.08.00.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 00:36:13 -0700 (PDT)
Date: Wed, 8 Sep 2021 10:36:03 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Dennis Filder <d.filder@web.de>, dri-devel@lists.freedesktop.org
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <20210908103603.44a533bb@eldfell>
In-Reply-To: <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/guyGmiRj.Xsnz3BgZb6mCm6";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/guyGmiRj.Xsnz3BgZb6mCm6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Sep 2021 14:42:56 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 9/7/21 12:07 PM, Pekka Paalanen wrote:
> > On Fri, 3 Sep 2021 21:08:21 +0200
> > Dennis Filder <d.filder@web.de> wrote:
> >  =20
> >> Hans de Goede asked me to take a topic from a private discussion here.
> >> I must also preface that I'm not a graphics person and my knowledge of
> >> DRI/DRM is cursory at best.
> >>
> >> I initiated the conversation with de Goede after learning that the X
> >> server now supports being started with an open DRM file descriptor
> >> (this was added for Keith Packard's xlease project).  I wondered if
> >> that could be used to smoothen the Plymouth->X transition somehow and
> >> asked de Goede if there were any such plans.  He denied, but mentioned
> >> that a new ioctl is in the works to prevent the kernel from wiping the
> >> contents of a frame buffer after a device is closed, and that this
> >> would help to keep transitions smooth. =20
> >=20
> > Hi,
> >=20
> > I believe the kernel is not wiping anything on device close. If
> > something in the KMS state is wiped, it originates in userspace:
> >=20
> > - Plymouth doing something (e.g. RmFB on an in-use FB will turn the
> >   output off, you need to be careful to "leak" your FB if you want a
> >   smooth hand-over) =20
>=20
> The "kernel is not wiping anything on device close" is not true,
> when closing /dev/dri/card# any remaining FBs from the app closing
> it will be dealt with as if they were RmFB-ed, causing the screen
> to show what I call "the fallback fb", at least with the i915 driver.

No, that's not what should happen AFAIK.

True, all FBs that are not referenced by active CRTCs or planes will
get freed, since their refcount drops to zero, but those CRTCs and
planes that are active will remain active and therefore keep their
reference to the respective FBs and so the FBs remain until replaced or
turned off explicitly (by e.g. fbcon if you switch to that rather than
another userspace KMS client). I believe that is the whole reason why
e.g. DRM_IOCTL_MODE_GETFB2 can be useful, otherwise the next KMS client
would not have anything to scrape.

danvet, what is the DRM core intention?

Or am I confused because display servers do not tend to close the DRM
device fd on switch-out but Plymouth does (too early)?

If so, why can't Plymouth keep the device open longer and quit only
when the hand-off is complete? Not quitting too early would be a
prerequisite for any explicit hand-off protocol as well.


Thanks,
pq

> > - Xorg doing something (e.g. resetting instead of inheriting KMS state)
> >=20
> > - Something missed in the hand-off sequence which allows fbcon to
> >   momentarily take over between Plymouth and Xorg. This would need to
> >   be fixed between Plymouth and Xorg.
> >=20
> > - Maybe systemd-logind does something odd to the KMS device? It has
> >   pretty wild code there. Or maybe it causes fbcon to take over.
> >=20
> > What is the new ioctl you referred to? =20
>=20
> It is an ioctl to mark a FB to not have it auto-removed on device-close,
> instead leaving it in place until some some kernel/userspace client
> actively installs another FB. This was proposed by Rob Clark quite
> a while ago, but it never got anywhere because of lack of userspace
> actually interested in using it.
>=20
> I've been thinking about reviving Rob's patch, since at least for
> plymouth this would be pretty useful to have.
>=20
> Regards,
>=20
> Hans
>=20


--Sig_/guyGmiRj.Xsnz3BgZb6mCm6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmE4Z+MACgkQI1/ltBGq
qqd+Xw//YYg5s/y1PMWoUy4cxMW7/CgNkj6+yjiLv4fhbVfeRiarLvFtBWdI4DAq
fe6Px+bd2R2mb4mdUTSWy7qK2zQh2l06TTFQBBsZIYERAxEOdI3/RHNBrXKcYQBs
WGOubmOlrNHosGUXiKJESA0RFjVK0gOvL7IU/rgMRQYJbgVOzvGvID1aqDL2XFGw
PBcHRymN65NcOs9WKtu3jlKlCqzfv74qjPEJomWRBpPlwrAIskHzfC5eIFDjC8gs
ynWSbRmRNtvTEghw6kUiR6Qv75POnnuTNoo6LS3UmMLOa16jgjPCYuReRlMP4T55
iAGesOuuO414klT30otuUy5T9aImuKDsCYWPqHPcgnF9bC7TjOIWipxJRijtZMun
mFp6+XfnKNhc3B7W2pHPHJYxc8u7CSMt9jUuwZQRsWYT5TtxFsX7qCp7Jp8ybCqu
vlBtAYgm/F+CeMcDof/9eCwvKJjju75QNRdVO0LAh/ULADDuqwDbtEmTXKFvgjvB
PwN+AxrIxrLjkNHdJjAogyWuCztAmb76jnPAPiBtoS8cDCKH7YB3VMhKY1zxafyk
TdjpN8ZavkTZlm6vUfGA/G7j4M/pnQ4ZPXSDKLper09bXCbRKqs0aeXZ6+MlNBba
cOjH43ulnf9ZD2cpG0DmISx1S4HnAmtXt37UtJuYm4vG6m+GT4A=
=a44X
-----END PGP SIGNATURE-----

--Sig_/guyGmiRj.Xsnz3BgZb6mCm6--
