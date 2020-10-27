Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8E29A217
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 02:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D84C89805;
	Tue, 27 Oct 2020 01:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFFF89805;
 Tue, 27 Oct 2020 01:16:58 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKv1g2Cbwz9sRK;
 Tue, 27 Oct 2020 12:16:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1603761416;
 bh=h8xyjrpuSTlQCEVJbKMBITShYWl4W1pNpWMa5O4i5Kg=;
 h=Date:From:To:Cc:Subject:From;
 b=kpPRu+qimF40ShKPvebpKGUO5QP6pBgqjCyigKJ/qAt3xWd79haEEqbDd8ICDyUGh
 PCZc7+vQ9NvH6kDrzONHogQHh8Ygh3A7awKODXGAJZjPQOCg8pxHfNoNV8ksRUBAZI
 NWH63TBNsObJjdkqclHpQFz8roHV4/h9R1DuWE/0RMxLgwc7Ec276+KbCMqIjk8Q5U
 LcuxhZEvASx0qit6td/YjvtyCzn938yJpxVH/Q5FqnWWLAY8Sok++ZUoE15bPVW6jd
 DIp07GWpNom8Wph4d+E1Vw8Dee67EjTuIUOR1ea6vDR05hWm++jygOnpqG0rfJSZ0C
 wISHl8/C60gAg==
Date: Tue, 27 Oct 2020 12:16:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20201027121653.02108274@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============2076543043=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2076543043==
Content-Type: multipart/signed; boundary="Sig_/eyURcSdGIGG_KJ/feEncUOg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eyURcSdGIGG_KJ/feEncUOg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drm_dp_helper.h

between commit:

  a77ed90da6bb ("drm/dp: Define protocol converter DPCD registers")

from Linus' tree and commit:

  6e5702980b14 ("drm/dp: add subheadings to DPCD address definitions")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/drm/drm_dp_helper.h
index da53aebb7230,ae4e20245ba3..000000000000
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@@ -1003,16 -1035,7 +1054,17 @@@ struct drm_device
  #define DP_CEC_TX_MESSAGE_BUFFER               0x3020
  #define DP_CEC_MESSAGE_BUFFER_LENGTH             0x10
 =20
 +#define DP_PROTOCOL_CONVERTER_CONTROL_0		0x3050 /* DP 1.3 */
 +# define DP_HDMI_DVI_OUTPUT_CONFIG		(1 << 0) /* DP 1.3 */
 +#define DP_PROTOCOL_CONVERTER_CONTROL_1		0x3051 /* DP 1.3 */
 +# define DP_CONVERSION_TO_YCBCR420_ENABLE	(1 << 0) /* DP 1.3 */
 +# define DP_HDMI_EDID_PROCESSING_DISABLE	(1 << 1) /* DP 1.4 */
 +# define DP_HDMI_AUTONOMOUS_SCRAMBLING_DISABLE	(1 << 2) /* DP 1.4 */
 +# define DP_HDMI_FORCE_SCRAMBLING		(1 << 3) /* DP 1.4 */
 +#define DP_PROTOCOL_CONVERTER_CONTROL_2		0x3052 /* DP 1.3 */
 +# define DP_CONVERSION_TO_YCBCR422_ENABLE	(1 << 0) /* DP 1.3 */
 +
+ /* HDCP 1.3 and HDCP 2.2 */
  #define DP_AUX_HDCP_BKSV		0x68000
  #define DP_AUX_HDCP_RI_PRIME		0x68005
  #define DP_AUX_HDCP_AKSV		0x68007

--Sig_/eyURcSdGIGG_KJ/feEncUOg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+XdQUACgkQAVBC80lX
0GxM8Af7BpAFcF31vfAklBSUUuavpTugxLNrHkyzhVSF0q3yEmm324CMIgYGT0YY
7k9q0sdsqTa8CXYxkvuLFjhIS/ZkvwbMgzphXe23hMnhXs+mHvqcFAd8dXuVVxwH
iu0SzprR/qt1MJc0ILXJBO02K8YgFOxFmiUqDdtb+viBxzgRg/ZD1UhqaOFrj57m
7QaH4Kl75PYpLLKHCQFTI/ZwWRspR4/52wt1T8PIYCIPYo1quMTQJGk67OS3ytFO
kTXa6xoGfeproe/qyMM/ENnzanc33CZHXOZltFOkhwTO3VxOxfVebZMqfhJn7HvB
TAEdcAivWJ4JKXE6rNg9aGXYGGKaxA==
=wfcx
-----END PGP SIGNATURE-----

--Sig_/eyURcSdGIGG_KJ/feEncUOg--

--===============2076543043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2076543043==--
