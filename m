Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75516AAE615
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D8910E85A;
	Wed,  7 May 2025 16:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K+1XMG4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABE210E856
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 16:10:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso272635e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746634200; x=1747239000; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6sdeDWT2RVHND3OpKFEExx6G89kQ5Uyxy9ilnbcLQog=;
 b=K+1XMG4P2MsQmuZphQRNR8Wa2LMZcU744HfB0AxCPZeNyKlvva4d1tRsU5eo+GTj+f
 Gf1pLbsSIIneKMr/7eMXPbleyeY+8MaihpnPkWvW0k97i7PgEzRXntB4snRo8XnEVL5L
 qPXEwndefkQ5xiMHmimnpaCjcn0pH53FSKFd7PHucfUvVw4T3qyyCTtWVMEt1zqIxDYj
 ZwSe/0QK0Do9dAssWiCc37A3Ebc5m0RerqBgRSyA/pSlQNDTewTjRZ5dJOR8vvuxQRW5
 QiNYPaw6A0027VyIzoqpBMuPMSwWNxDDPertwlDPMyTtzbpVNbptvZXtSduJ/IgrJCOd
 uZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746634200; x=1747239000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6sdeDWT2RVHND3OpKFEExx6G89kQ5Uyxy9ilnbcLQog=;
 b=szTZZwLzQbJgmqTZHIzJQpulwUs4JFLB04EM3UpW77OHImcxvU+n8ES2BVqo9T2D7I
 wX0rs+yV4M5REMTncmVtYZb58r1uSHA4KflvvKwC8u1YsKAoee0V1fgmbLMQWzDHCowb
 jWSprMUxOlxWMKYLSv5uZ2uFWfte9xlWc5X0rEpdSgRoAdagkfizz5Evx/9Pv+JnKzT1
 DqeRoflHEtCAzfMIp3D+w2+sMDK5HzrjoMVCzWcpQlEkH9J9IxjiOqy1PYXYuiUY6Fjc
 xn8gtwo888gbH+2S/MQJkk2GNDScbCH0ULH9EPnrfbFOFpz5OzYoMWAS/EY2qfG+UsX6
 isgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7avZDYl4VOWwLWKJENCR/4HU4WpqGb5ouFZ5HjU9O9n+p2FMiwD6M165R54YyOz7m+RnRPwlWvGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxmotvEPHhPQSKiMBjsd7CtbAxQvAk8lO5pIRyRBcoTd8PUL1V
 8PH8ndbw8CtFRnRQGdBrIVvlnGcwi5lXm7zQwiVP34i3sAbG2Zx/
X-Gm-Gg: ASbGncu2R4rh+ZPHpvoADVBYCVP1c/JaLJ+umzHzZunTsK08p/ePqkVMo87I12cVygI
 p0gtotbz1VlfYlH0BMka51OU6o1s0wUBuWCRv5u8DXtGVTWBSLxyv40UTGyqX+4mAqdXtI/Id7F
 oJ2TZNO+tqZZQAwPvhS5x0K3gLHkToEHv6VhA/72gHQwms0gX+b0TcgiIMQ4PGCU+EfpvJhW9v2
 4V+8n2ys9qnAMCXcg9qKHg8yd0gvfxPbe0R8U/AhiD3d3qqKy3jUBdBpU2BNZkQp4QtTyO8oL2X
 6AXgTYG/nxzXbfqpT2289Q+UM3DVTYIJxerYLl3T4oytV710ji+73Ba8UlvlD4MHz2dGEt+b68l
 68jp9fO40h+baFfbZGDJkQ+CnCTE=
X-Google-Smtp-Source: AGHT+IGZ5cxayYN+VPQ5QBXlqfoxa/LdThi6w4Oeu7e/BRzEyeGhaKe+FBK0iyFm9ZSGmHRw9qczWQ==
X-Received: by 2002:a05:600c:cc4:b0:43d:cc9:b09d with SMTP id
 5b1f17b1804b1-441d44dc029mr31091155e9.20.1746634199863; 
 Wed, 07 May 2025 09:09:59 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b5b0d349sm2543095f8f.30.2025.05.07.09.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 09:09:58 -0700 (PDT)
Date: Wed, 7 May 2025 18:09:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next v2] gpu: host1x: Use
 for_each_available_child_of_node_scoped()
Message-ID: <3tcwixvkxuk6yjubepzlh7kcyrvfhw6wqb4jzdbpowyfokrsmd@ltwfgluwzrqz>
References: <20240830073824.3539690-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cnrhbvhedw76ny6r"
Content-Disposition: inline
In-Reply-To: <20240830073824.3539690-1-ruanjinjie@huawei.com>
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


--cnrhbvhedw76ny6r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH -next v2] gpu: host1x: Use
 for_each_available_child_of_node_scoped()
MIME-Version: 1.0

On Fri, Aug 30, 2024 at 03:38:24PM +0800, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
>=20
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Split out from the patch set.
> ---
>  drivers/gpu/host1x/bus.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--cnrhbvhedw76ny6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbhdQACgkQ3SOs138+
s6FXiQ//eWNGJgEYk17XzTHp0ookSGIqVAJfm7AAHaBG9VwCAD1Cq3HJaDnAs52B
9A2rn0/Ws3WI2TIiZJtYMx5SCG9/ZMyCz6TZkECA2+08by0G+k5ve+62eW7JIMQ1
TCD+cvLN0ciJavV2+B379sxuB36FmzQuuJuRy3MaR2PzIjgER9OHtXFH5LDxTW74
I+TqzTOT7WDS8Fv35AcEdzfMOMHAzjdSWyD5n6ZU9OsM0xLsuqh8vFC7oygv6V44
awekczCFZMM5aDeIwYizdfG0n7hcSXkHb8u+0OhttQqJuvjnsRP/kyRTxld+B+lJ
iiWYbhlWi4Hi6v0CC41LoFOujrB99ayeFZFf3qs8e29z/wJm3OaCZQ6lsrEgb/hL
Z8JjjoA5T716hZ5O/C3bL3Mf2zSw6UTc+6iKaLn1NZJCFShrNAXetVkzYXpbG9xW
zx0wLjlp0vqT5y48/rAZ7WTsr+cq8u+6Pfx3+BXORyfr5fxYwlEdTgT6Z6tqQIVx
lx5qPwmrCkbbshL5zbkHtfAtgI3b3+YoNh2kEFwtNSwI4isc4pv1Nh/E+//nowmx
OEKfKUSbbMMf4mBzkw2n/iVNzuD5tgtVaVDI3Qh63BFf5QOd/kt/GpRR+lnKx7i+
aZrqzj8dJSWAFQRs+t5nFrXEJaPA2lLJP/rV6Kf1oU4B6PPwBPc=
=E2Ym
-----END PGP SIGNATURE-----

--cnrhbvhedw76ny6r--
