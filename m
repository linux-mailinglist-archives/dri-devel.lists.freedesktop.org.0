Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327237BC4EF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 08:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D9910E58A;
	Sat,  7 Oct 2023 06:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28410E58A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 06:06:52 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c87a85332bso23364635ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 23:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696658811; x=1697263611; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mRH/ODzd/vAmn0ed32Al/IcMDZNJk8XZpLTBrLtbkm0=;
 b=qlw7o6fhyAMSM5r1G1deXtDZSAypK5dtSWFh9xfEOHaiTe793ByK+4vWAUHV9kMiUv
 KuTwBU6bO9v6ASp6sL0e1kGdG46O7Zt/15j/NJ821rtA9k9dQzZSTERczw/4gOGpmVb9
 4FJtxWMRMYkJiau+m/Q4Nm52RcxuOcAwIdiIy0h9EMj32GLF0mRgbvhSxR9GUlWjPMzs
 iA0nt0Z+9jQ78aabma1SS8scFe/KUxt+6rpSR0mAauh3nmbtbSUKtSzuiSXsq6k9wm9j
 fPlQ9Y3Yw/4URKnQ8T7vWKD6hrCBBY5yZEaJ/JijV6epiFGgcLYFC/lqkG/RYdxTd4td
 2mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696658811; x=1697263611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mRH/ODzd/vAmn0ed32Al/IcMDZNJk8XZpLTBrLtbkm0=;
 b=Q9yzamTobtQqk/9TangSuqKm2JdDcfQKhOfK6v4tteNytt8GoX2sccD9QRd4UhRtdl
 PRDcRBsX3qYTE+jqHSeeajehMr+r8q4z9BmgpK3Ct2AZeuh6+cQ02Cy9iVFsMwZ4THlU
 +UonI8HRoKCCMA3+t1Q/YPjBw8ntsVP48xbbDCIHTorKXcufTuW9kseSc/DUvuWTJtjP
 s++0Wg9MrfeF1Ww6/vjbWAycLULayXOQBoRirHEk/9vMUE8OqR1wbeUW6ct3ImArtoSQ
 821xRezFjxrE7QeXSun60xGHYt1Q9QbDtEWvNwTEiapSAqfj3/CVu/FtnNM4zgI+E0/4
 KKBA==
X-Gm-Message-State: AOJu0YzLzfJWLs21lNRnw08ZH8vPcN+zdBQQ0rfRlziuyDkYHbds8/XX
 EAPZmOTVGukF0rprRKDNatzo9A==
X-Google-Smtp-Source: AGHT+IFPoUH5BIfNkYT/OBhzfeAxcY0FszI7GRoNKiM3FgygXWrmM5IHxpBFOAAGM46eqFwQVZki6A==
X-Received: by 2002:a17:902:da88:b0:1c3:ed30:ce0a with SMTP id
 j8-20020a170902da8800b001c3ed30ce0amr12913088plx.19.1696658811618; 
 Fri, 06 Oct 2023 23:06:51 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 jj15-20020a170903048f00b001b8c6890623sm5014431plb.7.2023.10.06.23.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 23:06:51 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, linus.walleij@linaro.org,
 swboyd@chromium.org, airlied@gmail.com
Subject: [v1 0/2] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
Date: Sat,  7 Oct 2023 14:06:37 +0800
Message-Id: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus series proposed to break out ili9882t as separate driver, 
but he didn't have time for that extensive rework of the driver.
As discussed by Linus and Doug [1], keep macro using the "struct panel_init_cmd"
until we get some resolution about the binary size issue.

[1]: https://lore.kernel.org/all/20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org

Cong Yang (1):
  drm/panel: ili9882t: Avoid blurred screen from fast sleep

Linus Walleij (1):
  drm/panel: ili9882t: Break out as separate driver

 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ---------
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 771 ++++++++++++++++++
 4 files changed, 781 insertions(+), 371 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c

-- 
2.25.1

