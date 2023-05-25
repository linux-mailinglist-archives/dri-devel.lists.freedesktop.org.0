Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A534710DF0
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 16:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4609010E165;
	Thu, 25 May 2023 14:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E01D10E163;
 Thu, 25 May 2023 14:04:52 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ae557aaf1dso13836385ad.2; 
 Thu, 25 May 2023 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685023491; x=1687615491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5OTtpvBZsd1mzIar/P+7WCe42Wjpq9sEz4353rghUnk=;
 b=og/EY73MWp6vFDXAgLGjJXne44Xe6KFU24j/h8OLEkZLZCSbUOdt8EH80nqlW0xV7j
 hlYoGllMwTl94Cf3flS2MresG0DFpfkvSNkQPBMEd+JSA9i7kAm6awYrjsR3qh6sD0Py
 XGMNDdWP3A+NE1nb7PGHts1FyTGheVSIvNdk/RqqTJ8dr84fRlAxEHHGvHS4bpwFIXJI
 pkVkNaUBPUSh0AyBF8GyBDOSqRvXwg4i7jpX5Y2fcCxLz/1NN9QpOnRhboivUCW9y4T0
 7H6X/v08qFmcVE0sa4pkd/QOFuMNgP26MOp+clFonTTKjv5y3E5C51w/GbdWtmgDlRwi
 lkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685023491; x=1687615491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OTtpvBZsd1mzIar/P+7WCe42Wjpq9sEz4353rghUnk=;
 b=lrRaVZvFQ4Nfo/OzwHSUNqXFqGXJ31A64dQn38ZC4fG8PQnZM0uiCfshKYI9UxZOCR
 o9keTMlXhw8gsrWyV9aJ4Gi+VIWWwF7DDXDNB0LMGuVgoU6syf09sga6YlXQYg690dZf
 /JWmB86OpLFM72hvhVGi1nFxD9TE3bKEpp9d0+3t5bs9zYypxVyM9+8ytumyk1lFIZlm
 RTSOfZeYI5n9xI3Nf1gmu3jtuvfMqA6MCzZXGE/pCeGPytHEXhFF3YNTY/l5DZcU4KKC
 nb1Jf7PGNmCTQnsMM5yorpil9SzabmjAqHVGi/zzO5v4fKwHSVtcofPfEWtXpFTXv/7H
 Cxsw==
X-Gm-Message-State: AC+VfDwbgb+qU5afNdjFRebJ5hPfK/DvZoFUrHhg8F2p58bgnz6yvqPf
 yuY2Vn0CKp+l19xhFEfq8zw=
X-Google-Smtp-Source: ACHHUZ5ph8WUg3toWhCGyBDAVOLPd9jm+Mr4SBQCkwQjrwZcjsUKsQv6aQKJWln09yU5hmCxQ4Q5WQ==
X-Received: by 2002:a17:902:bc8a:b0:1ad:1c29:80ef with SMTP id
 bb10-20020a170902bc8a00b001ad1c2980efmr1575077plb.18.1685023491295; 
 Thu, 25 May 2023 07:04:51 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-28.three.co.id. [180.214.233.28])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e80400b001a682a195basm1475018plg.28.2023.05.25.07.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 07:04:50 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id F066D1068F8; Thu, 25 May 2023 21:04:45 +0700 (WIB)
Date: Thu, 25 May 2023 21:04:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Nouveau/NVIDIA <nouveau@lists.freedesktop.org>,
 Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: absent both plymouth, and video= on linu lines, vtty[1-6]
 framebuffers produce vast raster right and bottom borders on the larger
 resolution of two displays
Message-ID: <ZG9q_bb1rDj79mgv@debian.me>
References: <e8f93560-a2f6-8e9f-031a-88d333482a31@gmail.com>
 <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
 <b34c7037-7f4b-e4bb-dac8-48bbbade327c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tX6NsCAgxtfTaPFl"
Content-Disposition: inline
In-Reply-To: <b34c7037-7f4b-e4bb-dac8-48bbbade327c@gmail.com>
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
Cc: Antonino Daplas <adaplas@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Helge Deller <deller@gmx.de>, Felix Miata <mrmazda@earthlink.net>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tX6NsCAgxtfTaPFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 06:37:05PM +0700, Bagas Sanjaya wrote:
> Oops, again, I messed up the regzbot entry (reporter field still assigned
> to me). Inconclusiving...
>=20
> #regzbot inconclusive: Wrong reporter assigned (from: doesn't take effect)
>=20
> Please ignore this thread as I will send a new one with proper regzbot
> commands.

No need to resend this report as Thorsten noted that DRM subsystem already
have gitlab tracker [1].

Sorry for inconvenience.

[1]: https://lore.kernel.org/regressions/d4879ff1-b9ac-0373-ceb2-beaa645fba=
23@leemhuis.info/

--=20
An old man doll... just what I always wanted! - Clara

--tX6NsCAgxtfTaPFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG9q+QAKCRD2uYlJVVFO
o2BVAQDxdf+VgNKjUWWNEhoNwmXh+P+87BVSt4rVppMOM1QEUQD/ZeG6yqM0deuL
YNpG/cKVM4KHln3Qnh18gmVJbXFlIgg=
=O6hc
-----END PGP SIGNATURE-----

--tX6NsCAgxtfTaPFl--
