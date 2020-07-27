Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627B22E6D2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 09:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C75A89C05;
	Mon, 27 Jul 2020 07:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDC989C05
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 07:43:59 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id k18so1380389pfp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz4TcW9rTup6J1JHf4cL+vgG/kmFz0aHv9ruePdNsKs=;
 b=aFXOkM+Be+7mBtbE26DlXdCZ1eQ7pGgqRGMDv7uP587bt+zwmfsY4EiU1e0wTOgTy3
 Yw3ZlK7Y0MBV7i48If//5OPi/xfuJ7myy+YbKQ1g0MwO+4U+9eTWWoe8SzCgaZJ+dUEg
 wOytugbcFSL9vY8q9xzzyKmeiWm+gq9jldEOniIwHuJnAzv+oWs4lo6i3X7j181HUNOl
 0KY3hNz8ipRo93vT3i38xhYHmOosCK2Te7HhO1rdUrFxHyJBhMXzppT3SpiC7mbZp1jd
 8txo/0j375SmCHvYFEEyagYwGcCTmwlqbqkY86RUt5BW3L3F47+v5SuVM5jnf3PrGnct
 QBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz4TcW9rTup6J1JHf4cL+vgG/kmFz0aHv9ruePdNsKs=;
 b=RSHDDO8q6eEdgrHWam1BvpdI0FYzwAgeMO9hGpH70OTySGcoSBPEkEXHaDq/a18pDw
 rLRFkql1LTggMCJuiD8CFMrV7T1d6IGhTO6lcoZyPL/0dKzfFA0gGKtKd/SDuRqFfhd6
 2Ggbrh79FswjbIa1nccO3orHEObH5jfz+G+hx5JN2BheQJMW7giPELnQiOPcgAkJ29Mt
 WRZic73PhHauKTh+XYdXiyVwqG1tGzguNurziYhKmhdofrZKt80RIERnkWBZe69PC0WP
 cp8N15/eBnDPgcXVce454l3L4qgR1ZNeP7t2me+mGRUpszyVR5Bf40OmB77Rh83amie0
 V1Bw==
X-Gm-Message-State: AOAM5339v3PpySyGz9Ee0rZm5waq2bo2pwyiAiS/g7zqn4VXOpf7+GPc
 YjNqgb8Tu5PIa/Ckokkfls7QNg==
X-Google-Smtp-Source: ABdhPJzNAhwoobYuzfypI6jZj3vQId16bxmejaBmJhjHNhj5jBPLz54zUVzlg6Vppj/NNfSRoK5DIw==
X-Received: by 2002:a63:6c49:: with SMTP id h70mr18571850pgc.150.1595835838525; 
 Mon, 27 Jul 2020 00:43:58 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id n22sm13062152pjq.25.2020.07.27.00.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 00:43:57 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/2] Add support for Tianma nt36672a video mode panel
Date: Mon, 27 Jul 2020 13:13:46 +0530
Message-Id: <20200727074348.26116-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Poco F1 phones from Xiaomi have an nt36672a video mode panel; add support
for the same.
Most of the panel data is taken from downstream panel dts, and is converted to
drm-panel based driver by me.
It has been validated with v5.8-rc5 on Poco F1 phone; my tree with other
dependent patches is here [1]

[1]: https://git.linaro.org/people/sumit.semwal/linux-dev.git/log/?h=dev/poco-panel-upstreaming

---
v2: In dt-binding, removed ports node, making port@0 directly under panel@0 node.
    Also updated the panel_on delay to a safer 200ms as needed for latest Android.
v3: Replaced port@0 with just port in panel@0 node.

[1]: 

Sumit Semwal (2):
  dt-bindings: display: panel: Add bindings for Tianma nt36672a panel
  drm: panel: Add tianma nt36672a panel driver

 .../display/panel/tianma,nt36672a.yaml        |  95 ++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-tianma-nt36672a.c | 859 ++++++++++++++++++
 5 files changed, 973 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-nt36672a.c

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
