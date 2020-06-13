Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C471F8FA6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F126E0E3;
	Mon, 15 Jun 2020 07:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7626E15E
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 14:06:34 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id h22so1675527pjf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IK5yC+mXW8ZLjiUHkz/X49N5nZRFi1/NuMVfIcCI63A=;
 b=TjoAC/EVMbd/UAY7eQ7kuBpthFa6tila5Hde+XHB+I/x3VOzAvXcTq6u3eKTHkOMIN
 kW5qoTuWbCXQ+Hjp0oLoF2FUk3+1nam88trCg5+nTwD9gIZraz4Dfml0Pvhv5bgiXCui
 Aj4GbTtYqL/YPTDHXRCe+Ga99jecwt97255/aJIuTh+1DiWCdy70EpcbaST4FCNLCdug
 Fb3c5P6ydgqDxIIBdX/BdL5wlLxeVbTlzrNuD+BzbXpVWbdrTik6XHcCoYzgFVNrpl0e
 aUVJFoeeR98VKjoaMdKIzamOO402EQ97kevzpcH4siCypYlIsps9Aro9mxjar+kHifjM
 57Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IK5yC+mXW8ZLjiUHkz/X49N5nZRFi1/NuMVfIcCI63A=;
 b=AtyV7D/Vt2T6LGYP/PyNqra50zWaRiIFWiNqb3XXd3Lo3K8cPMrxvBj6qVZjZ2M+AA
 tRmsaeAjN2b0mGK990bIIku/r8k6kUBPomtE7AQBFKSZ6snSQdLIe3/E0/hbqsgG0Fj7
 HDLHI7CrDwlOWFyzRLNACVf+bv0w8+aQZ+Xs557yT88VrunHeY6YhyCicm5iTmU4/cZC
 5vSosmcPQT8ktfZGxNYluNHQngXZYV7Jg+poj7RyC4cKrXCCeAOLh5KR+p1OMPZ+FHFf
 2gW3ZXfv4K3ZPKo1bgLRNA2BspBZXSgTJUV47Wkt+18KwyCiXzrCW1hP4SfqvYWS1FmB
 UtdA==
X-Gm-Message-State: AOAM531+jbkloYGQl+DJALapJ5eH535CzEVhJzHwEZ+Eb/9JoHNS4WpA
 hLCS0SaAUAvMrKVXDHOavec=
X-Google-Smtp-Source: ABdhPJzBjlWK9yd8lsoYPLMQRIvyiHWL206wgm7uKsMFuX2GOiRHzI8v9oyzHB7wal49BSkNISSfCQ==
X-Received: by 2002:a17:902:b493:: with SMTP id
 y19mr15089701plr.186.1592057193745; 
 Sat, 13 Jun 2020 07:06:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d809:ffb0:2ceb:aeb8:b257:998d])
 by smtp.gmail.com with ESMTPSA id i3sm7786929pjv.1.2020.06.13.07.06.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jun 2020 07:06:33 -0700 (PDT)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Noralf Tronnes <noralf@tronnes.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] Support for tft displays based on ilitek,ili9488
Date: Sat, 13 Jun 2020 19:36:23 +0530
Message-Id: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The goal of this series is to get the displays based on ilitek,ili9488
working.
Eastrising,er-tft035-6 is a display based on ilitek,ili9488

Kamlesh Gurudasani (3):
  dt-bindings: add vendor prefix for EastRising Technology Co.,Ltd
  dt-bindings: add binding for Ilitek ili9488 based display panels
  drm/tiny: add support for tft displays based on ilitek,ili9488

 .../bindings/display/ilitek,ili9488.yaml           |  71 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  13 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9488.c                     | 446 +++++++++++++++++++++
 6 files changed, 540 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9488.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
