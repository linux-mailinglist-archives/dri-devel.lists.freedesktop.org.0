Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D7C939D62
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 11:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B7210E508;
	Tue, 23 Jul 2024 09:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bQb7Bvgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA6810E4FB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721726195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TefpIFM/hYJAhndMJumSf9gCCpA96xbCMh0IQFzWh0M=;
 b=bQb7BvgbdFIDQMFAjYbs5v0Fw37sZNeRAy+SaE4ifiOHZAyZd/WVEhzJS0Cr9UgHmC2/aC
 h3Pumx8iXY2zUm8TvHvgAUQQjDzNoRDtOg5zELoFdWa+UrAIlyk0lj/sHTZ9OVH8BTYJgA
 /A2YffXod5pydEqh11/PJ8LXdWTA7rc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-NLfWdbPXPOeqdg_Giun6lg-1; Tue,
 23 Jul 2024 05:16:30 -0400
X-MC-Unique: NLfWdbPXPOeqdg_Giun6lg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6D299195608A; Tue, 23 Jul 2024 09:16:29 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.165])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 744C41955D48; Tue, 23 Jul 2024 09:16:26 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 5/5] drm/panic: Add panic description
Date: Tue, 23 Jul 2024 11:11:34 +0200
Message-ID: <20240723091553.286844-6-jfalempe@redhat.com>
In-Reply-To: <20240723091553.286844-1-jfalempe@redhat.com>
References: <20240723091553.286844-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Now that kmsg dump callback has the description parameter, use it in
the user panic screen.
This is the string passed to panic(), like "VFS: Unable to mount root
fs on xxx" or "Attempted to kill init! exitcode=0xxxx".
It gives a hint on why the panic occurred, without being too cryptic.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 2efede7fa23a..fb283695f50e 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -81,6 +81,8 @@ static struct drm_panic_line panic_msg[] = {
 	PANIC_LINE("KERNEL PANIC!"),
 	PANIC_LINE(""),
 	PANIC_LINE("Please reboot your computer."),
+	PANIC_LINE(""),
+	PANIC_LINE(""), /* will be replaced by the panic description */
 };
 
 static const struct drm_panic_line logo_ascii[] = {
@@ -633,7 +635,20 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
 	}
 }
 
-static void draw_panic_plane(struct drm_plane *plane)
+static void drm_panic_set_description(const char *description)
+{
+	u32 len;
+	if (description) {
+		panic_msg[4].txt = description;
+		len = strlen(description);
+		/* ignore the last newline character */
+		if (len && description[len - 1] == '\n')
+			len -= 1;
+		panic_msg[4].len = len;
+	}
+}
+
+static void draw_panic_plane(struct drm_plane *plane, const char *description)
 {
 	struct drm_scanout_buffer sb = { };
 	int ret;
@@ -642,6 +657,8 @@ static void draw_panic_plane(struct drm_plane *plane)
 	if (!drm_panic_trylock(plane->dev, flags))
 		return;
 
+	drm_panic_set_description(description);
+
 	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
 
 	if (!ret && drm_panic_is_format_supported(sb.format)) {
@@ -662,7 +679,7 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
 	struct drm_plane *plane = to_drm_plane(dumper);
 
 	if (detail->reason == KMSG_DUMP_PANIC)
-		draw_panic_plane(plane);
+		draw_panic_plane(plane, detail->description);
 }
 
 
@@ -682,7 +699,7 @@ static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_
 	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
 		struct drm_plane *plane = file->private_data;
 
-		draw_panic_plane(plane);
+		draw_panic_plane(plane, "Test from debugfs");
 	}
 	return count;
 }
-- 
2.45.2

