Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A5706F79
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 19:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5567C10E1D6;
	Wed, 17 May 2023 17:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228F410E1D6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 17:30:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41A6261964;
 Wed, 17 May 2023 17:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60644C433EF;
 Wed, 17 May 2023 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684344606;
 bh=IvTb+46oPYwMB9EGNhmugY6I0xjp6TxZeov/IeB0P8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E7Y/VqVfTJBCJa5GLyXgkRD+QqoZ66eahzP2VUe/emQ3Lb7gyz84ytXDPCrb6VBNa
 Eu2KUgIh8bBw58hZ3h3BhwvZXrKFTRbsqHJxraDSQQBkiPFOKaWfgP0RMOhX05xgsX
 tXXWg0LNs+gp/Fru6UyvvkqdB9UTie144m8wJtX8OLj+nAjzsQPXi8EnQKx/PAOzk3
 ct1OJlKAGJeqhR0vUhkRhsvFPmhwWX9jnfBwOIrQng8dhslRbZRj8LndQA39bGwOYI
 l85uzKx10jCNh6VaEbxG+6S/J34yzgZf2VvJ5Zkp/kcuV/tbnkwzt2nOts3J/DjPfu
 zZJr2CdsL7JPw==
Date: Wed, 17 May 2023 18:30:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: st,stm32-dsi: Remove
 unnecessary fields
Message-ID: <20230517-bless-sterile-e35305fa70e3@spud>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-3-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eoRL2ml0lZ9nxAWN"
Content-Disposition: inline
In-Reply-To: <20230517143542.284029-3-raphael.gallais-pou@foss.st.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, Rob Herring <robh+dt@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eoRL2ml0lZ9nxAWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 04:35:41PM +0200, Raphael Gallais-Pou wrote:
> "#address-cells" and "#size-cells" are two properties that are not
> mandatory. For instance, the DSI could refer to a bridge outside the scope
> of the node rather than include a 'panel@0' subnode. By doing so, address
> and size fields become then unnecessary, creating a warning at build time.
>=20
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--eoRL2ml0lZ9nxAWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGUPGAAKCRB4tDGHoIJi
0sYPAP0bagnXi45xl7G332sbgQz2hLgro/DfudjfE3m/BtEHgAD5AYkXh6KYQ2IP
x0e+PKodvtu48I3DV8dvY4c1iQa69QQ=
=wkP+
-----END PGP SIGNATURE-----

--eoRL2ml0lZ9nxAWN--
