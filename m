Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADEC881A22
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 00:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890BA10FFF7;
	Wed, 20 Mar 2024 23:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0RSRCNvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE3610FFF7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 23:22:03 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dd933a044baso1985398276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 16:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1710976922; x=1711581722;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=31u9h4pRsIoYT5xL2+2Sx/Q3BDCy9WQzGQxSt0T02WU=;
 b=0RSRCNvlmn1oN+7kAoyNRieVGTtyFVRgQSM0icg4nXdo85cn5EHP5B8qU5wvSLnpsp
 Gj2x67RZviepyAoHJmOvTKF8J1FQWf6thoFF3KdSEN0tDcM7Y1rSgHv0/tWv+KygAOyE
 4xz5FNcEpNGJM8u7Dfi9qaBLU6hHBGuTTCHkL0NPzmI+jBc4sRACRoKgmrhRtSWp8wEv
 ye/N1prn/EzKpluSiMd3n6vRU6o0cA61pmFLGmWvwQuaCQJXxfBkyP7HSNR1N+xr1yfg
 LpTtsJKwc6mZ27XRLdKmaYNrz4+vjjHy8WTBjDGxFf2jnsrxYrcNQj8EeWAlu3epWfbn
 R1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710976922; x=1711581722;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=31u9h4pRsIoYT5xL2+2Sx/Q3BDCy9WQzGQxSt0T02WU=;
 b=xPdX5wtDjQlXsjBjSgOXgn7XiZkymcTjIswfbKcUZS6QWocL38D/uXnI/8n20CzBnU
 H3gyS1TOaPMRWmDWN7XEFze1C6vIaKLtYaCpU8HKShQlyqE+etxk3J3ej6trldMvUt0t
 izvKbR13XTfzf/GAniq7GMosM/Hr0ZnGF+jWnyeBUDO7bIOd1g1K5sSKEtrac8EGcnb6
 u4QoTxrt9z2kABErvCp+r8Y7r65vqf3VQzeZ3mptof7jaDI0kLMoCJ1HMzlBpAy5pp+G
 /Md1aVzx4v+N1Xyn3v7rYgI0lzIYyx0Mue/mh8actiih8Se6+k7dDK/MhSl/wkIBH1UW
 7lqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfb42zHZdoMTGfO3Ho4yrA/A40Y7nQW+nBnNdclUcDCKn4tpkOl9O9VNBGG+1wsA3QzgUvCNDxAIzzVxiMn0jfMHQ1H5SHEYAK8bJ09/RM
X-Gm-Message-State: AOJu0YxTOIwtK6buNOgPQ09KGwFNHbRrtSbe0zKYtw9PFZv52Cy2fK70
 qAq/AKbCXBGyElIgpoGFSl4cJ2z50Knw2/pwScWL2BJItevac1V9zfs5DGoJciaSdTPuzY7WAO5
 B2M/v8oTW6/h2WpzYdydtUQ==
X-Google-Smtp-Source: AGHT+IEbxaoDxR39hoPNgni/Vs4CVRqb2djIgFXCSM9OsEXWBDwH4FweLj7pnfzYDXD3ipk1F2Hy16EUjCN+ESro/Q==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:4b84:0:b0:dcc:2267:796e with SMTP
 id y126-20020a254b84000000b00dcc2267796emr201630yba.2.1710976922546; Wed, 20
 Mar 2024 16:22:02 -0700 (PDT)
Date: Wed, 20 Mar 2024 23:22:02 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJlv+2UC/x3MwQqDMAwA0F+RnBdoqzL1V8YOs4maw6okUjbEf
 7d4fJd3gLEKGwzVAcpZTNZU4B8VxOWTZkahYgguNK4ODm3XFLc/kkpmNcxCvOJCX8GIY/QdtV3
 bP/0EpdiUJ/nd/et9nhdMvlXFbgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710976921; l=1895;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=LstULD3SZgSv3OfqQEREHb9PlnHVDFzksy2daTuKq/I=;
 b=asHNy0GS4ziNs7+teZK7JmBwmWLU7eI7UJYX/Jv9UFQa5idrd1r/icfuQF/NfP0K1Tp7LHyZY
 MGpRYh9EuvuDYbE8MrciB/WCTNc+XdNdU97Xs+IFqzbG81WPC/L/6PW
X-Mailer: b4 0.12.3
Message-ID: <20240320-strncpy-drivers-video-hdmi-c-v1-1-f9a08168cdaf@google.com>
Subject: [PATCH] video/hdmi: prefer length specifier in format over string
 copying
From: Justin Stitt <justinstitt@google.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
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

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

It looks like the main use of strncpy() here is to limit the amount of
bytes printed from hdmi_log() by using a tmp buffer and limiting the
number of bytes copied. Really, we should use the %.<len>s format
qualifier to achieve this.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/video/hdmi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 03c7f27dde49..ba301f3f4951 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1310,17 +1310,11 @@ static void hdmi_spd_infoframe_log(const char *level,
 				   struct device *dev,
 				   const struct hdmi_spd_infoframe *frame)
 {
-	u8 buf[17];
-
 	hdmi_infoframe_log_header(level, dev,
 				  (const struct hdmi_any_infoframe *)frame);
 
-	memset(buf, 0, sizeof(buf));
-
-	strncpy(buf, frame->vendor, 8);
-	hdmi_log("    vendor: %s\n", buf);
-	strncpy(buf, frame->product, 16);
-	hdmi_log("    product: %s\n", buf);
+	hdmi_log("    vendor: %.8s\n", frame->vendor);
+	hdmi_log("    product: %.16s\n", frame->product);
 	hdmi_log("    source device information: %s (0x%x)\n",
 		hdmi_spd_sdi_get_name(frame->sdi), frame->sdi);
 }

---
base-commit: a4145ce1e7bc247fd6f2846e8699473448717b37
change-id: 20240320-strncpy-drivers-video-hdmi-c-bc18d585971f

Best regards,
--
Justin Stitt <justinstitt@google.com>

