Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD0487203
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B191130E5;
	Fri,  7 Jan 2022 05:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85581130E5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 05:13:38 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id w27so4911567qkj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 21:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Li/jQ4nlT3gPpvd1NyTQnIxzc9JA+p42BI5110gVryI=;
 b=flgkUHgw4ONbU++HRN0/dcycqmYpQtCeuXbAZ978Y2HlS3hd45yMtsBSdhQcwc8dL6
 69sqSq1ogMCvac19pdxhTNzIZhDwegFYIGfnPiXMZ+4DLXSZt5wRv0OniLkLUBGnB2b7
 XjTjbETLYgbS1L325wN3km5U6+gHDtMKydhcAFVwrcdJ4nebFD1W5I8i/d5AFzezksmg
 R5eCgAJu720OURyKmnAEgKN/CP1b6r0GiTdOTLPcbvcRLtzaC3K+cs4NpK8hSU46Dvoq
 NDsJc9q499uGQ91vEnxGq1JnCW+DAwNuRdUrrOyXZZk/TCHKbbGsUhaormBvLtjqEVd4
 9Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Li/jQ4nlT3gPpvd1NyTQnIxzc9JA+p42BI5110gVryI=;
 b=zpT110Yas/6ImY0NZ3UGvMsrXCgKnvZ0XbmgWbp66ZepCCzEyC8fMmqJwt/Hpb5kfK
 J2aNQ64s3LuUY0/15S4kcZXUevrL40ts/4zdg/4Om8YVm9RZkMq734EaiRS1r5Np48x+
 knU4yBZ/oARvhIy94I8SzZjTjlK6HUzEY1O5DE3NlcR5mbFFT8xFwdWqbXBgO++UWeDE
 wGsdjDTc/pgKbxCLbY1lFjzn8ko9oBlAYcKW0H2ciG8cQhzbiNTnHfbVrX1ztWqwuUXq
 zJJhItA/kPU+E4V/yLhiMCqiTpOH66onNOFDs4AMhifjp29X1zV4acThK6JqjMvC8eU+
 vOdA==
X-Gm-Message-State: AOAM530+4F6IgnTqBoTiumVrzsemSnAOxP3YaSN8p2LFdwNfbTAHnvBX
 Doe9y4sdMoEAkDsmsK9Q0zs=
X-Google-Smtp-Source: ABdhPJwKY6h//TE+tGAQiabm+i9yikHXhF4LBqqUoo9Q9fDk3rh6FQkdWelmqULqZGdTfgcbWDhPpw==
X-Received: by 2002:a05:620a:40ca:: with SMTP id
 g10mr41638232qko.425.1641532417910; 
 Thu, 06 Jan 2022 21:13:37 -0800 (PST)
Received: from master-x64.sparksnet (c-98-233-193-225.hsd1.dc.comcast.net.
 [98.233.193.225])
 by smtp.gmail.com with ESMTPSA id d15sm1651461qka.3.2022.01.06.21.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:13:37 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: 
Subject: [PATCH 0/4] add pine64 touch panel support to rockpro64
Date: Fri,  7 Jan 2022 00:13:31 -0500
Message-Id: <20220107051335.3812535-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds support for the Pine64 touch panel to the
rockpro64 single board computer.
This panel attaches to the dsi port and includes an i2c touch screen.

The first two patches involve making the reset pin to the Feiyang
fy07024di26a30d panel optional. On the rockpro64 and quartz64-a this pin
is tied to dvdd and automatically comes high when power is applied.
The third patch adds the device tree nodes to rockpro64 to permit the
panel to be used.
The fourth patch is an example patch to enable this support, tagged do
not merge as this is something for the end user to enable only when they
have the panel attached.

Peter Geis (4):
  dt-bindings: display: panel: feiyang,fy07024di26a30d: make reset gpio
    optional
  drm/panel: feiyang-fy07024di26a30d: make reset gpio optional
  arm64: dts: rockchip: add pine64 touch panel display to rockpro64
  arm64: dts: rockchip: enable the pine64 touch screen on rockpro64

 .../panel/feiyang,fy07024di26a30d.yaml        |  1 -
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   | 80 ++++++++++++++++++-
 .../drm/panel/panel-feiyang-fy07024di26a30d.c | 11 ++-
 3 files changed, 83 insertions(+), 9 deletions(-)

-- 
2.32.0

