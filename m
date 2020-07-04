Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130B12144DB
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jul 2020 12:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E626C6E3F5;
	Sat,  4 Jul 2020 10:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AB66E3F5
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:28:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d17so25071312ljl.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ChdzGdENdb3WewpqYoS1A7CP5uDoue3KfNFfd6bCwIA=;
 b=fF+bK/MiJoxHCkfg7qrlcScomt1i4osHKMgQvcelolBraTgtXUpwCB8jrvFyIPDP62
 1caqYhacM+ATxkb4nMabHg45uBsuM0RLFimP1cfJZQQTfTdkojDUeB39oFFUdMH9Ah6H
 XpnYIjftn9SnEACgOlFiBmWuVLk1m2UDLxjXP9KPQv0zSQ1VidFN79J2bxvk7htl9L/v
 qnLWpGVM0Ae8GxgQ1Mq2fu1crSqcdHCwecUD2TdJb/T//fRQOLpGYtQEK7zZHcFQfaxt
 zeN8XqfDlnqmmtoDlg4jGey+IkgjCAmbDeeBteth3g0jN7XfFbZ6n2MQK+CPfPIHFqi8
 SGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ChdzGdENdb3WewpqYoS1A7CP5uDoue3KfNFfd6bCwIA=;
 b=ubrPmh4qVnpNFKZCPgFJEf2lalPAz0QKByEHn8pM/tZu8NrMkHL1uqtOxcUH1CjF9L
 hIKwqsrkVwZ6wEIsOsCDD2uCmQdDmyJIzhgmGb+4/6xeHPb6OwQXhKUnRJAX46rtehj9
 YVOeg+88cVkwNxaXdksII2QF9lq9JkEE09jP5VXSCXAEkH+XFV1yLs5R9BnsSsj4YGrH
 Srp0nCHYobj2ttjwyj4nUUHU9SdMuRpPzNm8XB+NML04TearvS7GfEzLO+HeewvUnJmp
 UWPyk4y6XHm2bsnE9M9wVhnlNG51LNvLNBXVFNQWgFi/wZ4d9J2Hqosy86Xf1kFB2o/+
 b1Sw==
X-Gm-Message-State: AOAM532YESZm8CW5ydQ5BxmjkPz2c56SfkhMX6c6CP4USjje0gQWLDP4
 UFM4SN7E+74SWReQbQjuoiXC/9uEPbc=
X-Google-Smtp-Source: ABdhPJxVOX5CDm3eDrguOA0bMz3Bhuav996Y6x6qbdYp2fD2fnCwENNTrNAD0AjWmlnHnKvbHrMzxQ==
X-Received: by 2002:a2e:9853:: with SMTP id e19mr16421929ljj.436.1593858492750; 
 Sat, 04 Jul 2020 03:28:12 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id z23sm5366913ljz.3.2020.07.04.03.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:28:11 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 0/3] dt-bindings: display: convert panel bindings to DT
 Schema
Date: Sat,  4 Jul 2020 12:28:03 +0200
Message-Id: <20200704102806.735713-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch-set convert 3 of the remaining panel bindings to yaml.

This is a follow-up on v2 that converted a lot of panel bindings:
https://lore.kernel.org/dri-devel/20200408195109.32692-1-sam@ravnborg.org/
All was applied except for the reaming three patches included here.

One binding is a DSI binding so just added to panel-simple-dsi.
The other two bindings addressed review feedback from Rob.

Sebastian Reichel has a pending patch to address the remaining
panel binding in display/panel/

All bindings pass dt-binding-check.
Based on top of drm-misc-next.

	Sam


Sam Ravnborg (3):
      dt-bindings: display: convert innolux,p079zca to DT Schema
      dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
      dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema

 .../bindings/display/panel/innolux,p079zca.txt     |  22 -----
 .../bindings/display/panel/panel-simple-dsi.yaml   |   2 +
 .../bindings/display/panel/samsung,s6e8aa0.txt     |  56 ------------
 .../bindings/display/panel/samsung,s6e8aa0.yaml    | 100 +++++++++++++++++++++
 .../bindings/display/panel/sharp,lq101r1sx01.txt   |  49 ----------
 .../bindings/display/panel/sharp,lq101r1sx01.yaml  |  87 ++++++++++++++++++
 6 files changed, 189 insertions(+), 127 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
