Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395402F296B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CF26E07D;
	Tue, 12 Jan 2021 07:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6CC4D89EEB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 01:54:51 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [124.64.18.63])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxpbxgAf1f6+ECAA--.2474S2;
 Tue, 12 Jan 2021 09:54:46 +0800 (CST)
From: Zhaoge Zhang <zhangzhaoge@loongson.cn>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Fix macro name DRM_MODE_PROP_OBJECT in code comment
Date: Tue, 12 Jan 2021 09:54:39 +0800
Message-Id: <1610416479-32736-1-git-send-email-zhangzhaoge@loongson.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: AQAAf9AxpbxgAf1f6+ECAA--.2474S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw43uFyxXFyUCFWktrW7twb_yoW3JFc_Ca
 47Wa1kWwnrZrW29w17Za9rKrsak3s5GF4DWr95A3Z8Aw4DAr13Jay8Wr93tr13WrsFqryF
 qa18Zry3AF1xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbc8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6w4l42xK
 82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
 C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
 MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
 IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
 6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2txhDUUUU
X-CM-SenderInfo: x2kd0w52kd0w3h6o00pqjv00gofq/
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Zhaoge Zhang <zhangzhaoge@loongson.cn>
---
 include/drm/drm_property.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 4a0a80d..bbf5c1fd 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -114,7 +114,7 @@ struct drm_property {
 	 *     by the property. Bitmask properties are created using
 	 *     drm_property_create_bitmask().
 	 *
-	 * DRM_MODE_PROB_OBJECT
+	 * DRM_MODE_PROP_OBJECT
 	 *     Object properties are used to link modeset objects. This is used
 	 *     extensively in the atomic support to create the display pipeline,
 	 *     by linking &drm_framebuffer to &drm_plane, &drm_plane to
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
