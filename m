Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D6C14B0E9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ECE6ED09;
	Tue, 28 Jan 2020 08:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4106EBC2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 14:25:06 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id n7so4967010pfn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xgGQ8U3A5kqg0C8/HdgwH0P9Ql14HnR66HG6y+CNuN8=;
 b=AbYUcND03t3MKu1VE1KLUJh1WdqEUUP/jq2b6vOAWi0OZiKqMJOtil1427yDhU+X1k
 t8Mos5yP3y8b+pMYSl8JCkjP2i6viSAuxCCC7pWwSX6GTj4fpjzmAtF93QhPZkdbJZQZ
 XX+Far7zf3a63NU7MP6l2w64FldhkrCskR6sU/pzRikY4vsdcx+ZQ3hkqIop6gpTBp8r
 hpVZl2IfqK5D3KA+Er8NqeKeEo/IYv2vJksl5S33RpATbkvK2X2DpoV4bIUwFAY69Q6R
 iyh2vbOr98qOws4QWQ6kkpD9+3Oguy8Cp/dl76h8YFfegw9kF2BjSzmNipGHIJc38muE
 6RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xgGQ8U3A5kqg0C8/HdgwH0P9Ql14HnR66HG6y+CNuN8=;
 b=aT2s6QwPZYD1+m5y4Jk4o23WSSrXoDubWTGMyT8RVfbC3zBVMGWpcIbfrHw6aQn2eY
 D/4ilo9gTWZb2Zqpvfsc9Hve8zjiE8lE2sm0F519NNwj56qopYmFRUHf+euU74eJSZ+s
 L9thhv8j/ynK0gElMB2+PYNDe7iWsIvtdLMN2naW/FwIrxE4zUxILjJkZX+bIdNM4eC8
 JXKorn85epR6SZ7mRxqr5yYL7BVeQWzQWIxVQI3RdF82Rr7JvMkc/pyEgnrnLjbnGTCO
 jIfB/rfukWdMI+h0DsGKHY+c6779tye7CV2Xd5sPLjiTM+0OXfDMEADiHCLo/vX3MiBM
 XQDg==
X-Gm-Message-State: APjAAAV2UsIOHDvYimW9zfFajjqeut8Wc5ZG/bO8itkjobKDQ9HGvP9/
 2msFyFB5QccsQBTUcq0yWbw=
X-Google-Smtp-Source: APXvYqwUG2E5ZQLmyu1s55pWcNljK1w+OwcR8s0+RtG9/HECgiJtj+d7FGvnmCBC3OlB6GWQiV9ZTg==
X-Received: by 2002:a63:2842:: with SMTP id o63mr20203056pgo.317.1580135106370; 
 Mon, 27 Jan 2020 06:25:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
 by smtp.gmail.com with ESMTPSA id
 u11sm15963603pjn.2.2020.01.27.06.25.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Jan 2020 06:25:05 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 0/3] Support for tft displays based on ilitek,ili9486
Date: Mon, 27 Jan 2020 19:54:49 +0530
Message-Id: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The goal of this series is to get the displays based on ilitek,ili9486
working.
Ozzmaker, Piscreen and waveshare,rpi-lcd-35 are such displays.

v2 changes:
* Changing file from txt to yaml format
* removed ilitek,ili9486 from compatible string
* assignment of dbi_command before registration
* made dc and reset gpio compulsory
* typos and unwanted comments removed
* changed the name of function which were display specific
* arranged the Makefile entries in alphabetical order

v3 changes:
* added vendor prefix patch to this series instead of separate patch

v4 changes:
* removing checkpatch warnings

Kamlesh Gurudasani (3):
  dt-bindings: add vendor prefix for OzzMaker and Waveshare Electronics
  dt-bindings: add binding for tft displays based on ilitek,ili9486
  drm/tinydrm: add support for tft displays based on ilitek,ili9486

 .../bindings/display/ilitek,ili9486.yaml           |  79 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  14 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     | 283 +++++++++++++++++++++
 6 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
