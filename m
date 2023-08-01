Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559876B3A6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F8510E3DC;
	Tue,  1 Aug 2023 11:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C106810E3DC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:45:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 412356154A;
 Tue,  1 Aug 2023 11:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFC4C433C8;
 Tue,  1 Aug 2023 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690890357;
 bh=bwYNSqKRC0R+674VMqvdQly3Gz4NVnq8bIwpgip/fMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WqmyPFmmeSmegi+a0SHRqS5oZwD76X7tmgjW+ljezELQ+8Wb26NIznCKG5haaLEAF
 keLzY9Dl8Y+2PRS4UlZ8ig2z8HcVeGXW/vRnTDqvxhcbdPkmGGF9yy4p9pzqPN7wS+
 FFXXOlRZtzQYDHcY+rsp0zBC3hN0unDTsBHEmpQee2vUeuUg7aVq68vZkK0bEws6RD
 Mz6rV7Sbxc9Jp9L/kGOLPldmyPAaPk4+2R6tiGhkyuhOxYSmC7FYox9b4nAEKP+5e/
 oDa0SURRY28NGjaPdq7IsswE5tgKPdMuv/aHJdiypo99SdjAWWGEC/EzBu1rz+eck0
 GdGIMGvXRAUuQ==
Date: Tue, 1 Aug 2023 13:45:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [PATCH v1 v1 4/7] drm/fourcc: Add drm/vs tiled modifiers
Message-ID: <clxexkf4wjx5sxlxz3znbxehgxob2vw56v4pn63vuu6kfffyxo@bek3dvzsz5id>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-5-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yslrfwhuh7l3ursl"
Content-Disposition: inline
In-Reply-To: <20230801101030.2040-5-keith.zhao@starfivetech.com>
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jagan Teki <jagan@edgeble.ai>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yslrfwhuh7l3ursl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 06:10:27PM +0800, Keith Zhao wrote:
> These are mainly used internally in vs-drm,
> I'm not sure if the new modifiers can be used with the existing ones.
> If there is a problem, I will improve it further.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8db7fd3f7..0b884cf50 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -419,6 +419,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VS      0x0b

Please don't use any acronym there.

Maxime

--yslrfwhuh7l3ursl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMjwcgAKCRDj7w1vZxhR
xXHaAP9IH1zIQb62ZyQMhxixSEF8riImLMdkmCdKEGrFpkEFWQD+PXDOQ/6x3wG1
4wF4AjgAQYTN8OUvFxlHHLqmlcYYDA8=
=rlbJ
-----END PGP SIGNATURE-----

--yslrfwhuh7l3ursl--
