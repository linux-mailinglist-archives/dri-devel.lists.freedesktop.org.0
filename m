Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E54D77D5122
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 15:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958310E3B6;
	Tue, 24 Oct 2023 13:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCDE10E3B6;
 Tue, 24 Oct 2023 13:12:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-507b9408c61so6111493e87.0; 
 Tue, 24 Oct 2023 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698153161; x=1698757961; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TENfBjhU132BqHx7e5lh2Xj82u8/6PsMbhLSeVzUVmE=;
 b=V/tvOW9RK6WM+DD+xwDfDYNXEy6xP07EJ7NGzxWGQsrl3mg7K5fQrSzBg+dq7zUVzE
 flrmtVh5xCvAUlleZdzlhlclZyK/zMN32NRVQo9xw5BiVsYAvYK4B05YmGESTUzRp9M4
 beLWeEQREbAyJB3Y5T3xJRdJgpW0Z0yKHW25CjpFmmzwmHnVWv4jcJWKcS2usW2Dj7fk
 efhylfiB9e9grtV/hVqENZY3eHi/e5GS5ixSX4aetwh4sCxkAounrqm+c5Y4OLr6KVrL
 ZpVM+rgbfJQ5JQAJ6QHpxwU1+mB9NOmV6XF8whlA4m5NtZXwNUNb0BV4IkJfJ+Y5d2iJ
 rYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698153161; x=1698757961;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TENfBjhU132BqHx7e5lh2Xj82u8/6PsMbhLSeVzUVmE=;
 b=fWg/t6ZJ2Lyjjg0gb6iBR6UNZNgbS+k4QCodykByKTShgwC/tVu5mhxRDaZi/M/9xc
 wX+HhaUDX6RVVMuLmg+yezT/C1kbRdZOjk3Zqy+r1ocu9uERDk3aU0QYFTKtvT7ogYj5
 PxcHtSCMXfAcH01PZnat0j89WQh8DZeZPCIjXccnT9lXamNk1d/DuQoi0TcdjbmJFD/B
 ACBIYBu7radypQ9QENhjKZfWPg99D+xyZg/y/y+y0Sgy0fEsRKcIvwRUrbBJpeZoZexh
 nUHQcPgsxN5EfijP0EYom5gM/nLt+bPeNOyF8/y7LS4Onu+j1Tz8uxyBjhHGZ1P99rmf
 AAvg==
X-Gm-Message-State: AOJu0YxQAomgjRn2CD9bHNPjLPvfyKY7Gei36u8XQksgBJeNG4VvDzjc
 vCBX/sWEtIMUvYAZjF2hNPw=
X-Google-Smtp-Source: AGHT+IF7eNZyraXuO05hd8ytRheYwAzq+Ufexzu1jhBvvkvtptakGZkXMw0wjg28+ew3AtHwCHepOQ==
X-Received: by 2002:ac2:5594:0:b0:505:6eef:cf2d with SMTP id
 v20-20020ac25594000000b005056eefcf2dmr8118591lfg.17.1698153160957; 
 Tue, 24 Oct 2023 06:12:40 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056512118300b005079dac9620sm2128423lfr.43.2023.10.24.06.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 06:12:40 -0700 (PDT)
Date: Tue, 24 Oct 2023 16:12:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/doc: describe PATH format for DP MST
Message-ID: <20231024161234.4b35230b@eldfell>
In-Reply-To: <ZTfAn2al6lspfQCI@intel.com>
References: <20231023203629.198109-1-contact@emersion.fr>
 <20231024103604.6dd7f6d5@eldfell>
 <TJceGIK3ZUXu0BwrhZUQIJhVtnuTayrPRLcg_KGuxE91o9OPfqxduzZljtreq-z48_1FGMy1z6qppi9UleSqx_hIMJ4GK_CCGBPiyRKkCwM=@emersion.fr>
 <ZTfAn2al6lspfQCI@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hUEM7WlJTsPO0tmER0QbpSP";
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hUEM7WlJTsPO0tmER0QbpSP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Oct 2023 16:03:27 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Tue, Oct 24, 2023 at 09:03:22AM +0000, Simon Ser wrote:
> > On Tuesday, October 24th, 2023 at 09:36, Pekka Paalanen <ppaalanen@gmai=
l.com> wrote:
> >  =20
> > > Are DP MST port numbers guaranteed to be tied to the physical hardware
> > > configuration (e.g. how cables are connected) and therefore stable
> > > across reboots? What about stable across kernel upgrades?
> > >=20
> > > If I knew that, I could perhaps manufacture a stable identifier in
> > > userspace by replacing the parent connector ID with a stable connector
> > > designator. =20
> >=20
> > Hm, my assumption is that these are stable, but maybe that's also wrong?
> > Ville, Dmitry, do you know whether the DP MST port numbers are
> > guaranteed stable across reboots when retaining the exact same hardware
> > configuration (not the software, maybe the user upgraded the kernel)? =
=20
>=20
> I suspect in practice those should remain the same as long as the
> topology didn't change, but I don't think there's anything in the
> DP spec that actually guarantees that (eg. some branch device
> could in theory reshuffle its port numbers on a whim).
>=20
> But there is no stable identifier for the corresponding SST
> connector anyway so I don't know what you would even do with
> stable port numbers.

You mean the index in the array of connectors exposed to userspace is
not stable either for the root DP connector?

KMS device bus path + connector array index for hardwired connectors is
what I've been imagining as stable enough for all end users.


Thanks,
pq

--Sig_/hUEM7WlJTsPO0tmER0QbpSP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmU3wsMACgkQI1/ltBGq
qqeItw//X0o2L3AkG30OLXGZQIL5RF6CsCzA8seny7CqXu2nMQtfWTbEtbbavz3l
BpNmnSKOMjk8kn0T1EMFhdHuA2Sophrnj2/fU5Ysn1aTlIminBWhIj6YkkvoBklE
4yvRj/yOsFft//zxGK7tnp7K8N4AnYu/RjwESReJ3MPx5r+21pL5RHcHiMp2BHII
IwzncueXXqxTVXxD+GUTB72BPm9m2zc/Tk9+DxV2hr2EWiTZRuP9aEgE1TwBTxjM
v9BLUsQld1Luc6w3xomeKCpkHdXHEcfg0XpG3D6TJAci7wtzkDtel3TMeKetG0yb
na5RQFMDopzhtNnZy/XdpMLWuPWuoP6TH8OKfLYCIXX2pL7NE6Cq8hBo3WPUtUzp
eq9v3EB/gzN5W0W5qWsCITWlnKuCjleeic3O42+J+zMceZYRy6qrYliVDKIEw9av
RUV4oLHDdo1HusGKrckxiNUfcviAK3BS5p4lShWK8TZuWMe8Jx6LODEHDNxLKVo+
VHZD/xecZIbjPgCKmVrMrHMWrQ0eFc92C9NJG0pxHyuA6NcnqFNLnmUzoMwIXuWf
AC2MbCZRHDlzCvvu//gaflQwIocfapUiXWa+AJZ1PuHbxgzaFeB4GXVJhSas0Gds
CvxLGo14KUnUOjWn5uyMixx6aNqV/7SNtLlVb9tR1G5BO+uMWMo=
=MVDN
-----END PGP SIGNATURE-----

--Sig_/hUEM7WlJTsPO0tmER0QbpSP--
