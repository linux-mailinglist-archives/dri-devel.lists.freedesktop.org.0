Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ABA6093CC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Oct 2022 16:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6010E1E1;
	Sun, 23 Oct 2022 14:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403C210E1E1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Oct 2022 14:02:55 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so1256944pjc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Oct 2022 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t6pBF/o0natTLuLX/wEXaHuftOiR1PZ0M1sSmiCulEc=;
 b=IUWzmI71fyIUK86PItGrbkGDgECFyiP1DOXhDRI36uIh3LwOJb+pBNZRtiGXBxuR/X
 EkgHrb08gHySShO6zEhRbGtQSD8HXiWRiwsX/q1fb4Rla2P9+yK3DEuXXIoajEbx0KZJ
 O1lMk1WEESOFv1GJwGm8jKsXfcB1ydcOrkxggQ6bgQnfaPn6QQyYl7BTjt3nku5VKDf1
 srM3Rbj9zZMaXgvZpKOjm3Sg6oSAt/TWhe5fI7eu/Rqo3eSw/iNCKi2PS6HmcnvHUD/7
 s4d/neVbaEVYhkCsZ7/kMfwkkOvxCHM/K84QA8S9oqiIfXWOnaDdE7aIujLYTe6abH7O
 I1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6pBF/o0natTLuLX/wEXaHuftOiR1PZ0M1sSmiCulEc=;
 b=w8yUg0uYmNBFJkumxMebUn9Nd3x2tI9tXjPj1nGFCq5xuRe5IZFToV1Dh0/Lh+Iq8p
 lG6YGGe/fGSeuOiqhwt0BadIy+b+TIAGV1CNLd78FbmWb6Ra3FVCBmxHvjugQYQf0qn9
 FryeD3X30IO+bDSfC9vz+cY8JTIvqKPJTvA+XjYIKkDzvBbJ7madHXWmoft7LqIzfTGi
 RduU27HcYCHlOTsKyt9nIXFNFwyVgY32geJ2TiK6pd/zZRjm5X+MP1Ukf2obldcmV5FL
 qbkBZ+WCQlwQCl8xTJJ15z4oqgarLVke7kc8ul4KVCeEhT40GbzReEWVQfwDFkvmamZW
 rq8w==
X-Gm-Message-State: ACrzQf3x9H1/XpzctHYHjotGkla0ICxwsWlz5+BlxJpdVxS56ML4zEvs
 DMp9gwrcNkwXAi4U+lGAnyw=
X-Google-Smtp-Source: AMsMyM43NXpGWu4+Am+eBa3FFP7OIWC4DXukJ4PyEXkP7L0HIiDUqvD+1k1Nk6FUUuV+KhrvT3PF6Q==
X-Received: by 2002:a17:90a:6845:b0:210:7ef5:ab99 with SMTP id
 e5-20020a17090a684500b002107ef5ab99mr24388726pjm.80.1666533774770; 
 Sun, 23 Oct 2022 07:02:54 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-1.three.co.id. [180.214.232.1])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a056a0000dc00b0056afd55722asm4270109pfj.153.2022.10.23.07.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 07:02:53 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id C9886104163; Sun, 23 Oct 2022 21:02:50 +0700 (WIB)
Date: Sun, 23 Oct 2022 21:02:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH 0/3] new subsystem for compute accelerator devices
Message-ID: <Y1VJieGgVv9BwaO3@debian.me>
References: <20221022214622.18042-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KFhUQIkYlmhwSi0N"
Content-Disposition: inline
In-Reply-To: <20221022214622.18042-1-ogabbay@kernel.org>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>,
 Christoph Hellwig <hch@infradead.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KFhUQIkYlmhwSi0N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 23, 2022 at 12:46:19AM +0300, Oded Gabbay wrote:
> In the last couple of months we had a discussion [1] about creating a new
> subsystem for compute accelerator devices in the kernel.
>=20
> After an analysis that was done by DRM maintainers and myself, and follow=
ing
> a BOF session at the Linux Plumbers conference a few weeks ago [2], we
> decided to create a new subsystem that will use the DRM subsystem's code =
and
> functionality. i.e. the accel core code will be part of the DRM subsystem.
>=20
> This will allow us to leverage the extensive DRM code-base and
> collaborate with DRM developers that have experience with this type of
> devices. In addition, new features that will be added for the accelerator
> drivers can be of use to GPU drivers as well (e.g. RAS).
>=20
> As agreed in the BOF session, the accelerator devices will be exposed to
> user-space with a new, dedicated device char files and a dedicated major
> number (261), to clearly separate them from graphic cards and the graphic
> user-space s/w stack. Furthermore, the drivers will be located in a separ=
ate
> place in the kernel tree (drivers/accel/).
>=20
> This series of patches is the first step in this direction as it adds the
> necessary infrastructure for accelerator devices to DRM. The new devices =
will
> be exposed with the following convention:
>=20
> device char files - /dev/accel/accel*
> sysfs             - /sys/class/accel/accel*/
> debugfs           - /sys/kernel/debug/accel/accel*/
>=20
> I tried to reuse the existing DRM code as much as possible, while keeping=
 it
> readable and maintainable.
>=20
> One thing that is missing from this series is defining a namespace for the
> new accel subsystem, while I'll add in the next iteration of this patch-s=
et,
> after I will receive feedback from the community.
>=20
> As for drivers, once this series will be accepted (after adding the names=
pace),
> I will start working on migrating the habanalabs driver to the new accel
> subsystem. I have talked about it with Dave and we agreed that it will be
> a good start to simply move the driver as-is with minimal changes, and th=
en
> start working on the driver's individual features that will be either add=
ed
> to the accel core code (with or without changes), or will be removed and
> instead the driver will use existing DRM code.
>=20
> In addition, I know of at least 3 or 4 drivers that were submitted for re=
view
> and are good candidates to be included in this new subsystem, instead of =
being
> a drm render node driver or a misc driver.
>=20
> [1] https://lkml.org/lkml/2022/7/31/83
> [2] https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summar=
y.html
>=20

Since this is new subsystem, it should have its own git tree where you
collected accelerator-related patches. By convention, there should be
"next" branch targeting for next kernel release and "fixes" branch for
bugfixes pending for current release. Both branches should be included
into linux-next. The names don't necessarily be that, though.

Also, it had been great if you write short, descriptive documentation
about the subsystem (maintainers handbook).

Cc'ing linux-doc folks.

--=20
An old man doll... just what I always wanted! - Clara

--KFhUQIkYlmhwSi0N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1VJhQAKCRD2uYlJVVFO
o+yTAP0Wq0yPX3TS5HZJ27v0PHGSOWTbOi+nH/lPSH1cS+ol9AD8CHBTzQqZytiP
wolMvwwGEa8J+1fi1Wk5hKbB1ex35g8=
=9xlo
-----END PGP SIGNATURE-----

--KFhUQIkYlmhwSi0N--
