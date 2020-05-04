Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CAF1C4E97
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA636E51A;
	Tue,  5 May 2020 06:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A076E491
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 20:01:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d17so540824wrg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 13:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwqNTpvr36YlbOoEch1Pgho2qgj2JVScQlJ2Ca/JbVM=;
 b=MQWbg/TSygNyKyr5jE13Qw4+hnu+8Ghk/K0WTZpN5wFyh7CFc2J8wLIyLAfrj5Ty5l
 TQ5pfDHa6GsnyR6ZkTRK2LyipMDCjKf8g3+tHKaOFbPyJj6LNgGfHcWVzi7Ph0nmGbX/
 CnKIYiWdrV/Ib49qwonSgj+r1LMdU9u/u3hD+gY08rXbfihI9xKhVDH2sb2PC8z2eU/L
 K7EhzVh+3M26Jwb949bnePkL2tsfWwX2MD3V/6js9bAtf/ZkPtPeCUAqMEh3cWvCdnEu
 FMyRFDODIR+MmCrazrMyMTICU0WeHan/Ek5/1R6QU3iNRUtOu9iwrlTEPFRBHuCwidnd
 6n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwqNTpvr36YlbOoEch1Pgho2qgj2JVScQlJ2Ca/JbVM=;
 b=ILQEbzBeig0D0Kkr6t/yi76Z/1+8U9ca9ztywW6CgZGiCRaG5oWxyKTdVJgBZ4RSy0
 C5FtOqVtueTtu430R671RRCwabE4zV5SvICibBJyrTefDOltj8C98Otf/US8Uu0VLKhW
 EW6DcgVLwPBZKX3N3rmymNFAn8ChIHLd1QLVwYBaZz133lXa4VCYYJEJcc7jD8C3/fnP
 xP/2MZqAwUjOicAdAxyUxvmmpUJKW/izEb0E6LsT4QdaUXDYfg9tmDe+sjKeYYJcny/J
 XllxCxP9Tze6j4r0Mi4Z4e8UL8dTKoIJAwlyHmyyVIU7LuFZ8yOfNR3wJZdaxSOCgUCo
 pB7w==
X-Gm-Message-State: AGi0Pub3Mq1+/CzXYx8UWwgjlQRhiefsB2ko/d4uY4sPsxW+0wApv38b
 tR/6l4UXz+bFNi7dV6mVgzfLFZMSF0I=
X-Google-Smtp-Source: APiQypLvvE9333aRFxwKbKQHbL0iSZvAaDGcvFb14pX/z6fIIXy/aeg7zbhQ+V10PpIe2vBXj6AbyA==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr1104639wrs.149.1588622470431; 
 Mon, 04 May 2020 13:01:10 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id s17sm739252wmc.48.2020.05.04.13.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 13:01:10 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: 
Subject: [v3 PATCH 0/2] Add support for ASUS Z00T TM5P5 NT35596 panel
Date: Mon,  4 May 2020 22:00:58 +0200
Message-Id: <20200504200102.129195-1-konradybcio@gmail.com>
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

changes since v2:
- fix Kconfig indentation

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
