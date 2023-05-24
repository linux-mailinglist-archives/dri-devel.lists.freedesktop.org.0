Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 063FF70FF1F
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 22:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065B810E60C;
	Wed, 24 May 2023 20:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363BB10E60C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 20:22:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE26C60B89;
 Wed, 24 May 2023 20:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4C9C433EF;
 Wed, 24 May 2023 20:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684959759;
 bh=s5ykL53eIy5CGwh+Iw+O4G1LCAdTOLiMVsk4kKJJvAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ic/gA1SoNxVphLi9Yr09q1NOWlRi4n7QtIlO8PiDMPO/5AjhF6tN41JSTraVU1rZ1
 EsrhMklEgX39a0oHewCQ10+hcL0SEAdgS8IbzVpihF5ydl2kBE8JBBtWHHuniBvlTj
 FzhJaENSXzTgkjYx4bCwnq8kJACAT1YwCIps5tGdyoP3z75f3+0/orOyLTDr9dlliX
 K+tXhcvgKpbBYK39Mfgm9Xq3R0b2qbHSW7bKfJ6YQar/5Rtp+mBokGvN/eQ67bCzsz
 Wrfc/rAdnq9ZO1clL5tM/tzth/oShl3jjHA3YfFdkdlp81/59hY37IpGAbjx+BTTfe
 wPLGlfRd7LJag==
Date: Wed, 24 May 2023 21:22:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [v2 0/4] Support Starry-himax83102-j02 and Starry-ili9882t TDDI
 MIPI-DSI panel
Message-ID: <20230524-dispense-luster-7962b13074c5@spud>
References: <CAD=FV=WRecTWsFM96k81YAx1=jJT0vpS4EPP0ZfWFUGHNFx9Tw@mail.gmail.com>
 <20230524072816.1131039-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rgZPHXM2KOTwBnaO"
Content-Disposition: inline
In-Reply-To: <20230524072816.1131039-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@google.com, robh+dt@kernel.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rgZPHXM2KOTwBnaO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 03:28:12PM +0800, Cong Yang wrote:
> Compare V1:Add compatible for Starry himax83102-j02 and Starry-ili9882t
> in dt-bindings.

BTW, my mailer doesn't like how you threaded these patches, I guess you
sent them as a reply to something I was not CCed on.

>   dt-bindings: display: panel: Add compatible for Starry himax83102-j02
>   dt-bindings: display: panel: Add compatible for Starry ili9882t

These two are
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--rgZPHXM2KOTwBnaO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG5yCgAKCRB4tDGHoIJi
0mNmAP9AKMIRtWN+rUBErdb+/gBM5rXYpT7EtNguO7DBe0rJsgEAz1171lVSS3no
TFIgyfCnddHmw1ar3lRdb02Reqyxcg4=
=TsDO
-----END PGP SIGNATURE-----

--rgZPHXM2KOTwBnaO--
