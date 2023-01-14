Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD466AB15
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 12:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC20710E061;
	Sat, 14 Jan 2023 11:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527DD10E222
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 01:00:25 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id v6so2050404ilq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 17:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M97B1poe5E1m8pRKPWmlzH7xdRB/G7s4vd7sxOh8JfU=;
 b=iCpVgOW0Qk7d39TEoAOHyhjb8/9UP9uv+s2E0M9CdmFRAT3u+1r+IUvnkCllC2ZGzu
 ZXg20Jpls8I0DfZGWFIX2pglh4cMNeO/cmpNf8biDpdM30lGwubkmav09F26N6t3bIK5
 owfVc6PdFHphzx9l6UpIm3FO/7qCxveL4n5MXxTNW8FnJCu8JWLQQf12ijLb9fjzfeac
 ymixjL2QcF8AxgbLTuWTwOvBedmkN+hPbK1GZ9QMsEYqgcy58kyYgwtEvjVh0TLwCRI9
 tI5CRzvwbYlQ4id7m1Bg4KVjX12zAe58SyUD6l0Zcb21sX0LH1+HTppRxSTgwpLEzhCB
 TrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M97B1poe5E1m8pRKPWmlzH7xdRB/G7s4vd7sxOh8JfU=;
 b=vJj+eaz3yUW6ahtu8j5q3XFTozyecMLBxR1oUXqNPHAHXGeLdAcPXk7E70w2/zubWs
 4I8l7qX0K25pm15Z86a5v7WVXZ0pLkVHk8hlMUKIt/pCCh4p64qTf7Z3EUiRAwi0Szqp
 oiYW/wEMfK3N5NqOloXfAW4yI8iZoXyn/OhHgAxQa72iqt3jGi6C6Me0oMA+kw+jqdzl
 HRjK1jxEsEpnfLMbPUbIAzCcfTAvyXrR3Ig3arVTYOXJYA+cXWKFIy2Dbg6Zqbkiqw8I
 QcR/V7KY9R/7xzjkvFmzXYJvzyb0s5HK7DstGLL9yjYwHZn+8aw3JjzWo1Bqu1wtbKGv
 jvwQ==
X-Gm-Message-State: AFqh2krOGoAZjx/6fQBe9HQxVbcUnPdSQFdlxe3cZra7/pSDDOh3N0Qd
 YNLYFremzmEc2y54WZ1cj6s=
X-Google-Smtp-Source: AMrXdXs4tO6gubNamHO0YTrHBNKzl7KOApYhShlUDiJyp9pUHqFWHMYvjSSYIC4F9zr3L+Gs6pyv7w==
X-Received: by 2002:a92:de0a:0:b0:30c:699e:7f42 with SMTP id
 x10-20020a92de0a000000b0030c699e7f42mr25924210ilm.9.1673658024476; 
 Fri, 13 Jan 2023 17:00:24 -0800 (PST)
Received: from localhost ([2607:fea8:a2df:3d00::6463])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a92cac9000000b003036d1ee5cbsm1787300ilq.41.2023.01.13.17.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 17:00:23 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Vinay Simha BN <simhavcs@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/2] drm/dsi-mipi: 16-bit Brightness Endianness Fix
Date: Fri, 13 Jan 2023 20:00:04 -0500
Message-Id: <20230114010006.50471-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 14 Jan 2023 11:05:05 +0000
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
Cc: Caleb Connolly <caleb@connolly.tech>,
 Richard Acayan <mailingradian@gmail.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v1:
 - move 16-bit brightness handling to new functions and revert API
   change (1/2)
 - remove Change-Id in compliance with checkpatch.pl (1/2)
 - separate panel driver changes (2/2)

This series adds proper support for 16-bit MIPI DSI brightness and
cleans up existing panel drivers.

I cannot test the SOFEF00 change, although I tested an equivalent change
to an external S6E3FA7 driver generated with the same generator. Both
setting and getting works on S6E3FA7.

Daniel Mentz (1):
  drm/dsi-mipi: Fix byte order of DCS set/get brightness

Richard Acayan (1):
  drm/panel: sofef00: Use 16-bit panel brightness

 drivers/gpu/drm/drm_mipi_dsi.c                | 52 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  9 +---
 include/drm/drm_mipi_dsi.h                    |  4 ++
 3 files changed, 58 insertions(+), 7 deletions(-)

-- 
2.39.0

