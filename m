Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBF389A132
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC1E113C62;
	Fri,  5 Apr 2024 15:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BxlsXW+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08631113C60;
 Fri,  5 Apr 2024 15:31:08 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso2791338a12.0; 
 Fri, 05 Apr 2024 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712331066; x=1712935866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f26+JW8g/Mxdh9BcUQdPk6EFgK15mePlKBpnnLhSmdE=;
 b=BxlsXW+UHBjUnNfBGE8/wWF+59d9ZTiOo9Nh44j9qVu9xN0MWv2gTZ3ZmAU5wkzxXp
 TluThNgZX6zD0wSYyhVsBtZmqbmnc/iYv0i1KeGlcu5NZYbncA9iigN0GNTx7QQ0KwK0
 nqo4RRlHzXOU3DkjdN4QsevxSfqG5l0qzEFTIOB4s77xGzlWRK9etnVdb1USGSfluU9d
 ixcp+sFnqWsHVHxtmIAjHwttWLiJ/+4W68hZ6FdeOdKO+xVcYWaI9FSxf6sA5jPQfE8X
 VNxNgc+sJ4GPCtLKNcW5kFY2nczVaeJs8QpMIvrScnfhRXu5GPEgQiCiOtN29EF1OSrG
 qoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712331066; x=1712935866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f26+JW8g/Mxdh9BcUQdPk6EFgK15mePlKBpnnLhSmdE=;
 b=Sa9cCULCg7k6YcMRb6HTHOQ+CDyeBSlsQUvcRGngQOthkVXHEABZWiSxSwwJiEtOd7
 /xrCKVCeunU7AaT1me2QlBgw/Tc/5p0iVwoFhSpqy7A3gbV4Bb7XRSyEDhLMFcMxmCd0
 Y4cMpl/WNaWpEzHEB2OAcAev3mNfVu0/dhEOyRXa+UGKUQM/iXStKvNJJshU5O1N+cCs
 32nnlBNXal2CMiHontjkUMIpwvJHB31T7d0DrCE/eJDgsO8BfXj4PowvunksjmhRtS1x
 4qH6gh5pb1P1RO+vhUIgB2BPfCQOKGmHdK1N1eNoaFf77E5XStH0Cj8Qi33ffrFtglok
 i+Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJt4xcxK6Um9dMgRP3Wdsi7o6ywQpjgBjezgEIfRANPCadfqHGkI41ia5Yg/zGPs9DK3cerNNQjGMbzvif7qFMTOgEEF5qXuJm5uvWZv1Aq8BcLy2ItqTWQnq4brcH++U4GGrsgNIecelGNQ==
X-Gm-Message-State: AOJu0YwV6kcOkUMybkveJ25KD/5zrKk002I4/7chV69NaZbcwJFHlMmW
 Vjj/Btimin2T0quEZ9cRA4CgLNGPCBrRluvB+DJfVubAoCCQPl27
X-Google-Smtp-Source: AGHT+IEOoVbeSJ/OSUmQPcHN5mMxTwHjjaoROo5lfs6LhyW4u0ipSb8oGcAGiW5kwuMmalkC8ave+w==
X-Received: by 2002:a50:f60b:0:b0:56c:3feb:8898 with SMTP id
 c11-20020a50f60b000000b0056c3feb8898mr1359874edn.3.1712331066460; 
 Fri, 05 Apr 2024 08:31:06 -0700 (PDT)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 ca19-20020aa7cd73000000b0056dfda8eef3sm906752edb.54.2024.04.05.08.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 08:31:05 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com, megi@xff.cz,
 linux-kernel@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH v2 3/3] drm/lima: mask irqs in timeout path before hard reset
Date: Fri,  5 Apr 2024 17:29:51 +0200
Message-ID: <20240405152951.1531555-4-nunes.erico@gmail.com>
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

There is a race condition in which a rendering job might take just long
enough to trigger the drm sched job timeout handler but also still
complete before the hard reset is done by the timeout handler.
This runs into race conditions not expected by the timeout handler.
In some very specific cases it currently may result in a refcount
imbalance on lima_pm_idle, with a stack dump such as:

[10136.669170] WARNING: CPU: 0 PID: 0 at drivers/gpu/drm/lima/lima_devfreq.c:205 lima_devfreq_record_idle+0xa0/0xb0
...
[10136.669459] pc : lima_devfreq_record_idle+0xa0/0xb0
...
[10136.669628] Call trace:
[10136.669634]  lima_devfreq_record_idle+0xa0/0xb0
[10136.669646]  lima_sched_pipe_task_done+0x5c/0xb0
[10136.669656]  lima_gp_irq_handler+0xa8/0x120
[10136.669666]  __handle_irq_event_percpu+0x48/0x160
[10136.669679]  handle_irq_event+0x4c/0xc0

We can prevent that race condition entirely by masking the irqs at the
beginning of the timeout handler, at which point we give up on waiting
for that job entirely.
The irqs will be enabled again at the next hard reset which is already
done as a recovery by the timeout handler.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 66841503a618..bbf3f8feab94 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -430,6 +430,13 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
 
+	/*
+	 * The task might still finish while this timeout handler runs.
+	 * To prevent a race condition on its completion, mask all irqs
+	 * on the running core until the next hard reset completes.
+	 */
+	pipe->task_mask_irq(pipe);
+
 	if (!pipe->error)
 		DRM_ERROR("%s job timeout\n", lima_ip_name(ip));
 
-- 
2.44.0

