Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB1696237
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F2610E889;
	Tue, 14 Feb 2023 11:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F255310E888;
 Tue, 14 Feb 2023 11:17:58 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id fi26so16790755edb.7;
 Tue, 14 Feb 2023 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sbucsuXzTBHTPi5YgVujzJdJMdqlsrI6bpiVdNozqNU=;
 b=T5Yj/lA+1g10YN9izHCQDkOHkjVfkWS7nQYYqf3rsNhfTTUcaP82vzwrKTJpkuUceO
 OXQ0HSa8GVKfvSbxq7xrWblk3AQiMRICsJl2WOmsHv+YtLhkgdVWktBj4M26qEoc0sF1
 4CzuR3KdhHcbKbQsbRnYFn5dFI4m9vvPgCOViZnBtUve4gIE6Oot+u8bVzMPizS1BTmY
 3yoAMmpk40SPasbLQ7MxnFhM7UVI+lk0xZeVHQtbpVCdwj9v3FY8fkcAMhdS27GY8NgL
 oygHJLFv4K7ytnqLEFG7SgFMHxkMKv0w4Wdi03F9a0NMXXZnJQ9/Hs9oY2synuyuXI/O
 TZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sbucsuXzTBHTPi5YgVujzJdJMdqlsrI6bpiVdNozqNU=;
 b=G58SMKpf2rKMdcj8looklXKMrLvyTwTaduoaFIHnEIgdyhA6tL0eYROGJqtZrkEJ5x
 vy/9C24gXQlOQ8NuHxKZtg8t8d81pqX5VRgZzfg0eZk2xZ7vjkFK0znE0zIeChi7xaD7
 dUcvOsvU37z80Rqyrdadc162u+PsKcMFoEiyatxYAL5CWSSecgPBuJxokAWKuYqQ+yzm
 y5GocDj8jhtgr+7aqg0my5QY7IX0WM+m0eX/gidrHDzGodIHDe2nKyuZxYdzwpL19+Kr
 +rxjYXEAe2xlwagkDOTNaTvwHwEP7pH+lZQi3jvoBdyyky8LjD3+qJxMDScuLxuzmd8q
 MFHQ==
X-Gm-Message-State: AO0yUKWu1wX0W1hIbPPQwfEw0dIl4VAH21OztJEoWGbPrp8MBai5fMpE
 KOqn6v1xGGeLJ8OZNXGSXUA=
X-Google-Smtp-Source: AK7set/MdHvrwZSd1nTndmLo4pUCBBrKAIlc0/pHFE8DTl4pL8nNRYzh/ZlZUca/burMPf4nnQpPAA==
X-Received: by 2002:a50:9357:0:b0:4ac:bd84:43e1 with SMTP id
 n23-20020a509357000000b004acbd8443e1mr2125064eda.8.1676373477400; 
 Tue, 14 Feb 2023 03:17:57 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 z96-20020a509e69000000b004acb6d659eesm5094471ede.52.2023.02.14.03.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 03:17:57 -0800 (PST)
Date: Tue, 14 Feb 2023 13:17:45 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Message-ID: <20230214131745.294d5363@eldfell>
In-Reply-To: <Y+tiIYMVnQ6gyJ/e@intel.com>
References: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
 <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208141312.76df0cb0.pekka.paalanen@collabora.com>
 <Y+OdtR78JnQOTj38@intel.com> <Y+QRSH3kLD4Xrktc@intel.com>
 <20230209135105.4137872c.pekka.paalanen@collabora.com>
 <20230214114227.7fa94b78@eldfell> <Y+tiIYMVnQ6gyJ/e@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HNKsfv6m6Bq7=iO0SmPvXq5";
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/HNKsfv6m6Bq7=iO0SmPvXq5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Feb 2023 12:27:45 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Tue, Feb 14, 2023 at 11:42:27AM +0200, Pekka Paalanen wrote:
> > On Thu, 9 Feb 2023 13:51:05 +0200
> > Pekka Paalanen <pekka.paalanen@collabora.com> wrote:
> >  =20
> > > Maybe we could refine this so that userspace uses the stride and heig=
ht
> > > implied by the caps for allocation, and then use the exact cursor ima=
ge
> > > size for AddFB2? And have drivers pick any size between those two they
> > > can use. The kernel would need the userspace to promise that the
> > > padding is always zero-initialized, so the driver can simply scan out
> > > any area of the buffer it needs.
> > >=20
> > > Then we don't need SIZE_HINTS. =20
> >=20
> > Would there be any problem with this?
> >=20
> > If this works, it would seem the superior solution to me, because
> > userspace does not need to guess or test for the exact right size.
> > Simply allocate at the CAP size, pad the cursor image with transparent
> > pixels, and let the kernel scan out the optimal area. =20
>=20
> No, the hardware cannot scan out a smaller area because the
> stride will be wrong.

In another email of yours you said that hardware requires stride to be
equivalent to the width. So it's not that hardware supports only
specific strides, it must equal to width. That's really unfortunate and
surprising.

> >=20
> > And if the kernel needs to do a pixel format conversion, it only needs
> > to do the optimal minimum amount of work. =20
>=20
> Involving the CPU (or GPU I suppose but that could involve big extra
> latencies) in the kernel to massage the pixels around every time
> seems extremely sub-optimal. Seems like we might as well use a
> software cursor at that point.

I meant drivers that already do that anyway, because they cannot scan
out ARGB8888 on the cursor plane.


Thanks,
pq

--Sig_/HNKsfv6m6Bq7=iO0SmPvXq5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPrbdkACgkQI1/ltBGq
qqfHNw//TVEbYlVrxSFnsGG82oc/fiumTM7eBuRojlVklHaGY+EJKIId8JZkhflT
i05/Fb3mL/bPkSRTCGlWsz+ELZm/Ie4WNDbcRyqqisIxJjQzVLOgRJRCxby0ZMBv
+AceW2h0aQ3JIr4NRqmDCHQ/gjHrOlxqKvDNY91X4oCIFBw+3gxIE2QjhurW/oSz
fGI7Vy0k09k7rtQAMXM5xhmzmRPcDFLo2QapVioBYwmH+h2GR13WlQ6ZlVhfY425
g5bH20qixzA4UhcArc8edrBYxO5NWBLvG8NIm7WKf0gmQqdk4qtUg5pfYMpkzOTX
c7fMsc6FYJ+6QOsPS9YhxoEDJ8hWLPUk2c8xAD7NZqY+xXvgRXjfE9g+Qg9vt+03
Yhv8Ai6cTS+hnYZhNfkariYrxM79pEDZ7t2T/WF3RDyRZZtaOha/lgT5dubjM0c9
DCPK8qwRzV9BHaW2VQ/1Lpf7lxoWyWmgyti9dPpTY5YbEwxuFVCKTPAwoXxvfkjm
utATQTEYPxqDWFKMeyaxWKQDnhKSodXpc1sBkPsmPuehijroQx/O9dhwaGfaq0MD
xXsghKDsf7w7/b3Uj3u/8Ts+Cplkjsm8zJR9+ejMZ0XinseJFi6CsDFA7CQ1YjjF
tZsDAmKuUWGI6XhyhL+btK/svqICrvHgpB0yOVGBZGl5sDQuS4M=
=ouHC
-----END PGP SIGNATURE-----

--Sig_/HNKsfv6m6Bq7=iO0SmPvXq5--
