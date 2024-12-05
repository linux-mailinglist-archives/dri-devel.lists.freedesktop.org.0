Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07A9E5B6C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 17:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC28510E0DE;
	Thu,  5 Dec 2024 16:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XflbRC4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B1610E0DE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 16:30:08 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3000b64fbe9so10862071fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 08:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1733416207; x=1734021007;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMjnh9e7Jw2TD0W4BB+OtBZvaU7qr6SdoxJVRCE4W9g=;
 b=XflbRC4qKhBDLy/CLMk5dQoToKIV6weA3Rh1TlGxkvSOrIlKzLPtIE6KiC5z6O5QO4
 6Req7eoCsvW++ZNarxz96eEygK5cVuVYfAP3Q3yPp7E2Mrjxx2Ufl3on9kirPhX38/Up
 /+fjF2eqSOR+dPqTcggCGXSPgUgITKNnpf3Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733416207; x=1734021007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZMjnh9e7Jw2TD0W4BB+OtBZvaU7qr6SdoxJVRCE4W9g=;
 b=Pfj4mpAymuZypDIgGYz+wIY0likyDGeBwniRQ0QeoxSQ43YbCOgBaP4w+/ylYYrhBB
 RzKnTIYjoAoLzYJpy3BgtyBoY/ZdDqFSm4kCIdT+RJIZhmQixb9LVxPuG46JIgsRw4mR
 AYXbuSqommlb4L89oHvPGO87DdBmrfVWixyLMkUwLcd+l7O6A34IvXzF8o5050esgM6D
 v1J9DsdAPXpDSKSwRBBaIwC9txvbAivbh2vDwgeAlwfpo725E2IqyK3QgspOd2hNOvbh
 Dp0yzhvHCwqjRM+/bHeVX4BQ4qO6AOREiA/C/x53BzXr5WX4wdLD5vILT1AoCnaGuRJi
 mMBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUevYNzPcqfYJP4GUybFk/PfB+WAw6Ajd2hMjq71SXOhCIYWVoFgCbv82rrw7RRXbJzbNtmiOu5vio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZqJSwYqo6leRpvwoUPL8UM7D8Rb2LATPJ4nbutySnbKNaCvyZ
 1dQ+2JLfjBnCr9DPt5wo/pL0DRFE5wBOOkSDNhOiu0/SYftxN5PMkTvR9BMxUG8=
X-Gm-Gg: ASbGncvTLqpfcl3YjAvM+emEZt8NKKQQ893xXKwvu4as6bQeEiGkBSYYYS+X89oHZBR
 aKsF9YuW4oQZ7WqnKt88MbbU3+K1GoXb9RYoD/QxXYvQpmzveadWH9IMsXtezeWGX8lNNmbvb7o
 R41B7nlibVXzM6WslfvuDJqSJ9UCMlEokC30WvkpK8vKKJniR3itYgm7ajtwz8+mQMmzj2GX84K
 bNemD3iHZ7k3N3Rc7YuEqi69XjD8n8QG54ocPRw4+IcWJ2NTwyXFLKDjJPX7/nokt+g5oUsE5iN
 fS6mNcV+Nj5bpIsNYWXk2tkK8EMvL0q6RkW1KZPGv1nOKQ==
X-Google-Smtp-Source: AGHT+IFJFphPXj4RdWmYd4xFSWADfTEFl4LH/PWBW33N9COMCHipijXzOhDtWi1Bbu0TITxO8K7CKg==
X-Received: by 2002:a2e:a907:0:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-30009c50cb0mr67442741fa.22.1733416206629; 
 Thu, 05 Dec 2024 08:30:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d14c799219sm984973a12.55.2024.12.05.08.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 08:30:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v2] drm/panel: synaptics-r63353: Fix regulator unbalance
Date: Thu,  5 Dec 2024 17:29:58 +0100
Message-ID: <20241205163002.1804784-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

From: Michael Trimarchi <michael@amarulasolutions.com>

The shutdown function can be called when the display is already
unprepared. For example during reboot this trigger a kernel
backlog. Calling the drm_panel_unprepare, allow us to avoid
to trigger the kernel warning.

Fixes: 2e87bad7cd33 ("drm/panel: Add Synaptics R63353 panel driver")
Tested-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

---

Changes in v2:
- Add 'Fixes' tag.
- Add 'Reviewed-by' tag of Neil Armstrong.

 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 169c629746c7..17349825543f 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -325,7 +325,7 @@ static void r63353_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
 
-	r63353_panel_unprepare(&rpanel->base);
+	drm_panel_unprepare(&rpanel->base);
 }
 
 static const struct r63353_desc sharp_ls068b3sx02_data = {
-- 
2.43.0

