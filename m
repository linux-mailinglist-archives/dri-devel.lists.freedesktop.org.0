Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45221EA364
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 14:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DC789A4E;
	Mon,  1 Jun 2020 12:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F7F89A4E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 12:04:43 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b6so7830181ljj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 05:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=uWuUiR7TXctAjVeKOr8L1L90oFHd8m+2E22vWGPVwuY=;
 b=pxxmuXcCo23hoyLT6JjRf+RnuXc07dZBD7UdaHhiS2+3XyUhscr0x2dChXtMoGX0v+
 Aaj94w82056aMAbr4Ll/lWtPuVb3i736Uut9gdrCSeI2hSgBnvOsH9DlH8TgxwWmYNFQ
 nic9O1axW5p+Azv6H4eHAmV6QlOLrrF7Paa2Dshv6h5giNXWtsu3zLPbOXoUkhWeuh2Q
 mDaI2b9h/4NSaiIhWdSFv3CkZgcREAQCbP0rVVqaZQ9kjJTcsvxpOGlKQUFI/EIqF37T
 sYG7PKyBT4T7jNepV76JeJbBf7NWaFFXGFEePM4zFjnMAVnixu8Uy95r4KMIO74965tp
 mWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=uWuUiR7TXctAjVeKOr8L1L90oFHd8m+2E22vWGPVwuY=;
 b=Sc4KyFiMWn3QwzHuniNbk6lATYxU3faUZZoeXwTN1pTjvcKOmb+JtD4OYvuPQqUxeo
 Ad6Weo2Z/4MRqoB6vih2KqkYvRDMonGtjk4l1zHdynmQsKXwZX6q/vXsVCuXx+Tn6IJI
 r4t5t/tPfr64IQ1mn14uCMVjeMg4N9I941yRn+Fts+eG66kwEcEXvYAv6KDM0Q9rx8Tr
 DScgHbn/wZEeQ+rJB/46jifp0bJzjgrSt67Op6lfXgNffnUraJbgZU8qNinc8a7F1kMu
 XMgOCIqsvzuP2hZvklxGSUe+IsYP4zUH1z0KaKac9TgGDUY2VjDZZgIXt8HWZWgtBTnc
 91nw==
X-Gm-Message-State: AOAM532MNjmMJ8aym0UibzIlch74zkD2Z3q5qYSYOtcjoWwqA8ofqTse
 lJeSpsg5hC20d2XbZtjXBFE=
X-Google-Smtp-Source: ABdhPJx2+a7QjkR2bsexjoVjQxQ5Z0U4L6CCkesS4hDCWmURian+72HcNrMuUxWPVVOZ72ng2v8snQ==
X-Received: by 2002:a2e:8490:: with SMTP id b16mr5226801ljh.325.1591013082091; 
 Mon, 01 Jun 2020 05:04:42 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b25sm4726025lff.26.2020.06.01.05.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 05:04:41 -0700 (PDT)
Date: Mon, 1 Jun 2020 15:04:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
Message-ID: <20200601150438.5833f021@eldfell.localdomain>
In-Reply-To: <20200528144545.GU206103@phenom.ffwll.local>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
 <20200520141908.314607bc@eldfell.localdomain>
 <20200520124617.GX206103@phenom.ffwll.local>
 <382ab1ab-a89c-e384-3200-0cb3257c25bb@amd.com>
 <20200525142804.GD206103@phenom.ffwll.local>
 <20200525175519.0289a728@eldfell.localdomain>
 <20200525150955.GI206103@phenom.ffwll.local>
 <20200528151402.17aaeb9d@eldfell.localdomain>
 <20200528144545.GU206103@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============1217329204=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1217329204==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PorV1PtrlRMuz3w1wB+gVTk"; protocol="application/pgp-signature"

--Sig_/PorV1PtrlRMuz3w1wB+gVTk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2020 16:45:45 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, May 28, 2020 at 03:27:57PM +0300, Pekka Paalanen wrote:

...

> > Hmm. Maybe Wayland compositors should ignore all EGL import failures
> > that happen after the wl_buffer has been created (which implies that
> > the dmabuf has been validated to work initially). When import fails at
> > a later time, the compositor should just paint some error pattern
> > instead of the window. That would let the kernel keep on returning
> > errors.
> >=20
> > Yeah, ok. I'll keep the ENODEV there in my next version. Let's see how
> > that looks then. =20
>=20
> tbh I have no idea what to do with dma-buf shared across drivers.
>=20
> For dma-fence it's fairly simple: Force-complete them all, with an error
> code of ENODEV. But for dma-buf I have no idea. As long as the dma-buf
> sits in system memory it should keep working, plus/minus bugs in the
> exporter where it tries to look at device state that might no longer be
> there.
>=20
> The real fun starts when the buffer is in vram, or when the mmap somehow
> goes through the device (but that's more a case for integrated gpu, and
> it's a bit hard to hotunplug those and consider that a real use-case).

Is forced driver unbind not a real use-case, or would it not invalidate
the memory references wrapped in a dmabuf?

In the proposal, I listed driver unbind as a use-case.

I don't mind if cross-driver shared dmabuf needed ten years of kernel
internals development to reach a state where it won't explode anymore,
but that's the goal I want to set today. I don't think we can tell
userspace to never share dmabufs cross-device if the exporter device is
hot-unpluggable, can we?


Thanks,
pq

--Sig_/PorV1PtrlRMuz3w1wB+gVTk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7U7tYACgkQI1/ltBGq
qqc32Q//U7t8CiFNJLZd3fxp4UPzt0o0ukPE+oPSxaKcmNxm/oRuapn/4RUMLSdu
daKLLBxMRx313WZIWIlAKWBjMXxeA0EK+T7azX5LDZ4OwURjY6z+hOy5AL9a/vpT
nHtfopfLMTb9aMomU5c+Az56geCO8WMG8X6dEuCCa6jHgpKfYu5iulg1ZcPyvZzT
bk5AOJVNEcmFy8L5sVapG0g3JHtez1aOOzABXvK7iD09i8KnRyrn/uBeTS9e9YNx
rNSwl9GhXKINOrgRT4NIvE+GBCIFWfYkolvXJCod0YV/ttv5XzCMxIXWUL0GYROh
vn86yJSeoPBL1J5+M13QS30WnLEpGn6cPDgU6ptUPmgUvZtQqbYobrwpJt+NPlcy
Zu7zh/AC8nlMnca9nLkGErEqQEuAlRI8gipm4kyq9wBZAl8oJDX+3e054oQP2rcb
FOwC/gBglOGLlNcF/nTdQreoEky8G4FWBFRqkAUrmVnn2J7wojpC+/OpqQLYGv3/
Q4iSXh14TWyOWfa3Bo3kTxM9MNFxjaoxmoc1WlafFoiDjzjMEcZxePXHApPuZAL3
TGAQwje2HxNW1lF1G1SqhdDw5Kfm8sjVQqGMC1Ac7i4MoGiAOLRo51hy+JEf5JT2
NEDn60CZWKam8x0qN0yNPBccTc0N0XwsSBdQAXFPul3iSs7wFww=
=DVBu
-----END PGP SIGNATURE-----

--Sig_/PorV1PtrlRMuz3w1wB+gVTk--

--===============1217329204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1217329204==--
