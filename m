Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AD09E8CBE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BD610E0AB;
	Mon,  9 Dec 2024 07:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XMloHuay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D5B10E0AB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:59:31 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-21649a7bcdcso6414735ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 23:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733731170; x=1734335970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=;
 b=XMloHuayeOZohR4Bss9Dq4wpS5aJ+zSebnQRqnNagwJ8hA5g1q98EfrhKKMcG7RG7+
 alDvi6wOhmZFwUpm4FaGq07e3t8/lE570DI4A5Ztb0akh9EPTwWc1hdQoZYXSCsR24Xj
 8Ue+Utk4l1p4ZbJFUTMz/r/E0KQoRtoqOLpAGT0/o6lapGbjhSu+v3+2JdxpFXHO7Qbe
 KQ72Fus2zut2+D+nIjSvGkwS4gRs5w2x6HK3omuMBcj3QptOld2xnZ+3YWrNQTpPtuTi
 gkaVHRGXHNBVx8vRY0BycyNliElZ0xbuEYXRsC2xf0PWDViXNin+7TdOUyn8N7VZ+eLp
 0wbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733731170; x=1734335970;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=;
 b=b2q/6CMYr+2I+LqvNAPUIU7/fErBANZlpoXqRqSxTlqccCW6yVNhZ/NAap34Bdj/x5
 FtX5bgZkaBJP09BmdceGYPkH9X7m7ckFGAMOpAg0fRjmbXxZOlmhP7csiD0WlxBDYdEA
 Nc6vLAMSvNvq/C7/GKrNSO0rByxnreSxvZdD0H0lggrxyduaxIiy9xNi7RY33T21gGPL
 /0TicVAEg1T+2zfhZOUaMIYtriOLOtbH1B8Rf2QJl2d40dVWt2c9VgKco2kqzzocFLJk
 +kP3pxXRAvgcCduys7n9EhMtw/uHR/UWORT1CV5I69Coi+oK/sl7nBbDSNxYx98IjN6K
 czcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVONk05SvF0Ok5es+h5anKmKDZo68bz+VIw2ciiZADbc8onSykcb0MwdK6yAnRFMwGCV0iLW/FgV3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykvHssW325Nls+7wx58tkDmjyvVlj+DKQyJwcH6WSpctSSDc5v
 FiTn+4KLG4kJ8GzQXkpXoAJHj1N2NfrOahMO1jiQohPLMN9+aK1b
X-Gm-Gg: ASbGncsQytl/fOGcsbqEuSAJmIx/vNs/ggMvnSEHns9GzkAdtu5ItDA+Dn9TNBi6s3X
 qXU1FmxtgYBWvMUG6/cli+sBebNzkwjooH+jHzTHqPjqSGioJS823rjPYmkZYKjgCRXrEVCnp7h
 7NgurQTtNPjWW5tJ903CrP5110nlUxkHLWVBosH7jv+TkSEwj6R2GOtfOU5g92erMPn9ltgZNLJ
 retetuXPOUccLTxRJFCSvwTpIKNkzdJH7e/PrhhosUo0HfZR5hg5CxXL5IhkwgFgw==
X-Google-Smtp-Source: AGHT+IGoeeJoIHfFKB8IHGMMHXOwW3xF5w1b+OPf6OpYRt5GQUeN2r72qeeit1SjjCo03L5SijScYg==
X-Received: by 2002:a17:902:cecc:b0:216:1367:7e48 with SMTP id
 d9443c01a7336-21613951f65mr187686175ad.0.1733731170459; 
 Sun, 08 Dec 2024 23:59:30 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 23:59:30 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nick Chan <towinchenmi@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Apple DWI backlight driver
Date: Mon,  9 Dec 2024 15:58:32 +0800
Message-ID: <20241209075908.140014-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  54 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 126 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1

