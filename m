Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA4B4245B4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 20:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C566EDDF;
	Wed,  6 Oct 2021 18:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A046EDDF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 18:08:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e12so11397838wra.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 11:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DTgcaODMLq0FDZOTCg8W/z1Fr7XxKSIUscX7w76buGQ=;
 b=RsC8UScmhM19mw1WinyAleFhYLrVR7Gk3GliZHEQSHzxNPJkPFd61OGqk6FXJ44ozz
 qT0/VMvwcqKN8FnasbeAPYQqyMV/rsrfFBMkidUDnqKPnzXI3FWxx3QJwbsFq+k2Y1j0
 drtqGfyEjt1LJDtlcEBUSlSl4GbLePnASMLtINKAIyOeKKUGr3aKEKwUEUtFQDPrwV0r
 NCUwmA+XKXNw4p+AnzHGp0buNiwV681fvQvpzXj9JHCtGUt4zS/OH1S05115IxU6Bzng
 j8JkC6ojWs9MU1OlYebr6sVkSCo4jNTH45P0vAIw5Xmi5B5/9/BGn8siYp2QrVSAC2Qj
 rHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DTgcaODMLq0FDZOTCg8W/z1Fr7XxKSIUscX7w76buGQ=;
 b=Yz56SXBuz14igUG8q6qv+QeSt/rxxb4s9nGaF+i1jb80YpNesVvTdLLPONwiVugCAI
 yB6fw17LKJnPVpdjhVrGA2M0+dvih4z1hw6hEn66vHZo+V26eVOUuoVPwF6UOPL1NKDn
 WZwNs5ZptnZQFPCGUwY47SV+s+HhysM/1ziUl/lbveUc+s17VZuUNyeDi0fz53k/t8zq
 cdK272sbl+qCvACIDfa8Fn6y8PXWDbdXtZKiJI9RdhVblC9gcJNuNYHcsWlSDV5URPVi
 rAQrNNndmNVY3jWelAeBvPMOh1OZ8srnBSIqZ87O4lvHfnvoMsiQT9+nJK/j+PteII9s
 QuwQ==
X-Gm-Message-State: AOAM530p3XzbcKAUKIxmkMLASw4QTCkiFrY48yrN6hE4eTHQJc+PL33w
 +rI7dJA+9fTR6BNFVZfBxiQ=
X-Google-Smtp-Source: ABdhPJy5jk7/29DVswHa34STgqGvvLSP8za9je7mjfhKchSht/aLzUE6uR0yrsmglRMKhmyeLcjmTw==
X-Received: by 2002:a7b:c10e:: with SMTP id w14mr11736487wmi.98.1633543723399; 
 Wed, 06 Oct 2021 11:08:43 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d1sm25183923wrr.72.2021.10.06.11.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 11:08:42 -0700 (PDT)
Date: Wed, 6 Oct 2021 20:08:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Bump VIC/NVDEC clock rates to Fmax
Message-ID: <YV3mJ6hH6M08CTvG@orome.fritz.box>
References: <20210916150920.2136180-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="knCz4z4ruBPHn7pA"
Content-Disposition: inline
In-Reply-To: <20210916150920.2136180-1-mperttunen@nvidia.com>
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


--knCz4z4ruBPHn7pA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 06:09:20PM +0300, Mikko Perttunen wrote:
> To get full performance out of these engines, bump their clock rates
> to maximum. In the future we may want something smarter but this
> should be fine for now.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/nvdec.c | 6 ++++++
>  drivers/gpu/drm/tegra/vic.c   | 6 ++++++
>  2 files changed, 12 insertions(+)

Applied, thanks.

Thierry

--knCz4z4ruBPHn7pA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFd5icACgkQ3SOs138+
s6GztQ//ce6l8V7kt1dBAN03Tk2ITlc434/6Q8kmc1mbfTIcNFhFh2Xd5LqzdPVw
x8xuxiSmUGfwnSBmIt7527SoiQX6xJZnb5MDJNjTotHQEV7iXlV46eGPEC34WmdG
PrnbPdrGOYxIKvVRomsAY4V/BOUTjwUxX8VyCeXGRm6pgtFL/Cm+VQ+T7BVtZ13Z
JhsUA3nUIv8MVCZvubFNTacSidRLhPUs/IlaSZFPK7QQIXrkQ+VGTXKDFBN+c/yf
oaHQNc9kPlCr8odOG5KbdL4jJfwOuOvRGkKfbXtMpp3fkygfxRE/nnwi+McHdEfG
YvQjZ2vOa2rRx1AcFfRMy9IK72CY9ZeRCUNNjlqoCYeGGUs2ScO1qxb8j8Iz33oK
2pZaA5Ewi0ygmmJBnZtV5xX2f48w7ijq2kzJeMUNn1QlLdgNR7XbgRcP1zM0Oda5
BZcetENg61O+QiMwb8jsX6lYGnOQlul6YsTVWsuiLVGpFt7356PXfF/VP54299oy
j1DPKdLFD3803EelRgmEQe67qjshGt3iB48vKBGv3xlEUb70V/csd70DzC3CUaUN
SF0tGS+GGchEF3t+t7+zQNSwh/sw5q6wZNVFKscBxDKotQDNoVqce+9hyMSZkjEu
NNhXWK+2OjODfEeU18IeBYga1Xmf1U2s3Pk3rGKK14bwh7MBPwM=
=12s0
-----END PGP SIGNATURE-----

--knCz4z4ruBPHn7pA--
