Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F8A4775C3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECF310E224;
	Thu, 16 Dec 2021 15:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FC510E224
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:22:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j18so1540731wrd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N9lKomucSEtgpalX3CqQQafa6o2fb76nBfcohaSv2i0=;
 b=RiN3+7h2+dS25INC7Gf8BPfoVCcvRFVUUth9najkqFWtZJ2s8mxTX2aUm8atU5pMez
 AbW7FHEhmPgLXQk9znLFEESxZDcVJ6XC6FDF6ra5By+L3VlxNN5HWrzvj/7oINATJVH5
 T4PF2Kiot4lISiQvsUdMBPAFGp5adygEESAiVXmYM7unQqdBh3ueVghRDHqLHcii0VCs
 g82F3adcpyxbequgS/D+baMYsQLAEbFQNUgtDLxFLem+DkU+Qm7TFR2mg/Z0yCrrrRMN
 FK7l0JsP8J9Hurf3AnTxjix62NgHc0tKl5/97nXE0yTxhvy+LGCJrG8EUUtusW5b3LhD
 OwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N9lKomucSEtgpalX3CqQQafa6o2fb76nBfcohaSv2i0=;
 b=W9r8AWXKBhrRXArWrpRiB3wfSCeEuOh9dsTqRjiAo7uqEDVXHMvjDOsZz23ZDTauRT
 660c/ICfRe+QEFXvErfSWssoGPV9U3JhQ0gz+9frzQT3IwpyL4H1KXjjaZjpolLzdw5b
 ZBBzep1Fne8fahtbfS6bc7tbQwl0hZ8HubQeoFm43XlxVUDwo0R/fToJCYVEXOk18m3X
 HqkWBnf1P6zD6fuI8mftItrdOgOQND5VKc4Lo61MPhIoUj2J867PGMjffqb8knpG4jxP
 AVMIL7LI7eyHQtOmstac/y501LTVHzmTAac72b482Uq/DKL0j9jLWgLDd4cFYqk5Wi4b
 ekcQ==
X-Gm-Message-State: AOAM532ffTf6IKBjRnmBaGmy5+Bhb7jQRr3PclJahpyvL1zkL1mQXRLc
 dH6pDCl3To8p3Otma0qK60Y=
X-Google-Smtp-Source: ABdhPJxx/CpIEkfJ7mExMh2hQOZZomkvt7McXghXR6da0L3qO+ST232+y0rAS8ozWZflFbx29kYq1Q==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr8352497wrn.93.1639668145306;
 Thu, 16 Dec 2021 07:22:25 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id w15sm4921670wrk.77.2021.12.16.07.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:22:24 -0800 (PST)
Date: Thu, 16 Dec 2021 16:22:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 10/22] ASoC: tegra20: spdif: Reset hardware
Message-ID: <YbtZrOtns+Fk5tEF@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kmzUbGK/nRGQn6lv"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-11-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kmzUbGK/nRGQn6lv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:13PM +0300, Dmitry Osipenko wrote:
> Reset S/PDIF controller on runtime PM suspend/resume to ensure that we
> always have a consistent hardware state.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 32 ++++++++++++++++++++++++++++++++
>  sound/soc/tegra/tegra20_spdif.h |  1 +
>  2 files changed, 33 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--kmzUbGK/nRGQn6lv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WawACgkQ3SOs138+
s6Ef7hAAvN95siU/ogWUCn3U5jvV2xqxZXBwjimV0crLNHF0/o0HMkgZpuSC5RtK
G6Xk2Od6WsmYkIi6fr+YcyQ8dywvI29z7eRg/nbyEduda5lFZKVXCMSTUt1wZmac
8AKSgtpmXhNRECD2+rmES3sc//gh5mY4PrV/DNY67jFvo7IzDuSUeWoq9SU6bjOS
VMFyC/LD6ClzTWHxntB9LctBRk8E9L/tGF/j7vyHTa2CS2Fh/o0dD7Y8W6pnNgmN
0af4NDx5gox9CTwmCd7x61kU3Fw22v2AujNAGbQ53pjasgtlaH9Eur0zE17Bnp7r
f0l3Zp0CtVvMb+WPygM+IR1+ZmxGqL2ohc3SoZqswnNQDNljlfqoiMSzx2yEGrKe
1ZLDxDZLSzTHKCnaJEFhDUzlscGqMBMVOibheflHwWfxJk82nkzEs+ac4FA5Xmh8
a1VEfTQ0kyfJgCiDxAt3H90mGAgofnuyfcXgP9s2bm1NdYjXBE4gyZ4NzCT878kJ
ogE9/DrcbPI+K3sq/OjLEZrZAjwLOAf1OHcmF4QsFjJac7CNuJKLoTgDsN/yB1jG
OLzAqPpIVFzh4uf+k4liyoFAlDSrLpR3iAF9p6uWuCdvD+hQEgzuty128FS2AwA9
wnjLdUHoMcsbMAYI156l91YpYswWloVZHZQYbvRbhoKfsojNzs4=
=NQYq
-----END PGP SIGNATURE-----

--kmzUbGK/nRGQn6lv--
