Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921702F809E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 17:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA4989812;
	Fri, 15 Jan 2021 16:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAF589812
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 16:23:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id h17so7715347wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b1o12dNG44Js/P1pUm9lZNb9c/tZm0IvKlzwFKSJOe4=;
 b=u6Rz3/y6TejtY7ekD7TKOvD32frkhlVQ3X+PCLdMmVT6F9BRLCVc+bA+Vk1Vh3zgLP
 xkvPFk+w60b+dFoGP+B4I/bU0xq4ZYtP2Ply4FsO4k29OD5JyQlXSF2YMrfnjwE2WZ1b
 3THTd2EiQU4B3Rb2IQV7glQMGZOIXVDbGwY9bPF2TxBqm917Q+EnmqNP+V0MrVsFcGpZ
 gu9e96TKFx0rMXez9ReUmI08ABBoXJiaymFC1fg8PmwV3kKhbzdCm/ibolcurWQTJd/V
 1nrH0u70hiyqHnxINP+duj8ThcabSh3drJrIA0VaifNftd3ZwUI1nxD2OpqOc9+B3xaV
 gUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b1o12dNG44Js/P1pUm9lZNb9c/tZm0IvKlzwFKSJOe4=;
 b=qqq/QrVc1NRcTFlpdNQYGMPSv0Mdg+ltV2TgFI+rywQgsd2RFZ5mJNA/wOM4mhZtWj
 vvkMoz3TATDL77QVooNUSjeDKHM/t/WhSpmQGVNM2uc2tUtDiGmp8I0INJwgGzlTinCW
 E3yxm2PBHA1bQa+eb3NIGLlqY0FXaOtYgMFLA74kHVY7lgcrOxurnG/oa0BAHOeC74UJ
 rhbtjKNJPtEUpsJX6Da7AOFdzVYxoA4GQsO8/41lpCxd2OK4fjSLtHQmSKawcU0g691b
 Blfg5WXx9fh7oazDjf1m4SmoM0UWvQtlv7Hg4li6WAL4qLSgnmSq55luGMBqmJnDcpQs
 oeRg==
X-Gm-Message-State: AOAM533GC2sDIMgxEkrwjH+OZlwAxD6NqQHMbUpcjGdeSGjZdlFX0SWm
 pMlAbbDIf0OzSfu32X+GlHg=
X-Google-Smtp-Source: ABdhPJzuFsNid31NEDYUxiNY45bsQsrtZWzgTx7aYMNWv8incgqJqU9ca7xAWrPlDAPAJ5n8tyfiOg==
X-Received: by 2002:a05:600c:4e87:: with SMTP id
 f7mr9459591wmq.163.1610727788758; 
 Fri, 15 Jan 2021 08:23:08 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u13sm15516794wrw.11.2021.01.15.08.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:23:07 -0800 (PST)
Date: Fri, 15 Jan 2021 17:23:06 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Message-ID: <YAHBatsdlhhqir67@ulmo>
References: <1608015653-37527-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <1608015653-37527-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
Content-Type: multipart/mixed; boundary="===============2020276118=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2020276118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YaX/wmy9Np5Jy0xx"
Content-Disposition: inline


--YaX/wmy9Np5Jy0xx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 03:00:53PM +0800, Tian Tao wrote:
> Fixes coccicheck warning:
> drivers/gpu/drm/tegra/drm.c:350:1-3: WARNING: PTR_ERR_OR_ZERO can be used
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

This coccinelle patch was recently removed, so I won't pick this up.

Thierry

--YaX/wmy9Np5Jy0xx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwWoACgkQ3SOs138+
s6Hb2RAAh8kG7ZuKmcYpO1qU01x7b/rh7eLpfTuzlcGyjC69Ixt+mBl20L1bahkH
bdywhLzSmyfGS8dFuvaLJotWjMsjbK7G6Va6lIq6g3cvcyqS390Sh6KFoxFQb46w
rcySTs50KCLtF+8769UwnShMRweM9De6NA7oGJGUwJMROZLM0duECrQlVReNutI1
FtPsi4MuI5gCG8ERyuSwTSeVheDTRhmsBjWXRG0TKDv2RBwLYg77x/+G6yL0imVm
Nkaojq0bJ+D6ozeLCyN9G7GqYt+3USx/73wh0/1h4XRuNQjXR2AcIvDVLT0QtWwP
83zMY7Ge7HakgKr3U3bnReoexzg+DFk73C8BD0aCTPA6bWWcZJW8f/p0Cl1oBwBq
2J2CtItExkB7973OP+qdIiNRPV3V3XhVifFpBOWyeAdroQuutnfUstwlljmLJ9xy
xcW9GfKc0IoJdmFIXN+xRO3MYizi8yKu1+eLQ0Jsz5UERHO74grLmPwUCQG6wMjN
Dd+vpvbH9fRTZjBxeZnd/pLoMZ8Eqelil7i70Bqcy2KwCfe/jtRqUHWudadVfN5V
pC74zcf6p8onyzXS84Fd6lZ2A5t5gteEpkfERTqSDPgEfuEgFh0RrAXptnNuer/5
ExdIWhBeQy3nbdBwrXP0nGskdBz6UKYaRpVrErRP2Ow6cnXk0Jg=
=EKtM
-----END PGP SIGNATURE-----

--YaX/wmy9Np5Jy0xx--

--===============2020276118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2020276118==--
