Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA84E709F21
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D669110E095;
	Fri, 19 May 2023 18:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9668E10E095
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:34:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8385D61861;
 Fri, 19 May 2023 18:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FF6C433D2;
 Fri, 19 May 2023 18:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684521276;
 bh=eeko69CoO8ZrCLhtBQPdoKb6TrEQeWu0O7r9Z4y9WyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JlJEz5/fnfTeVT2F9T0JGJYwTG5ZOKk0uPVzkWYsehaV7usdCNAIu2Z2/r8v8s+rH
 u8HYQSvGExfEQDNk26ID9aVGrlaAEU+ax0gjbdULERwkzpYY/wHz1XhhM73074LkRb
 PGQGQGL+QXufYkxcwom4NzC4/OQwDL/kJOnVUpxF0fEtwneheu4roB5C++12c44qH2
 Z2VVcTnO2ni7jAtcXuWBWBnZmzbsONKr9ikIFEBbBBE9LWrK2v9Nqpsh1OnclfukSM
 pZwD3NCNzvarD3kereEo8SlKMybREFlwaFMkz8oLho7oYT3ot5sNTva9jwZfuXUhKQ
 u4b1Onax2BMdQ==
Date: Fri, 19 May 2023 19:34:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0
 LCD panel controller
Message-ID: <20230519-catatonic-swimmer-80b086ae0586@spud>
References: <20230519170354.29610-1-aweber.kernel@gmail.com>
 <20230519170354.29610-2-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZbsHYCLMrj/q3z3Z"
Content-Disposition: inline
In-Reply-To: <20230519170354.29610-2-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ZbsHYCLMrj/q3z3Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 07:03:52PM +0200, Artur Weber wrote:
> Add bindings for the S6D7AA0 LCD panel controller, including the
> S6D7AA0-LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family
> of tablets, and the S6D7AA0-LSL080AL03 and S6D7AA0-LTL101AT01 panels
> used in the Samsung Galaxy Tab A 8.0 and 9.7 2015.
>=20
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changed in v2:
>  - Updated commit message
>  - Added reg to required properties
>  - Reordered required properties
> Changed in v3:
>  - Fixed patch that didn't apply
> Changed in v4:
>  - Added LSL080AL03, LTL101AT01 compatibles
>  - Added description to reset-gpios
>  - Added vmipi-supply, renamed enable-supply to power-supply
> Changed in v5:
>  - Changed compatibles to avoid concatenating multiple model numbers
>  - Removed '|' from multiline descriptions
>  - Fixed license

Looks like you've resolved the things Krzysztof and Rob took issue with.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ZbsHYCLMrj/q3z3Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGfBNwAKCRB4tDGHoIJi
0u0GAP9naF1Vwzu/CY4ARw7Njk+TP9o/o4hxhuUWXHEbiUuBlwEAoblSB3j14JWx
NEOpn/W7lrzZa4Ggt66sk+s2FdulmwY=
=/BPW
-----END PGP SIGNATURE-----

--ZbsHYCLMrj/q3z3Z--
