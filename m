Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663B78797C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 22:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296DE10E12B;
	Thu, 24 Aug 2023 20:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E030910E12B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:41:28 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-58fc4291239so4159847b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 13:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692909688; x=1693514488;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hz4CFw7X3XsTByuJR93CvFKCbJeqUhmZnpkGK0VJwj4=;
 b=WGl84gWJpZs4+/H8ZXNv8yQkCqJlW6Q4Rd9RfqksEKVmzX3LHumwWfk6tFAhnVwvKM
 /FkVVV+dObPvSP8He0F5KMytfq9ZWu1i9HPU5E1CHIAlewDKBuJ85DmIrEaS49QJaJfW
 dBnwsmw8dj2h7ERu9DZgIgW9ZRs82zESu+KznfxdYuct4V4dq7fWFl5xRFTprOBC+Bzr
 zMbPVexoZYBUi2CgdZ4AhujbrPXbuWvLjDM7XLrUw1K5mIEVbfF6gdS+lwUMJKl/yA0I
 +6mGKqzwXrxSIFMeQfb4BifyswRTncphX1CyfA1wLTBfgcTeA0z3NDfRZDkpUv5hptEq
 C1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692909688; x=1693514488;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hz4CFw7X3XsTByuJR93CvFKCbJeqUhmZnpkGK0VJwj4=;
 b=ViL2NL9l6bs2Y+MPt4ZOCuJ6HZMu17J6ylJOqR0x/iNsHmPaH2X9L+TgeIicRvJFv0
 eA2P9yC/4+QEzYbe1h8pQyxvK8HpY+1SI0Hm3md/pTzAPTB52BHuflQHnI3Jo/Paex1c
 B3jWD1LJbHrgu3+r/bgccj3tsdQlfn3oioS2TNnZ+LY1zQmbFCGUQORgNgPmrebCybrs
 VOyJuyJBXGnyvI2yfd/RQg9OKbhokj1+nSK29Y0VSxa2P4fcZPTVUCy2AaTh5R8QsHRe
 nSWB2XZmS28vq6ShZHmvXxRq4M7MrH5mEzKPnuabUCKdF3LqcHOhC+hkzimYTzlft1yU
 B3+Q==
X-Gm-Message-State: AOJu0Yx+aiuQF3N0Gftw51aHndmrh26xrnWBDM6umfcqlDvvKtqwanDj
 k+5dBL5iZOiRIcig286ZVPdfD6i2TQB4ocsHvw==
X-Google-Smtp-Source: AGHT+IFDfmcb6QRyxXzjJwEVKI5B+o9eDZJHyc49OqYlJuzPac3u6KNBg9jNjwHaz5s9qqEmTbiHVP5TL0fZIEtjdg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:ad48:0:b0:584:61df:9b1b with SMTP
 id l8-20020a81ad48000000b0058461df9b1bmr273288ywk.2.1692909688063; Thu, 24
 Aug 2023 13:41:28 -0700 (PDT)
Date: Thu, 24 Aug 2023 20:41:26 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHbA52QC/y2NywrCQAwAf6XkbGD7EBZ/RTxks2kbKGtJtFRK/
 91FvAzMZeYAF1NxuDUHmGzq+ixV2ksDPFOZBDVXhy50fYjdgP6ywusHs+km5kjMsuBMiQotlBw
 nemf9k3EM6RrbgSX3EWp0NRl1/w3vj/P8AkGmFbKAAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692909687; l=1908;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=HFQNt7NrZ+VUFmpxtwuEPPv30mfdkkfZfzWz5XtYhO8=;
 b=JWiLA+vWRrMNRFZSBcilB9fmvYoJsOpvmuDtttnNah4xZ6mzum5C+zgvV/Q4etqSvgR6U9Axp
 A3zAcN+pVxbBTsC1E5YhNxXiVy3JeskI9DORDLxYCLXc+O7WHIf0i/C
X-Mailer: b4 0.12.3
Message-ID: <20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-v1-1-a7fb9054734c@google.com>
Subject: [PATCH] habanalabs/gaudi: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Oded Gabbay <ogabbay@kernel.org>
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
Cc: Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on its destination buffer argument which is
_not_ the case for `strncpy`!

Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only
---
 drivers/accel/habanalabs/gaudi/gaudi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 056e2ef44afb..f175456cdef0 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -660,7 +660,7 @@ static int gaudi_set_fixed_properties(struct hl_device *hdev)
 	prop->pcie_dbi_base_address = mmPCIE_DBI_BASE;
 	prop->pcie_aux_dbi_reg_addr = CFG_BASE + mmPCIE_AUX_DBI;
 
-	strncpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
+	strscpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
 					CARD_NAME_MAX_LEN);
 
 	prop->max_pending_cs = GAUDI_MAX_PENDING_CS;
@@ -8000,7 +8000,7 @@ static int gaudi_cpucp_info_get(struct hl_device *hdev)
 		return rc;
 
 	if (!strlen(prop->cpucp_info.card_name))
-		strncpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
+		strscpy(prop->cpucp_info.card_name, GAUDI_DEFAULT_CARD_NAME,
 				CARD_NAME_MAX_LEN);
 
 	hdev->card_type = le32_to_cpu(hdev->asic_prop.cpucp_info.card_type);

---
base-commit: f9604036a3fb6149badf346994b46b03f9292db7
change-id: 20230824-strncpy-drivers-accel-habanalabs-gaudi-gaudi-c-f0b5814ced38

Best regards,
--
Justin Stitt <justinstitt@google.com>

