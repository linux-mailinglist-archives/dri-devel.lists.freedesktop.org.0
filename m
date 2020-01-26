Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636FC149FA2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAF66EA2E;
	Mon, 27 Jan 2020 08:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD86C6E9E0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 17:39:27 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 4so3969647pgd.6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JPhbtBY8gOwYPx83UtyAbhByhPVYNxgtrCHSPOuLVIc=;
 b=drZFzvjTvMiYn9QTMd/4CgtR03LvxmNKIhzuCqVkUTJfZ5i9jskToxvFsUmMnIe/HN
 x/OpkkvGh7O4olV81J59L3DUglC0F0GZxiUwiy3NK6vXKtQyE8QbduSCRflmgJFtEauR
 3hDwTvqLMB8nZ/HbIPm90g5PZhPUSSsD40NndOo85lcqbNcSYQtzgyT3Gv8lD3n2QGsV
 smYWW0kdm8c1mfTlOA/yUVi/cI8f9u9EV6tD+DtiSJfD8pfxByk3YWhiNcRt/cv+0jaU
 xUCHPkNuSA3E4pmu0fTCQdoHaP7A70QdcxDJ4EfsCItRgBRsgi3hr8gKIV+1wf3rHckd
 zOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JPhbtBY8gOwYPx83UtyAbhByhPVYNxgtrCHSPOuLVIc=;
 b=lry8TkwClU3Q4wLD1TleGom0hjPycJRe9m7Hne+z3UGRv45fRZr69DFunW6Y9hykY5
 oSap/7Cn8+5wXSgw5ViJX7LldRoFsmUvR6h7KccB6IVXTjlF2ieviHjWR9w2EfrW9sBD
 Aivo5aQqM/Hoas7YbItviS74150rZXfVjmAwiU2DdPB7pvelfQuNb4ZcPCmlkwoATyC/
 Wg5H9+IiHDFi0jqrZ+j4kqXukPKUpHSP+X+r5VDAKnqzComv+395ZV7aW/KiZIsRifgZ
 cYZDDhOCIU7AedwyeHhn0KU+LNRxqUj/ymN+O8PgY+dTSW7VrOdbAdWsgyURtdMSO/Op
 oXXQ==
X-Gm-Message-State: APjAAAW/E4GMfozwRKFGll1tMo+YC3gNaLfD4xT+QUcYFBya4meaKrdW
 XkMJumK6Sf01TtYSA1TVavfgJGZHXjy8cw==
X-Google-Smtp-Source: APXvYqymd3pnKnhpGeURpfHiVrfcNVx7H6x5T+c2klPzkNN9/ENjmoTTDJdgYC9G4F+kOwyRNlWXQQ==
X-Received: by 2002:aa7:84c6:: with SMTP id x6mr12158872pfn.181.1580060367329; 
 Sun, 26 Jan 2020 09:39:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
 by smtp.gmail.com with ESMTPSA id
 c184sm13125548pfa.39.2020.01.26.09.39.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 26 Jan 2020 09:39:26 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 0/2] Support for tft displays based on ilitek,ili9486
Date: Sun, 26 Jan 2020 23:09:00 +0530
Message-Id: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
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

Kamlesh Gurudasani (2):
  dt-bindings: add binding for tft displays based on ilitek,ili9486
  drm/tinydrm: add support for tft displays based on ilitek,ili9486

 .../bindings/display/ilitek,ili9486.yaml           |  79 ++++++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  14 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     | 283 +++++++++++++++++++++
 5 files changed, 384 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
