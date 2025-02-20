Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD606A3DC61
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337D010E975;
	Thu, 20 Feb 2025 14:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="g1TyMZ9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8719B10E975
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:17:39 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-abbec6a0bfeso167630766b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1740061058; x=1740665858; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JTj2n+cO1ksr4sIMfZ6fZHsbGN0ZLnv+4jljDLUN3e4=;
 b=g1TyMZ9Kd1gnRI78lri0mf5T4qcfbomxiA7+jdCKk4XqLZuNREh5ADoiISVnINt32m
 24a/Rsz2MPTPcGfR+ZDz9I9HhC722okMq3WrOe/IID9bYg8Rz17Wa+7lNNpcnRa0Dkvc
 8Rw3sp67vfmHnLo0TSsnfTm/V2yaCjugclRcWzKWBQsnWgfI9qkCfDn+fjvK93AjyVnQ
 8R7VuDR5Xn5fN1uzsxmLV40tZ7aKy45s8BuKKap4KIgLay72ej79MhqSaklJVLXHKKDR
 JM/3Ic+BQo46WwiHZVJOUQTzXgZTdGwW+L3EzkQOWcRwHhWQs9lNn9DPksJkdTLA+4uG
 f1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740061058; x=1740665858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTj2n+cO1ksr4sIMfZ6fZHsbGN0ZLnv+4jljDLUN3e4=;
 b=IO4/K52oo2KcXv2+qygJ99JdrRe3njtZjkvTx7gF2DSaephmmgH+IbVNUsjKH817fK
 NAQlMc1nhMw2QrZWLzk+kfKNtnssK1WOpwVMTpECle564dOsbUlscgn29bOaXMVfyngx
 bWZgeQ2v8P7GkcL3RLJg9Fx4QfIojF1oyJXLfKADh8ul43373TIzDTVs6boEQarv74wM
 MrT7nLei2soMrM6ZOOOBzq2a7rNak55k/mjuf16zkz8q36d7s3dJQb6wx9JloTIV21yd
 BHpKj0WZXxyNzfB5QLmWTGH9mFVK20nC67nWz8vsJ3MMkaPidrLYVxUFEMik2904GnKb
 QGow==
X-Gm-Message-State: AOJu0YxD0NaRmw0UdoQb6+WxFlqKnL6XHAEIRTTpq8mBU4vrvN5cprNf
 u8zlpIwSVDc17mhiyo4Ia9ObdJa63sJJAfBwjo6SrBdFCUoVJFlzbZq+lGG8y74=
X-Gm-Gg: ASbGncvVP8q4B+cBbO2RVSjGHRkUhI0+7tdKuypm3HR3HZ5MAMT5b7HvKWZ+2sI0zQo
 Q0z+Lln8Prsogbm6udMMf2Yrda+FGFWlEzzuQOSQt6yNOS0S3OF8J7lxdw4qPNZzl7XuRNJyagl
 yr3TAbprNAenFoo/frpju+eI8C1NurRdB3s0bnpKuP5PWeoDwWpvyL5CfCsRemmxBVQdlw9YXbp
 6xqTUwcVeBt1/eG9owz8a3A9mht/cZZXeQK76mkVZ0ZdUpM34PtauDMQac1ntbhujIyb26/+viC
 Z1M8I63jrq2m83VcYQ==
X-Google-Smtp-Source: AGHT+IE6o+/cJ+UwhOVC1D5d0dAkIysZD3muXSO+pyu0qJjSa/4TuvtmEKXevVhYTGpBTz+vXwH+Nw==
X-Received: by 2002:a17:907:9491:b0:abb:eec3:3946 with SMTP id
 a640c23a62f3a-abbf3d06509mr205955766b.46.1740061057935; 
 Thu, 20 Feb 2025 06:17:37 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbe441236fsm239556966b.176.2025.02.20.06.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 06:17:37 -0800 (PST)
Date: Thu, 20 Feb 2025 15:17:36 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org, 
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>
Subject: Re: [PATCH] MAINTAINERS: Add entry for DMEM cgroup controller
Message-ID: <wrqz2mls4vfx7e5hdegl5rxtgz3hrw3enaalpxusarkqyqsxam@sebklnnnma2q>
References: <20250220140757.16823-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="auj7lverra4dsowb"
Content-Disposition: inline
In-Reply-To: <20250220140757.16823-1-dev@lankhorst.se>
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


--auj7lverra4dsowb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: Add entry for DMEM cgroup controller
MIME-Version: 1.0

On Thu, Feb 20, 2025 at 03:07:57PM +0100, Maarten Lankhorst <dev@lankhorst.=
se> wrote:
> The cgroups controller is currently maintained through the
> drm-misc tree, so lets add add Maxime Ripard, Natalie Vock
> and me as specific maintainers for dmem.
>=20
> We keep the cgroup mailing list CC'd on all cgroup specific patches.
>=20
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>  .mailmap    |  1 +
>  MAINTAINERS | 11 +++++++++++
>  2 files changed, 12 insertions(+)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--auj7lverra4dsowb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ7c5fQAKCRAt3Wney77B
SThJAQD0zjicigO8wYeq3uRQv5OjE5jzfwLH0yChQm9R7aGzZAEA9/vW6lQuYqpN
ppmEIS1pKu6XgwxVsiQNVnYDiagKlQc=
=6Bo9
-----END PGP SIGNATURE-----

--auj7lverra4dsowb--
