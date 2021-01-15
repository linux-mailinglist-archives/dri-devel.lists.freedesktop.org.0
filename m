Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275F2F8063
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 17:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FCF6E0C1;
	Fri, 15 Jan 2021 16:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494866E0C1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 16:16:24 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m4so9819377wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g7JbEVsR6hed7rNs5IQiLomB3I1tp8PyB2urljaCSwE=;
 b=EsFnt9FjssJUKYVHi70fmTgHzWLbKC8a9WAzFKSxrf2NwiJGIkPhpi9cqWsMMHIB1N
 56YBnNK5YkLq02FYZvJ3naIV4nj7WkXefd7zBjzyJ6jSS/ewW7CumW7LMHddyYkwWFwm
 XHgUg2rdsLX7wWzh5HPJHQZ13FtzHuCeb1JRiE8G6bqEU2uZHonQvu8CfC6/5G5DKvU9
 rwRoTK8qFugcegCdeYpfZ/8cBNnrQeVkRNNt6AbFSTIzMYVScfb8u2yDh+0ntMe8uTxJ
 M0ebTDWVyMbjGwz/ovff8GQh+RHQGGsldgrbdgsOXMNTeEiV4aUSE/LSTns3/1DndBJj
 tmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g7JbEVsR6hed7rNs5IQiLomB3I1tp8PyB2urljaCSwE=;
 b=d3XiP7AasOoJvLHQ04aj4PltlYlIRiBmtJXJWAuONDPvRsQ+/9kpKs2cYCkYEE3N01
 ykWJEgO541xjftVED+2a6jFRvO+s5cWcI16TXeiRE0dr+VtbA9HTiAy9uWj6wFDHA9by
 NWWyS3DHDh0h+Ge1cc/aCvjGPm9w44cttsmZe8tmwQzVcb2r/WBzGuCHM7UvJO1i3Hx/
 Rd0wa5GRC+23GYwzyZFROZPSJ6HRdAh/tiLZ3Rw4Ht/j4C7DkwjNj093FuD+MxWrLjgF
 MXeB0hP4YGa8AbSwHJezAq6k0LljYIXFb3VQjEbCEZutfjxydJiOuq1Y60eL8MBw/Djz
 ofKA==
X-Gm-Message-State: AOAM531ka4pnpUcRO5dgFDosJLXAmoCCfg8GhHCfryEPHhZBVKLwViMP
 jLetnilKe+o7oa+srzzb1Jo=
X-Google-Smtp-Source: ABdhPJz9jeKybwSSqsE8URg/01ZwtZjzdv2knp6hjtYRPUNR7Rp/VuENkn+AnJYqxLoh1SkihlMmSA==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr14192059wrl.110.1610727382984; 
 Fri, 15 Jan 2021 08:16:22 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p8sm16034262wru.50.2021.01.15.08.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:16:21 -0800 (PST)
Date: Fri, 15 Jan 2021 17:16:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH 1/2] drm/tegra: falcon: Support newer VIC firmware
Message-ID: <YAG/1MTY8BdO+Msr@ulmo>
References: <20210112113707.3837876-1-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210112113707.3837876-1-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com
Content-Type: multipart/mixed; boundary="===============1392014589=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1392014589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J0xAiNj7E4FsUDNa"
Content-Disposition: inline


--J0xAiNj7E4FsUDNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 01:37:06PM +0200, Mikko Perttunen wrote:
> Support newer VIC firmware by accepting the new magic number 0x10fe,
> loading the full code segment instead of just the first page at boot
> time, and skipping FCE setup if the firmware header indicates that
> FCE is handled internally by the firmware.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/falcon.c |  9 +++++----
>  drivers/gpu/drm/tegra/vic.c    | 21 +++++++++++++--------
>  2 files changed, 18 insertions(+), 12 deletions(-)

Both patches applied, thanks.

Thierry

--J0xAiNj7E4FsUDNa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABv9IACgkQ3SOs138+
s6HRaA//flUNiwu+BTIMkgejTbqnIfXuvdwappq+ITMYLcl/WxAgr1j50JRyB+o1
oQIGSQIR4inK11HkoFI0F0hpYLVvVFkBdhUMedC4di44lSGYchMPlukwiYn5/eKG
VgI1IXKjaPbSzj0ckVETO+KROhU9O/P5lxbLWaipfjzoJ6uK7cu3dVqXGWYvJeA8
WoDBstZDAKGmp/OlNV5s/xnuwCsUjjNDW8njBiSt44saCQNzeUalZyfrdRnjLAy2
Oet87FmOCDr/+F9Q0AruFiIBHPU4Glhgy6ZaFo9SndO3G9Sr6q4tKjmEefGvMBjO
3VfNiNLe99Og4PeMG0hI33rdVlvVl7b5Npcvm3z966W7U4/ESVVmTvpromg/rFG0
QTDktpzlWJey+v3SdtbdnFSGdY2OliK84w1xGmHfPDip0u09ZV6kenKXAkjht1s+
46RHmTh3b3tme8wzcMfHXkgj0lUXxg+dzYIYgCv6iDHMQ9RUyzKTFxktAnw5lW6q
wnkADbcNZ14M81e9MCAbKH8veAQ23ilCUpEavzHu06C0fALpNOuiTrOxogOFTqCZ
nrXGMlL2GdH2Rb8icgDOywDmam+u9yoYBcRmhQv6PuPj3xwalXnYV8DIYH4kJwRv
hI2/CdZu+FW+8UzjRLP656ajTv1Mi11y3Jp+wPrCQsiVtahBMdA=
=6QL4
-----END PGP SIGNATURE-----

--J0xAiNj7E4FsUDNa--

--===============1392014589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1392014589==--
