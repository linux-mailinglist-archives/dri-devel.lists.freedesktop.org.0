Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEED68EB64
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C85410E720;
	Wed,  8 Feb 2023 09:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F6510E720;
 Wed,  8 Feb 2023 09:30:32 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id sa10so19266122ejc.9;
 Wed, 08 Feb 2023 01:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UF4aqmKwcWXSxe3wCzrxaVkrpexZAyZ7zVeyvjkueiY=;
 b=Y8TkAEIy9dNTrBjOnxMuwI5VWqs8hZMfnLd/rxAArmC5WKOFwq93dkOIm6kLiU22op
 I8s/PWY1aJzsuzr25rhPTf198AWJ1opEXlsaDcRQ31JO+TM+x97Vey1XISTI+m9i5hu4
 P2QVnrjutbIFSi8Bj1cwMg5+VcIeFLs90iw4g0erU3fSjS07vKjdDU+ENgVXO6fiRhJ8
 AMiE9XasqcoMC4Rl+yn2nCgVQ/X8wBiJ+kl0gQevTiGTcqUiAHX1jKhVzH9RBtbsJtC3
 bmRQYuTb/Z+MnbdDQjoXqVwdD/w7BMUohvU08a9vj0RTZuA5Ep80FGiBY8Tzk6nltRI+
 OEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UF4aqmKwcWXSxe3wCzrxaVkrpexZAyZ7zVeyvjkueiY=;
 b=W8OTpu+tcETjlIK/gV5C0ApAct9HT7Gx5AAkAkkyQrqIxVTMh7st+faCgu7qJIXP3k
 xwaEaIZwG0Kk8bcmjpq1rjApP2zZDnizAiIfNIw+GGvJQWbhCrW2KHiPC0PsNn7NCvXF
 UVaDc3z0lF8ZtLJdtF8NCUy0bbkMIQk+SESM3W+e3opDUMCO2jN7OmUcBhb5o3Sl6js8
 YAJhid5Ds3Ec5aIdzXvpyq0H9CdUX+HgBSRlPx9ZySn6Zc5slEeVWDRofw+91UffgUlh
 CyU/0Q8/RzLXsr5kw/n5ewajC+v7T+adUkU3FO+CeRGIw6XOf/Dxi0ZclOshZAsa2IHR
 f6hw==
X-Gm-Message-State: AO0yUKXdKMy/ffq1NBpkcWhncaPUaVsyDmyr6xMWTOWQhkEdLnxm0eYZ
 ADUApitVATs6Q/O0ZaTc/RQ=
X-Google-Smtp-Source: AK7set8sWoeIZXPIsJC+D6HasbSZSXHfDBgqJe+bXW2hPiedayfB/N2Ywa5jUbehGgrjm69okXJAAA==
X-Received: by 2002:a17:907:7e95:b0:8aa:af33:72d6 with SMTP id
 qb21-20020a1709077e9500b008aaaf3372d6mr5029979ejc.45.1675848630650; 
 Wed, 08 Feb 2023 01:30:30 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 l2-20020a170906a40200b0084d35ffbc20sm8064141ejz.68.2023.02.08.01.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 01:30:30 -0800 (PST)
Date: Wed, 8 Feb 2023 11:30:26 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230208113026.595a6593@eldfell>
In-Reply-To: <Y91Y98jyOimabC3O@intel.com>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
 <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
 <0fc18aec-0703-55f4-f635-d09d345e8dc0@amd.com>
 <Y90l+DY0rSaMvN1U@intel.com>
 <758e5cf6-53e0-567c-c760-5b773bc7a11c@amd.com>
 <Y90vrEa3/1RbaGOV@intel.com>
 <f9633729-2db0-3bf1-311d-f03bd04d47a6@amd.com>
 <Y91Y98jyOimabC3O@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_wzDSRWXu4DStDFSQOOi4OL";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_wzDSRWXu4DStDFSQOOi4OL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Feb 2023 20:56:55 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> Anyways, sounds like what you're basically proposing is
> getting rid of this property and starting from scratch.

I would be happy with that (throwing "Colorspace" out and defining
something new). Then we can start with enum values we care and know
about.


Thanks,
pq

--Sig_/_wzDSRWXu4DStDFSQOOi4OL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPja7IACgkQI1/ltBGq
qqcuExAArLw8c+O74J6GUx2Z+cuOlQAYHb2G6Ayil8kftremroz89Gi9wxe2Hh5Y
VDgHzs5Tx6LiThMMf45gqll34o+ymRjH0Ki3k0u7cEGDhhQbgJRjtqq4uSYJDeeo
gjKCutCYmsM/yRz+5A3H1RbswB+PCkRHBFUBe551QUfc5xnyxBI0D3lHZl8m7Buh
h1+Iob7+QpwIY0ztlhg5mzHg8RxE5zH7zSnhicZ4pn1Pgx9kN9knc5tZ/3x08A0w
SJpksgmVj5eBoAoasTLjDmQfyEO2AJXhFrpe7zdYo+xpMiT9G6HHrbdl0J5Ec5W4
eQiRq6Q+DHeZl6rjAKsiW5C5AsvRwPD3ab5RaLzx6H2Ikz35SnWB+IGpUc8ljQ9l
BOJwnoZHjpMxPMSyEXY0h/7p/EFT5Fi58TPz5rEgJccUOywGUkndZol4BlKHR8Jh
PGd7g6CIPOVcnC6oMLBovcbYbfoEU4um1LLt6NRZ8RxXBqrYowkfE3+vrBrn239d
M71RMkbUyGFTpap8kaxJFuxXrp6XBOiIz+8m5Y2eXADrsFZjTU4qqAVGEylYuBtE
KnYfx0YO07xr7N7AA0FcREV32HAvjD/z6rXXdpC5qTCA/2mWdHzM9ZEKA8GyAOrQ
9NHK2mUEZJrpdY3ESpWPpVMmFVISrcy9Ly/3iGDcHDklljiKXt4=
=fCTA
-----END PGP SIGNATURE-----

--Sig_/_wzDSRWXu4DStDFSQOOi4OL--
