Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F0D3D4881
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 18:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783FE6FF7D;
	Sat, 24 Jul 2021 16:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9D66FF7D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627142669;
 bh=6kxx24+tNiTwiGUNlCYc0+udJ3yXQxBElRKKameUdnU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=R5FpRZPbkKdGoKh2n+vPr4/m9cWtCOYSGhFzS82nJ5xdfjbwNs4MkQgGaStaD2DrD
 +ZbHrcIjDX5WFd0sw2Z2kqfFhs5nYyENqw8zeyel8ZB39umdgVqdrLhcxQ1dO39tRj
 ayjON7htm0vVuFmzQ+W8cxDY4ADwYJW7TQm6kmhg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.228.41]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MDQiS-1lxwU702L8-00AS7x; Sat, 24 Jul 2021 18:04:29 +0200
From: Len Baker <len.baker@gmx.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/3] staging/fbtft: Remove all strcpy() uses
Date: Sat, 24 Jul 2021 17:14:09 +0200
Message-Id: <20210724151411.9531-2-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724151411.9531-1-len.baker@gmx.com>
References: <20210724151411.9531-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:329MDQ8YYI419jtmxMfrFBjESTzOsFnksAGa5ruA+GfDttL7lWO
 wte8/djM2LhNs6aEPzKc7JtdjaOdDdMoNv0o6C+eFtqCWikMKFXqUIciDbQgSo5yVwiDl6X
 ZH/WD1FmYzPF1ja/WrdY5hztftD5klqmo8f6g8Ol4tUTKicTr8nD7tszuqCgpzW+TwDEApL
 QuYGl5kqbhqENSGRWrAvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TlzSNjjpZCc=:WL3ahatTWMY6d26wj6FmBM
 feg2Cl66/zRO4QSieaqZMJmneHGcFh76xjVo7ovVPictW2u806BykZUnKxUPCocZztniypk3X
 nF77c76931fexpNuPWQ2CDD2YK7k9mhpXvirYAUQ230vxEiWd1DvQ9Q6pdpTzCLySIXt73+5v
 iubuY58rFsK6vZ4NeQQcB8sslt4xyrKFt6dHj4MB06R43PwyV5+vPDoqRSlNHvuYfkiXDVu4E
 SNsJhb+MSAl3JkY+jkziYyTtEI5GopguWnXT8xP9tH1V1Xhh+azjhZdMZiuqjJV9dRCeXllac
 oTHd5PPv8EDrYF50oiP/bfhdNR6VthWzecALMNPdXYbFK2bueG58tkexxFnj/yz2HPiAMYmM9
 YqRAtqKGJFpa0xUNodwuSTt3f2wY3VJxrIwf1AraROCYDIAEpfRrDtczFauKjI8L11KFubuXw
 KKi+39RRPA9JtZUuI6QlT/Gos8dAJvi4v5292TSnM07UNDiUMN30BT2Vynt7QKz3ijY1HZDfH
 KL69SaknYSuQryW9QQiaOOFzqWoIi99et87BAyfEYzVsobPvpfFPzNYXzx0Ju/tvdjVAVnnQq
 2btdxJqc6G+FGoA7kN+/lSS+y8vgRPSRYLWt2Np16v/y1PLAM4S5bMCMLtErbfde+BJsRv60Z
 uZbW95IL2WcLSu8hGmN3Ry8T4CQuSwXk53VCdGLJdUk89TWTJSuIldTRKxcFk3Z5bWBJ9XbYA
 bM/IOxVOnE7E0U9YzisEUx8BEOEp9yz7DjGlKshpP+s2pKh0FFQihPmXjRHe8GCcmVJyFJrNG
 Ymg2ntUbT9jWgnyRFkE3UJabppENEfQGI6YqmS1XQLyAUxIZ12feKHrVeayFtsZjkjL4ypFrX
 ubUQqv/VY+4EdFB+gKv/8EgP8Lp2bbC4DlkSXLV31h9rS2ewwTdozl+XRsUVN3RvKWuGVVGkF
 bK/ICNuLwdfozsoDj7b/EfkguzjAU+YoOGVxntFb9PnOdQ7cHj55/QVlz4W+WDd/Y6vDTPxZw
 JwN/wrpYnQez/f4wlg7qXsouYPXJ0rMw9rxMxIAkpJww2eiIX2mu+NVsZAUGkrj1W3ATm7TV2
 t5KEU48QHESBP4XdDI5zoR/xcGYY0676nUd
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
Cc: linux-fbdev@vger.kernel.org, Phil Reid <preid@electromag.com.au>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. The safe replacement is strscpy() but in
this case it is simpler to use the "%*ph" format specifier.

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/staging/fbtft/fbtft-core.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fb=
tft-core.c
index 3723269890d5..be20da3c4a5c 100644
=2D-- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -992,8 +992,6 @@ static int fbtft_init_display_from_property(struct fbt=
ft_par *par)
 int fbtft_init_display(struct fbtft_par *par)
 {
 	int buf[64];
-	char msg[128];
-	char str[16];
 	int i =3D 0;
 	int j;

@@ -1036,17 +1034,14 @@ int fbtft_init_display(struct fbtft_par *par)
 		switch (par->init_sequence[i]) {
 		case -1:
 			i++;
+
 			/* make debug message */
-			strcpy(msg, "");
-			j =3D i + 1;
-			while (par->init_sequence[j] >=3D 0) {
-				sprintf(str, "0x%02X ", par->init_sequence[j]);
-				strcat(msg, str);
-				j++;
-			}
+			for (j =3D i + 1; par->init_sequence[j] >=3D 0; j++);
+
 			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
-				      "init: write(0x%02X) %s\n",
-				      par->init_sequence[i], msg);
+				      "init: write(0x%02X) %*ph\n",
+				      par->init_sequence[i], j - i - 1,
+				      &par->init_sequence[i + 1]);

 			/* Write */
 			j =3D 0;
=2D-
2.25.1

