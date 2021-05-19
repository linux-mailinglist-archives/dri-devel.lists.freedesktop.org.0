Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312C388B4B
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B0E6ED01;
	Wed, 19 May 2021 10:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0E16ED01;
 Wed, 19 May 2021 10:02:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id m11so18214361lfg.3;
 Wed, 19 May 2021 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=wKqcg3MzcR6h6W6HHFEBfQTy2iOY5y6ezRvyBWxeZWg=;
 b=oVR9DyultY8Jrt6KYHORcQXWp/bMwpgcAW56+GSPbHtqVW80WFzjd7dv/ZwpW5kaRH
 e/PW9XFCXnUFjoecP6lE79WdRgtC9yUbGkyKiMSDZYOFlWSDKDkizVXvnV8QoGtDsRgp
 zn6RSc7cq7Uw9HtBmClm5rT61YhDzh/CpJYpVgi0HnjDjbPscznnnSFxNc26owTpYSDv
 efDk/hp++Rq/KkYNNhIU6YXn43ckayH6/Pc/fiCnY3TWQ3nYKaAH/8FKSfBkrmUyryXD
 okwQhoXQCw0Mh7l68aHmJjPl1D8a5vNEG/8gi5hmGlDRX+RuhcHw4qAy7FSXpjZ8Qv3G
 t1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=wKqcg3MzcR6h6W6HHFEBfQTy2iOY5y6ezRvyBWxeZWg=;
 b=l+YlrCIbl8qR5GFgOHsSDZ51eIcPRgLjVbISNFp2uDy9JuDTVhTUC8mFHPtlnGVSGE
 XPtia8ArP/UBPM6RZHRRn5qcsCTTgpxG90kZraghe0ZaonQEN77GzX83JsAMP66zDjO+
 wU8PAGmK5TKqqm4Z3nByOn4acqSSTMI8uupQ3UecdXkuJ458t29EhZKyCN7SbfRmb237
 e2Gx6zd2xS2g2m6Xicy90XZJ3R1f4EzMBoGbmGguKjXCBfFqMzG6TAUR/YcXvxQPGSrs
 F7lJqnij4BQiC+wzZuHZqLygaVY5rF4phJFps9r6d7OYb+4qh18gzCIh64BT2QYrWIQg
 8prQ==
X-Gm-Message-State: AOAM530JM1+QdKumryZSJ8O7lGRaf0puYfwtDSjMpawvDh+izHGnu+qe
 Qm6vqkPrxdKWQ5S+ICEC1uU=
X-Google-Smtp-Source: ABdhPJwPN6RWW3sZPhljhU3QfyzY+DR0nj8AbpvdAE1GKrXWtmTc8oIkoV9m204hOzPHF3/eQ3D/4A==
X-Received: by 2002:ac2:592b:: with SMTP id v11mr8256182lfi.296.1621418569748; 
 Wed, 19 May 2021 03:02:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t1sm2556906lfg.226.2021.05.19.03.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:02:49 -0700 (PDT)
Date: Wed, 19 May 2021 13:02:39 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
Message-ID: <20210519130239.370c7e47@eldfell>
In-Reply-To: <20210519115337.3194fa11@eldfell>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <e51a3067-a0b3-16e4-5996-bd8527b7536b@amd.com>
 <20210517115726.4fc1c710@eldfell>
 <5f6abaaa45bb7f77110d9f87c9824e3f@sebastianwick.net>
 <b0834be8-9023-0fde-f15d-8c44f72e7702@amd.com>
 <20210518105615.212b84e4@eldfell>
 <9d4ec9c3-6716-7c80-97d5-dd3c5c50ab51@amd.com>
 <20210519115337.3194fa11@eldfell>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TyVT5tyJOvX/0Srp.ylFYLq"; protocol="application/pgp-signature"
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
Cc: Deepak.Sharma@amd.com, amd-gfx@lists.freedesktop.org, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Sebastian Wick <sebastian@sebastianwick.net>, Krunoslav.Kovac@amd.com,
 hersenxs.wu@amd.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/TyVT5tyJOvX/0Srp.ylFYLq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 19 May 2021 11:53:37 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

...

> TL;DR:
>=20
> I would summarise my comments so far into these:
>=20
> - Telling the kernel the color spaces and letting it come up with
>   whatever color transformation formula from those is not enough,
>   because it puts the render intent policy decision in the kernel.
>=20
> - Telling the kernel what color transformations need to be done is
>   good, if it is clearly defined.
>=20
> - Using an enum-based UAPI to tell the kernel what color
>   transformations needs to be done (e.g. which EOTF or EOTF^-1 to apply
>   at a step in the abstract pipeline) is very likely ok for many
>   Wayland compositors in most cases, but may not be sufficient for all
>   use cases. Of course, one is always bound by what hardware can do, so
>   not a big deal.
>=20
> - You may need to define mutually exclusive KMS properties (referring
>   to my email in another branch of this email tree).
>=20
> - I'm not sure I (we?) can meaningfully review things like "SDR boost"
>   property until we know ourselves how to composite different types of
>   content together. Maybe someone else could.
>=20
> Does this help or raise thoughts?
>=20
> The work on Weston CM&HDR right now is aiming to get it up to a point
> where we can start nicely testing different compositing approaches and
> methods and parameters, and I expect that will also feed back into the
> Wayland CM&HDR protocol design as well.

I have forgot to mention one important thing:

Generic Wayland compositors will be using KMS planes opportunistically.
The compositor will be switching between GL and KMS compositing
on-demand, refresh by refresh. This means that both GL and KMS
compositing must produce identical results, or users will be seeing
"color flicks" on switch.

This is a practical reason why we really want to know in full detail
how the KMS pipeline processes pixels.


Thanks,
pq

--Sig_/TyVT5tyJOvX/0Srp.ylFYLq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCk4j8ACgkQI1/ltBGq
qqdF8hAAieYqEHEO1DkAmnZBQl6E02brZEmgXY6QjQHN1OwONhm+TdceSiBW2fUX
+LLF35EJY2nkppz8yIhcwMMzFKsENd5igpGPMDYkS7JGV/sudTV8Bqy5m80xb+Rj
Ig6EMkRoKSbH60/BbzNhbOu39U4f9r3ub+zShVt18m6+trL2m45Ki9DXnu2bV/Sp
CSOt9pr3nW6x/YxzmAfADM/tB3Bi9hB4jNijwYKKgncuNU9fVKjHLmldnJRXL8+O
1IB7Z+QSfmKpHA7giaBE8Qd5q2H6wUay7y1547CaddlpRGUuHFOE8u45KxBZsX/m
2EKyw08b4fFdbED9JkO1KZ/KyFi2VbobyYaYu2caB+/H1laqKqqfiLk2mmkb5MRI
C3EQBY0KMJl9RYqFTAC0wMQglyQxliDUBjPe+figOzxWUrPB5jnTlkqN11MrArup
lgRJ4CI5NuMm0y2P6Nigy0XLKc4s3MxS+9SX0K5eCVX8FIotqcqydE3Zza6ag4uP
uLrwiu+Uk+HuL9c+NRdEC4mnsuV4JFNA91RH+awE6NmFASXimzEts2pwVtzekDEr
+RYHZ/T6QRrYvIp+4KATm/kL35yd9cXpf7Lc4cLQzHiUwXYzZgDA56AI5i/HWpAv
hfGrKu/MN6trd4nnDH3EzeFgGoUkwCLWRxtsiCfkqeioWkGaK7E=
=Ju9/
-----END PGP SIGNATURE-----

--Sig_/TyVT5tyJOvX/0Srp.ylFYLq--
