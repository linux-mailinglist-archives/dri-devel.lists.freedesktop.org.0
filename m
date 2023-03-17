Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B976BE318
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3345010EE65;
	Fri, 17 Mar 2023 08:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4781E10EE5E;
 Fri, 17 Mar 2023 08:22:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDF51B824F3;
 Fri, 17 Mar 2023 08:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5376C433EF;
 Fri, 17 Mar 2023 08:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041362;
 bh=e/el3O/A1UgFfDEmDRZYS7OolJfnj2ACdH8OTNTnlj8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z9MBk22I4TIw7eMlENbYvYjSjpYCRZmcvQXO2Xg5zyQn4kdQ5M/oShwbToap7MgWZ
 nM2Ff76rkB9dXEa9azdPX7NwbqN8hMM2z9rqOmxkjlLKmp5XQIFsKBsLA72CgOoAIX
 /02PAjVgEwnp9eGC1PEhxuRkqrZBPt5Q2kNnEdSPatUf4F/ziuQxD5kyGM+5KRCfFo
 Fj7tN7La0tGlI6PiU0a57LugS/lMuBc1CisLkXI9JFaHO5Nl/rnvJxd7aOBA1xL/54
 zaov6bknAF90glfzYYQVzwbybQvNd1XTqfvjSo2Uj5egpBjurWf/1a4hFKsz0hykkk
 PRPXTJDGFjdEQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/37] =?UTF-8?q?drm/nouveau/nvkm/nvfw/acr:=20Make=20local?=
 =?UTF-8?q?=20function=20=E2=80=98wpr=5Fgeneric=5Fheader=5Fdump=E2=80=99?=
 =?UTF-8?q?=20static?=
Date: Fri, 17 Mar 2023 08:16:51 +0000
Message-Id: <20230317081718.2650744-11-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for ‘wpr_generic_header_dump’ [-Wmissing-prototypes]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gourav Samaiya <gsamaiya@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
index 83a9c48bc58cb..7ac90c495737a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
@@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const struct wpr_header_v1 *hdr)
 	nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
 }
 
-void
+static void
 wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_generic_header *hdr)
 {
 	nvkm_debug(subdev, "wprGenericHeader\n");
-- 
2.40.0.rc1.284.g88254d51c5-goog

