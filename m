Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209489A12E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2C4113C5C;
	Fri,  5 Apr 2024 15:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cNDgW0nt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880A2113C5C;
 Fri,  5 Apr 2024 15:31:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56e2b41187aso1852581a12.1; 
 Fri, 05 Apr 2024 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712331065; x=1712935865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Wc7eRrLLTaY9o1kesXYpNbXIiaQ79me6bUkH9C+N8s=;
 b=cNDgW0ntr5yYnSotmwrPbsz6qlmjf4J9aF6N7vBmaw6pcjyThWCn3gwW4PtuFaHqWY
 HIA1f/QmYgsnLsYM1w6iMGEyEn061yQFsPs9cQGRM9uJJ0KAyf8FKz+/yHMSHhZ062cv
 jD5dccq38m/7IOnJ4db1kYYVDE8plGB9rs9Hwr3w88CmpA7+qc1nJy3Fx2/dJ65Ydqxl
 8qbaoXCJuW1PfSHQA3N3XZwIR1fH24Za+TKafKjslpbf7mqA+OsXbj9z7zDRglUnO4Oo
 o97J1yoyviyHB2N4g+Ff1Dto1+xwctNbDxbL/E7U9K+N3b4rfHyzJUzoZFvJY6U8ujWg
 BS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712331065; x=1712935865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Wc7eRrLLTaY9o1kesXYpNbXIiaQ79me6bUkH9C+N8s=;
 b=tKuugIWLDmosG5+cGyXtelDHSfRZK6/3B8H7ZFlQ2FzNEiiEtNOhNmR74CaXQJ0M9W
 sn4cADMBzKgaCaj1ln2yn8keGkc+LA25NOwI4o1mINX0gtyr8ln+CB50GmSPtNdGwmYU
 LWKOVIfaLM2VV63qtqDiFyc+wCE/kaTjLABq7j6q0IjREi4jyzUuJd0GLz01gCb6Ieud
 4nbpaix2xvG59aC3YHzj+gBbGrqUjdqrbaKP4IWv0XEuMjzLTbf2bDeKy46UhA0vQpYZ
 Utmw/8/o67zGXmHbTO2jHw9tSabMOdbkE2rsXQYjW+e0UYT34ruBHWRfYIbhOfbX/Bar
 IjCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr4PGi9wgUMCebXmvFemxwQuJfH7VGMvDzsxiTAVyKgTX1nUYTY3vr7mx6MYMnD6O3xLgrhm06S6QeHue6Yh0yiriLyFhXHaGFFl0JO7QfT6Yf5lXizOHXaZcziQggY8mHPzI7x/S4JiNbjA==
X-Gm-Message-State: AOJu0YxqQplEgkMBWr59l29oebkdA/arc0G/Ok6ruNM+3g+tE5qmr/E8
 E8isKXyvoxsM86Dol1yWIuy8IJOAfQq6P+TkZcdwpF9Amq7kOlSr
X-Google-Smtp-Source: AGHT+IG8XRGLoAvJSk3V6tIUxHh1MIP1Ubq65h4+cLa/zgO/WLETmMWp1Z1DJ/2HAU/3sW4nJR2XQw==
X-Received: by 2002:a05:6402:e81:b0:56c:292f:84da with SMTP id
 h1-20020a0564020e8100b0056c292f84damr2264828eda.17.1712331065319; 
 Fri, 05 Apr 2024 08:31:05 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 ca19-20020aa7cd73000000b0056dfda8eef3sm906752edb.54.2024.04.05.08.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 08:31:04 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com, megi@xff.cz,
 linux-kernel@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH v2 2/3] drm/lima: include pp bcast irq in timeout handler check
Date: Fri,  5 Apr 2024 17:29:50 +0200
Message-ID: <20240405152951.1531555-3-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405152951.1531555-1-nunes.erico@gmail.com>
References: <20240405152951.1531555-1-nunes.erico@gmail.com>
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

In commit 53cb55b20208 ("drm/lima: handle spurious timeouts due to high
irq latency") a check was added to detect an unexpectedly high interrupt
latency timeout.
With further investigation it was noted that on Mali-450 the pp bcast
irq may also be a trigger of race conditions against the timeout
handler, so add it to this check too.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 00b19adfc888..66841503a618 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -422,6 +422,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	 */
 	for (i = 0; i < pipe->num_processor; i++)
 		synchronize_irq(pipe->processor[i]->irq);
+	if (pipe->bcast_processor)
+		synchronize_irq(pipe->bcast_processor->irq);
 
 	if (dma_fence_is_signaled(task->fence)) {
 		DRM_WARN("%s unexpectedly high interrupt latency\n", lima_ip_name(ip));
-- 
2.44.0

