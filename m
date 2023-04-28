Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335906F14DE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 12:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711CA10E3B6;
	Fri, 28 Apr 2023 10:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7F810E3B6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 10:01:32 +0000 (UTC)
Date: Fri, 28 Apr 2023 10:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1682676089; x=1682935289;
 bh=iO6ySNGWg8GkzQ6zIK96En/QGrGWcd7YAR2KROIu5J8=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=a7CBJfwCtaMexk2zX8ScEtkKL4kFc8RtycVYyzu8id3fIeVWzleZs/tCAUyfCrDRM
 aAJeHfL/ItGstwofe1GQkfhqnwvo8rObT/cwXPj2C4XR1uv4oiIuMFU2NXmdPF2YcX
 HWkPK+azfe4jpohPA2x9VDmr80mdg68Y8B63YrWxWCe5LviVNtEgnp4kHrAxbNTMrb
 i2fmvR+MKcifIK1vzq+cSY862lWVUb5QgVqT56ETsDLTx/sJmdutQE5/7Shqwry2Li
 VUWxKgcmr22U2ZrKGhjldpZeChNh5mI9sq3gbqQoo8s1DZtCHxOU9t3Ax//ghopP39
 vGX1TJTe6wnqg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/3] drm: fix code style for embedded structs in
 hdr_metadata_infoframe
Message-ID: <20230428100115.9802-1-contact@emersion.fr>
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

Only the stuff inside the brackets should be indented.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 include/uapi/drm/drm_mode.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..997d23fb2d68 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -878,7 +878,7 @@ struct hdr_metadata_infoframe {
 =09 */
 =09struct {
 =09=09__u16 x, y;
-=09=09} display_primaries[3];
+=09} display_primaries[3];
 =09/**
 =09 * @white_point: White Point of Colorspace Data.
 =09 * These are coded as unsigned 16-bit values in units of
@@ -889,7 +889,7 @@ struct hdr_metadata_infoframe {
 =09 */
 =09struct {
 =09=09__u16 x, y;
-=09=09} white_point;
+=09} white_point;
 =09/**
 =09 * @max_display_mastering_luminance: Max Mastering Display Luminance.
 =09 * This value is coded as an unsigned 16-bit value in units of 1 cd/m2,
--=20
2.40.1


