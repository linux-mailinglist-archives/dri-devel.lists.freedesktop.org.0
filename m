Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A6A326DBF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 17:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CB56E0A1;
	Sat, 27 Feb 2021 16:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839456E0A1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 16:12:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n4so11564368wrx.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 08:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8L0fMvr8Juw0+FWxKzR0WBqNrhDEw2SqgZ9h6QXSd3Q=;
 b=AZ+ESH47UAIy15YfmnXCJv76yqNmSE8RlW1IRN8RuQdo4NZ+TnDKm2x6lpOUvMNGV1
 vVkqgjRFLEkF9LEx9DCEI91PfFI1NwanByQuTe9n2nbN8SgcONx/lYAFMzW+FJ+YfsSE
 Kmzho365fT8/KPSL6BtCE+q+wZl0zeAu5+k1N9npbVdulFj2i94HQIElrJTmC1ZpGLTp
 WcIU8mNRN124t1836WAGRG69dh63hq5GTH6Xqf6UCAJ2B3aYFxlw4vgNkpbSpuBxbMQ0
 4wBE994x+yevPKAWPA0ZGnN+7brEyImFQUhSlUzjh8bVEP8ExjjASErTOau8FCErSasr
 LaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8L0fMvr8Juw0+FWxKzR0WBqNrhDEw2SqgZ9h6QXSd3Q=;
 b=Q7yJTEK1azYUMWbxwYh/G6SnppiQ3bZLVlB52Fm26S0YYddctnAnWyoHjGmQ3bOD1X
 dztpBimVP+veYDHfL2tk4vVORkKtogMr2gI7nmldFZ1r5EVUUJS3Jt6LcbLtpjdis42q
 Wm0ur98Kk1iDODn5851GxLy85vk9q8ezGnHS01bZ7D45LLNmrZtq0XNRzxt8GnksfM+d
 y3enzSzME45igY55U+zidJApt7gXna+u4sn1lycnoKTTjp3C9WG2HaYA/xO87mqoqIKj
 T0gTrSJAxePidh6B5MFGXqRrkr5kehyFUstVYWXnUqoMYaHXUehpr8DB9eblmdxr+NvD
 Eq3A==
X-Gm-Message-State: AOAM533fyMEYVcuF+q7RhbEwxUoT0gM6PzNwn3krbbao4AaVl2nUGTLL
 2GPhOd+s/bnqLnHlKYgZ70I=
X-Google-Smtp-Source: ABdhPJyNjitvPkhLUbSk9Ff/vTlgnbbp6Ci60uCSjhqVnFNPtK11zA5i95/I8RDW1Ny9ZNglG+58xA==
X-Received: by 2002:a5d:6809:: with SMTP id w9mr8155024wru.376.1614442353238; 
 Sat, 27 Feb 2021 08:12:33 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700289c166d32b9da85.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:289c:166d:32b9:da85])
 by smtp.gmail.com with ESMTPSA id b15sm18390027wmd.41.2021.02.27.08.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 08:12:32 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v5 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Sat, 27 Feb 2021 17:12:26 +0100
Message-Id: <20210227161228.1632521-1-adrien.grassein@gmail.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
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

Update in v4
  - Fix bridge ops;
  - Fix i2c error detection.

Update in v5
  - Fix lt8912 name (lt8912b instead of lt8912);
  - Implement HPD via a workaround. In fact I don't have the datasheet
    of this component yet so I can't say if the configuration of the
registers is correct or if I have an HW issue on my board. So, I choose
to implement a fake version of HPD using a workqueue and polling the
status regularly.

Thanks,

Adrien Grassein (2):
  dt-bindings: display: bridge: Add documentation for LT8912B
  drm/bridge: Introduce LT8912B DSI to HDMI bridge

 .../display/bridge/lontium,lt8912b.yaml       | 102 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c      | 817 ++++++++++++++++++
 5 files changed, 940 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912b.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
