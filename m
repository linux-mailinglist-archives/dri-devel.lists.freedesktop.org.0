Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530914B0EA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F526ED08;
	Tue, 28 Jan 2020 08:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B716EBB6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 14:06:52 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 2so4949525pfg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 06:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UR3h5nrfJHdQliakSZtipAYKwFl6uOKWlJ6IfQvABM0=;
 b=L12qN+kJLWkPwQhT4M3TBYMoUEmBbJ6U2VAEvfffXWHocq74miL+za2/eE1qEUW3wf
 2xg8zF0C64LG80ND9N8KNIWHhiACitzw/CgcJEDu1c3tEgRqrGMy4slGg5+5xBabi3hn
 ob9EBJSYyw4VK9pBxV9rEFYFoCErnOA1OMNNAozzbhmYpGoq9WiZwEyHsI72W5/9RMZ+
 SIBPYqQiZImwJVENcm/f5aDysYzGmbQ29oAitztenbceLza2PGuekU5WdKGsVAe6TFQA
 zyZNIXBPv2HpfpYt1MVjsvp3NikHaJ0vmczXmHzZYBfJybn97Dy2IwkNapNGnKZFwEfa
 EE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UR3h5nrfJHdQliakSZtipAYKwFl6uOKWlJ6IfQvABM0=;
 b=SoTUjpGtbjy18pkvbQSwQy6C0cuv4VfsD47ki40DbW1T57ff3zp0800yhMQ7iIjVva
 8R/v3KKP7NdPkq00EO3uBMj5dIFRa0dCHdhc1wzMn6rBw4ZxyNvv/hox3Yb8htWR0R9O
 yOlRZ3zOmMqEfoxASQOBNZCOdXaOUf4bP+mjdICR/+ngqe+79Q7CWF7cIvsu96m8As/0
 szJoGPo1GeodJA89dudahWcm7DLMpo+xWl/HKeb70voBV++TtnHDxtxsmsAd5MF4z0zU
 dgB7doi5qGL7eRtN4TdT/cXXatMM7iwABMne2RawEq/IZQGJl3TUQaqyhkPxQL2VsSGV
 OTHw==
X-Gm-Message-State: APjAAAWhXv63zV6PC6MLuXYIpROnFPpThDmgoCbAmoIrprVBvWbO1PMP
 2tni+5AYLOSockYNhvE7STA=
X-Google-Smtp-Source: APXvYqzYXpmMd8tKKyZVc2br06gRBHFtpr+30z5ChUnFVkz8Nrrz3j36MshggXJp4KbyXxZhfMlS5Q==
X-Received: by 2002:a63:6c82:: with SMTP id
 h124mr19563264pgc.328.1580134012093; 
 Mon, 27 Jan 2020 06:06:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
 by smtp.gmail.com with ESMTPSA id
 q4sm12779225pfs.65.2020.01.27.06.06.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Jan 2020 06:06:51 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 0/3] Support for tft displays based on ilitek,ili9486
Date: Mon, 27 Jan 2020 19:36:44 +0530
Message-Id: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
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
* added vendor prefix patch to this series instead of seperate patch

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
