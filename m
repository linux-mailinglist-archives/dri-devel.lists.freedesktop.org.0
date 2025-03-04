Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5891A4E978
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BBF10E667;
	Tue,  4 Mar 2025 17:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=faith.ekstrand@collabora.com header.b="Bj2rwb5o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CA510E667
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:42:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741110125; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jgs4ZIUnD+6J3iiic5qME2stj9Eifxi6vyAOmuPrGxd9LzOy+BKHHoBLXkyYN7SJ7THF9WXNd3ggcnEAf8BSKkWYcT3IjHg4B8tjy24Hi8HkQUYqM7TXZ6IH4/CzR+NUxYgpJ3uToLp/h1e4pRVM7wu3AgvKAzKxcKm6VELPSfc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741110125;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9Fm2flbYZr+f3GoNTKszA3vX6mp2AuB400lXDmv/wWY=; 
 b=WcHPE8rN6lHrgr01jRJPiuNrAujkLhkRy1DS3IzIP5fZCN2Nyr82u8y3wmOPJWUswoo0UbOUXiEXywLhI2JrtcTCKs2BDMfu4g9XTHHcwfwtZLEXqmISKFszq3/46vNviTP2e9dArA4AzBG1bBsw/d02So+3w4/VPlymViRlTCI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=faith.ekstrand@collabora.com;
 dmarc=pass header.from=<faith.ekstrand@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741110125; 
 s=zohomail; d=collabora.com; i=faith.ekstrand@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Reply-To;
 bh=9Fm2flbYZr+f3GoNTKszA3vX6mp2AuB400lXDmv/wWY=;
 b=Bj2rwb5oArxpvP3Kw/wd9k6XnpexZW8Xq0cj+FR7610hAdCfOn2D8VGZf8oANG38
 98ayOJSAyLE3a4HE/OLVtUg403+YOSMr+CN4MD1pM2Rn0k3gShrYJgKmiN4axfAPMwv
 r2zoKiQIuVY2U7OtYMsxNMWGSOiBmmxQUYwjfiOw=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1741110124353967.8006841569494;
 Tue, 4 Mar 2025 09:42:04 -0800 (PST)
Date: Tue, 04 Mar 2025 11:42:04 -0600
From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "asahi" <asahi@lists.linux.dev>
Message-Id: <19562401f20.d79694fb2656590.4318752193247758006@collabora.com>
In-Reply-To: <20250301-apple-twiddled-modifiers-v3-1-4b9bb79825fe@rosenzweig.io>
References: <20250301-apple-twiddled-modifiers-v3-1-4b9bb79825fe@rosenzweig.io>
Subject: Re: [PATCH v3] drm: add modifiers for Apple GPU layouts
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_8437004_640660631.1741110124320"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

------=_Part_8437004_640660631.1741110124320
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

~Faith Ekstrand








---- On Sat, 01 Mar 2025 16:01:30 -0600 Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote ---



Apple GPUs support various non-linear image layouts. Add modifiers for=20
these layouts. Mesa requires these modifiers to share non-linear buffers=20
across processes, but no other userspace or kernel support is=20
required/expected.=20
=20
These layouts are notably not used for interchange across hardware=20
blocks (e.g. with the display controller). There are other layouts for=20
that but we don't support them either in userspace or kernelspace yet=20
(even downstream), so we don't add modifiers here.=20
=20
Signed-off-by: Alyssa Rosenzweig <mailto:alyssa@rosenzweig.io>=20
---=20
Changes in v3:=20
- Condense comments for clarity and concision.=20
- Add text explaining strides and planes with justification.=20
- Add table giving tile sizes for GPU tiled images.=20
- Tighten up wording.=20
- Link to v2: https://lore.kernel.org/r/20250225-apple-twiddled-modifiers-v=
2-1-cf69729e87f6@rosenzweig.io=20
=20
Changes in v2:=20
- Rename "Twiddled" to "GPU-tiled" to match what I now believe is the canon=
ical name.=20
- Add modifiers for the actual "Twiddled" layouts.=20
- Clarify that the body of compressed images are laid out like their=20
 uncompressed counterparts.=20
- Link to v1: https://lore.kernel.org/r/20250218-apple-twiddled-modifiers-v=
1-1-8551bab4321f@rosenzweig.io=20
---=20
 include/uapi/drm/drm_fourcc.h | 63 +++++++++++++++++++++++++++++++++++++++=
++++=20
 1 file changed, 63 insertions(+)=20
=20
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h=
=20
index e41a3cec6a9ed18760f3b0c88ba437c9aba3dd4f..2e21f71c500ec96b55abb04967f=
20630963f59f8 100644=20
--- a/include/uapi/drm/drm_fourcc.h=20
+++ b/include/uapi/drm/drm_fourcc.h=20
@@ -422,6 +422,7 @@ extern "C" {=20
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09=20
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a=20
 #define DRM_FORMAT_MOD_VENDOR_MTK     0x0b=20
+#define DRM_FORMAT_MOD_VENDOR_APPLE   0x0c=20
=20
 /* add more to the end as needed */=20
=20
@@ -1494,6 +1495,68 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modi=
fier)=20
 /* alias for the most common tiling format */=20
 #define DRM_FORMAT_MOD_MTK_16L_32S_TILE  DRM_FORMAT_MOD_MTK(MTK_FMT_MOD_TI=
LE_16L32S)=20
=20
+/*=20
+ * Apple GPU layouts.=20
+ *=20
+ * Apple GPUs support nonlinear tilings with optional lossless compression=
.=20
+ *=20
+ * Compressed images pad the body to 128-bytes and are immediately followe=
d by a=20
+ * metadata section. The metadata section rounds the image dimensions to=
=20
+ * powers-of-two and contains 8 bytes for each 16x16 compression subtile.=
=20
+ * Subtiles are interleaved (Morton order).=20
+ *=20
+ * All images are 16-byte aligned.=20
+ *=20
+ * These layouts fundamentally do not have meaningful strides. No matter h=
ow we=20
+ * specify strides for these layouts, userspace unaware of Apple image lay=
outs=20
+ * will be unable to use correctly the specified stride for any purpose.=
=20
+ * Userspace aware of the image layouts do not use strides. The most "corr=
ect"=20
+ * convention would be setting the image stride to 0. Unfortunately, some=
=20
+ * software assumes the stride is at least (width * bytes per pixel). We=
=20
+ * therefore require that stride equals (width * bytes per pixel). Since t=
he=20
+ * stride is arbitrary here, we pick the simplest convention.=20
+ *=20
+ * Although containing two sections, compressed image layouts are treated =
in=20
+ * software as a single plane. This is modelled after AFBC, a similar=20
+ * scheme. Attempting to separate the sections to be "explicit" in DRM wou=
ld=20
+ * only generate more confusion, as software does not treat the image this=
 way.=20
+ *=20
+ * For detailed information on the hardware image layouts, see=20
+ * https://docs.mesa3d.org/drivers/asahi.html#image-layouts=20
+ */=20
+=20
+/*=20
+ * Apple GPU-tiled layouts.=20
+ *=20
+ * GPU-tiled images are divided into 16KiB tiles:=20
+ *=20
+ *     Bytes per pixel  Tile size=20
+ *     ---------------  ---------=20
+ *                   1  128x128=20
+ *                   2  128x64=20
+ *                   4  64x64=20
+ *                   8  64x32=20
+ *                  16  32x32=20
+ *=20
+ * Tiles are raster-order. Pixels within a tile are interleaved (Morton or=
der).=C2=A0




"raster-order. Tiles are tightly packed with no padding on the right-hand e=
dge except that which is required to make full tiles."? I think that would =
make the stride stuff more clear.



Either way,



Acked-by: Faith Ekstrand <faith.ekstrand@collabora.com>

+ *=20
+ * GPU-tiled is the preferred layout (compressed if possible).=20
+ */=20
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)=20
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2=
)=20
+=20
+/*=20
+ * Apple twiddled layouts.=20
+ *=20
+ * Twiddled images are padded to power-of-two dimensions. Pixels are inter=
leaved=20
+ * (Morton order).=20
+ *=20
+ * Twiddled layouts are useful for sparse images due to limitation of the=
=20
+ * hardware PBE unit.=20
+ */=20
+#define DRM_FORMAT_MOD_APPLE_TWIDDLED fourcc_mod_code(APPLE, 3)=20
+#define DRM_FORMAT_MOD_APPLE_TWIDDLED_COMPRESSED fourcc_mod_code(APPLE, 4)=
=20
+=20
 /*=20
 * AMD modifiers=20
 *=20
=20
---=20
base-commit: 0ed1356af8f629ae807963b7db4e501e3b580bc2=20
change-id: 20250218-apple-twiddled-modifiers-fde1a6f4300c=20
=20
Best regards,=20
--=20
Alyssa Rosenzweig <mailto:alyssa@rosenzweig.io>
------=_Part_8437004_640660631.1741110124320
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div><br></div><div><br></div><div id=3D"Zm-_Id_-Sgn" d=
ata-sigid=3D"3241918000000049003" data-zbluepencil-ignore=3D"true"><div>~Fa=
ith Ekstrand<br></div></div><div><br></div><div class=3D"zmail_extra_hr" st=
yle=3D"border-top: 1px solid rgb(204, 204, 204); height: 0px; margin-top: 1=
0px; margin-bottom: 10px; line-height: 0px;"><br></div><div class=3D"zmail_=
extra" data-zbluepencil-ignore=3D"true"><div><br></div><div id=3D"Zm-_Id_-S=
gn1">---- On Sat, 01 Mar 2025 16:01:30 -0600 <b>Alyssa Rosenzweig &lt;alyss=
a@rosenzweig.io&gt;</b> wrote ---<br></div><div><br></div><blockquote style=
=3D"margin: 0px;" id=3D"blockquote_zmail"><div>Apple GPUs support various n=
on-linear image layouts. Add modifiers for <br>these layouts. Mesa requires=
 these modifiers to share non-linear buffers <br>across processes, but no o=
ther userspace or kernel support is <br>required/expected. <br> <br>These l=
ayouts are notably not used for interchange across hardware <br>blocks (e.g=
. with the display controller). There are other layouts for <br>that but we=
 don't support them either in userspace or kernelspace yet <br>(even downst=
ream), so we don't add modifiers here. <br> <br>Signed-off-by: Alyssa Rosen=
zweig &lt;<a target=3D"_blank" href=3D"mailto:alyssa@rosenzweig.io">alyssa@=
rosenzweig.io</a>&gt; <br>--- <br>Changes in v3: <br>- Condense comments fo=
r clarity and concision. <br>- Add text explaining strides and planes with =
justification. <br>- Add table giving tile sizes for GPU tiled images. <br>=
- Tighten up wording. <br>- Link to v2: <a target=3D"_blank" href=3D"https:=
//lore.kernel.org/r/20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@ros=
enzweig.io">https://lore.kernel.org/r/20250225-apple-twiddled-modifiers-v2-=
1-cf69729e87f6@rosenzweig.io</a> <br> <br>Changes in v2: <br>- Rename "Twid=
dled" to "GPU-tiled" to match what I now believe is the canonical name. <br=
>- Add modifiers for the actual "Twiddled" layouts. <br>- Clarify that the =
body of compressed images are laid out like their <br> uncompressed counter=
parts. <br>- Link to v1: <a target=3D"_blank" href=3D"https://lore.kernel.o=
rg/r/20250218-apple-twiddled-modifiers-v1-1-8551bab4321f@rosenzweig.io">htt=
ps://lore.kernel.org/r/20250218-apple-twiddled-modifiers-v1-1-8551bab4321f@=
rosenzweig.io</a> <br>--- <br> include/uapi/drm/drm_fourcc.h | 63 +++++++++=
++++++++++++++++++++++++++++++++++ <br> 1 file changed, 63 insertions(+) <b=
r> <br>diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fo=
urcc.h <br>index e41a3cec6a9ed18760f3b0c88ba437c9aba3dd4f..2e21f71c500ec96b=
55abb04967f20630963f59f8 100644 <br>--- a/include/uapi/drm/drm_fourcc.h <br=
>+++ b/include/uapi/drm/drm_fourcc.h <br>@@ -422,6 +422,7 @@ extern "C" { <=
br> #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09 <br> #define DRM_FORMAT_MO=
D_VENDOR_AMLOGIC 0x0a <br> #define DRM_FORMAT_MOD_VENDOR_MTK     0x0b <br>+=
#define DRM_FORMAT_MOD_VENDOR_APPLE   0x0c <br> <br> /* add more to the end=
 as needed */ <br> <br>@@ -1494,6 +1495,68 @@ drm_fourcc_canonicalize_nvidi=
a_format_mod(__u64 modifier) <br> /* alias for the most common tiling forma=
t */ <br> #define DRM_FORMAT_MOD_MTK_16L_32S_TILE  DRM_FORMAT_MOD_MTK(MTK_F=
MT_MOD_TILE_16L32S) <br> <br>+/* <br>+ * Apple GPU layouts. <br>+ * <br>+ *=
 Apple GPUs support nonlinear tilings with optional lossless compression. <=
br>+ * <br>+ * Compressed images pad the body to 128-bytes and are immediat=
ely followed by a <br>+ * metadata section. The metadata section rounds the=
 image dimensions to <br>+ * powers-of-two and contains 8 bytes for each 16=
x16 compression subtile. <br>+ * Subtiles are interleaved (Morton order). <=
br>+ * <br>+ * All images are 16-byte aligned. <br>+ * <br>+ * These layout=
s fundamentally do not have meaningful strides. No matter how we <br>+ * sp=
ecify strides for these layouts, userspace unaware of Apple image layouts <=
br>+ * will be unable to use correctly the specified stride for any purpose=
. <br>+ * Userspace aware of the image layouts do not use strides. The most=
 "correct" <br>+ * convention would be setting the image stride to 0. Unfor=
tunately, some <br>+ * software assumes the stride is at least (width * byt=
es per pixel). We <br>+ * therefore require that stride equals (width * byt=
es per pixel). Since the <br>+ * stride is arbitrary here, we pick the simp=
lest convention. <br>+ * <br>+ * Although containing two sections, compress=
ed image layouts are treated in <br>+ * software as a single plane. This is=
 modelled after AFBC, a similar <br>+ * scheme. Attempting to separate the =
sections to be "explicit" in DRM would <br>+ * only generate more confusion=
, as software does not treat the image this way. <br>+ * <br>+ * For detail=
ed information on the hardware image layouts, see <br>+ * <a target=3D"_bla=
nk" href=3D"https://docs.mesa3d.org/drivers/asahi.html#image-layouts">https=
://docs.mesa3d.org/drivers/asahi.html#image-layouts</a> <br>+ */ <br>+ <br>=
+/* <br>+ * Apple GPU-tiled layouts. <br>+ * <br>+ * GPU-tiled images are d=
ivided into 16KiB tiles: <br>+ * <br>+ *     Bytes per pixel  Tile size <br=
>+ *     ---------------  --------- <br>+ *                   1  128x128 <b=
r>+ *                   2  128x64 <br>+ *                   4  64x64 <br>+ =
*                   8  64x32 <br>+ *                  16  32x32 <br>+ * <br=
>+ * Tiles are raster-order. Pixels within a tile are interleaved (Morton o=
rder).&nbsp;</div></blockquote></div><div><br></div><div>"raster-order. Til=
es are tightly packed with no padding on the right-hand edge except that wh=
ich is required to make full tiles."? I think that would make the stride st=
uff more clear.<br></div><div><br></div><div>Either way,<br></div><div><br>=
</div><div>Acked-by: Faith Ekstrand &lt;faith.ekstrand@collabora.com&gt;</d=
iv><div class=3D"zmail_extra" data-zbluepencil-ignore=3D"true"><blockquote =
style=3D"margin: 0px;" id=3D"blockquote_zmail"><div><br>+ * <br>+ * GPU-til=
ed is the preferred layout (compressed if possible). <br>+ */ <br>+#define =
DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1) <br>+#define DRM_F=
ORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2) <br>+ <br>+/=
* <br>+ * Apple twiddled layouts. <br>+ * <br>+ * Twiddled images are padde=
d to power-of-two dimensions. Pixels are interleaved <br>+ * (Morton order)=
. <br>+ * <br>+ * Twiddled layouts are useful for sparse images due to limi=
tation of the <br>+ * hardware PBE unit. <br>+ */ <br>+#define DRM_FORMAT_M=
OD_APPLE_TWIDDLED fourcc_mod_code(APPLE, 3) <br>+#define DRM_FORMAT_MOD_APP=
LE_TWIDDLED_COMPRESSED fourcc_mod_code(APPLE, 4) <br>+ <br> /* <br> * AMD m=
odifiers <br> * <br> <br>--- <br>base-commit: 0ed1356af8f629ae807963b7db4e5=
01e3b580bc2 <br>change-id: 20250218-apple-twiddled-modifiers-fde1a6f4300c <=
br> <br>Best regards, <br>-- <br>Alyssa Rosenzweig &lt;<a target=3D"_blank"=
 href=3D"mailto:alyssa@rosenzweig.io">alyssa@rosenzweig.io</a>&gt; <br> <br=
></div></blockquote></div><div><br></div></div><br></body></html>
------=_Part_8437004_640660631.1741110124320--

