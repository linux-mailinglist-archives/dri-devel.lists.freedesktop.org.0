Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0006F14E1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 12:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4245B10ECA2;
	Fri, 28 Apr 2023 10:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7874010ECAE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 10:01:47 +0000 (UTC)
Date: Fri, 28 Apr 2023 10:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1682676104; x=1682935304;
 bh=6YN8T8owtd4li0gDN/0X8nJ0xexeERh39+ubt9+AR5I=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=pW+/zqdfS+tFUy9kOu7235Qn37qk6MBYk8ImzyM00/sgcAGGCH2Kbeaj09FzFWJvl
 q4Ol0Yj7YxfayljUluhTsU1OZ0jDSJK8svHKzrFcwUcRjVv3eQRxcWXGaFaOyTVfNf
 GlaZ02bFpJEBqlaYjXDHmE0yObYRasKOVFuFRUcGM6yC6ityx08F7axG2sohUIg45U
 +9Lj1mTPDu5XkYkKHHrz/+4tXVH0WhQmhD//WvN8s5a/rcCCo+O+iNNwd3GdXilPZO
 AONoimLvfLdRZgM7A0ItEHOMWASJMoW4TmS9kk8TjQehWGuo/Nf/GMfpMGLDawh6jK
 bQqnxRYYYzvpA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 3/3] drm: add enum drm_hdr_metadata_eotf
Message-ID: <20230428100115.9802-3-contact@emersion.fr>
In-Reply-To: <20230428100115.9802-1-contact@emersion.fr>
References: <20230428100115.9802-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoids hardcoding magic numbers in user-space, and makes the docs
clearer.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 include/uapi/drm/drm_mode.h | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c0c40dc9e2f1..eb2a38c73ae0 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -859,6 +859,31 @@ enum drm_hdr_metadata_type {
 =09DRM_HDR_STATIC_METADATA_TYPE1 =3D 0,
 };
=20
+/**
+ * enum drm_hdr_metadata_eotf - Electro-Optical Transfer Function.
+ */
+enum drm_hdr_metadata_eotf {
+=09/**
+=09 * @DRM_HDR_METADATA_EOTF_TRADITIONAL_GAMMA_SDR: traditional gamma, SDR
+=09 * luminance range.
+=09 */
+=09DRM_HDR_METADATA_EOTF_TRADITIONAL_GAMMA_SDR =3D 0,
+=09/**
+=09 * @DRM_HDR_METADATA_EOTF_TRADITIONAL_GAMMA_HDR: traditional gamma, HDR
+=09 * luminance range.
+=09 */
+=09DRM_HDR_METADATA_EOTF_TRADITIONAL_GAMMA_HDR =3D 1,
+=09/**
+=09 * @DRM_HDR_METADATA_EOTF_SMPTE_ST_2084: SMPTE ST 2084.
+=09 */
+=09DRM_HDR_METADATA_EOTF_SMPTE_ST_2084 =3D 2,
+=09/**
+=09 * @DRM_HDR_METADATA_EOTF_HLG_BT2100: Hybrid Log-Gamma (HLG) based on
+=09 * ITU-R BT.2100-0.
+=09 */
+=09DRM_HDR_METADATA_EOTF_HLG_BT2100 =3D 3,
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
@@ -871,7 +896,7 @@ enum drm_hdr_metadata_type {
 struct hdr_metadata_infoframe {
 =09/**
 =09 * @eotf: Electro-Optical Transfer Function (EOTF)
-=09 * used in the stream.
+=09 * used in the stream. See enum drm_hdr_metadata_eotf.
 =09 */
 =09__u8 eotf;
 =09/**
--=20
2.40.1


