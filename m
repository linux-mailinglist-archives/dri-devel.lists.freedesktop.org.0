Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4170DC0C393
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC95610E2CA;
	Mon, 27 Oct 2025 08:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JfCErtHV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9447610E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:06:24 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-57e8e67aa3eso8207266e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761552383; x=1762157183; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v1ar+zOx3UK5ZzhkLv+Cc5rARED6vyzcN8kpDrUCdNc=;
 b=JfCErtHVGgd1tXwP5SOOlVzH6mNJNlv+7zSoa7VWZfnuwvWKDt1e/maaXtsEhlXOk4
 G07by+xyszgcWngQTSpdLTIepbKYrY9WIY3VmOoYljTmt+ITN7Pu7Td19fSD88f1ASHL
 2VAi4Cx5mFy0moc1gKcpAoBMZld1yIyalqDzJPEmcgkLPQifVStv4VLgz2LOcZ8BPwE4
 x0vMuLdYU43w2MRieCwjQhCOahT0b+lheJZYQ3nhBsp8Wu7tmLcQ5qBgIhKRuiZ2KoLX
 4/0BXQGRi84cY2MMBpyXbwsQ6qYjPrEBMUpxhLfUflYiKGJ4y9iyYs8cnBVQmsO1JPO0
 H6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761552383; x=1762157183;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v1ar+zOx3UK5ZzhkLv+Cc5rARED6vyzcN8kpDrUCdNc=;
 b=EwacKD07HL0E8yaopNCG1gwyNXwdXyZFJ8ZGMcIb7N7azJfkYJo57GM51yjqLuaKuC
 EHMiZIwgVhEHpBQ/LXpLSn/nk+BbOfwk+n5kYd9ejgCEVy5A1u4x+SZCbsK7+ezDhrgl
 tg7PccrPm3V/8RSEwLEhW/+JEmqX2d0PKXT/wsY8dL+Y6eC121rRfda6J42B37uKN23L
 DQfyB36N0H8dGznOkVw0u4VXBp+1x0PhncB7qWW7FnDReZAq9OQKuU95s1/1IfYfyt2T
 jF65sqbVg6GrQinKSAtwhogVbcOx2oChjBCipfL/lgY8OuLDqpT5Oww7e049lUxssLB1
 fdnw==
X-Gm-Message-State: AOJu0Yzdc1iYApsslkufa5uJnt7x2VZT7xlk4pQXxhqU1IL7L3EtwdSu
 n8zX4NBKz040LDj6tmhphZqzoDS+4ud4Xs0M2tcior6ek/UypnIDfs34
X-Gm-Gg: ASbGncv6EFAo0szCkYYR1SvF9zdPHJqmbmyKiZMFaBq5wb4QAzusXcH+qYHqx8t3AQw
 +AFtxraOzVAAviuxegMTt1MiVVTudvhZJhykO+Hyjb38IjdYCWUd0gUL3oTSlrZEOOAN2k+ZDvZ
 moX6XXn/2z+OUvLR8yCAyDY3sE8KlQ0LhEQGnBWNr1qLlWc1b2m5Q/c6lMVYkbOvg9vN5sbOByF
 r5QyyRgsItkN7fE6BASTqjnqDo7d+kvrrLPeUdK58hVGakFwxjLiSY9OufhJtS72n7skYboTbpy
 pK/bguftPx+xDao1OOuqddFxwNbFt+uyOiD6nQUwhXopZ9fIZEjMryEYixGerMhEzUq2iLbThKY
 6CMCFobpo5YluWcFvky1gulx8fhUPmZwjF4qP+T25LDAmNRKyw4facAvDIDJjvA2vR01WS2om4+
 jh32GN50YKH7ruYfLdiYeG0MUHcaFRjPuXsrwGnnhMl/Z0
X-Google-Smtp-Source: AGHT+IHFD/pP4nQCmY0EGsGYROyGVf/b4kAAN6SMJ1j5q07/foKaGrRisSOwr9EE60mOw2Upx+akoA==
X-Received: by 2002:a05:6512:3c82:b0:592:ee37:935f with SMTP id
 2adb3069b0e04-592fc14ab79mr2762129e87.23.1761552382395; 
 Mon, 27 Oct 2025 01:06:22 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41ce8sm2210689e87.6.2025.10.27.01.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 01:06:20 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/6] drm/sitronix/st7571: split up driver to support
 both I2C and SPI
Date: Mon, 27 Oct 2025 09:05:40 +0100
Message-Id: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQn/2gC/3XMQQ6DIBCF4auYWZdmQJTqqvdoXKCiTqJigJA2h
 ruXuu/yf8n7TvDGkfHQFic4E8mT3XOIWwHDovfZMBpzg0BRcRSS+aAqxZk/VgpsUKXsseZYawn
 5cjgz0fviXl3uhXyw7nPpkf/WP1DkDNlYYiP65sFLnJ7zpmm9D3aDLqX0BZ3QAQKoAAAA
X-Change-ID: 20251024-st7571-split-c734b06106a4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=SHyI8R4tmfpX+TjjAvSZcqT4Jl7+j2cCDwZNAwIZGOs=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo/yfZ6lE31RLIHMMdUpzBdIAbtj8tbfuXtK1pA
 vZdgsxX10mJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaP8n2QAKCRCIgE5vWV1S
 MlduD/0YBuEsX6OM/b+GTbUOByMwjJPSqIEhUnjWivr0lu5tR7rwpb/AqHp+DN4d8xu0LUKYSkD
 U0nvwE2kvqdWqJfBBCU4xzYS7Nbm1CZFJg+So82FdSPkjLJNkDJX0oWH9JOvFB4TM2QvaH4rjKW
 9ke2BzSY/VzZkUiBwJ3lWAzPSWnZxui+AQ+WSF8boQljOP2Luiv7K5gDOgmHQWxvfV7hRug4QUf
 aUqXsGj7IPJT69mU8Hzdw57N6ecipzVduImjgZiYTlQHSpD9mdXf3qvxC55x5K/KnpldOVJvk3/
 2MxpwRVep4HBZAZJstOMucS2n8GIAAE00HrOTfXH3mGQ7ITHT79gnvBfXHeZYmZy09QrhjfaSPx
 5X932T82lCZCYDcsfftaKvYKtOOeK9JNHkAOwhwRECzv369GEP338OeF2Kht190ec/fp5t5x+fK
 py687eo9TCqFM2e8hdqV4iuiFQWweKRruIA/4AIiwU/EcxR1bVuqUa1aO4AYmJyEZKIRNoj2KsI
 mX659BEqs5tcEMfjFNcZ64t9ceW933ZANQqwFZgyXOrsCeo4j3qaE0Nw2GRH/XBPqaU5JP9e4s6
 QW0p+yoZVPBlpuG1/Mzp63k3vBlekJvSNmyoRl69dIXQcCIhmtM+YJRETQFQ7OzTlqtH4xe1Wc7
 XenI6C9JP+eqS0Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

This series splits up the driver and finally implements
support for ST7571/ST7561 connected to a SPI bus.

I've not tested the SPI interface myself as I lack HW, but the
implementation should be okay from what I've read in the datasheet.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Add MODULE_IMPORT_NS to st7571-i2c.c st7571-spi.c (Kernel test robot)
- Link to v1: https://lore.kernel.org/r/20251024-st7571-split-v1-0-d3092b98130f@gmail.com

---
Marcus Folkesson (6):
      drm/sitronix/st7571-i2c: rename 'struct drm_device' in st7571_device
      drm/sitronix/st7571-i2c: add 'struct device' to st7571_device
      drm/sitronix/st7571-i2c: move common structures to st7571.h
      drm/sitronix/st7571-i2c: make probe independent of hw interface
      drm/sitronix/st7571: split up the driver into a common and an i2c part
      drm/sitronix/st7571-spi: add support for SPI interface

 MAINTAINERS                           |    3 +
 drivers/gpu/drm/sitronix/Kconfig      |   38 +-
 drivers/gpu/drm/sitronix/Makefile     |    2 +
 drivers/gpu/drm/sitronix/st7571-i2c.c | 1003 ++-------------------------------
 drivers/gpu/drm/sitronix/st7571-spi.c |   76 +++
 drivers/gpu/drm/sitronix/st7571.c     |  918 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/st7571.h     |   91 +++
 7 files changed, 1162 insertions(+), 969 deletions(-)
---
base-commit: 07a4844f2ef49f352ef46d0a4774ad63576a6694
change-id: 20251024-st7571-split-c734b06106a4

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

