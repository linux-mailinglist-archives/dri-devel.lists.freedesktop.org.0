Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734E74CE21
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB8010E1BB;
	Mon, 10 Jul 2023 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 441 seconds by postgrey-1.36 at gabe;
 Mon, 10 Jul 2023 03:31:30 UTC
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52B010E0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:31:30 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzq9J6lSczBHXgj
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 11:24:04 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-type:message-id:user-agent:references:in-reply-to
 :subject:to:from:date:mime-version; s=dkim; t=1688959444; x=
 1691551445; bh=H4M1FA3w6x1yznCaH0WK+ec5JCpNRw4pwcwdTvtr6MI=; b=y
 NsDeva+noYtAb2+7bgPbEmvRoqVH4cWz4sa6rROiqV9vFLLku0cDQMYfp9w0MFhS
 L5wLoBoqZp0R5YoWCf+EHICmF9yU5PEGl6MC5azXOy31a7p3lpzj3VLFDZOdKTZ4
 OMOOy08RBqWYuW+MFs08ESgkpb1ELaMqQvmtjt+IB7TwQj6ThokvU5juFOfpG9XQ
 9Z7T3pKJFsexd6MGDI3uGKxrcVLl79Vemccllcw/oRXzwhrnS06YlE9HHZVKUSwb
 FTjvvkznRU4h4JticJBBhARi2nyr6fDkSx1I59CPeP9B99xWLEhifUspbLdLlH/x
 ZpOyo1wasCZbqm+KQtWxw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qYqtuXD3e8qC for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 11:24:04 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzq9J4ZdszBHXgf;
 Mon, 10 Jul 2023 11:24:04 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 11:24:04 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/nvkm: do not use assignment in if condition
In-Reply-To: <20230710032131.52747-1-xujianghui@cdjrlc.com>
References: <20230710032131.52747-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <8ccb32d03035b15ea9c08b0d0cd9b73d@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_bf2cb193fc71e38381f1842dfdfeb9b8"
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:22:46 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=_bf2cb193fc71e38381f1842dfdfeb9b8
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
index 976539de4220..054fa42f1d04 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
@@ -286,7 +286,8 @@ nvkm_i2c_new_(const struct nvkm_i2c_func *func, 
struct nvkm_device *device,

          if (ccbE.share != DCB_I2C_UNUSED) {
              const int id = NVKM_I2C_PAD_HYBRID(ccbE.share);
-            if (!(pad = nvkm_i2c_pad_find(i2c, id)))
+            pad = nvkm_i2c_pad_find(i2c, id);
+            if (!pad)
                  ret = func->pad_s_new(i2c, id, &pad);
              else
                  ret = 0;
--=_bf2cb193fc71e38381f1842dfdfeb9b8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Assignments in if condition are less readable and error-prone. &nbsp;Fixes<=
br />also checkpatch warning:<br /><br />ERROR: do not use assignment in if=
 condition<br /><br />Signed-off-by: Ran Sun &lt;sunran001@208suo.com&gt;<b=
r />---<br />&nbsp;drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c | 3 ++-<b=
r />&nbsp;1 file changed, 2 insertions(+), 1 deletion(-)<br /><br />diff --=
git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu/drm/nouv=
eau/nvkm/subdev/i2c/base.c<br />index 976539de4220..054fa42f1d04 100644<br =
/>--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c<br />+++ b/drivers/g=
pu/drm/nouveau/nvkm/subdev/i2c/base.c<br />@@ -286,7 +286,8 @@ nvkm_i2c_new=
_(const struct nvkm_i2c_func *func, struct nvkm_device *device,<br />&nbsp;=
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ccbE.share =
!=3D DCB_I2C_UNUSED) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;const int id =3D NVKM_I2C_PAD_HYBRID(ccbE.sh=
are);<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;if (!(pad =3D nvkm_i2c_pad_find(i2c, id)))<br />+ &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pad =3D nvkm_i2c_pad_find(i2c,=
 id);<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;if (!pad)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D func-&gt;pad_s_new(i2=
c, id, &amp;pad);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;else<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D 0;</=
div>

</body></html>

--=_bf2cb193fc71e38381f1842dfdfeb9b8--
