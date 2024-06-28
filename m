Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143F91C7A9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 22:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6EB10E011;
	Fri, 28 Jun 2024 20:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="anThcKJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A4810E011
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 20:58:47 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7178ba1c24bso712125a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719608327; x=1720213127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tl72+hEsFj3IepAaeWSkRE5ZSKXOhBsSp9DqAh9ZaTA=;
 b=anThcKJI6oET1S6tnA3O0zLwxG5j6RzWSpoAJd1ssxgwvncAYKcPSL/n1HMiSjtgdN
 lyaLKgiQfPe1gibX1ukxcP7yKONc86OnzgXkgLDUY0EG16pf958YgO68imPSV9tj0/fq
 GKMFl6ZJI4WaGzt25xMLT4nckmJ64AkdzuUKSnSycIqQzW/PID1q2sYxRq82ol6Z0XFV
 7JdjEEwYK79TVS8LGXmEg2xZ1+amYliQhVPHycn7oioYORNEQSKvbGIYVv2FZzU7cybh
 Nmzm41VHmGBS1xldq0iDkJEHOFk+KhtZX03GUmWdkT78kH7NqWhAH8LgSlrSzlNnYidf
 TmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719608327; x=1720213127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tl72+hEsFj3IepAaeWSkRE5ZSKXOhBsSp9DqAh9ZaTA=;
 b=RfclqBvFvJXkA34s+9QPop/Y2AhweMm6w83jPhdJgA1q6RbsRibezQJrMC4ebjMFQF
 YsbzFVMHRomkeQCI5oePs8AmtdcUxZfrP9xW0xlHpajRN/p5rw2bgWvMTObS3663myH+
 t2CxGVPNwhAFz+nXMmxVF10GHXMrnzX9tk7aQakVPBbOc2j8sDGwJ0tqJ3aLAeGTJqf3
 AZdQ03e9ipVx1eL53BMIXqQvpsgz47K+6zr0Zw5I6QhyaNYXvFIOuZYzrs9LhPAy6JND
 ByK5kRk5N1rUiQaOQ1TIExjGePHgMXFk0p1pMNkCk9buVh6R8pAqCy6RKPzBe9rbqPtt
 1SXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX47fY5s9euAb0g+K2XFZ8d5KUwjCwa+9f00zzJ/b9KB/Sxe8fAtmKeupXPBqtsu2O8j7UKY7dvmx3wYunq3fyEuW3J+itGebplDeNtqizU
X-Gm-Message-State: AOJu0Ywf1TF51eWVOjf1OjVoaMqKt2OhOY/awAn0EZJY8cFLfExUm/pY
 3+Up6/rUFGCRdHzvTW87WmheE56y1+Zrxc9CPp7IZ1JTCMmzqAHBh5fpd8IjEQ==
X-Google-Smtp-Source: AGHT+IHF4vbD9vhOn3SdH4o1mgyyRbgjnnJ+BfvI8KX26iICPEspnmI2UBgYDwJRc2VgEgWvnA73mw==
X-Received: by 2002:a05:6a20:29c:b0:1bd:2894:4015 with SMTP id
 adf61e73a8af0-1bd289440famr10062918637.50.1719608326894; 
 Fri, 28 Jun 2024 13:58:46 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1568f4esm19709635ad.191.2024.06.28.13.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 13:58:46 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH v4 0/2] drm: panel-orientation-quirks: Add quirk for Steam
 Deck Galileo revision and re-label the Deck panel quirks to specify hardware
 revision
Date: Fri, 28 Jun 2024 13:58:20 -0700
Message-ID: <20240628205822.348402-1-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
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

This is a series of 2 patches. 

The first patch is from Valve's public kernel 
source tree. It adds a panel rotation quirk for Valve's Steam Deck Galileo
revision, which has an 800x1280 OLED panel. The previous Steam Deck panel
orientation quirk does not apply to the Galileo revision's DMI. I have
added a short commit message and signed off below the original author.

The second patch is one that I authored to clarify which
device version each panel quirk applies to now that there are
multiple Steam Deck revisions.

---
v4: add missing S-o-b from original author of patch 1/2 and re-signed commit
v3: fixup inconsistent patch versioning across patches in v2
v2: fixup patch 1/2 commit message

Link to v3: https://lore.kernel.org/all/20240627203057.127034-1-mattschwartz@gwu.edu/
Link to v1: https://lore.kernel.org/all/20240627175947.65513-1-mattschwartz@gwu.edu/

---
John Schoenick (1):
  drm: panel-orientation-quirks: Add quirk for Valve Galileo

Matthew Schwartz (1):
  drm: panel-orientation-quirks: Add labels for both Valve Steam Deck
    revisions

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.45.2

