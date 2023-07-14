Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE575389D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9420010E86B;
	Fri, 14 Jul 2023 10:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0210E86B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:46:11 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689331569; x=1689590769;
 bh=F88L1jddDY0lJbDr0j8tOCNblklIgEUw4HUYT/cLCZY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Jw3e7fhIBpB0TFm64KbXc8dQjpiKyBEc2iv2vaKA9t+OeiWZguZ44IE8vVAMr0nCB
 N5renVnXw8Cj4YDzyrc9EZx0JRuMS1qMgNKXZcMXDBr91blFDvS0AE7JRdxQQBlGP/
 WuKGquhsbtu52hENlkGxUA6PChxGlXAdPwUjuxFUuEepCDtLgS5JWtQlj3MfqXFOaP
 BUmHoECgD6RuGJgFHvWkJ54Y61l8uCy689qb2oN+8M5QuxhX31C4gPOwTHwdzGgchH
 lq2wZiLm7uQx2EjIhAm0AOKKRNSWMnf735ntQ53i6MaGxwL7SYkiWOobMWS4KUxZu1
 AmnPGvakgRwnA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [RFC PATCH 3/3] drm/file: drop DRM_MINOR_CONTROL
Message-ID: <20230714104557.518457-3-contact@emersion.fr>
In-Reply-To: <20230714104557.518457-1-contact@emersion.fr>
References: <20230714104557.518457-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This entry should never be used by the kernel. Record the historical
context in a comment.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: James Zhu <James.Zhu@amd.com>
Cc: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/drm/drm_file.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 010239392adf..a23cc2f6163f 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -53,12 +53,14 @@ struct file;
 /* Note that the values of this enum are ABI (it determines
  * /dev/dri/renderD* numbers).
  *
+ * There used to be a DRM_MINOR_CONTROL =3D 1 entry, but such nodes were n=
ever
+ * exposed. Still, some user-space has logic to handle them.
+ *
  * Setting DRM_MINOR_ACCEL to 32 gives enough space for more drm minors to
  * be implemented before we hit any future
  */
 enum drm_minor_type {
 =09DRM_MINOR_PRIMARY =3D 0,
-=09DRM_MINOR_CONTROL =3D 1,
 =09DRM_MINOR_RENDER =3D 2,
 =09DRM_MINOR_ACCEL =3D 32,
 };
--=20
2.41.0


