Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D75AFC82E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82ED10E5D3;
	Tue,  8 Jul 2025 10:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=heusel.eu header.i=christian@heusel.eu header.b="jQVp3Im+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Tue, 08 Jul 2025 10:20:33 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CB510E5D3;
 Tue,  8 Jul 2025 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
 s=s1-ionos; t=1751970031; x=1752574831; i=christian@heusel.eu;
 bh=pVC7GxX7t70O6nV2vsIuzXnuZ90xj4rHSPK+8DUoSsM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=jQVp3Im+DjSW1Cq4oO+wNwaWM/qqmSsgIhncxNnIuR1yY4rTQjHHFwZzyt4GRss+
 AMqOpiEB+uWTgt6ZDyUbrel0CNnYpFy51ni017rkHHWtJKLQstinz5wDGOOrVxg4T
 jhIlp2VoGwAsGR3IMCa1cu/0CjlKVwihmE3MPE43+cpyOAomP1j/UyODCRvInR0Av
 PL2jAmQ+Txkz1b+J21pgovagWwzzQM4xop0OokSVCXHq0qgwnAtV0NdwYhnvKeoH8
 FEgMnQtqu+6lJ00d912gwb2UatRUuewzEy1jmJCAjAg1vcl4FZXHY7OBStK+5BcLn
 Tp1EIL0vk497uVuMag==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([94.31.75.247]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MyK9U-1ura8N2VIK-0117h4; Tue, 08 Jul 2025 12:14:43 +0200
Date: Tue, 8 Jul 2025 12:14:41 +0200
From: Christian Heusel <christian@heusel.eu>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: tzimmermann@suse.de, asrivats@redhat.com, 
 Christian =?utf-8?B?S8O2bmln?= <Christian.Koenig@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, linux-media@vger.kernel.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: 6.16-rc5/regression/bisected - WARNING in
 drm_gem_object_handle_put_unlocked after commit 5307dce878d4
Message-ID: <a028ff08-8478-4cab-8bf6-3c9ea4b21ccc@heusel.eu>
References: <CABXGCsNxhEu+win6h1Zwi-0e4NeURzOt2KA=BXakRz08moG4uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fya22ekfcjwoyp6c"
Content-Disposition: inline
In-Reply-To: <CABXGCsNxhEu+win6h1Zwi-0e4NeURzOt2KA=BXakRz08moG4uA@mail.gmail.com>
X-Provags-ID: V03:K1:kP9F2Oeo9EM+WR1is69hCSu10i0wMrSM8tP03uSWtSAgZa+h4UW
 /G52w2AJzg55Fj+GRg/neWqrxYh9CW8AS8/zNoToIatTcTUCofxizj0i+EuI644J3i14PRS
 nPVy8+aQCMw8Qi157G29tt0Eo+sS3nF9qzWOoYWASCyjrEXjvh1hP7sbDNG4kKbf8g7+hfr
 vPPPR8g3XexELk3WeaDjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H2nh9rO2OA0=;jtSf1SzejbeX1LrAyBirK++nz36
 dnVxpKGjQgoul0PGDASUOwNaDC4KGVgLz0UDwP1B+luszhJAdFHQ21FaaRmGyD74Mg1gEtJTd
 gZmwiByWgCq43dsr37bKfb4d6VzDQ3iKo/EArB6L8qPx0z4x+0VrR189ui/Fe36iUoIMK6KlN
 Olv8EvPA+TonTXo0rdfcm+09pQBoP0INxr3UP9Fvo8gY1dmJNBfoWmXuwS4KCKhiwuPHQUl97
 k/nZFayVPJEX8tUIgim4lxDPvLrSZp0/HTCXruTm++2CiW2kBt0NtFAQn8+os+WoEow8Os7Lu
 EnBs77UGNYs18d9vyTd9UXW8v+HGE7dnAYks5WigbUSdFT1ZWPrwrh6fWUNqqdX6fXoPX5YGm
 uGDJ7FadXmh4x70w+mLxloebyAwy9eTLqMe/GuQ0IU5SIxulIhJDVbWe5jDQSahUTCbf7+zWN
 3W4mRcgo9CQSgmktKMzYSXDk1iGhkfB909XL2WSUWRmncUfenO1Pr4F57Pi9zo32+vXFoVwCu
 RCb06wR1iz0pL/hM3vzIfNdP8F4WtiCGLJh03UekM/WjpFCyWl3f3xVjviUnzdoEs66pBIBqF
 FLtydsMdWNIRYEWfNWnSrsyLqKuQ1k9zYEkmZd7hNeVwEyjEfD+VUWDZQC705GAe5Zk48zUZ8
 f0U8a1x2IxgEG/F5YICHyY+drKha3lRkeMWwM7ahpINaNGeJYBs/9nV1JeSk8JYkCGDzgWunV
 FzaaM/Rf/ltcyMchBLv+iCVIY2afIQwtFqkkKSeQ/je1EZ7tkn0Nnoi9iWQ2GlX6HRVCcLfvj
 YYVJqrTRWq5C/3JetNbxWMq+hylIORnzzDaRhxa1Jv91znCNT2rpPzuGakNk5y6W04/HOCxze
 wUpsA18oPe3wh1dNJG8Mm5t/XioRC3i+jq/HvycwSXIiE/fJ08iPRQr7qA0Mc3OYHohm6OZez
 m7MFFj//83pfIkyUYYYkgKMO4vbtaUT+fPVgtgoODq6i2dZ0ATH0Txwf8toJSeCS5B/VT/5rD
 /d3IyIm5nKSf2lvatVB/Qep0iJKLZcqOxrn8W1e8L2Tpy4RdDmGIDR/zHdBSwQ6nSr9TaiXMj
 PSPUGyV184lEseNL1BT6KXDy3X/3BL0sfRfHTJPm8NTuXQj76YSr0gY0DrCYH/+72zthZjsI5
 OffM+J+OURnWwTaYBi14QPEc2+aBdYBwOEeIMmJXBmNjvgIOWNPXgP1WTy6E52gPoktVZIzYQ
 +9DbsIZDL0UZRVXqnCm3Q8PY4/7QTOU0aLwprc8aB5YneUjC1xbqZibqratTgtnKo3fQwNIjU
 u/D4Foci1UgOsqEWq3XRoZhQ6msHX6+GX5J/fl5onRjM/S5+DTYsvXDW8o544GkruoB2QFaLM
 BoS2+Xx2RFuKtoQjL4MRlHpwoWvCHVhIB7DbC/wK8MIzhtAtajP5DoA+Jks7RJFwWd47smx8h
 mm/A/aKAJZjc1/OhLt7kmWq9C3L3hAV+6yl1G0hySoR/5g2wpa1wc244Lche3+CNYZXIkH0pf
 5z3Grhk8OOb2qkoExan6u5DIqagpr5kE1ruGWMnCsKVRkX7jSgCBLNFSfg5qF9pgvL2F5mV7K
 ZVR7GY3Ein4iILcoRJC3Uy5Zhs42ruiRp7rkc/kXU64F7gR1P6QO1GW25ZNnZ+V/BAwI+b/KQ
 E=
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


--fya22ekfcjwoyp6c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: 6.16-rc5/regression/bisected - WARNING in
 drm_gem_object_handle_put_unlocked after commit 5307dce878d4
MIME-Version: 1.0

On 25/07/08 02:26PM, Mikhail Gavrilov wrote:
> Hi Thomas,

Hey Mike,

> After commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles
> for framebuffers"), my kernel log becomes flooded with the following
> warning:
> WARNING: CPU: 5 PID: 1812 at drivers/gpu/drm/drm_gem.c:286
> drm_gem_object_handle_put_unlocked+0x207/0x330
>=20
> This occurs during normal GNOME Shell usage, and the trace appears
> repeatedly. A full stack trace is included below.
>=20
> I bisected the issue to this commit:
> 5307dce878d4 drm/gem: Acquire references on GEM handles for framebuffers

I think this is the same issue as the already fixed
https://gitlab.freedesktop.org/drm/amd/-/issues/4393

Also this is the fix linked in the issue:
https://lore.kernel.org/dri-devel/663110e1-3aa0-4f6f-8727-3a240bc96075@kern=
el.org/T/#me2a0f3254a57cdd157ba79344ab8d51476ba18e5

> Reverting this commit on top of current mainline kernel (6.16-rc5)
> fixes the issue =E2=80=94 the warnings disappear completely.
>=20
> My hardware config: https://linux-hardware.org/?probe=3Dce4c44c524
>=20
> Kernel config, full bisect logs, and kernel logs from each bisect step
> are attached.
> Please take a look as soon as possible =E2=80=94 this regression could af=
fect
> any user relying on fbdev or shadow planes, and the commit is already
> CC'ed to stable@vger.kernel.org.
> It would be unfortunate if this made it into a stable release without
> being addressed.
>=20
> Thanks in advance!
>=20
> --
> Best Regards,
> Mike Gavrilov.

Cheers,
Chris

--fya22ekfcjwoyp6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmhs75EACgkQwEfU8yi1
JYXsLg/+ObOtHgsihU/489f7Y2qWKv5s/4scLsWukSapGhIEIxW0sWySxqzC1Zg9
JKzfWpnsBe3LbXbTo2/CxhdMaQ8kZWODBig7q0mHJJ72Ag3sBMfhcPkqHaGi2LDV
AJTcfdb2hnRwbeDAfIFeHBZUws9fVNaNBQw4/n4HuZNSBjI+VC4uAIKk2USnzmPT
2SEZTXsZw7zKx1lYs/pmOqMguNpbyYstcgqXjH1nxJxLC0X7p5pQTNlqYaKx4lZX
yj7Eusoff/Va4x4nVv+5FlErKVbAXyRgCH16X99hzdSeda28JbZUqoI1HLZ8D+TY
PdAlknCqzmKMd7T3DTdMzc0r8K2t1BCpcvJTa8Tl/imo9OV6sdzFLHW9Zrd3ek7x
e/aV45/7HCDpLpIVDA6t2OUDf9ydeKlIs7koSGBO8nmKBRjmj+XZDIQY4WK1uAw/
JOSJL/sWF2lqh3GXTPLgy8EXi6GpHuuUnqVjjX1DA+9Pq9Wyl9gNbqmnt7yL7Ry2
Z6ZkTnlmeKRkOeLmIC3gtnAn37cFm+QNqkRuTFwZPMTVdoxSJMoO/7QNyEWuz5ei
tLsVAYCHuPKaRzD+IJn9mORKEeY0XLqV0sVrTQLVEf/jx6FB2IvM1BmanMc9Oh4b
UCqFH2z6b/SyLnqPsTujbWRKpP7gNNfxGkySHlkPcYRiA2EUbR0=
=iEvw
-----END PGP SIGNATURE-----

--fya22ekfcjwoyp6c--
