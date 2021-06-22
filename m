Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3553AFB61
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 05:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4023B6E030;
	Tue, 22 Jun 2021 03:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4910489FDB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 03:24:43 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8Bb74sB5z9sXk;
 Tue, 22 Jun 2021 13:24:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1624332280;
 bh=ukHoe8ctQydm1jqRsuwRW4KFJ9MlEMitYVp0CC94KvQ=;
 h=Date:From:To:Cc:Subject:From;
 b=H9x+PfUGruPRnjchM7TIRaA8XSf9Oi9rXdiOaxzJQuTd9DQF2PgsrKmgzvAGn1NgK
 SpmIUyUwB/8UxQ8qB4T3xaA4zU2tRI7pqAV7MlIxJe3gRc8aNrXwRXUSl61GzjrTDs
 VpVh8IxsBhADhYMXQgMPqBWPDTUpFMJsxJzNwACXO63YJx3aW5dRBl0fVV9HDbuhGf
 1P194O/1dffRAe+hT+BBpiJ3ivKzkm5QlXpnau8npI5+8UeZjBVpiLR60a6qf5uNgJ
 NozDMciig7blGEC90tDn3UmTzYmESbvG0zRFXlWpsr8dWdV9daD6gPhMg3+Dih3Mh/
 JAyrG59I++yZg==
Date: Tue, 22 Jun 2021 13:24:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robherring2@gmail.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Subject: linux-next: manual merge of the devicetree tree with Linus' and the
 drm, arm-soc trees
Message-ID: <20210622132434.55d19766@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uSDg2vJvmRq8jbuyLpabCQA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Parshuram Thombare <pthombar@cadence.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uSDg2vJvmRq8jbuyLpabCQA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got conflicts in:

  Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
  Documentation/devicetree/bindings/media/renesas,drif.yaml
  Documentation/devicetree/bindings/net/stm32-dwmac.yaml

between commits:

  7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes f=
or HDCP")
  8929ef8d4dfd ("media: dt-bindings: media: renesas,drif: Fix fck definitio=
n")
  fea998229140 ("dt-bindings: net: document ptp_ref clk in dwmac")

from Linus' and the drm, arm-soc trees and commit:

  972d6a7dcec3 ("dt-bindings: Drop redundant minItems/maxItems")

from the devicetree tree.

I fixed it up (I used one side or the other, please check when
linux-next is released) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/uSDg2vJvmRq8jbuyLpabCQA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRV/IACgkQAVBC80lX
0GxoNQf7BpZM/gOXkOiMkGb28zhmBiipd1Z+F6jFXBMUWWPxmT4MNkph/+HWbUUK
I6NRDbRK/QXYZo4bfWYN7BV8BMBFs8fYoKRh1y8Rbi6QIW8f7L8xDI2kHqYtG0Yz
/Y3/ZX8YRmHXOMeFnyAwb5kpc6gNo5Mz6W6g/fAWIsMwFVS1+5HqazPvgtwo4hMo
lwoU3U2wTVtcatnjMQ9U0tkthC9Qp/z7ncMV/nYYephC94t5sma7awwBXmQffBRN
LGavlv5jeQ0kTvaI7fKJsZ0TsZ234kokXorAeIJua/6TR5Ag2Uq3V5CFYXYUk7+H
CpxXTNjcNHsQr544g6zYfMWWBLjCKg==
=T7sk
-----END PGP SIGNATURE-----

--Sig_/uSDg2vJvmRq8jbuyLpabCQA--
