Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D66E36D8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C84410E319;
	Sun, 16 Apr 2023 09:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A632910E30C;
 Sun, 16 Apr 2023 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681639012; i=markus.elfring@web.de;
 bh=r0+PJdQ4hGk1HJh+uo+JIif8tJrueAMEY3mwlSLHrmU=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=mtES6whmgR9otWu9W9TcthNGrHLhJk3lpf5NK2lV9mOEj3y7NkGGTp8acRyaNKk6M
 AzXiQlAFSW9aXFpsPk2zFGevx6XgSBSiJZkB/a0vOIyluXHKWD4qdqVbZ617QyoXMi
 fFRl5TsjaotS3LeigZoiUV+zLnbt63l7ivKoTxAHlsTIj62+VCCnq7sIIYtLOAe6LB
 XEqsiDqMiYVixG2da1FhLtuyFGixV7R+ubjeX5X3S6AwkdgQGodGtIxEBsxJYJiBAj
 TyUAWRaBdhbRtiOeflL3K6cXT/PvCFx9YjNimYlqTx/Dlr99tOi7EY8wyW0c+MnIE+
 uSuZHpN9T2cvA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MS17h-1ptjSx1Gwd-00TChB; Sun, 16
 Apr 2023 11:56:52 +0200
Message-ID: <3d0215dc-74d4-2c42-2eee-7a5fcf62b9f1@web.de>
Date: Sun, 16 Apr 2023 11:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 9/9] drm/nouveau/therm: Move an assignment statement behind a
 null pointer check in two functions
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WvnSLZ8JcCgMT40fqtD67Yim4ZvJgIl6oJCIwq+1/gPHEiaAl8q
 FhtXDlNawnxkcNTWtv875NFd9FxT1kFrqwfVPOWehFvliE95E2oftLK3nleN6PpZQmBrTIR
 dqcN7ls1xmnpH6Lx0jRAmSFNub8Av8hEqARkT3eoWHkCVnp48ebOrpqbliPFnNTNZ8/+tDp
 KOep4bZGKEzYHnxFvlB0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZddhYlKIvjo=;RArXRPo10vQmCQ1pWSpjmtcplWF
 boRDeb0W74h79NEj3z/879cMkWGPWlpqSiTIIrqpZ8WHqgD9vR06i8tuM4o1RDeo0+zuAPdas
 g7kKZ9I3wJVXtFi8RYIi/xeq0t6xHOTSAkw23lq8+9PsHVBYI0e16xFZjRMHNBi8pDZtunlbs
 OL0qOEDn9Vs7r6DbVdgmGHxQ3Ru7S5FzfCloOBbCcwnT8ScjI0LkcIfXwS8C9HAfojtXNKmgp
 DjrjMDEL5zOSKjJMMJHr/MS+ylJbq6YpT/CrBBn15iPdIxw1ChtyqyDcvjD1I5R+xUClCz60P
 rYdJ6oWQr8zQaKfxKdD7OOX8Kdet9cWA2T7Avwt2JAWnh7/n3d9/Aa8ikFI+z87SLrjuX4YNM
 1aNiqJMEGz93sk+iA5X5sPeZFJgQWxL7iy8JFRcKl/UJV5uZ3m/ZyyMxmKZTF1E9vul/8vEzI
 BdEoQklhJ5VWr7SuN2yT7xwz4xi3/TQglDWseqjWRr+ZrO6YUarqg6kPycCNXlU6C8pv5HMZ8
 VPdIZvFVTesPT1Rb8PQi9KWGajs6ZxIY7vnQNqdKjccvlCNq90s60aeR6SFmHhcKjfKMWvG24
 Q/xwQUHdWAEEOhFqcANrR/gVh2g5zfQTx/lDeNry9iqpm8ZcTbfqvMTc2BoeNnmoxaOV96aaC
 KS5JYFbu5xfu1nqjkPOJZSuwWlc5lplhWkd/O+X4l2qPwSVyKuVaEcFMGLwRx/5a7y88w3tsU
 aP43GwBHdnzfgm8o8r3AQXUvBNHinu4trUCY18oMRgTpsDYO7CN1QU9Cr9Zah7tsdYuye1DNT
 vgXPhbLFQyMD3jYma131HsHkJOIYR2V4AmhSjwH/BZDaMeiRepcC88cGNmrqtKrpl+yvtiIZV
 NFDT15KJgPVW8w5i2G+GeFxsZ+2WPkXJ2U3+SrFZ0ewx3B/He2SNXpIkm
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

Date: Sun, 16 Apr 2023 10:50:12 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the functions =E2=80=9Cnvkm_fanpwm_create=E2=80=9D and =E2=80=9Cnvkm_fanto=
g_create=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the data structure member =E2=80=9Cfan=E2=80=9D behind two null pointe=
r checks.

This issue was detected by using the Coccinelle software.

Fixes: da06b46b720687117178d3ee85a601762f1c36b5 ("drm/nouveau/therm: cosme=
tic changes")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
index 340f37a299dc..b13ba9b2f6be 100644
=2D-- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fanpwm.c
@@ -98,10 +98,10 @@ nvkm_fanpwm_create(struct nvkm_therm *therm, struct dc=
b_gpio_func *func)
 		return -ENODEV;

 	fan =3D kzalloc(sizeof(*fan), GFP_KERNEL);
-	therm->fan =3D &fan->base;
 	if (!fan)
 		return -ENOMEM;

+	therm->fan =3D &fan->base;
 	fan->base.type =3D "PWM";
 	fan->base.get =3D nvkm_fanpwm_get;
 	fan->base.set =3D nvkm_fanpwm_set;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/therm/fantog.c
index ff9fbe7950e5..bfdf4ca5625c 100644
=2D-- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fantog.c
@@ -100,10 +100,10 @@ nvkm_fantog_create(struct nvkm_therm *therm, struct =
dcb_gpio_func *func)
 	}

 	fan =3D kzalloc(sizeof(*fan), GFP_KERNEL);
-	therm->fan =3D &fan->base;
 	if (!fan)
 		return -ENOMEM;

+	therm->fan =3D &fan->base;
 	fan->base.type =3D "toggle";
 	fan->base.get =3D nvkm_fantog_get;
 	fan->base.set =3D nvkm_fantog_set;
=2D-
2.40.0

