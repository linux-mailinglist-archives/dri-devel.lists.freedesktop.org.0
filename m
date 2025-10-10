Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C6BCCB2D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 13:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13EC10EBB1;
	Fri, 10 Oct 2025 11:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="O4cwVJZr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com
 [203.205.221.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60C910EBB1;
 Fri, 10 Oct 2025 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1760094554; bh=Va2a4D98hjnu9LEgc09fJiZkCEmkyPryN1JxjQF74wc=;
 h=From:To:Cc:Subject:Date;
 b=O4cwVJZrHuDbPIRQ2gbg5u8CsGQ3RarVUCarkxiNnCP1/fD1NXjtkYu9Q3kly8Lyg
 8rN02t0hjEElM6fynLwWjTGQW/LWtnnLy1i7Ea4rUq9BF8+DIsGQVcsezo4qMLsOEY
 Vqns3xInCWSuBZh3aK/6fYwP0qlwKgGmJ+Djt0qs=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
 id C9238DF; Fri, 10 Oct 2025 19:03:09 +0800
X-QQ-mid: xmsmtpt1760094189th75kxfie
Message-ID: <tencent_001410A13E4527AF944A2844EC4F54EC2E07@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+f2RC3BlwYiizd3prbv3hYezNwInt+laiQwFkK5HXIhSEisvqjc
 O5UX/TsKVHDGxK8QJ5/2eNg8WWt2ZbP8GKTX1SmhnAO+SoePYqc5j3PrCLN7rrfvvD4fMGriWazF
 Z97zBRuqcQ1xkKUWC1h7oNAPEx7ZAMPac7UrG3UkhTYPWpW6EBLeBxdZQfUcI3mO3/KMDV9wtRtM
 Ih50G0DR0WUggFygIiswb7gDbvgTREsPNGw2/7wPoMeNm9EEWc7k5yu2mzu7oYlzaEGPvjVYL+93
 aSPIIyh46YVkngiKw0R8Xvl+H3oQ47KzS2zBi+Nsi5sEISt760YfRWuSf+EKpYRblIOpVDhnlfZB
 0OTkEca41NXOk4qaLmR+3bIs6HnTaKcRDLXtvlEjdnApqGAUNe9BONoTCsck4M3qF8vvWhcsfDhb
 okvTwmp+Oj/B2kns2UhpPScMxIVgpWqqYO9otzeSQGRF5gP+w6wqN0bcZ15nUptubKGpGvYjSPtk
 C4SEUYWIW83i4jmKW+REPzwVNuLizOSc0IpzDiiG9XjCjkjCHFhLLNkPtH6tAHc+TdvRCpPhgBHs
 vlj41Yn1x+ETbzsaHfJCP386d0Ja/KqUr1NISzkfC/nrvBSWho3URHe5UTBn9Fwd7nqP7FN5q6Uc
 6COXDBfBzQmYBcuoTdv64nv1it2EAQ82JNBEC7ITE/ziuh2pHQWvUwCeP0oR1706puEbccuiNGPt
 Pj1yDtc50DG0GU9a8SrONYZ1YACBWiIbId9H16rjRqKAVCAS3kAuz8ktyDTmIoJPASrpAZ6MGDAy
 zvq9JCGDZ+JAyfToZ2luGSL2HXWKnu69qjg5W/BEVDqZGfEtTLI4B/MWGT3dVOhWBsE8BMoAPdM4
 SrSY2DX3avIpde27emxwXm47mdH6Fnc9aNWSuXuKOeW7lJVWdBQUm6HMPk+VZGjnLnQpLc1dnIu9
 uvkrkJbZkVXvpyARHZ8C+N5B8apom4r84T4waZaGw=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: 2564278112@qq.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wang Jiang <jiangwang@kylinos.cn>
Subject: [PATCH] drm/radeon: Solve the problem of the audio options not
 disappearing promptly after unplugging the HDMI audio.
Date: Fri, 10 Oct 2025 19:03:07 +0800
X-OQ-MSGID: <20251010110307.226431-1-2564278112@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Jiang <jiangwang@kylinos.cn>

The audio detection process in the Radeon driver is as follows:
radeon_dvi_detect/radeon_dp_detect -> radeon_audio_detect -> radeon_audio_enable -> radeon_audio_component_notify -> radeon_audio_component_get_eld
When HDMI is unplugged, radeon_dvi_detect is triggered.
At this point, radeon_audio_detect is triggered before radeon_dvi_detect has finished (which also means the new state of the connector has not been reported).
In this scenario, radeon_audio_detect can detect that the connector is disconnected (because the parameter is passed down),
 but it is very likely that the audio callback function radeon_audio_component_get_eld cannot detect the disconnection of the connector.
As a result, when the audio component (radeon_audio_component_get_eld) performs detection, the connector's state is not shown as disconnected,
and connector->eld is not zero, causing the audio component to think the audio driver is still working.
I have added a new member (enable_mask) to the audio structure to record the audio enable status.
Only when radeon_audio_component_get_eld detects that enable_mask is not zero will it continue to work.

Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
---
 drivers/gpu/drm/radeon/radeon.h       | 1 +
 drivers/gpu/drm/radeon/radeon_audio.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 63c47585afbc..2d0a411e3ed6 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -1745,6 +1745,7 @@ struct r600_audio_pin {
 	u32			offset;
 	bool			connected;
 	u32			id;
+	u8			enable_mask;
 };
 
 struct r600_audio {
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 8d64ba18572e..a0717895cc8a 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -212,6 +212,7 @@ static void radeon_audio_enable(struct radeon_device *rdev,
 	if (rdev->audio.funcs->enable)
 		rdev->audio.funcs->enable(rdev, pin, enable_mask);
 
+	rdev->audio.pin[pin->id].enable_mask = enable_mask;
 	radeon_audio_component_notify(rdev, pin->id);
 }
 
@@ -274,6 +275,7 @@ int radeon_audio_init(struct radeon_device *rdev)
 		rdev->audio.pin[i].connected = false;
 		rdev->audio.pin[i].offset = pin_offsets[i];
 		rdev->audio.pin[i].id = i;
+		rdev->audio.pin[i].enable_mask = 0;
 	}
 
 	radeon_audio_interface_init(rdev);
@@ -760,6 +762,9 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 	if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initialized)
 		return 0;
 
+	if (rdev->audio.pin[port].enable_mask == 0)
+		return 0;
+
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		const struct drm_connector_helper_funcs *connector_funcs =
 				connector->helper_private;
-- 
2.25.1

