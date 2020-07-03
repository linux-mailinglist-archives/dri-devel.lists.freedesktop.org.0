Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E145F21530B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FCD6E25D;
	Mon,  6 Jul 2020 07:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98146E142
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 13:38:21 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id d194so11753812pga.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 06:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=VFd81vfcBlp3Es3dpBrxLjfarRsAbMK7vh/f9iOrSDw=;
 b=NuCxf3z6WqYbYeQD/SMMZHBdiw6c5t9v2q2YxbZrv6Zaojas+kJuGUPC1ScH7uZsRR
 nhRA4XbnmEDBnvoEL/VQb4tVkpOR+vU5/B7CoUjVkszSCSjS3uj0/hyrUqVqFQvFz9j4
 QT+FXMZBN4nUHJPeu86Z45y33e3NPSmT2+OLc+/8MdEUhStLRgzRPTFwyMpEvmH7fV/w
 95tZySfGDiSLOx1MtiJ9PrDDwRtQgo+nHLid4jIjTgr+SBXiNUXdvNw1Ltzth6tQgsOM
 IjHE+gYbI63OwcA5yBDU4LFKa9ZLSzzVgCmKLlUXiMJcVdwNuHmQOtnQaRQg4cN/xmxB
 gRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=VFd81vfcBlp3Es3dpBrxLjfarRsAbMK7vh/f9iOrSDw=;
 b=LpHzSHvrd7nRQ3QwR4Nn0OBrAoThhElIFBCDA/BkHgX15m0c7JLwbcZAczjpYZMuGm
 4efU1YTIFfGSGAlmSVjAfPXJZ8eYIjPvykFcATs1ry3bXVxK5oBC0Z+Yw/lhpQA7SW33
 Fz5H3RCVGZKf7eqe6Of5ZAjtIxJWTulJgK5Ks1XlqmBFnQwT3qb5sysOyTcWVItJsNyk
 xGyRwDJPTIAwezUFa5UxZKPXdZcOKvcQ/khbPXHFrh2CAEKydyH06AqLOwllTqPLA/zw
 Owd7Nryy0EdLSM7xjWiu1F+7rv84pkFusCitia1k4GpSK21Fs92jxutsFgk6tsHTSDz5
 c0Gw==
X-Gm-Message-State: AOAM530SsYSS+jtbfGWDpTg64zrO38xPrkYyTUgK9nMSQDOlQZlB7YQe
 E7R7jGaskp4vrnwFDGytDm4=
X-Google-Smtp-Source: ABdhPJyfIBGoalH1o3MDckuQZrNhSkZAWShuJgSblfifU72BKYDJBrIzFNPbd90TLvmj4l57K/RIwQ==
X-Received: by 2002:a63:db46:: with SMTP id x6mr26092809pgi.265.1593783501349; 
 Fri, 03 Jul 2020 06:38:21 -0700 (PDT)
Received: from blackclown ([103.88.83.224])
 by smtp.gmail.com with ESMTPSA id d9sm12219404pgv.45.2020.07.03.06.38.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 Jul 2020 06:38:20 -0700 (PDT)
Date: Fri, 3 Jul 2020 19:08:06 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org
Subject: [PATCH] drm: connector: Indent code using tabs.
Message-ID: <20200703133805.GA11191@blackclown>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1957866753=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1957866753==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace space-indents with tab-indents.
Issues found with checkpatch.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 38 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 00e40a26a800..441d4075dfa5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1906,11 +1906,11 @@ int drm_connector_set_path_property(struct drm_conn=
ector *connector,
 	int ret;
=20
 	ret =3D drm_property_replace_global_blob(dev,
-	                                       &connector->path_blob_ptr,
-	                                       strlen(path) + 1,
-	                                       path,
-	                                       &connector->base,
-	                                       dev->mode_config.path_property);
+					       &connector->path_blob_ptr,
+					       strlen(path) + 1,
+					       path,
+					       &connector->base,
+					       dev->mode_config.path_property);
 	return ret;
 }
 EXPORT_SYMBOL(drm_connector_set_path_property);
@@ -1936,11 +1936,11 @@ int drm_connector_set_tile_property(struct drm_conn=
ector *connector)
=20
 	if (!connector->has_tile) {
 		ret  =3D drm_property_replace_global_blob(dev,
-		                                        &connector->tile_blob_ptr,
-		                                        0,
-		                                        NULL,
-		                                        &connector->base,
-		                                        dev->mode_config.tile_property);
+							&connector->tile_blob_ptr,
+							0,
+							NULL,
+							&connector->base,
+							dev->mode_config.tile_property);
 		return ret;
 	}
=20
@@ -1951,11 +1951,11 @@ int drm_connector_set_tile_property(struct drm_conn=
ector *connector)
 		 connector->tile_h_size, connector->tile_v_size);
=20
 	ret =3D drm_property_replace_global_blob(dev,
-	                                       &connector->tile_blob_ptr,
-	                                       strlen(tile) + 1,
-	                                       tile,
-	                                       &connector->base,
-	                                       dev->mode_config.tile_property);
+					       &connector->tile_blob_ptr,
+					       strlen(tile) + 1,
+					       tile,
+					       &connector->base,
+					       dev->mode_config.tile_property);
 	return ret;
 }
 EXPORT_SYMBOL(drm_connector_set_tile_property);
@@ -2024,10 +2024,10 @@ int drm_connector_update_edid_property(struct drm_c=
onnector *connector,
=20
 	ret =3D drm_property_replace_global_blob(dev,
 					       &connector->edid_blob_ptr,
-	                                       size,
-	                                       edid,
-	                                       &connector->base,
-	                                       dev->mode_config.edid_property);
+					       size,
+					       edid,
+					       &connector->base,
+					       dev->mode_config.edid_property);
 	if (ret)
 		return ret;
 	return drm_connector_set_tile_property(connector);
--=20
2.17.1


--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl7/NL0ACgkQ+gRsbIfe
745R2Q/+MrJ/7YsoeXHWQ5EIqUEJZeTQ0ohelFWFDlBOMNFjEWFIa9YI2+PK+zCS
e+1Mm8vso9bcMBm42ahPUXkd42SKmUUTABQuq2FU15XQn0A7M9LOFliEqpmAnSYi
BkOztVjxxq3rTcCM7VfGn7oytGtctu3Aruhk3MvdyvoTBzxRhLXLBuQfPfesUQoc
ErzUBg4JAAD07erPir1XeliEQ/616qL+mozqqsnu5Ol7p9wV0zrmhLyF1uZIFYVT
eP0V8YQEaJWOHXgplefcCY0f3kYnac971IzQgh9x13cgqYez22WTq6PmedP70/AY
EQza2Qei/dsWHq6pUIaMjdTVes8psBnKTRriaJu68RSISID8oInueDUNcwD+tdrQ
/gdHqppTadpozO36GjvCm72MJIQHoAveK8sqy/mF3UTWt5qucSgGk10sBMH3E7/f
lhyGQiTRFVANRzBjPwrJu+lABL9dd0ItKJfzibydagcgs0GtKHVYIuv3hpHx5ARg
YDzhq+tizgl6Vir8sBEPTKuywCANYRTlugutNitBO3IB/UzAmDSj8E+vUAK3XD6i
7jFQnFeDpQNB5bAtVPXbuoioxAwXGQ49Mb3S7I6LjEJLiEXsLNftcVaTIeyhVqPb
aMVP4fp6jfOlVu+NLMUVJLzR51e+fnAd+srKegPLDbV4OSSD4S4=
=yF/2
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--

--===============1957866753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1957866753==--
