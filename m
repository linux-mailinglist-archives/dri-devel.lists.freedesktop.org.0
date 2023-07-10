Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1BA74D346
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 12:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AFA10E25C;
	Mon, 10 Jul 2023 10:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1EDA810E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 10:24:16 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxTetP3KtkHBkDAA--.3830S3;
 Mon, 10 Jul 2023 18:24:15 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx7yNP3Ktk6SYnAA--.5526S2; 
 Mon, 10 Jul 2023 18:24:15 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Sui Jingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
Date: Mon, 10 Jul 2023 18:24:11 +0800
Message-Id: <20230710102411.257970-1-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx7yNP3Ktk6SYnAA--.5526S2
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KrWDXrykAr18GrW3CF48AFc_yoW8tF1rp3
 9FkryFkrW5Jrn7tr9rJwn8KrZxuayxGryIgFWUGw1SqFW0kry3Jr1kurZrurW7ZrW7G347
 trn7CFs0ga1UK3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUclApUUUUU
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
Cc: loongson-kernel@lists.loongnix.cn, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because smatch warnings:

drivers/gpu/drm/loongson/lsdc_plane.c:199
lsdc_cursor_plane_atomic_async_check()
warn: variable dereferenced before check 'state' (see line 180)

vim +/state +199 drivers/gpu/drm/loongson/lsdc_plane.c

174  static int
     lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
175                                       struct drm_atomic_state *state)
176  {
177          struct drm_plane_state *new_state;
178          struct drm_crtc_state *crtc_state;
179
180          new_state = drm_atomic_get_new_plane_state(state, plane);
                                                        ^^^^^
state is dereferenced inside this function

181
182  if (!plane->state || !plane->state->fb) {
183          drm_dbg(plane->dev, "%s: state is NULL\n", plane->name);
184                  return -EINVAL;
185  }
186
187  if (new_state->crtc_w != new_state->crtc_h) {
188          drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
189                  new_state->crtc_w, new_state->crtc_h);
190          return -EINVAL;
191  }
192
193  if (new_state->crtc_w != 64 && new_state->crtc_w != 32) {
194          drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
195                  new_state->crtc_w, new_state->crtc_h);
196          return -EINVAL;
197  }
198
199  if (state) {
         ^^^^^
Checked too late!

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202307100423.rV7D05Uq-lkp@intel.com/
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/lsdc_plane.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index 2ab3db982aa3..0d5094633222 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -196,13 +196,7 @@ static int lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	if (state) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
-	} else {
-		crtc_state = plane->crtc->state;
-		drm_dbg(plane->dev, "%s: atomic state is NULL\n", plane->name);
-	}
-
+	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
 	if (!crtc_state->active)
 		return -EINVAL;
 
-- 
2.34.1

