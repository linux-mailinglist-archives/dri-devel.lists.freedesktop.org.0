Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0722431E26
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 15:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208B66E053;
	Mon, 18 Oct 2021 13:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BF86E053
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 13:56:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m22so41776375wrb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CQAjLnOximuKx0DmQIAeiOi/1ZXjfKn8epi/lvIk+Ss=;
 b=K5RE5oGLDAAciVB5NngQtXHbhlTGPi89aes19DUwmRHdMAnubtOr/N9ewroaDcLGwJ
 qrhvz5jkbJ16LQlX5BNfY9dBY6K9Zz+/NkbAuUPcJSoSKr8IxyU2oSDDWmLhCTKar+53
 fzUb7UHFoBIX1uRmBu74SC1mddispQ7ZJk4blw90WCLh7DF1ltyzHaeORmNyJ72NvWZs
 pOJpWQ6nQyfIym6APt/S/u2V3CRqNWqWZFG70AM1jEVrz5pGQoULPT/VBGEmBqWDkxPc
 HNPc1yNWrY6TWZ29wUFdBhHRQqPzs7DezJfkJAMI9u3RiZb+uf8dl2RJTrcgZnycuvVy
 BQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CQAjLnOximuKx0DmQIAeiOi/1ZXjfKn8epi/lvIk+Ss=;
 b=Xf0fyezJoUiZ+EZs+b4wC4PbdRaVznW4VWX7RSEidYnYdnZU0XTHUTHMSPEWG8umCx
 ClpJgeQ4iPPuMdVvLlbem7lcKIZB/k0gFaOn3sZEmiWUBkJYWuz2n7LYpWj1Dd7c4eEH
 ce9BoETgn3e34MJFvHG9Aow7LVLZGmyE53v1wmifivPukmDPK3LcOxHAU9CFEnw2Fakt
 REFfr/ZnEmeX2UZhRrnpZzv4wFgRTEmdsah1ES1PQoScP0Z7CUR9HOfQ+woEBQqfl5AJ
 RljWyHpvuV97KXLoBiDhbzdA4er75eTXJ5SQzqdiI9SxCvAHu4x1RGchrS4B44O5CxNt
 fLxQ==
X-Gm-Message-State: AOAM531DX5oEjCPANZ8hHOEaQt0Z+5D6E5cJ1VkqD8dkgoeQfbhnz9iq
 UciCOHM60gV+2IO+X6SD3iA=
X-Google-Smtp-Source: ABdhPJyLUikatPx9OZjnogCBKUsuSLMUC/VnUCNtU7OWVGgkrh+ihrhMGLmZ9Y11RvP4AUEpO2g0WA==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr35594570wrs.80.1634565389010; 
 Mon, 18 Oct 2021 06:56:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id f15sm12504747wrt.38.2021.10.18.06.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 06:56:27 -0700 (PDT)
Date: Mon, 18 Oct 2021 15:56:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: mark nvdec_writel as inline
Message-ID: <YW19CoGje1xPjJtV@orome.fritz.box>
References: <20211013144109.2191071-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n9hwELlB4KqoDSQy"
Content-Disposition: inline
In-Reply-To: <20211013144109.2191071-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n9hwELlB4KqoDSQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 04:40:58PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Without CONFIG_IOMMU_API, the nvdec_writel() function is
> unused, causing a warning:
>=20
> drivers/gpu/drm/tegra/nvdec.c:48:13: error: 'nvdec_writel' defined but no=
t used [-Werror=3Dunused-function]
>    48 | static void nvdec_writel(struct nvdec *nvdec, u32 value, unsigned=
 int offset)
>       |             ^~~~~~~~~~~~
>=20
> As this is a trivial wrapper around an inline function, mark
> it as inline itself, which avoids the warning as well.
>=20
> Fixes: e76599df354d ("drm/tegra: Add NVDEC driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/tegra/nvdec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--n9hwELlB4KqoDSQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFtfQgACgkQ3SOs138+
s6Gxtw//ZYz6Ut60RhlZ8WZy7EAs9vKEl0kYn1NyVnKCTcfVa10K9Xmn0FEJbaKm
gXu1RSB0V+SKrA0IJdTEuMHI+yjDngiwNU+CcsXlnjQc+kbtO65ekeXytE1B+DQq
oA05PTjFChGcMNai4Zpq2s1nuWVByJHeXGDjIQAkdfccojm3GpkV97a9fJvyYUuM
WOtk2OKc+hsHkBmQsVD0L3BSBPtz/VaJKLje2+E/LeQxZo5bZPkmMkUHE/PpNEc8
GSSxiDJLnhs7kCuw64YXmQHfiupEsBXSA2iFW/vhGrlS0LPGbec5ZFZqN18C/JRz
bJQLX6jn4hPtmlS4cLVz3UIfsDfC0mWLTh+pOUn0HpOQbea+FNA2l3r16tjil8Wm
ehUgxd3AWWDkRFj/1jels5FBZgFf8zX3glqsF39BhHzcTiW/sS80aRP2oK8t8dF6
ayO+bdb4xFQFcME7dME6OHHgV9xQRioATkP4E8ErTfl7CfUM8pKZ91q+C1fRBSr1
5F9YUF/X80QElBMaQ6JQbaUmi//mfQ0gLU++5Vs33UXaRfF3QJY++X7LMZ4xIbgP
IwrYjjMK9zhPWBAin0PGAc/sF6puSqOk1poU7tKlZCJ4vY1phhLT+iZiI2/OrUxq
D3LaibgtcLJyRlGZdD5qgt+agSSjyK+b7KlseDLvisjUg48Ldo4=
=nP4o
-----END PGP SIGNATURE-----

--n9hwELlB4KqoDSQy--
