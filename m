Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E46F1C09
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 17:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72D710E0FC;
	Fri, 28 Apr 2023 15:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493FB10E0FC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682697337; i=markus.elfring@web.de;
 bh=kvezJ209ikMxtDva7A5XsAYen8uuu1lgjSi7/a9lTp8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Fl1VywDLibIGQpfhBTzVktxEkaJ1GCLZyAg2XawtjP/sJZw2ChZH8gTaJneRIpWra
 sm12a1uf4zBhJDTPK2SszzxDfNokgTDvVYuWfggEFGNFlg1Gfv5BL7RDSXGkkXyCtW
 /dhf6FKaqgAyjzcyeQMyrwkdeHdHlF6sFpoA5X3H7hF88D3eT1VFD71ogPN1ZcIOas
 UHlfTZLSyKw5JJ+fAVfF8UV3bC3s6STe/GmJwnTcSCPvOazOQ/nWsZQEUmAhKQmztr
 P7+16b/KkUR1jbp1doyWT6OvAPwOGfGFnbgWAGa1AVzRCVXD8T5gyRVOBqWh2bSDcp
 EZTr2dPMvKtmQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJnvp-1pYH7w1ZNp-00KBuC; Fri, 28
 Apr 2023 17:55:37 +0200
Message-ID: <fa69384f-1485-142b-c4ee-3df54ac68a89@web.de>
Date: Fri, 28 Apr 2023 17:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH resent] drm/bridge: it6505: Move a variable assignment behind
 a null pointer check in receive_timing_debugfs_show()
To: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-yi Wang <hsinyi@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
 <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
 <6f758653-36c9-91a2-7bbc-278ae3f8ccee@web.de>
 <CAN6tsi4WBDOyzvXJ8vV=xJYay1JbBGo+UzZ+vudTBm5Fk5nB=A@mail.gmail.com>
 <14083012-2f19-3760-a840-d685fcedc15e@web.de>
 <CAN6tsi7263VnTba+WUUWR171Y+CsOKAb=it8cofPQGRk26K=aA@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAN6tsi7263VnTba+WUUWR171Y+CsOKAb=it8cofPQGRk26K=aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dx1Md9h5hfxKHvfh7saoWqSlEiZQdQnZ2ZefsxCeWBpWc9IC3/j
 aUgfyxT751Xfez2r3ZYGHvuN0tdaIppX7zn5qnit6rbH4a6b0DRofgPC80Z9eR4izYInJXL
 TlwQnPOb21zp4nJg5KKMBU1IMgfvJAv1JBZDfoCGjBJRsQjQnlDHF3+nfWYkIWpgt8xE5vb
 dFgnsPojK2/VMc0to4Tpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+Co1tYJEdIs=;VPZVqdaKivsLb011GvoatTV92TH
 2WMVARjLnfmRHV+aIR9k21+uaPsVovoFAQFy+56IHduGwAqjggAAPdvz3UdbkH13bICS5R6RP
 Le++zRnQSLjsLEm+wHl7nwR7oeBiOmcT12XfixrvEA+7cf6EbGuPy4yVZYSP6Zaa22XMScMGZ
 oBiOpb3MUIFM2v465mdoM4Y4H+YqOwjn5gpTXHvrILzCPZPn6v9L+W/rIYu/a7weKnM0Hg1uo
 2ZzcRfpLhy2oW/pnJPZeLtRfujeF2O0rir3ICXtsb7YTfrlgh4uF6j1UVUyeQhGSuiqvBhGkR
 nkH0BVSZDC9CK6BlUAVo9oOmjAwtdhYzmSwUYOjyoXVso4T74Ox+/HjOJtXXEVUzg1CX8lnN8
 lRTTcr8TGawjUbFsYX3nHtMjAPb8cMN84Li8Q1s0wF2G5+ODucBVeuERly05Qh4uGp4Zqtvap
 8JEJzb/u7pPHukCrgchWFfPsyA0016WUHMp4eyurk1m6IhbHc+PfKTSpIt6fI7pAzM3g3Spu2
 1Le8oRRvvaFLbXZ/HtlkbKAzbhme4psDD4oDx1MtsYOYYO1ULQy8aSxtn4fO1Ce6x4ByDLnbz
 8uHWH6pGKv2XLFJWbJwyHVyGJVSswW4D+mOdBqSg8HD/pcIb5KGlc6U99q/NI3JHTLQo8KUAR
 lTNlnnBGuRaEdDaG1NCA9ndotkVn9SQDUP9HQEHU/afsbtsPiXy0pKpTTk5U20j8xqGRSdxXX
 P+7ai+YgXT2A58vuj3ylx5BhHuF5ZSlHterajeoW+mLAe+uNBDoQDYXIW89TIEm3DwHXqNeKl
 aI5vyH1iqJW/yEJnYD9JasX87z+5mflHDF1ChGkSLs74q1fVG0g1LSChRQFqzyYF/l+DVjGuZ
 UdYe9qbwW6CYz4G0xxWDrmXD7BjBkXnv9xaAcR/n8M/m93xouMnN3rNFaKomY2q/ABVD+DRZi
 JKHQEQ==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 16 Apr 2023 17:30:46 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Creceive_timing_debugfs_show=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cvid=E2=80=9D behind the null pointer check.

This issue was detected by using the Coccinelle software.

Fixes: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 ("drm/bridge: add it6505 d=
river")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/=
ite-it6505.c
index abaf6e23775e..45f579c365e7 100644
=2D-- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3207,7 +3207,7 @@ static ssize_t receive_timing_debugfs_show(struct fi=
le *file, char __user *buf,
 					   size_t len, loff_t *ppos)
 {
 	struct it6505 *it6505 =3D file->private_data;
-	struct drm_display_mode *vid =3D &it6505->video_info;
+	struct drm_display_mode *vid;
 	u8 read_buf[READ_BUFFER_SIZE];
 	u8 *str =3D read_buf, *end =3D read_buf + READ_BUFFER_SIZE;
 	ssize_t ret, count;
@@ -3216,6 +3216,7 @@ static ssize_t receive_timing_debugfs_show(struct fi=
le *file, char __user *buf,
 		return -ENODEV;

 	it6505_calc_video_info(it6505);
+	vid =3D &it6505->video_info;
 	str +=3D scnprintf(str, end - str, "---video timing---\n");
 	str +=3D scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
 			 vid->clock / 1000, vid->clock % 1000);
=2D-
2.40.0

