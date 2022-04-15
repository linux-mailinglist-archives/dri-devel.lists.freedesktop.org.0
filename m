Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A8D502D4C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 17:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF7410E1F1;
	Fri, 15 Apr 2022 15:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BE910E1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 15:47:53 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u3so11104861wrg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yLsy6Cg4nTGsce8DJN5bhB9sYWSZN/u1ooAdq1shsLk=;
 b=WofpZkYJduA5PuvzLuKjMGm5LfRHMtkKXOmASzQFM1iFhfMnjmM64iV5kvhVP2v0p2
 EuFG3koJz7aQauCoXnUnU1KSpMWBWKxBuQ9swkkmfo5JQzGjIHnKepNFrnpy5iNkruDA
 yHwMexMsrq5EviVYM7ETRB4tMEtOFZYaYLw6/V4xFI8oiNEwvdobkFDc9SqdYTgWQ8nC
 g9DDbWrR00qjcSOkmDo8H6PPpwQSc/6wmZ5gVhjZ0cgs48j+UnJ7rEgMX73Rxf/cIGjS
 X7xAfhrNezhpGwjKKQz1xGOyWAWdYNIPp+YCWKpOoJWbKCP4leN1v/cnofnhYIQrz5X6
 B18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yLsy6Cg4nTGsce8DJN5bhB9sYWSZN/u1ooAdq1shsLk=;
 b=hOvlDQthnOlA9K7CzJhiIMZFpppaIPoPo2f9kUW6Q5Y6jxidCm12X6DNMCjsIZI70w
 ZzdyEUM9MawUdPasEKU2fPAC1Gbd8AiJ0vF2GNFJn+cHG4sR6zouekLqASxXPx7NbtyX
 H5rN6BjmlQjUbNMJJayeLqSxPp9vJSdr7v6KZOHDcDHY3DVz7Xsnh/V1RmamdZ1/kR0C
 mQ0NQ8Pv2osNIH7EkUh+5+vob0pbrDK1L4VYnVwke3zlCaUm8/Rd8IpJtu7mS2yt46cp
 n5tB5Wo8N91IDn40w8vOpEQxaWtls0mGimWoAcDVGg7jRqDGBT5qoXC0rhFnjLKT2wmm
 2jfA==
X-Gm-Message-State: AOAM530Zm75VMecfrXADzcABwsLGuNu4c64fg29sgr+IByvJR0YhPfIB
 ZgxRJRht6JK8fc3xJrwGJ5Y=
X-Google-Smtp-Source: ABdhPJwUnErCAHL9a4AcK17pgWqUQWIkLy2B1nkMsshWvrsNjnjDKIXrvUU7UPMMlAAUD1dZdjbHTw==
X-Received: by 2002:a5d:64aa:0:b0:20a:7f8a:ec97 with SMTP id
 m10-20020a5d64aa000000b0020a7f8aec97mr2082595wrp.450.1650037672319; 
 Fri, 15 Apr 2022 08:47:52 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adffb87000000b00207982c7f4dsm4349655wrr.67.2022.04.15.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:47:51 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: emma@anholt.net
Subject: [PATCH v2 0/2] drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Fri, 15 Apr 2022 17:47:43 +0200
Message-Id: <20220415154745.170597-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

These patches replace the calls to drm_detect_hdmi_monitor() with the
more efficient drm_display_info.is_hdmi in the VC4 driver.

As I mentioned in v1, vc4_hdmi_encoder.hdmi_monitor (removed by this
series) is used by some code not present in the mainline kernel but
present in the Raspberry Pi tree [1].
Let me know if you want me to open a PR in the Raspberry Pi kernel
project applying this series and fixing this issue.

Thanks,
José Expósito

[1] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/gpu/drm/vc4/vc4_firmware_kms.c#L1410

v1: https://lore.kernel.org/dri-devel/20220406165514.6106-1-jose.exposito89@gmail.com/

v2: Add the ftrace command used in the first patch
    Remove vc4_hdmi_encoder.hdmi_monitor
    (Thanks to Maxime for suggesting these changes)

José Expósito (2):
  drm/vc4: hdmi: Replace drm_detect_hdmi_monitor() with is_hdmi
  drm/vc4: hdmi: Remove vc4_hdmi_encoder.hdmi_monitor

 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++-----------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
 2 files changed, 6 insertions(+), 12 deletions(-)

-- 
2.25.1

