Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50054716C9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 22:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE0910E6DC;
	Sat, 11 Dec 2021 21:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E1710E6DC
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 21:38:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id l7so18545712lja.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 13:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AN606FDWoic1gE/hvIhNv/tnFd7knEeZEmhAMBvktOQ=;
 b=LLKACYa/RglwZ3lc+IgOkFptxsNWlNEp2S1LoPxuOhjVJnxlkAkMMg7GVek+lN0nMh
 a7OXtCOcI97959q+n4eeVfYRQ2v9YD73i1h5nhVmG899RH2MWdWVScMGa1cFhfyA3lrT
 kzKBCr6d/rKnDxeaTebzq8FV8vnSj2QYmOsL1QTX/C6+ytDp7oEIU5OR7arKPuFKqo26
 uML9DYon7GugigEv4PP7fOSbIMtrAEzZVUV1wIdWQOjG5WF3L+gckeg8WfSIHpyNZ5bd
 oSvLhdqlXZVHnEFXD7x9ofq5W+7MeDn+kqWdiCcGyl13Ifsb1hLQNEqBw2kJ2I5U8o0K
 hX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AN606FDWoic1gE/hvIhNv/tnFd7knEeZEmhAMBvktOQ=;
 b=vchLyWme0xu7NowNYgHBGc4vUlfPcaCCTwALf9UnHHClpNr8D/JjB+iPKq4x3Opmtk
 8MYLOoQsu+2DtR0D6D7FLVMUa5Qswf86v5KXgYrNxEhFkGNsWmO7DMJIYK54ZeYt0gCq
 jyH0dEjavlVJeFqZ15s34Xznie7fH7wB333Htn9ckpTd5CwZp5hsXmTj4eM5gz4QENoV
 EDy3fXkz9mA+UuAwdQ4x0A5Hz/n6hKeZzXJ7tG9TH3gE5+2Hd1DimN2Kah9g2Jp+GjOV
 Mwq1WAtP95XZq2Hhs+qzHC0s7eojUTyEilzQICDPj+4sUTdbGUyYgryw13Xvy5T5c3hL
 VHhA==
X-Gm-Message-State: AOAM531ztwjW7eqX5zWI9YGy0X0XErqlw6nu8Os2MBOYPPwws2tNddCN
 X87OCmggD6kRe4MPd0SpNUQ=
X-Google-Smtp-Source: ABdhPJw9Udh0ZLeBHQZnYsPbOAv42sClfx6AJuaWEU5e75QX0H8fo56IQmU7TA6gsFS6FPg71+K9eA==
X-Received: by 2002:a2e:b8cf:: with SMTP id s15mr20806073ljp.364.1639258684871; 
 Sat, 11 Dec 2021 13:38:04 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id w14sm786844ljj.7.2021.12.11.13.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 13:38:04 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v2 0/3] Support Sharp LQ101R1SX03 and HannStar HSD101PWW2
 panels
Date: Sun, 12 Dec 2021 00:36:50 +0300
Message-Id: <20211211213653.17700-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for Sharp LQ101R1SX03 and HannStar HSD101PWW2
display panels that are used by Asus Transformer tablets, which we're
planning to support since 5.17 kernel.

Changelog:

v2: - Added ack from Rob Herring to the HSD101PWW2 binding.

    - Updated LQ101R1SX01 binding, like it was suggested by Rob Herring,
      making LQ101R1SX03 directly compatible with the LQ101R1SX01.
      Such that ["sharp,lq101r1sx03", "sharp,lq101r1sx01"] could be
      used in DT. This removes need to update panel driver with the new
      compatible.

    - Improved commit message of the LQ101R1SX03 patch.

    - Added my s-o-b to all patches.

Anton Bambura (1):
  dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03

Svyatoslav Ryhel (2):
  dt-bindings: display: simple: Add HannStar HSD101PWW2
  drm/panel: simple: Add support for HannStar HSD101PWW2 panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../display/panel/sharp,lq101r1sx01.yaml      |  7 ++++-
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.33.1

