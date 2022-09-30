Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384B5F05F9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 09:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8944210EB9C;
	Fri, 30 Sep 2022 07:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2671D10EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 07:47:32 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a2so5648826lfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 00:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=Z6q+W85PhfIbezv7TDb+SBy/RHZbL2cZcT8FkcOrh5w=;
 b=n8Dpo/rpbawJAyNd/Pj6aRYzdHvFMDE1TI/6iQAmBvr1+UW5BpOGs2llX3KmvcPGX4
 WUCnbgGiUxth3ASNm5XV6KBYupJul+LF83gq5qIjyfhTyebpN9m3VYxTrOYyLCWWy4dD
 bMFx/2mIOXHGKjMT0EVd2CYGO1OXuUgyZLTHqc4XrDRKv61/aETI1g+Gp5/Qd2ESX29w
 V0Nn0x3FuO7AFDac2AuAktO3PnX4h4Bk7VPCvIjPtbNYe1xKlJFiiNJ+hRbI0SEfg0qm
 Jxpg9xGFFXNxTjUPvKBJlulmz1vYHrlAWeLdN5L+4wNJ2kY8m69rny++z8r43cNhCMFW
 z9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=Z6q+W85PhfIbezv7TDb+SBy/RHZbL2cZcT8FkcOrh5w=;
 b=cutJsPQq86Su6mYcsRUHQ0deoqghl6PzY6Z1MFdTiqrm6mjvAHb+7RF54OfF+UnKtg
 QL+vFQ8fAGSKMoEGsNNHUvQZPy9WnONIZiock8mJIILgGXbvjfCI/CurUjm1O4fYyGG8
 TZV3RecgEfZOU0DzaBDEtvbLBIVlswNpQtAwG7AWq0RwKsZMF3xsFwAyPk/vhBoLLXNn
 Ja3PlUvRG49EOe6+nz9HGQ5k3+1OXVf0H84uwov4uUYxXIPswLnt5etZgwrlChYbTRYH
 Rc4jUsUJBqUAtu6CDl9sU6wD5qaPSsKaByEwkmtb9ngDeQ51p7MEFfWp/DO6NlSnPGZ/
 xYow==
X-Gm-Message-State: ACrzQf37KkVW0AKN9XIbQYIKwhHAbTz7FAkhDRFKJC0mHp7mQDAQ2SS0
 Z8CiLjaSK8UUI2Tr1OukZqc=
X-Google-Smtp-Source: AMsMyM7SCE6dMhT+J1CS5aBCMPH8vADbacjeR9wYwQvCwGeglW4oK4bXCh/JxvkGIQvulFLem4LOzA==
X-Received: by 2002:a05:6512:1153:b0:49d:1d20:ea47 with SMTP id
 m19-20020a056512115300b0049d1d20ea47mr2748563lfg.342.1664524050244; 
 Fri, 30 Sep 2022 00:47:30 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 bi8-20020a0565120e8800b0049602a81111sm213860lfb.107.2022.09.30.00.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 00:47:29 -0700 (PDT)
Date: Fri, 30 Sep 2022 10:47:25 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm: document uAPI page-flip flags
Message-ID: <20220930104725.61480ee4@eldfell>
In-Reply-To: <aP95gLg6WmDLYM18uEppie64PTBeG8L7xEHbDjTgYgil7h_aABI04mgTXkqwRjN3BUfax3IYjB507EsGnKWrtM_uy_oti7Ks_Bfh9VKMtQs=@emersion.fr>
References: <20220928094149.118943-1-contact@emersion.fr>
 <20220928130623.60b56910@eldfell>
 <aP95gLg6WmDLYM18uEppie64PTBeG8L7xEHbDjTgYgil7h_aABI04mgTXkqwRjN3BUfax3IYjB507EsGnKWrtM_uy_oti7Ks_Bfh9VKMtQs=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MaQnnU0NUVW3_VVpHZF9Y6Q";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/MaQnnU0NUVW3_VVpHZF9Y6Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Sep 2022 18:10:28 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Wednesday, September 28th, 2022 at 12:06, Pekka Paalanen <ppaalanen@gm=
ail.com> wrote:
>=20
> > > +/**
> > > + * DRM_MODE_PAGE_FLIP_FLAGS
> > > + *
> > > + * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.fla=
gs. =20
> >=20
> > Should this mention also drm_mode_crtc_page_flip.flags?
> >=20
> > UAPI header defines both structs. =20
>=20
> drm_mode_crtc_page_flip is "v1", drm_mode_crtc_page_flip_target is "v2". =
The
> latter just replaces a reserved field with a new one. So I figured "v1" is
> mostly kept around for backwards compat and everybody should use "v2" for
> simplicity's sake.

Makes sense after one finds the doc that says this is a v2 of that.
Backward compat makes sense, because someone might have been setting
.reserved=3D0 explicitly.

FWIW, libdrm does not use _target for drmModePageFlip().


Thanks,
pq

--Sig_/MaQnnU0NUVW3_VVpHZF9Y6Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM2nw0ACgkQI1/ltBGq
qqctKA//XNfKJkHWrAAwslY9kp5gzz0PJJ1mT30tOulOPEZJoeJQtfw8090UqXiV
8FmO7xnGqVLBZXznPhYYwPK4W9qzo7tYVNML0r6QXcGucKX1OYMiJzF5b1OPktYh
NaltA6oMuCDbPtolU4owYRM5yxrOaSX+tzJtaVjsTHnH1mcMAWxFIg6JyUGPxzUW
pbUe0qhyKinetMBhp7G7MSeCKtjLVoQK9py5P/gLKVYXnN2bYMPvq4nDp1SFU6sM
2OH0SF/8EAQQxJNggPzzM+g+WG0e7SPkbkP6RN40ka3y4cqcAIYiJzjbp4e6uPCk
XytSmap02W/R5DEXo0bVOxW6vvGLIoGnAqazjaOMY9RXz+rPqnzTltO2xwlma0K3
dmDejPWj3FRwK/IgfVYCe7cu9I3DmmynXlf3lvel4DLoO34ZRJwnJ77zj4CL+Rra
22cTRgXtdLyYJNXsesci8tfnCGVPtU/qjPKQURQunIkYur2aKHXzg10lphr8k/JL
4viOfOeM+q0RUicjqLo5f1UNrkN82JfZKbuAO9iS9VPAsc6927bcxT9A2x7146aN
kgJLC1DSyTbbbUmGbQjBhUu6sI0DwnJeh4Vq47uTsoE2iFaySb0/DlEGW+nUAaef
xHlxdYVvJBJ+Hex0tRFtr03CwkeiHpygRiuJ3WoU6Fz21Ar4+qU=
=igKA
-----END PGP SIGNATURE-----

--Sig_/MaQnnU0NUVW3_VVpHZF9Y6Q--
