Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D93B14A6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 09:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E8F6E3B2;
	Wed, 23 Jun 2021 07:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743D26E311;
 Wed, 23 Jun 2021 07:33:01 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u11so1659354ljh.2;
 Wed, 23 Jun 2021 00:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=YZemia2xkd9wPxf7PYIuUdoUM88tBDTDZzMRx7UGxbI=;
 b=GfHaiQ+9dIGdjyaQLgempGl1KINMmr3YRF7D4wIkxctZlc9Det8VtdI2vY+KW1RABi
 RlLB461SzAOy7eW5xXiO4QrJbQFjKRh02YPLm9FuNDAsSZJ3+/Pya0GCDpFNwKeVzRUY
 9L9zI++esx59hHSg4upM+RXbCmm30qw+RE89EVeWmUTswYkgOrjlQqe9J9Y2iQAtmJbT
 3o8rsqQehe99/nr5/Cp32XFWlCHs+Xmv+01P62t6HLtDd20RC8+ui3tPa7B6lHq6AxLk
 ttzCtSuwBABrFc0Iu7K1Uh/hzmO2lX53IWxVAbTbK2Jb8gFp+ovD22+calRRL4kdG5so
 q5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=YZemia2xkd9wPxf7PYIuUdoUM88tBDTDZzMRx7UGxbI=;
 b=pJjXFsAxGL9y8jqJyFI9a5679PQohC2sHNPujvieW/MMLrwJnqahydnHUAySpwu8nv
 5qTny0ijS9GaBvcEh7n/LkLmwkEUnjbOpiUetzECAPhf5G0TnaWlDS220B7gYL7hTrn5
 STaDKregCBeb0fkWcv9oD4oECx59htXNMj7DiVEuLXAlqMv7YZux3Xjlxy6+QXy0Sz0V
 dCnvwaUdjIf7TRqXzZxI/KlKbXRkWv3rhCOAXVahIxQ2VPWmEW/Esc+M7NxUfKx+whhS
 wxJYSGGxONA9fRZLbH61rRBxy+VRISJQyyuP8CRP2Fj/+p3zgBX0riyln+LrzNjxjoVp
 bXRA==
X-Gm-Message-State: AOAM532c6CRVKEE89naIbfTTy7gwVDoCYmO4jZeCDSctaHPUlO2qUj/T
 fBfgxZ2UnQDPWZF8ngACTHw=
X-Google-Smtp-Source: ABdhPJxJtSHXZTH9k9mfjaw0yxkiKK6KeX3EYm+tlF1m1UoKVf8S59+ZjYAFAiXbmik1WnhotcwI5A==
X-Received: by 2002:a2e:b790:: with SMTP id n16mr6712264ljo.9.1624433579918;
 Wed, 23 Jun 2021 00:32:59 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h22sm240173ljl.126.2021.06.23.00.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 00:32:59 -0700 (PDT)
Date: Wed, 23 Jun 2021 10:32:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 09/17] drm/uAPI: Add "active color range" drm
 property as feedback for userspace
Message-ID: <20210623103256.01d680ba@eldfell>
In-Reply-To: <k_QeCRpur3SNNIspBiTHOTT6Oj1pSteEO3MzyQFUG0lSXmEqJUI2tMXJ6wR9chzUHGahdQApJZrUxdJvIv6s8aXr2DBdoHg-2PsGH4kEMyA=@emersion.fr>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-10-wse@tuxedocomputers.com>
 <20210622100042.4041624a@eldfell>
 <56d079d4-841a-0ca5-b8a6-d2c10f91d211@tuxedocomputers.com>
 <k_QeCRpur3SNNIspBiTHOTT6Oj1pSteEO3MzyQFUG0lSXmEqJUI2tMXJ6wR9chzUHGahdQApJZrUxdJvIv6s8aXr2DBdoHg-2PsGH4kEMyA=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/og1XePoz.LGaKFtP+VtKobU";
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
Cc: amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 Werner Sembach <wse@tuxedocomputers.com>, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/og1XePoz.LGaKFtP+VtKobU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jun 2021 11:48:52 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, June 22nd, 2021 at 11:50, Werner Sembach <wse@tuxedocomputers=
.com> wrote:
>=20
> > Unknown is when no monitor is connected or is when the
> > connector/monitor is disabled. =20
>=20
> I think the other connector props (link-status, non-desktop, etc) don't
> have a special "unset" value, and instead the value is set to a random
> enum entry. User-space should ignore the prop on these disconnected
> connectors anyways.

That sounds fine to me.


Thanks,
pq

--Sig_/og1XePoz.LGaKFtP+VtKobU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDS46kACgkQI1/ltBGq
qqfLkw/+P6NaSOYz6suNSIJr6eu3bQ5Vjrs9V+oj+mwVKm9pq+WeE6l5yfRZpCMg
FT0hQ0qGdXuIAnn/LpNjkLMjHJHTH4RdiE4y7UpOn3hxkXO4mYnQne1qw58dKsSC
ZD4Zab6KBeJIQQ+pFzXP/8OeBszusmfxBrpOAEu5zI3GT9it+YqNHSIwsYTBeWSl
unLG6slUBvLsQ8YmbaPapOH4VBLyOFJCIgFKGB086yD1vu/TF41S+U0suq+FsiWF
tPr6hfYMv3EM82PTD1UFJEs4tZlLXpP9saX9ChWGOCHU42WAW3P1pOF/9mDHOsZb
a3V0UY4W9cymrqUDz1ObBRnvGVT9OiLg4yIw5RilUg3X0xOigaftalTUgOysndY2
PU7Wh+cPTwi4jkBIUVZQgViQ46btsdGVUBSa2t7VCvdN1Le+DxQ5IMN0P7b+63VP
tVbAAqFbuApCxrtPO1/N24DCS0ZWx/UG4HkJtwDsk+7izQkFMyNdIO+QfnFbNG9W
ANZ9SSweN4DlQeS1PyDiRye8Vx/tHFf05V1Vu2qSm9lXMsQPVI+r5JU2PldstOJM
MCZ2p0BhETEa9qthpW4Ozb5hWUmjKZBbkDC6OrSg1eUo9P1e4bmuCS6XIdCdx23Y
DvCmNmMOWQ89qzdOka3FmP4MA/uCQ33HfJZy+HR2A/4S1ONH89M=
=9fd3
-----END PGP SIGNATURE-----

--Sig_/og1XePoz.LGaKFtP+VtKobU--
