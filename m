Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80DEB46F45
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD10010E386;
	Sat,  6 Sep 2025 13:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OGhu1emq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D4710E381
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:21 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55f6f7edf45so3094642e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166860; x=1757771660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WIdATCDvQMnbdC21C7QVK0YJMHWri/9rANxhXm72f4=;
 b=OGhu1emqmuHdEjF780OoF/Qm7fk8czegoHJfJ1UVvcZSapKWbpTIwcgJuu+U0GGh2j
 j3QiDQ1pyEW4PdwRR8tgBxEYo/Q67Mc12Cg0W4ej/1ti9HyhpcUtafmGnB6Er2DidU7d
 HAEwXKWROeRCeVDu0yd+LIkHlsHtl5HDkUHK5RuKOGSuiWhlaIAS3/iNXIZuZfHQs2C0
 RQqQsTKGR90FVzybGhNOw/gtf/3iB+DPUxBQqa2/+9enKLyb2xMXVFOLkJOhNw2ooMrR
 cUG/2Q9Lw0h/3YXyxMWODQNYuK607gBaTH7vdML1YpNjFzKBvZVoZKr9EHif2eBsBgNo
 0ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166860; x=1757771660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WIdATCDvQMnbdC21C7QVK0YJMHWri/9rANxhXm72f4=;
 b=s2UFvwSJy02xhVT0G7qPgXW4jCmBullAj9pu6rCMDbYjwPK/FCxKVg+UYU0s/sXxcU
 Dl425c7IKIICIJafPVaj8TVnBCi71Dz5h1BikvhfYegyzAujJvot0aY8nNOizAGJion+
 o2LkkGVKoGC6H3e9lnNvd7jjEpaktSEHAltLMpvqEbTlc4HkKieBifL0SgAclCjER5Lz
 s8kG2TM4bZbeb8bSz6av4g27nSzXLfoM9WBfadeGzNQPFze0JaUWb231209+r6c4yLH6
 6IfllbfZ+lJ0lntsdpGsS4VwFeb3trKxXsoDNESTAfyFgj+YjyTibZnypJXQ+F3+8H9u
 H1+w==
X-Gm-Message-State: AOJu0YyUb8ysygSC86kjdVykUeIjpg8tybaGHCU+sIBDebwskeEruySx
 ErGGXY49VdZQncOpdQnQbOrVJacXHt20zbHfYn7dx/xld3XYA2Uwycdj
X-Gm-Gg: ASbGnctz1H4uT1hF8tWN4gJVPWZAKadONoT/++x7JQeAyRCqs55FvByZJtN9SEbwlgC
 afU5JD9CT7xF5o44iCcKCNlz1dbarXLaZIMn3e43qJJ9QcECvANQ2CNDVCUB0xWF5vvStRE+opR
 xruRQeBnfrlyKpg3xldx7U9PTQlipt5CUpoZ/PA7ghzbZa89/DYPSEDa7zibh/9s09Utm/odLNp
 Kj8ikrCv2VbGEDGpw1giqrMwS5D3jY/PIGNTt1GFbjYKuqSMFZMbMYFm2u+CR0dpjIloOol7UGg
 uVJm1JzbINSmAhL9PS4EA5ENxzlGl6gdh7fs6qM/8stHHmPiY6cOuVt2ylAHo+o+0KSGMmkQQU7
 O6hxzBbiRGQekBctlO4PeJ8dMS2AbeDzY404=
X-Google-Smtp-Source: AGHT+IFNwfE5WsBiCnMDmHHRkAwMlu0XKdppumOKmQdJeOPj17Tc0h1VteTrfL9JbG9gfpAEqTCYzQ==
X-Received: by 2002:a05:6512:6404:b0:55f:6902:c9f0 with SMTP id
 2adb3069b0e04-5626310bdccmr579045e87.43.1757166859396; 
 Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 11/23] staging: media: tegra-video: csi: add a check to
 tegra_channel_get_remote_csi_subdev
Date: Sat,  6 Sep 2025 16:53:32 +0300
Message-ID: <20250906135345.241229-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

By default tegra_channel_get_remote_csi_subdev returns next device in pipe
assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VIP
or even HOST. Lets check if returned device is actually CSI by comparing
subdevice operations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 16 ++++++++++++++++
 drivers/staging/media/tegra-video/vi.c  | 12 ------------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 3d1d5e1615c2..c848e4ab51ac 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops = {
 	.pad    = &tegra_csi_pad_ops,
 };
 
+struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
+{
+	struct media_pad *pad;
+	struct v4l2_subdev *subdev;
+
+	pad = media_pad_remote_pad_first(&chan->pad);
+	if (!pad)
+		return NULL;
+
+	subdev = media_entity_to_v4l2_subdev(pad->entity);
+	if (!subdev)
+		return NULL;
+
+	return subdev->ops == &tegra_csi_ops ? subdev : NULL;
+}
+
 static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 				   struct device_node *node,
 				   unsigned int port_num, unsigned int lanes,
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 90473729b546..2deb615547be 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -160,18 +160,6 @@ static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
 	wake_up_interruptible(&chan->start_wait);
 }
 
-struct v4l2_subdev *
-tegra_channel_get_remote_csi_subdev(struct tegra_vi_channel *chan)
-{
-	struct media_pad *pad;
-
-	pad = media_pad_remote_pad_first(&chan->pad);
-	if (!pad)
-		return NULL;
-
-	return media_entity_to_v4l2_subdev(pad->entity);
-}
-
 /*
  * Walk up the chain until the initial source (e.g. image sensor)
  */
-- 
2.48.1

