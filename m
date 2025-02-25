Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF69A444D9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE38D10E18F;
	Tue, 25 Feb 2025 15:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JB8OjMCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CA010E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:46:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D59644429F;
 Tue, 25 Feb 2025 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740498385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0QMFPn7v0dvtqEnFRRWaHTTHu3sj+oRLzfepMtxanK8=;
 b=JB8OjMCtCzJ1YInn4tNfeR0v0PbEPGZGOGVlzbzrit48JNQTeiTdt+9vYx4sh+wmawS/6N
 CETWdosaxauFkwlusUa9edkiZgRA6Ds9BO18Zl/y2+e36l0G7BDMOGrYrL+wG0xPiz6kvh
 NdCEI9zw1kowE2dr151TWTPB2obKNZHjLQsEqqALDY4IBajPhsJh8KGxAekJtz2SszH+ra
 P9Cv91kFMMvIoKx0qeykfMlaoVZSoamphKkqkcGwSiatDie1PU6n+6jTGQN1TvfxkqrFaX
 2IbDUk+L0Evph8E7rEmZiInCnG2QeentPxoE4AE7iwU5AZ8q75g5aRQAGmX7Ew==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 25 Feb 2025 16:46:22 +0100
Subject: [PATCH] drm/vkms: Add "hardware limitation" emulation TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-vkms-update-todo-v1-1-afb1e6f7d714@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAM3lvWcC/zWMQQrCMBBFr1Jm7WAaGpVeRbpIk1EHSVIzaSmU3
 t1gcfffh/c2EMpMAn2zQaaFhVOs0J4acC8bn4TsK4NW2iitDS7vIDhP3hbCknxCo66q1d1ldP4
 GVZsyPXj9Je/DwZk+cy2X44TRCqFLIXDpG58DBhZ3/g+MtBYY9v0LdOQsTJwAAAA=
X-Change-ID: 20250225-vkms-update-todo-50701246bcd8
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MFvmP9LovArK9OERLzzbnLEOunRvxAUL0nHnW9lN2zc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnveXPQ2q8V3VeN1NbMRQPdRMMaL4QjQAynIylm
 AUfAMv05wWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ73lzwAKCRAgrS7GWxAs
 4t5VEACUFayeAdbvJqZBoi1QRKlqceU3JOBr31o/wBKDiJ1qzS2UbREIJvAB+a1RFRfgaNByGFB
 qDaAN6Af8AbAkWVEu7MWzsUwelIPNlKCB9jm6GZCTiGBi21qUicgPWN/4jlAmx6BQ0Lpjg+ICBC
 sqzNO9Rg7oUx0zMnh8JquaWLKrqOf68L/mKA7auEA2eXmqOlxbdJFmsDWwLwCZPJ+9wgobGzjr8
 jETrvKjGZMIUIdJb1d5AjcLlqcWdb9Dn1rOUHDFfie+M5mRWSdk2w+1njLp1qTYjmefWF6Uqq8o
 xmkdirueb4RhqN09hCI9vREVFdBJGgwuTTDsoQx2g0JhMlVQlllWvtibZv47yzzh41a0wD9tVDp
 aT+7GEAXDHR3I3C+TY8rMm9plPimKKE9OwympO+6AWdAcOgtYK/HFYej+ilLmTZcgVgc7n7qLJJ
 qctsn8kr43fmptBxeWt6OMUtdE6eEj8+/llY20vqK25HY1hTonNusLSaJ6L2CQkTJl+qjWF6dkr
 DGMtcJ+Ieze+qYFErhzTDnwIpbOnYjiSAwd3CWyWgVfdT+MYD3yEJP1ShVpA/GXtK56Z+XQJ8ax
 YaP406FvqC6KPgq1XzlIMmmcp121MBO/+JFKlLXw9t+yVJ7FH2cOVXLHMCl/7y65RECPD7oktku
 ZYCZrvKztktDC7w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueetjeeggeffvdegkeetudekjeevkeehheduledtgeejhfduvdeuleehleffgefgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludejvddrudekrddtrddungdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhouhhis
 hdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-GND-Sasl: louis.chauvet@bootlin.com
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

Add the hardware limitation todo.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167..d5bc602547e7 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -147,6 +147,15 @@ module. Use/Test-cases:
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
+- Emulating Hardware Limitations with eBPF for MST and Atomic Checks
+  Hardware limitations can often prevent valid DRM configurations during
+  atomic checks. Examples of such limitations include bandwidth constraints in
+  MST and limited clock signals for multiple CRTCs.
+  These limitations are dynamic and require extensive checks, making them
+  difficult to describe statically. To address this, we propose creating an
+  eBPF interface for atomic checks. This interface will allow userspace applications
+  to simulate and enforce custom hardware limitations.
+
 The currently proposed solution is to expose vkms configuration through
 configfs. All existing module options should be supported through configfs
 too.

---
base-commit: acf3256160bdabcb5c07032f3bf6eb5a21f5b95f
change-id: 20250225-vkms-update-todo-50701246bcd8

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

