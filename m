Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C33F615714D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B836EA62;
	Mon, 10 Feb 2020 08:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D835B6E854
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2020 18:06:14 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id q39so3178034pjc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2020 10:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZU7g5zVIZ/P4SZ4dpB9xCWuJqO9E3k6FwzCkFJmuod4=;
 b=KxNiYfyCeByE340pvGYq+bgAhR+C842a+qVxzDVr2D6sqwJlyGXEE/ADYo/mXm0ElU
 h1covFXBZ4gGsBT0EP0EqPMxYq/6yS0QhqfPcGGEyBdJwpHLwakj7KySm3XmKjURdQpj
 jdeQMUY8zkvkClpZVpIE7UGh4VG4wqvrae/s3nVI01ULwe1mEVmoWzLCYjSe9PtQZ4C7
 iySj/0Ikkkln9qjTKH2qCaKRdUcAXjdcwwQHA4JNXe5zI6+DHEs8UHiBCvxztoz0KEGk
 eRa3dPXtT5rY8rdcrP1GhOmyJveTkW2J8H924S1Df1QnNhAy2cD1BDtWEwK9fPI8r5Ez
 YAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZU7g5zVIZ/P4SZ4dpB9xCWuJqO9E3k6FwzCkFJmuod4=;
 b=SqOtaY8Rin1GSRwezQz9AVE27uZCqccnFz/Pr5dsAeeBMqHmdhV14+7XHN2dYYmV2c
 RODiAiVQAwRvLvrEdTmawcYemRssMwCKPDg9AAZOf/7f9j0uIRAsk8jfiaZqdz8Yd1dF
 G5ODv42pZZ8Sm2MB6XqXkxi1XlGyBxIv6KEu25QSeWKWUJtPSj0EOHRR8lc+Crh3yS+M
 76LeQVtC3ehd+YoETlMtPuI3AbveJ7OUi2RRyM9Gmt2RVLHRLN0gp82Er0GQ81Mz5R1G
 k4HzapdQYDeVHUASmca5oDF1WXjAAj6JzbT8LXa1AYWBbbsupS6Hl1UypCFD2v96zqCh
 NVrg==
X-Gm-Message-State: APjAAAWdpmwHjG4Xyo/dom81aK/yH0FOZcAclBhJPCDxSt0A0kIo27tN
 VQQcJ3pK8yv18rlKYAf3kDM=
X-Google-Smtp-Source: APXvYqwVT34GcKgjHB08DF7tIEkPSLpAjSQYumkzzaNjl0k5tuQ334rGLBr6ofrk8f8FDzLoNDTHtw==
X-Received: by 2002:a17:90a:e28e:: with SMTP id
 d14mr16925514pjz.56.1581271574176; 
 Sun, 09 Feb 2020 10:06:14 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:508e:1313:1d5a:1ea5])
 by smtp.gmail.com with ESMTPSA id 23sm9454481pfh.28.2020.02.09.10.06.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 09 Feb 2020 10:06:13 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Noralf Tronnes <noralf@tronnes.org>
Subject: [PATCH v5 0/2] Support for tft displays based on ilitek,ili9486
Date: Sun,  9 Feb 2020 23:35:57 +0530
Message-Id: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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

v5 changes:
* made compatible part in dt-bindings less complex (Sam)
* added Rb and Ab tags
* dropped vendor prefix patch as it has been applied (v4)
* replaced tinydrm with tiny in drm/tiny patch subject

Kamlesh Gurudasani (2):
  dt-bindings: add binding for tft displays based on ilitek,ili9486
  drm/tiny: add support for tft displays based on ilitek,ili9486

 .../bindings/display/ilitek,ili9486.yaml           |  73 ++++++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  14 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     | 283 +++++++++++++++++++++
 5 files changed, 378 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
