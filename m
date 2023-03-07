Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085B6AD63D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 05:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AFB10E357;
	Tue,  7 Mar 2023 04:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0928010E357
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 04:38:01 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q23so6884696pgt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 20:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678163880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9VGm/0OBe4lAdq+mNIj50o86iCXlM99JOVqeZjGU0HM=;
 b=m5q7tcYe74Q04eb+DWS1HqvwG/PBGlBslHW8GZAqGwsClnIDujkyvISWnWWCbflmwZ
 WDAUN+8G+H7TI5VTUc7o1fNZkV1cgve4hbWNyFjb9gdBaZxrVa/T3TTxwt6s2R6Vap9g
 XeYrEzdNb0jzc6TyyNEP+0nE1PQOtC6z6+JH3kMH+jE3nPCrtj9P4n5nYMgNgYyg+2a/
 IJH3an43VvtEOw6L29SS0sNdePyo1vtrmc3gJkZp6m5WUig6sHXaUmf2IrO8LmcvUCKu
 acStDk/B60RMILSiW0LaMygus62FX75WlMBVaZ55fisUfw+nMokmFmZUOHSnym4f+eJG
 9J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678163880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9VGm/0OBe4lAdq+mNIj50o86iCXlM99JOVqeZjGU0HM=;
 b=X6YEu69FxgRk6GPhDvG/Swb3HQX5MJWkvP7EYJN4zCU310LHE9UjUjbmBiQIF2tiiX
 48C5a6eBZkOko9uN3YLvXUF3BfVQ5vwd4wla5OdEaDPf/MbSpqTNqjl5RE+h7ENxiNja
 EwvWjG1hrJll7fEfbRK6cS+Hh2m0zdvAX+srWIxqYPHoAS8VvC3Lkq70cyiJ2/AqLLwb
 GUQ7Qf/pT0Dx5Nz2unXo7ZIGdXAB5vM4tKmjFKwopEtx3l3Jr3+T8U1EqOv5qR9El6Va
 8BVYgaHjT8QRJ2qrZPksBLje67c8wK6fkeWqBnvydgndteuSJVZbcZOxku12E496S/tc
 /w0A==
X-Gm-Message-State: AO0yUKWCjR1pwKF8DNV8rKXYPBmmAS8Jz0KezwBlx83P4qfT0gjXxB+g
 +CmNomTsaP59vENAwIDFXw0=
X-Google-Smtp-Source: AK7set9afnIGTS0xOCj4X8sTfiQbfNLMSVLqqBUh+gnE+PeMAE0EGzcvQYKlYAlMFhtVVEiS50PW3g==
X-Received: by 2002:aa7:973d:0:b0:5a8:ab21:be2e with SMTP id
 k29-20020aa7973d000000b005a8ab21be2emr9435881pfg.18.1678163880487; 
 Mon, 06 Mar 2023 20:38:00 -0800 (PST)
Received: from debian.me (subs02-180-214-232-76.three.co.id. [180.214.232.76])
 by smtp.gmail.com with ESMTPSA id
 v6-20020aa78506000000b005dd975176c3sm7062459pfn.53.2023.03.06.20.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 20:38:00 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id B283110541F; Tue,  7 Mar 2023 11:37:55 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] accel: Link to compute accelerator subsystem intro
Date: Tue,  7 Mar 2023 11:35:26 +0700
Message-Id: <20230307043525.25660-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351; i=bagasdotme@gmail.com;
 h=from:subject; bh=bamdze7HsRu/UGKK7VIjGzsdYb1bczhaTZM9tydpM3c=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCls+3l2OtQ6+tawi7mdXM3DqLUvsHGqXMeVi2GCv0OLVs3d
 E9fdUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIlMl2JkeBU/1aIjbs6DPrcbx0ze8M
 4qFz24a8H935MzYtyENk16OJeR4XVi3uHPp2KSPgqm8N0+3lLsy3Jgu9OEmex/5kz4H6zJyQEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
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
Cc: Dylan Le <self@dylanle.dev>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 2c204f3d53218d ("accel: add dedicated minor for accelerator
devices") adds link to accelerator nodes section of DRM internals doc
(Documentation/gpu/drm-internals.rst), but the target doesn't exist.
Instead, there is only an introduction doc for computer accelerator
subsytem.

Link to that doc until there is documentation of accelerator internals.

Fixes: 2c204f3d53218d ("accel: add dedicated minor for accelerator devices")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---

 This comes from discussion on Dylan Le's attempted fix, where Jeffrey
 Hugo suspected that the proper target should be accelerator subsystem
 doc [2].

 [1]: https://lore.kernel.org/linux-doc/7799513f0fb5aee27b64752c037980471be669c5.1677120686.git.self@dylanle.dev/
 [2]: https://lore.kernel.org/linux-doc/CAOCk7NrAKZ2G-VbQW3MJUZmkKkO1Ccrs2wo12kg6QHysH-d=Yg@mail.gmail.com/

 include/drm/drm_file.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 0d1f853092ab8a..ecffe24e2b1b0a 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -408,7 +408,8 @@ static inline bool drm_is_render_client(const struct drm_file *file_priv)
  * Returns true if this is an open file of the compute acceleration node, i.e.
  * &drm_file.minor of @file_priv is a accel minor.
  *
- * See also the :ref:`section on accel nodes <drm_accel_node>`.
+ * See also :doc:`Introduction to compute accelerators subsystem
+ * </accel/introduction>`.
  */
 static inline bool drm_is_accel_client(const struct drm_file *file_priv)
 {

base-commit: 5c8cf1664f288098a971a1d1e65716a2b6a279e1
-- 
An old man doll... just what I always wanted! - Clara

