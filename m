Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E121C4EA0
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938EC6E52C;
	Tue,  5 May 2020 06:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD5D89CC1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 19:39:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u127so846185wmg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NW8oQWWMjyDuVRlAJpFreByMFafi4QpaqckDeeBZAK4=;
 b=BGvZgbNEWZJtJB/rLL03NY9rGi/ehlH0jg4N4WKhGixHvbUP/tquGIF4e4ki56rWne
 Tz+uVwFhd/70t7HHez2Wfo7FBUinRRAwV0VJriMwat8q2EEUNSlL64jdTT5bA10iKRyx
 IIowCe8n3GYDpxPnBrITwbAUvLNRl0fWAdB735ya0JBTSIRaMoUqvamsrQXPyr+8zaiF
 XF453YXLy1G6JebbBAtF6Qkh80Zh3npwl8uGSw1KXyMRg7rXYI3UU96M4TJ5/6WKwNoT
 yN6EOUFOZvFiEU0gO+PL9RHUPFEThCSX/0Tb5IUPAPUIyDtMAemXAQhDOqu87hAVH/Ds
 G6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NW8oQWWMjyDuVRlAJpFreByMFafi4QpaqckDeeBZAK4=;
 b=ZhNpXYuOBpiKwHLHLRbK6DwD9z21m9tU/+7QKseqUo+t4BQFILovoWJQcPR9+H82k4
 rWgCVaHe17AQlgV6bpb2lfnqsFRVSLA2xE4lsDixOceIPbi7PMzW2ksSGDBUS1T+SaS8
 pTAsFSiPW64V+ZL7n1+m89eXzT4R6nxBm/bEpFxMbSHyoflCFKzOkxRHxod+RLIciHbn
 fD+xWKHHjG/5TPpsZqILRi4WDR/tA/U2qA90/Mrkj5kAvUPTiKEvzbqn7uU3cbCp0Bh9
 agAknfMNFPddflgdj23a6LAIdDZfelT15MGzZF/vT57SIPwTx/GVhC+skPBtpnqxffjV
 fpng==
X-Gm-Message-State: AGi0PuZkQdxQEvy5YZ6ac81tbRdllutAbuU+GjPENWpv8qj1eLK5jDVw
 b84aZNHosBVYRe6mHUMSEEQ=
X-Google-Smtp-Source: APiQypKgVNA1FOuWyq3/1fPwRoS94xnMG7wOri4uYVEUV4/OF7DNlSDZCeZjGj/SyAfRTNf6GeY4FA==
X-Received: by 2002:a1c:dc8b:: with SMTP id
 t133mr16729738wmg.117.1588621195459; 
 Mon, 04 May 2020 12:39:55 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id p7sm20631312wrf.31.2020.05.04.12.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 12:39:55 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: 
Subject: [v2 PATCH 0/2] Add support for ASUS Z00T TM5P5 NT35596 panel
Date: Mon,  4 May 2020 21:38:12 +0200
Message-Id: <20200504193816.126299-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

changes since v1:
- make `backlight_properties props` constant
- a couple of line breaks
- change name and compatible to reflect ASUS being the vendor
- remove a redundant TODO

Konrad Dybcio (2):
  drivers: drm: panel: Add ASUS TM5P5 NT35596 panel driver
  dt-bindings: display: Document ASUS Z00T TM5P5 NT35596 panel
    compatible

 .../display/panel/asus,z00t-tm5p5-n35596.yaml |  56 +++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 367 ++++++++++++++++++
 4 files changed, 434 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/asus,z00t-tm5p5-n35596.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
