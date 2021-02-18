Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F431F1D6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 22:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A48E6E88E;
	Thu, 18 Feb 2021 21:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E686EA60
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 21:05:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id v62so5130426wmg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 13:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NKu8nW+IhkI0fhmgVr8yPbUe1udaTjMcC5LDq4YsEcE=;
 b=osYveTfuj+Cgj+Q1WULftu2Kn47vghARQEgS0i9Loy7FKPxlxmhTAhKnU4Dav5dpKR
 rXA7kkmBlfWr1WWONlDA36mBUXfW/EmH/DnZW/h1YEOZqTAVZTHex4wiJUpj2p2mFdYc
 +qsp8R0Cm0v3Jqw6KPG5swda4T0mwXRIixpZFS1g39zlChp6QUzBGwhP393mI+Ir23xH
 sawVMk3U1+ZG3yi2uZDGj1T2z8+ax19TqAsLPIIE6e+A/U4a6YulifhiHGprNxmHdD2w
 WqU6GpwDT71sH5KILU5FpIql51tZGskGYifyQrSge3xZeBRpKSKTnjR0eHQnl2uIGzUQ
 OFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NKu8nW+IhkI0fhmgVr8yPbUe1udaTjMcC5LDq4YsEcE=;
 b=CeuKKgdEW4RBRm0M4aNYOZVaL4HhnCMt1pGK0R/0XtgnuJnsHTHIxYj1T3i7U806LY
 q8aMFMcBu74WBtP3vbp3VByFgPytn2l8V4GHQ2LGxIjX/5PQ8Vs3y12RVXZMhtux3ugR
 9SWfG+n3EReoIzr3Ew3MAUzCJJ87KvOWSKMSY+vi9nbvV3Qmuq3075gbuVhnxPW+/QDK
 AA/a2UcIQsj4skDY4qdC44R00//sw9RcYIeNZyPtZxowD8pEdnyE/0vLglYw7GmvgFmR
 OtlxCvTBlDnEcFPooJtAwHXOICXDn2TwEmOXj8iIN3DfeFciYM7c6NDudF38AgkwY4Am
 nBUg==
X-Gm-Message-State: AOAM533XOEuCZkN4EYScah4fvJogWbxiuSxEagbQIHCSzo/a7J1pjbQd
 sLTfSM2iWid6QsaDweSrEu0=
X-Google-Smtp-Source: ABdhPJwBAIVnorgmOFhuQV+xAPUIp17Uton26DgC/TS7PQgpGmgxBZyThUYYDsaXuezZFuJUOintOQ==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
 g6mr5246257wmq.2.1613682315921; 
 Thu, 18 Feb 2021 13:05:15 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb0008bd270040b01df6f3b9f578.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:40b0:1df6:f3b9:f578])
 by smtp.gmail.com with ESMTPSA id m2sm8450878wml.34.2021.02.18.13.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 13:05:15 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v3 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Thu, 18 Feb 2021 22:05:02 +0100
Message-Id: <20210218210504.375752-1-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Feb 2021 21:55:23 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

this patch set adds the support of the Lontium lt8912 MIPI to HDMI
bridge in the kernel.

It's only support the video part, not the audio part yet
since I don't have the datasheet of this component.
I get the current i2c configuration from Digi and
Boundary drivers.
Developed using the DB_DSIHD board from BoundaryDevices.

Update in v2
  - Use standard data-lanes instead of a custom prop;
  - Use hdmi-connector node.

Update in v3
  - Fix indentation;
  - Implement missing bridge functions;
  - Add some comments.

Thanks,
Adrien Grassein

Adrien Grassein (2):
  dt-bindings: display: bridge: Add documentation for LT8912
  drm/bridge: Introduce LT8912 DSI to HDMI bridge

 .../display/bridge/lontium,lt8912.yaml        | 102 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912.c       | 760 ++++++++++++++++++
 5 files changed, 883 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
