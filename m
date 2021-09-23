Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA9416026
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 15:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B00B6ED17;
	Thu, 23 Sep 2021 13:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F116ED17;
 Thu, 23 Sep 2021 13:39:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id e15so26770657lfr.10;
 Thu, 23 Sep 2021 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=IRZM4/PpJ+JTJahmiyKSWPlcTattHTx8MUEFua8EMJM=;
 b=ORxGY9XXGYIIKi5OSxxdT//SGexDYGrdaHMdgYvwjejUy3masjbzDGBvyvtTzSp3yv
 v8ZwlCYZj7aKLvNtUc7tj3N94Tn7g+UEYTigbaQjRA9b2qCP+O0ggk7i6A1zOkCPbq8Z
 QE9f6WTJDb8WoAcEs6+0FeORziXNzFd3OJKcLaKQCdvYzCWNTB5RbnRyook3eUnQvedy
 IQymdLlp2Ed2iOdytrff7pzKB9zxN2OTrI02eljGbGtORva6tLr+Z/tvm2z82JmAObLX
 Ria/wGzz28RA6tv5qsIBeJLp/dTRDJ2JymPVbNpBl9WdPE74KStMPp6MRJKDaOG0TBgl
 dalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=IRZM4/PpJ+JTJahmiyKSWPlcTattHTx8MUEFua8EMJM=;
 b=oY8dQ0tpRPIKc/wCQzvawtF98zSxbmmbHmq9/dz0pQ4a6YrGf+1i/3+eN7/97Vvoc6
 k1ME7GODOMemsDPU9gUwRmEiwSgnpTvQpddXOO5Qb5ovM/GoB0KTDDnoSc2714pY5QXX
 boGA1ZaK2zzmHckaA3XL0fRnm+RJkOThwMnGGanEhNlvgXczzVv7wzU6++ORGHf6KjKo
 4TEBwJXzVoF6+dW/74xBYXWBrDiLGEaDR4aJ+C5F2HL1NxiIheZhgeAnkOO2+v2QTiT1
 zg0AnrBsPSEdzvvj6YqrJZZZwVwdbtxcSBc8mnEQUzChHxhXPu/LUy9RRQ/mB7CwxAKb
 XiBg==
X-Gm-Message-State: AOAM532Ekvi1JhzTcW3h6p8Y4zqo32eyNppdWbC1zPPS+k6mTmAmFsVQ
 ctJyUCZfJ+/DA4g4hbqCcyc=
X-Google-Smtp-Source: ABdhPJy4ckGqhqNDXkD7hITdFPSsHwtKw5bslITkh+nombR7blfCO0TF+WrP0mMdwOBlyloIiFq2Yw==
X-Received: by 2002:a05:6512:228a:: with SMTP id
 f10mr4260683lfu.619.1632404373081; 
 Thu, 23 Sep 2021 06:39:33 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x17sm599561ljm.58.2021.09.23.06.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 06:39:32 -0700 (PDT)
Date: Thu, 23 Sep 2021 16:39:22 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
Cc: Simon Ser <contact@emersion.fr>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: Multiple DRI card detection in compositor systemd units
Message-ID: <20210923163922.1537fb36@eldfell>
In-Reply-To: <8983CFBC-2D55-4AA8-ACFD-10EE410FFAEA@garmin.com>
References: <19277F1C-6CF5-4C19-9492-4A03F951764B@garmin.com>
 <xiT2GOL-X7GZiZUihjkIOFEbbS3vuVQrvogRKQjVdONfi07OwXydRhIUWU_elgmh0Ug9mAUONLEDC-bQe69fsOcd7Iq31R8T_Ai5KGhOnzE=@emersion.fr>
 <8983CFBC-2D55-4AA8-ACFD-10EE410FFAEA@garmin.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WAS/MY6fmUTVHNsOxCQukDk";
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

--Sig_/WAS/MY6fmUTVHNsOxCQukDk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Sep 2021 16:16:48 +0000
"Hoosier, Matt" <Matt.Hoosier@garmin.com> wrote:

>=20
> The /dev/dri/by-path idea works, I suppose, if you have different
> physical graphics cards. In my case, that's not true. These are
> virtualized cards that the silicon vendor's DRM drivers use to expose
> different subsets of DRM resources as different cards. So there's
> only one /dev/dri/by-path card here. Think: DRM leases, but with the
> lessees popping out as card nodes rather than arranged dynamically
> using the drm ioctl()'s to manufature leases.

That's the standard solution though, I believe: use devpath for
matching the device, because the device doesn't randomly jump from a
physical connector (e.g. PCIe slot) to another.

But since you have virtual cards, that obviously doesn't work. I'm
afraid you need to solve this with your virtual card provider. Maybe
there could be some sort of virtual bus with persistent addresses which
would make devpath reliable?

I wouldn't expect drmGetVersion()->name to differ between the (virtual)
devices since they are all using the same driver, right?


Sorry,
pq


> The use-case here is to allow separate DRM domains for each of
> several containers. It's not really desirable to try to funnel
> everybody's graphics through a common compositor that runs all the
> connectors.
>=20

--Sig_/WAS/MY6fmUTVHNsOxCQukDk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFMg4oACgkQI1/ltBGq
qqfhZQ//UIHvfOcqn7IzvJIrXZ2za4HxsXfhW7erHgTLyySRrUBBUVQTWuRr7u8b
Iht0aP7vOMvp+u+JW9gZ9fqDAbu/hQDAK1eE66kh1+AzIHf4ESqkHdKEbeW9JDmb
Ce2iMbu/1exSkMI8Wnruyfm1n37xlgkE/BpA0MML+2qI6hKVzV3992HaQdSrjV2I
r5wp/3jOMCSl4WTKmPEgHvPUCZ/wwh7cTAv0VyMRBDHygpsrER7MN7+WXHaAytn5
iv1k0KWe88qpW/ONygz6UicIp5K++2XjQsEKsiQgoKT1crePiYRTRxgKKdM/tWn3
TGNI1b4jg31Ez4AMTKIAqOTyLFpCndun/MEAHz5rL2SP8wjhMizsMePJi43AZTLT
nx9nC1porTTWKs5IOHknb3B5WMaM6ULeutq4CmrXEKcAbgm7QXKmeIeB7mwcv+Tx
+AyBTCyQl1+24WY/7PQHFIEl/o8DtVi0ZXUMM1GjQUrKVfN0PCBJfmkkrAJD0KT4
Pu+KqdaVQo3WtoCi9WGlA4O2dEqKjtGMdlxphSFYTV0GHaCnRoTFAeBUFdFRehy8
rMcTkWvs27CrjAV0B3kylGFF2az6KXIu6W7UmAbhZ2UK+sqqWR1p7L5tclyDYW+9
VcOR7DF3hG8BQhJHIE0w5OXt7oOb39DtqljmunSLT6C5UPLbFTU=
=3aOH
-----END PGP SIGNATURE-----

--Sig_/WAS/MY6fmUTVHNsOxCQukDk--
