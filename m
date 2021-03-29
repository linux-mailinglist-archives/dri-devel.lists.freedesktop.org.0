Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0534C71E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 10:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958B06E3F7;
	Mon, 29 Mar 2021 08:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1CA6E314
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 08:15:39 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m12so17108463lfq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 01:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=zBv0H2aHUbMd9Rp97TANmEJVCBnTx2DEtozoJt1A8Hw=;
 b=gqg3KfnxyAcBj5KVMSHNHSQk4DvXTHeH0jrYz+9wzgYu/WHvEzXx44yKBgixeoXyZ9
 Zjsb50FuF6UyrMxrJdyCOnc7rKLTEHh8u3+jbQhHdbm1WbwNR9p9r62CVLzntuS8jK2i
 rzo5Es377XuBH66gjk7Py5O4N9VV34mK3pvLQikNI4U2MFNiV8guQoBbXo5R1HsW6zVV
 MXBTsfj3mh3P2IxcvZp/RTmefhT1BxBHB4uVSq4oU5e0jgJPugUNBC+fHJqFkoYvVkPW
 cixTqFezaTagg/OoELfAKOFUERhoF4BG1uQUPzMbq/skSmqTvtf2b/DZDHucMxDfIvt6
 SpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=zBv0H2aHUbMd9Rp97TANmEJVCBnTx2DEtozoJt1A8Hw=;
 b=g9Be7Dsv94hRCjfAf3dYvbU64chKk8lxiTZ12ew8v7as+oSGaA8kjM0va4Wyn1pKeo
 cqSdYOJLAfUTAOR9WMLpozXjLgcoeSBZaakkwv3G7pIjaP5IGSv3/SkdfMAgE7Xe/46Q
 VcOlvy4BMlez3+Qku2w5QMQBHNY28rCy0qcJPUmaARjN1NN0ZMjMshbKfiX5N4LhHW0U
 750xSmcS6f1SoUuiYeYdQRFFqPg8B2vHf/KCdpTdaEOXbju9KdidPHLatQRXJhvNAikw
 mQ8ExIL3wd3LLUylTD5/oZV+V1q+qCndkZzOSy5Z/rihOW9SMxeKkAyQtzmCWKX9Ldqd
 VMlA==
X-Gm-Message-State: AOAM533Su210Hw8GFi9mOxWadUUn4uZJZtLTuOtM2memdaGuzE0CFluv
 35+ozjB2Gf0+2hRtn2dqSk0=
X-Google-Smtp-Source: ABdhPJzxgGD/4gmDa6/iAxicckA149Q3A/tIhIR7r08sRje8rOLmys2iDv4Z15DavZDyNBP+8/aMgA==
X-Received: by 2002:ac2:4316:: with SMTP id l22mr16161690lfh.338.1617005737725; 
 Mon, 29 Mar 2021 01:15:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n8sm1665977lfu.172.2021.03.29.01.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 01:15:37 -0700 (PDT)
Date: Mon, 29 Mar 2021 11:15:33 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
Message-ID: <20210329111533.47e44f72@eldfell>
In-Reply-To: <24LMQQ.CRNKYEI6GB2T1@crapouillou.net>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <1J_tcDPSAZW23jPO8ApyzgINcVRRWcNyFP0LvrSFVIMbZB9lH6lCWvh2ByU9rNt6bj6xpgRgv8n0hBKhXAvXNfLBGfTIsvbhYuHW3IIDd7Y=@emersion.fr>
 <24LMQQ.CRNKYEI6GB2T1@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, od@zcrc.me, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1207165472=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1207165472==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VjwGWdRbYYmHwPtJmbJ.naq"; protocol="application/pgp-signature"

--Sig_/VjwGWdRbYYmHwPtJmbJ.naq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Mar 2021 11:26:26 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> It has two mutually exclusive background planes (same Z level) + one=20
> overlay plane.

What's the difference between the two background planes?

How will generic userspace know to pick the "right" one?


Thanks,
pq

> Le sam. 27 mars 2021 =C3=A0 11:24, Simon Ser <contact@emersion.fr> a =C3=
=A9crit=20
> :
> > On Saturday, March 27th, 2021 at 12:22 PM, Paul Cercueil=20
> > <paul@crapouillou.net> wrote:
> >  =20
> >>  The ingenic-drm driver has two mutually exclusive primary planes
> >>  already; so the fact that a CRTC must have one and only one primary
> >>  plane is an invalid assumption. =20
> >=20
> > Why does this driver expose two primary planes, if it only has a=20
> > single
> > CRTC? =20
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--Sig_/VjwGWdRbYYmHwPtJmbJ.naq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBhjKUACgkQI1/ltBGq
qqf4zQ/8CTYQltHBAYzKNRwXrfze1iZznMXlxhTX0k079z6Vx/dqAUtOXtF5lU69
QIcj/I5rzbdgNFYg/PZv1txTlTJp12GrdynXWxEgvD9ovZhRG3cpqKHABkmPB3LO
s5mfv++oIP5go+xOjGn8BRtzmuOB93u3yORJYeJv2yu0KkBMtXJ9/O0z4DEoSPfH
lZgd50KlOG9pLwJNsxNEkHahrfam20UcCA//kR8GFBMp/QfjLcuExcAj1sef3IP4
awHTaBcP3SxyKzjMrqBPipzxAZENjWXQNHv0SETNj8FftIhSEcxSmAyqtDMbY2kf
B5xJfzplu88D5op7zO/IvjILey1eikJFKbp950TDvmjsDHCqHWcDzSXWXOZeNyOx
Bh0xwk+i0qcFLI19IGdJUGuFsyxewKpnr3OSp7KZ7mqa5VLX8leVodRpX6cA2/9x
C8ozpYeoAMESD5hraGlXPu5AYqFuMK394QhawcePltUQuzi23XcZdIxuE15h+B9d
VkpVIZ5xc83WUI6tW7oGjDzAC0IFcKP3XvtKFXoQfA2r5AnhMh8ZCAQkOzn1Yy25
CKFTZWhkfdZOWv/mudRPz65OrCy1F/JX+MdS8xTM8sFyLLYMyHgj7mffcxr+F5S6
nkg4lHFo9Z+icZiJiN/RprnkqwEocgqQx+/p3uZNeUOmsrcuiqA=
=Dre6
-----END PGP SIGNATURE-----

--Sig_/VjwGWdRbYYmHwPtJmbJ.naq--

--===============1207165472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1207165472==--
