Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1EA9EE511
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 12:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C71810E458;
	Thu, 12 Dec 2024 11:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p0VsgHjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F2D10E458
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 11:31:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-434a736518eso5529795e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 03:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734003102; x=1734607902; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+gESUwGVm8WBjqVJACEoM8n/aZXcQ4Fx33aNt8RmViA=;
 b=p0VsgHjmMSGgJcw01tadbeQBjj03QCoP9d2ewiUEgFgAZGqNrmRtMLWeYw8vSnhce7
 KWFg71jZSFjRqkeuPC2j9sr8l0QvSN4XKjTg2Y4zpCqSkQaR/h16D5gTryItbhIeQTT+
 8YBNd56DmTQYQOaaxVH97HmB+GE9X5d3PltMwF4G5Q/JaLb1/Z/8Ji6cdnq9pMEajUEj
 sqde0Sabbw4uWvNtuEWo3gaMufuQ/ZJyV6s6MrUwhN1KMkvhWUN1Rg7ml4076Hw8PgK4
 5nVQSSpMnbnydiIhmEAOomhdE0gOfp9Q56f1kyQaSbdU6RM3M/Ncg8rqeL0lA+KD8Cll
 usjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734003102; x=1734607902;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+gESUwGVm8WBjqVJACEoM8n/aZXcQ4Fx33aNt8RmViA=;
 b=uSqsvvLrtwmBcRQgvBgKeIxzk0pGWlGpbYYH+gIOUzmmtPkL1oW1kuFn3gK1Q5SJAW
 Xt0S+CYeIiAWjmFcIKjyxCZvKZVmc4YHnjZSrh5hBWQKrZ0qFTSfP9fTiz+wIAi9e8N7
 xwsJNZcrIFKwzt44+PHENDxPZMXljiUSpX9ZZyOMbYXiDx+eeHrfBuAa/KGlgMq1x+2+
 mJ6IRNpRy2f94aSy7iDs+KoXX9C7HFEVg8c6qrqVpHemXtZewSYdwGKidCC3gss31Nsq
 5L40gvHHBqPL7G9r7EjxBx2rXgCBkYisuAfTD4ov84gXFou87SYKwSGsEQzNhX3FXHMF
 gn3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX30bDkz0FFb+AFmhNt6i86JW+shUIv/5Mr0ZWPH86bPHsnEzie5sTmFnk2T6uSSqzTpIzl/gVnPUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKr+6nBh7SQ29sdgoM7WsjgmzkxywPs63efdLXeU4rBt7NzN8U
 qa+ShrXTmRscZpPX6Xh5jgedDd9Fcxjh8HmS4X6u/cTojJa2ZvPFfq9PL/9E36o=
X-Gm-Gg: ASbGnctlg/sdl9FKqdZcjIJ1AbXSCkKyM9IAE42NRtagGzfx0hsKcSgAwNU23AjQAlp
 ImJT3T0tg3eh5WDEnd9SFchAEY79r5tvbcowkPuUeY9w/iM9B+m1CRS2ygbJ4S9sR6F9NuKEBuM
 ByK4RIknzKML9MKUVzIvPkXBtrDo0dBR8y2Q/Y+8ZE5CUxXn3tIVAV8rKBgUSy7+yGDSFwWogkE
 /dF9fAR4OY4UiTxZ9gav+lppZUwCKSlBhtzeJW0zLWZjfQP/CIOlBHDqV9z2Q==
X-Google-Smtp-Source: AGHT+IFXD9JCROyiJxtYSdcxXayCgPwhArAcMYowgXbP6P19iREmdzEMAFHi33xiUeQM1gepZzrOHA==
X-Received: by 2002:a05:6000:a10:b0:385:faad:bfb8 with SMTP id
 ffacd0b85a97d-3864cec7d55mr6267275f8f.41.1734003101646; 
 Thu, 12 Dec 2024 03:31:41 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878251dbbfsm3727812f8f.97.2024.12.12.03.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 03:31:40 -0800 (PST)
Date: Thu, 12 Dec 2024 14:31:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/vc4: unlock on error in
 vc4_hvs_get_fifo_frame_count()
Message-ID: <02c87d9c-76b8-4d93-b0da-0e4f7d4952ae@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Presumably the default path is never used.  However, if it were used for
some reason then call drm_dev_exit() before returning.

Fixes: 8f2fc64773be ("drm/vc4: Fix reading of frame count on GEN5 / Pi4")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index b42027636c71..4f524ec126e7 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -522,7 +522,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 		break;
 	default:
 		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
-		return 0;
+		field = 0;
 	}
 
 	drm_dev_exit(idx);
-- 
2.45.2

