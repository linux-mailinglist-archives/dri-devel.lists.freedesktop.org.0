Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79678149F9F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891E86EA29;
	Mon, 27 Jan 2020 08:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8DC6E87C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 15:46:57 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id o69so186184qvo.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 07:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HvYFViqL28zytVfNmNuYVFJbpXhgQcfqxtA7e3MQQgA=;
 b=H71c1YvVdSF+ZzdGawRQrhOmkKPTPmEeF3dwYm78HwLCmA+OUNnMDFlVjOiCQTppGW
 Y6/oHiqBbfpLrTR+HM+2G2yZEF7nKHoLmFBvEnwreZBfxoi2IlwPOr04mn5jSqVaySNF
 Wu1Fc6IZBsomOv9XwIg+23lyWlFYqJbuaU/e68mn2DeQcw0sE7ReDYi5zSUIG6BR4DQ0
 Dzw5Dp+1kaetpwKkLpLhPCLMRuFnaHtL5joNEXKUGoXiLNwmCssA9hKMphQkCJy167yk
 YztWoG5STuH6AyejSScXOHOvl2heDgw9HN4Hk69XS1nAUuM02Gz9sDS+2rwe6HhqsB4D
 EHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HvYFViqL28zytVfNmNuYVFJbpXhgQcfqxtA7e3MQQgA=;
 b=lZG9D11UgPHi2bZp9OiPavdGDJ8Rx0rlHG8nivEqT4AllpVPnX4C6UnIHdUWGtiLC8
 KVlPyLPUJpIuRLmCFOSKFlFXUmf+/pUt/oCiDMPV7Izzc1PCtDTEcLyMT706J7HT7tso
 61JSx5kDYlef0fSTpUyg5M6gFUxPQmxat9cQ1HSFxXND+VxlWHkeaXxQTTVzdKiNeEH5
 tRJCOBnRNsZZ4r0aVF1CxOE8Y6y5pBlbVIQtnpHtfkx6zOhm2dkCLyPXy4TEbSlEO7f8
 Pd7abqmiuguVELUeM5Q+Qz/2U4NZBJh+X/diFdnULZd6JdWFgiojR3Vb5Qv06nzuph/r
 esNA==
X-Gm-Message-State: APjAAAWlzuykDzT80NVml636aERjI5XC/psAV4+/yN21iOknhNFOFasa
 Hwl6E1Ym0rCTuucdLvPIhd/DH1wI6R4=
X-Google-Smtp-Source: APXvYqx661QbpozApU+vTRAZlqYwssYbFs6vkJCY0wRjauYH0Je1ApVtPELPbAXaYX5n89VsxjdFpQ==
X-Received: by 2002:a62:e40e:: with SMTP id r14mr8398426pfh.115.1579966696800; 
 Sat, 25 Jan 2020 07:38:16 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:717b:4cd5:6ebd:92d1])
 by smtp.gmail.com with ESMTPSA id m14sm10552058pjf.3.2020.01.25.07.38.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 25 Jan 2020 07:38:16 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org
Subject: [PATCH 0/2] Support for displays based on ili9486 with regwidth=16
Date: Sat, 25 Jan 2020 21:08:11 +0530
Message-Id: <cover.1579963130.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The goal of this series is to get the display based on ilitek,ili9486 working 

Kamlesh Gurudasani (2):
  dt-bindings: add binding for Ilitek ili9486 based display panels
  drm/tinydrm: add support for ilitek,ili9486 based displays with
    regwidth=16

 .../devicetree/bindings/display/ilitek,ili9486.txt |  27 ++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  14 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     | 288 +++++++++++++++++++++
 5 files changed, 337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.txt
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
