Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C547A0C9C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 20:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B0310E2A9;
	Thu, 14 Sep 2023 18:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE3310E2A9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 18:20:02 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d81841ef79bso1590574276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 11:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694715602; x=1695320402;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+tDCVePA3H/Y86jExEhecx21ZlR+zsTby9yjOcJea7c=;
 b=R40mTlw176X1gG9izZf+4jfB+fS2Bdu8uK7KIBsVQljsB/omboOUaLvfxma+ehnAbu
 WhMz+TlSlC42pmKng8TqrlxUT0O9KxdITx9ub88O+WPqaecT56e7ZIPdTcSDPKXOt+mX
 JybC/3sfxX0tSOnL6L0oD8uqxgNwxK7bo+4vA3z1Az6ieZu/8Z7Y3wnT7Jd0kbz9btZH
 AP9WWD2qBnGFItomjbD+aFnE3in9c6Kbq2IcVa3pLVDMQEjwjbo3g4kPeViPE7Aqm1tF
 kC8blgImGgGuInid5EgW9kjKImf2KD/HlzeOWZ7mfNf7YmVG61R8oHrLea7s/imGD1O7
 I2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694715602; x=1695320402;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+tDCVePA3H/Y86jExEhecx21ZlR+zsTby9yjOcJea7c=;
 b=pIvoCJard2BgpmtHKuohwXxBdZ6lHMj3YRGZrnH/5sWhy7XIG7h2P+HRFoGmgD29+7
 lzQxKZMGLL2OdoJ2tOBO4XjGyREwlF4HlAqmASSUBPnEJdhkFpGyedHcy92elo0PwsIc
 9DUkP6VDRP8/Dipj15IzURFZqkiyYt8xfkG/YK25rM/1GFIkleXNrTo0yZ3wuIWT1Bhm
 MWHdBNypCjgn38ZE8Z4oQYSNntigdLjMtZCLHc/fflDCdCLTlASb/B2KShlqFTwtwrm+
 +bp6noqSgSFjz22m2uVIKuUiTsQy19fyCIdts0Eljbrid9iRjsK2y/FBa5HNR4PtPRoq
 Zlfw==
X-Gm-Message-State: AOJu0Yxk/FncbNqYYg6ANXZ+LVjO5chdc+2SCI18PcV94IY/au/FrAPv
 SKWleGYwg1IqzkouvRL8kLkk56eYu04qeKUO6g==
X-Google-Smtp-Source: AGHT+IGfxVOd75Rdpx2cardrEaNX99DCozdAd+Y1ohWSOUbn/k74RQ3w7NoBhkr2+YnX8BQUjGQoK7m2XXfE0ndaVg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:abaf:0:b0:d77:bcce:eb11 with SMTP
 id v44-20020a25abaf000000b00d77bcceeb11mr135467ybi.10.1694715601838; Thu, 14
 Sep 2023 11:20:01 -0700 (PDT)
Date: Thu, 14 Sep 2023 18:20:01 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANBOA2UC/zWNQQrDMAwEvxJ0rsBO0oP7lVJKsORUhyhGTk1Ly
 N9jCj3NzmVnh8ImXODW7WBcpciqTfylg/iadGYUag696wcX/IhlM435i2RS2QrO+d32grzpVKX
 ++cxsaVkVIxK5cB2Dp0QM7TcbJ/n8mvfHcZxWgPpkgwAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694715600; l=1992;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=SeuSKp981fs1thsOAOeS7EP9Ar4X1zn644iwNj5mbW0=;
 b=BWw2xpB4+Q0ImJXqA281cKFhurR2PsXPzdhCXMjsCWc7SsHnWYgeKtLVUn9zKZtXCCIxlq54x
 Lllt8bVOVZ2DwqP3B3RwgpiECJ3K+prluKT70wJhl50BC6TEYxoRCPO
X-Mailer: b4 0.12.3
Message-ID: <20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-v1-1-3adc2d9bfc52@google.com>
Subject: [PATCH] drm/etnaviv: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Justin Stitt <justinstitt@google.com>, Bo YU <tsu.yubo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

A suitable replacement is `strscpy` [2] due to the fact that it guarantees
NUL-termination on the destination buffer.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Cc: Bo YU <tsu.yubo@gmail.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Similar to [1] which was never picked up. Let's prefer strscpy to strlcpy, though

[1]: https://lore.kernel.org/all/20190328080918.9290-1-tsu.yubo@gmail.com/
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index bafdfe49c1d8..9e7bebcf24eb 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -511,7 +511,7 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
 
 	domain->id = domain->iter;
 	domain->nr_signals = dom->nr_signals;
-	strncpy(domain->name, dom->name, sizeof(domain->name));
+	strscpy(domain->name, dom->name, sizeof(domain->name));
 
 	domain->iter++;
 	if (domain->iter == nr_domains)
@@ -540,7 +540,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
 	sig = &dom->signal[signal->iter];
 
 	signal->id = signal->iter;
-	strncpy(signal->name, sig->name, sizeof(signal->name));
+	strscpy(signal->name, sig->name, sizeof(signal->name));
 
 	signal->iter++;
 	if (signal->iter == dom->nr_signals)

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-gpu-drm-etnaviv-etnaviv_perfmon-c-dd095491dfde

Best regards,
--
Justin Stitt <justinstitt@google.com>

