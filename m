Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F02B4C30E8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 17:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95E610EBE9;
	Thu, 24 Feb 2022 16:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D936610EBE9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 16:03:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j22so327765wrb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 08:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bmWCDhCLgHqbLcu4zq+gTabVGdCJ3VfshRrjvuSuZn4=;
 b=KMuwV3IWYYZFHnKCAS355Tm8ua1AtfKhURR2/YUPZTo+ryVCi4PI7vUr69YeklRQdu
 LIEuJ04EGSbXSLOf2SwphJBFxw8AT6sgh2K5rHaZK2IM4aEFI1pw2LS8i9rbL2yyQmfz
 iW3FhemIg7vrEZXLL40Yw9GRP5XeizSyuYrn3p6cIdMr2Dh/j2DUyWoi+Rg4OQGuvvSt
 PAmnzHscrlFKkwZysu9X05s9Eq1gLQ8ciTVn4yh4RASw7E0J6pDiBHivbn9qUZGy8YKf
 IlhSZQDWJj6GxqXTg6bmj+na/osXderBrENcqMcQcXUhF6TwxK+OlTh+Y/PYhs5L7EYS
 FZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bmWCDhCLgHqbLcu4zq+gTabVGdCJ3VfshRrjvuSuZn4=;
 b=phK04lAuLKunmR1LAKllM1H/S1/CA8U5Ur2KW0otCl3ZW3NPsxgmV/RWDjkDMuxh0g
 vWwMDG6HXoIOmR6g++YQarfO5G2a2D59WCjOIfwVmL515gkIPHFI8KGgoVdBfSJocAQk
 WVjHaReT/knJo0XsNXNLrF32R+cwNUe7CWGyuYKb5hM+pgbk3PZgM93TsLurG37pE/4Y
 rH8nN5Ng6Oq6PPeRyoPS8F/yltubnLDKO9y5l4qI83hkchW8Qn5wQvrYYXSi1K60lUHl
 KMxqKNUAFfLdOYxtGMs45+Ie/s3c9tXwtu5p4Io1qCOQgqEL98G4dWsmaFErnOtb1Nkx
 YqxA==
X-Gm-Message-State: AOAM530H22vZwCqpd4SRyzm/9fm/RuEi0G6F2Bk6Hm6YC5lLCMG0sQkx
 EVWZTqPLnDhG3mGNu8gZJbs=
X-Google-Smtp-Source: ABdhPJwnla5iOEohAZplej8ESMAiPZbMgCeoEBe+9bYVAHyR/1OmHH3f7CJYBq5mbv3HzYyPuWkUrA==
X-Received: by 2002:adf:f991:0:b0:1ed:c156:b6e3 with SMTP id
 f17-20020adff991000000b001edc156b6e3mr2862623wrr.411.1645718612169; 
 Thu, 24 Feb 2022 08:03:32 -0800 (PST)
Received: from orome ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id k18sm2588699wrp.104.2022.02.24.08.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:03:31 -0800 (PST)
Date: Thu, 24 Feb 2022 17:03:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: Use dev_err_probe()
Message-ID: <YhesUVCU/2E0cwUa@orome>
References: <20220207212923.10386-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TBBSrxsIdYbcaitO"
Content-Disposition: inline
In-Reply-To: <20220207212923.10386-1-digetx@gmail.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--TBBSrxsIdYbcaitO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 12:29:23AM +0300, Dmitry Osipenko wrote:
> Replace dev_printk() with a generic dev_err_probe() helper which silences
> noisy error messages about deferred probe and makes easy to debug failing
> deferred probe by printing notification about the failure to KMSG in the
> end of kernel booting process and by adding failing device and the reason
> of deferred probe to devices_deferred of debugfs. This was proven to be
> useful in the case of eDP driver regression by immediately showing why
> display driver was failing when user asked for help, otherwise it would've
> been much more difficult to debug such problems on a third party device
> that doesn't have developer setup.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 13 +++----------
>  drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++-------------------------
>  2 files changed, 12 insertions(+), 35 deletions(-)

Applied, thanks.

Thierry

--TBBSrxsIdYbcaitO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIXrFAACgkQ3SOs138+
s6E1vg//fMlOjgAdGesdZVvKGdBBfBpeh/YzJ5aGWpYZmV64VrqSjp23f0Y0ZJqs
kszvGnLEuhk6pmBSndIxvirBFNDVEvaOrHcKhmnJpR8LrbDOPZn7VY27t2xPNj5T
ABmRLiAvpgFTQsOYQktn1iyC0CnRiNnE842z8487bYO9pEtH2/6LV16l4NeBhnBa
L4uxx09AJc+FVtXJ+fz6LZy3h8DVlVIchzPbUBUePdUj7xxYEnql1QnATgmHIdwY
dyG+viunJqBflWiVrH9nBIxQSWkql7pso7XL+RF/K2ApCzaocwE8C4PF0smFGfDC
AgZeAj7hm2xl1SBD10+8rnHNja1TpMr3wUgE2HzXVa9RzgqWcXoamOqB1AxWHNFQ
u5QoaNqA6MSuO4FE72ahXiX+6BwSnlGB+vyBmwg53lORBGJW2aLjUsuqljb8xumu
sKbpnRjO/g+/mjukZTRfRwV0puaDYJ6jzt21VbQN27du20oajoy26h3ImLVdQPMT
Q1krSFT0VFdtwwjeh9Q7ZXn+eeiCLD4VDh31FJpjbWhwETYhYUPPnz65XCo+6Yr7
XcqNUacH2bZzkXkTXlkvzhg9bKsB6Mfv62CCXp6NMPNqKH5pfancS9fFz1voC9Ys
SKjZ2F2sdGTQTe6TmmllxjKLPwz9XVQoo+E5NVWUaJsZbwat928=
=31Or
-----END PGP SIGNATURE-----

--TBBSrxsIdYbcaitO--
