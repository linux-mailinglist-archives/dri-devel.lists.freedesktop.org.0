Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C4C3DCB77
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 13:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D3E6E0F7;
	Sun,  1 Aug 2021 11:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDCE6E0F7
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627818738;
 bh=BHpBlBtsblnIs/OJwA6XGXgJe+83P0AOEiqA8q2WIRE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=h3Bc4OUSQYi56YP3k2J0IBxGdnchqLmQTB9MED/FThcEr6zcFsUaQYnKqAafCQa9N
 yuBK72wKhmoUJjpF26wLPpSyrlQRnH5aU7ZpGIEf5aNWtTzBE9Q0OGtewjNGgDxp/2
 qUFlkFYk+AXNsmyTXtClrXOBdzDYIzjBtR3FT5yk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1Mo6qp-1myNzd1r3r-00pbVB; Sun, 01 Aug 2021 13:52:18 +0200
From: Len Baker <len.baker@gmx.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] staging/fbtft: Fix braces coding style
Date: Sun,  1 Aug 2021 10:51:55 +0200
Message-Id: <20210801085155.3170-4-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210801085155.3170-1-len.baker@gmx.com>
References: <20210801085155.3170-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:00bLwC3nTIERcfaw3w8RLsCAM6bKQNJn/2Riikz2relmlKOV1Yw
 jvY42DwN5uwXJdIYrMursuN/wyeAQKpGgiSZQZteORK4XiWO/UvcnqH3x/gGiplyFCdW37I
 SyYZrzLckcZtrsEdG1iiZrXmVwuHc/RbRbSpz5JJljwtmvFqGN1d1bbw+YCshZMjvGFZhFf
 StEa5y22VGAxN+NKU4DNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gejn52mgomc=:Vq+HxXHUC5KqWu/o5rVdmq
 jeGZYOeg4pvjQq1RlkTLUxd0FkOZuBTXMPdslWSwZCV+ffYGCsUzMu087YwshlgrwE8jJlUzb
 TaZ/fItIyAzf1y4HVmUNoAG2e8rO2T1+mwfEQI60TTt5rEjL79Oul5lSmg4pjshPwnWEkb4TT
 SdPEE8UIL+nHAaYrqeS0Z0l6UNnQ0+Ka+9GrqNwNJvLDq971Z+SmwFNZ85YRTvKsIge0iHl6E
 sLcrKro+C+uijA+qAZoyNvs0v1tKq+XwO86nD3jLLFfRqeoHaHtxz6Wpb8hbI1pNGRbaHA0qx
 BZcXMuyX8uiyyfmrn11JzvUfikhLeNUvClRLqKEabUOm8v05KkvI9yUOERkmPfMQlL1Y8a0fH
 ZtvqH4SpM9Y7y5XbSPBIKiFm3IcFCS4gGTJvsscFooEzSQNXKfn83QYeeTK5uDzxzPv8PeG2d
 pK1/sZWHKdGJgNbgoowShvtAcqC/wvJc9w4VFwW0W44M0QOUqgZ2r83SXfUMTpBYAFQtt9Yiw
 2vDc3tpoKnp4hyk6zb1x9gkSRX/7t5CJl60iDYCKlTOBVyrR66VQB6sc8rM3z5VoVkbm4EFzs
 q6Z+2Osz3+l7goxVZTzxJyoHW/BjukS7d/oVrntIgf2mWNTl9+nDqAbai9L5Q6FNtXXNepn4j
 I+EhtpBI32jDTEi85W6eaDe3n8dfQgalTgDcmMwoy8ONBydqOwj1hRxcd/OD1iVWWjVFjv1rn
 raP78nUWWhqj4LHac+mlP+JuxurPE4kuLxBNla+J7CveMEF39u720QBgCS01Qw7q3DkBM1kFn
 2tR24z1n8UuLwl2+WJOO+HKZ0dgwh10E1PUZqMxJmEXu/+d195MXM6br/3yJKit2a1HwrE8Ef
 f94Bhzn6/Zd30A/1GaEKz4fMfivm6/IU/n+GHOQy7D28UzidDYV9fAVowONA+1uEmKKeUYu3v
 u5dhUYekGf3rXaQzNIW6829uEMq60XaReZ4/PuPwDaTvinmg+0FMhPAGF7hg2xUVqgrP1zSl+
 D2jJPRL3DKzSbA+jXOuNW2RbGrMZW+41vvcwQ/1t8BfRdwInR+2vml9xtTJvUgXDH/t9cNZrp
 nWZ4r3uWSdeaLzAGcCk04st5XXbKcFleD9T
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

Add braces to the "for" loop. This way, the kernel coding style is
followed.

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/staging/fbtft/fbtft-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fb=
tft-core.c
index ed896049118c..ed992ca605eb 100644
=2D-- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1003,9 +1003,11 @@ int fbtft_init_display(struct fbtft_par *par)
 	}

 	/* make sure stop marker exists */
-	for (i =3D 0; i < FBTFT_MAX_INIT_SEQUENCE; i++)
+	for (i =3D 0; i < FBTFT_MAX_INIT_SEQUENCE; i++) {
 		if (par->init_sequence[i] =3D=3D -3)
 			break;
+	}
+
 	if (i =3D=3D FBTFT_MAX_INIT_SEQUENCE) {
 		dev_err(par->info->device,
 			"missing stop marker at end of init sequence\n");
=2D-
2.25.1

