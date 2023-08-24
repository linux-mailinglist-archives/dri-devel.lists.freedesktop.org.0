Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22E7870B9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 15:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E9E10E02A;
	Thu, 24 Aug 2023 13:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4DA10E02A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:45:58 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52713d2c606so8836550a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692884756; x=1693489556;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tkTLLhogJKRjJPVkEq8LcD1kIKEz4h0143EwcojipQc=;
 b=b7WMEb8iUoO6sOsXYQeIVTLiFnSq9TphO2y09CS0HWyUlxYfNqXDrpkzVyjldnHBSS
 cB65NP+42XVjQhcModDaFzL91XF6/m/WCUm6Jlq+AdpwjYPOtZ7kYewqx7FLszpG5EXb
 ohVkx6SgXv/SzpSuzu2ts5b1LMUw7zbSAudevDydZi1F8CUP+QfaqUHM31RlRvRVZvTZ
 0ZQ22zpYmbGUiJgwZMwI2TicpAfx6sLvriK7jny84l92hCoxrU3ERwfyBA5vUaMEJF1Y
 BYOUV1JWu5msbXgzeOovWHQuAtMJngeBBus0cHs+YWLu1MRYoqFezJVdKhcJbFdCoXAw
 6xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692884756; x=1693489556;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tkTLLhogJKRjJPVkEq8LcD1kIKEz4h0143EwcojipQc=;
 b=h/ELcGDAmaPPL/tXKh8h7ineBEpIlAQcyKLhOJdNJU2tvu6gARBzd67ZVGqvCT0u3W
 pktSAO9OGVpwfJE+zfV4lVxv3L08xYQ9/uJj3szSlHp+qwMT1Owoyd5sID0SfuBI/VuC
 sgM1R/JpOefShrm0iNwhNGVNk80jcOX1e3n2mQWIoGglE+AhJtaffzD7uwQHH7d+2T65
 UiDJvWmsY7rJJHYSRh6OXRzJ9tDAlSMrFt4JrJtTmdon0D3ompfOOWdm0zuHjIl7Ei1H
 gvJ2OILZ/4W9Zftyu3y4XiSWNxP2tx3rFslhb0hGX0kZxpi7HaoNlb0Vbrk1ltL2+aXr
 P3kQ==
X-Gm-Message-State: AOJu0YwZ78KRExwY7PNJwtwdTN26ei4PaQRvEExqRjOOMTcFtOi2iJUO
 ohLS6BEW4qsB5TNbKia0gGY=
X-Google-Smtp-Source: AGHT+IEAXKY6oy8+zcO/qKJkrPKVuq7hID5IGx1gL4tu9aBJmvqNkS89qmFuJ8ZaMIGK8PRzG5Lofw==
X-Received: by 2002:a05:6402:6d2:b0:52a:1c3c:2ecf with SMTP id
 n18-20020a05640206d200b0052a1c3c2ecfmr6284246edy.28.1692884756458; 
 Thu, 24 Aug 2023 06:45:56 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g21-20020aa7c855000000b005255f5735adsm10584916edt.24.2023.08.24.06.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 06:45:56 -0700 (PDT)
Date: Thu, 24 Aug 2023 15:45:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 15/20] drm/tegra/hub: Increase buffer size to ensure all
 possible values can be stored
Message-ID: <ZOdfEg9vF1umkEyO@orome>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-16-lee@kernel.org> <ZOciEaJlHhp4xnFv@orome>
 <87r0ns4weq.fsf@intel.com> <20230824120124.GR1380343@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TRPIkzK4mQ5lndJ1"
Content-Disposition: inline
In-Reply-To: <20230824120124.GR1380343@google.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--TRPIkzK4mQ5lndJ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 01:01:24PM +0100, Lee Jones wrote:
> On Thu, 24 Aug 2023, Jani Nikula wrote:
>=20
> > On Thu, 24 Aug 2023, Thierry Reding <thierry.reding@gmail.com> wrote:
> > > On Thu, Aug 24, 2023 at 08:37:00AM +0100, Lee Jones wrote:
> > >> When converting from int to string, we must allow for up to 10-chars=
 (2147483647).
> > >>=20
> > >> Fixes the following W=3D1 kernel build warning(s):
> > >>=20
> > >>  drivers/gpu/drm/tegra/hub.c: In function =E2=80=98tegra_display_hub=
_probe=E2=80=99:
> > >>  drivers/gpu/drm/tegra/hub.c:1106:47: warning: =E2=80=98%u=E2=80=99 =
directive output may be truncated writing between 1 and 10 bytes into a reg=
ion of size 4 [-Wformat-truncation=3D]
> > >>  drivers/gpu/drm/tegra/hub.c:1106:42: note: directive argument in th=
e range [0, 4294967294]
> > >>  drivers/gpu/drm/tegra/hub.c:1106:17: note: =E2=80=98snprintf=E2=80=
=99 output between 6 and 15 bytes into a destination of size 8
> > >
> > > I wish there was (perhaps there is?) a better way to annotate that i
> > > will always be within a given range. In practice this is always going=
 to
> > > be smaller than 10 and even in future hardware I wouldn't expect this=
 to
> > > ever exceed anything like 32 or 64, so 8 characters is already genero=
us.
> >=20
> > I assume you could do
> >=20
> > 	snprintf(id, sizeof(id), "wgrp%u", (unsigned char)i);
> >=20
> > but it's perhaps less obvious than just increasing the size of the
> > buffer.
>=20
> I had the very same thought process.

It's not a big deal, this happens all on the stack, so adding a couple
of bytes isn't going to hurt very much. Still with all the tooling that
we have it'd be nice if something could be added. Perhaps an alternative
would be to reject values for num_wgrp that are bigger than 32. With
that the compiler might have enough information not to warn about this.

Anyway, no need to spend any more time on this, I'm fine with the patch
as-is.

Thierry

--TRPIkzK4mQ5lndJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTnXw0ACgkQ3SOs138+
s6FCnRAAiccnAvmrJuZHMV5kFF1FRacmxg9JoUVPfX69Fn9T4PgT7LK3yatfk/cn
AfbXILrbjz4w1czp1YqXJBSPXiBegHtjTe0Ur7+iKvdSNA8vx/Xfg0zAViBwNWKW
KWEXTUmtozR1WQdiZUz9EC1b3aCgFjbXo4fth4+eAhSeyasP78SXUzx5/OPTcSIB
xZKsuyjsGIJW3e+XCWXdr5XYq+CVQWE5iMPTk4gP1JemQIL9zYavblGrudf57mQL
952RwlqLuBpEAHLb3Ro4kd05UcZ09zXFyG3fPKXGtToWEZ6/H7uubgdMGNwoDTe6
i4dQ+93anS6T+jDr+3WtHlj9HwzRnfIRw8ptvlbIoOxAKOqv7rmwmCV6W0yhrRm4
iIiJfKuvsNl1jwoa/ylQ7Jyq2vuxd0piJjaeuf6Ci0qtCzvmD/ow2HeNBDCSaNGj
kQAxZ8i6TD2/g+S3ni9Imo8jE2spwi2wzpMTg1AOu69qG+S7K9uzXs+bj5vYNjlE
yvPTwDTKeGodC0i5b+jXDVRB43SWDmG0WSr9gjvdCp9k/gLhR/5GxMlAzid7KpAz
KPi+zTnHmUdQ2VDggxY2LFZE2KLTdvClB/Rvlc0drrXFO7B/dHTK9h/R44ygSNbX
oOBntjwNEpmputS9cFM35D47UPXLefm5EbKSecxiGI7E9jaC+sM=
=P/OA
-----END PGP SIGNATURE-----

--TRPIkzK4mQ5lndJ1--
