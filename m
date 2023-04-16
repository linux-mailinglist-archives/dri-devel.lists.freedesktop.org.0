Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB146E40A4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A98C10E36C;
	Mon, 17 Apr 2023 07:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1D910E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:16:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-504e232fe47so4178050a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681650998; x=1684242998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CG6bCloxRF63LINwsV/S6++Cq8kHn62f+t1mJDbwRK0=;
 b=WXFFpsaEeQMYaSn0v/zrfFpyjWKoQioMpl8FyBtcvwM/W+CH3eQ+FO8fDo4YaSPbqC
 IBR4fvHDQFglnsUsuGDL9btHT7rzgxknyMVD8vTPCfdzkSoD9OpN8e/0qHNlEtLtPnna
 n8Wj0hynb/1Snkic/6YiPhC3tUkSx+ly+h1qYOrElXpFKddIjGlVH5U/mmCRnbijh9vJ
 ZEqJnPJ/11Q/ZClWyCxatUVsjtlwtMkJGtOFVBqYpefMS0frrrjxK2+2ltAvy180okSB
 fRcerp0pe6CHkmBii7OxVvmPyc0Q5kaLQgMUNyWXjmKjOzqcvNgTxzpnPnxefUNIzq17
 /27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681650998; x=1684242998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CG6bCloxRF63LINwsV/S6++Cq8kHn62f+t1mJDbwRK0=;
 b=k2gqjmuxK26JwEIBXQjE1nyg91//SiDFSLQpTsLtiylrNHa0enra3r7aQPn2Kl9n1v
 q5GK0iwUBrbc/2Q/Bk/u3RVMtxOu54bC85z8Z36iC/HzemldnN/6h8riQlaadIW/57sw
 mFXpvYd3vDbYbuNgh2NyLMlRQrolGV33MSGO4yIlbPKeosEDVxzwSuXLeMCYFIpWb5zZ
 NFzHk6JJmHLAYNrynnRJrjZpWMiww7S8hvQgZT/IVl6S01O8FNRwWI8kzY6KIWb/oIwf
 un/RA/Iow62EDbXXAM1keVAGuPrz/zzqmciNqJNxYvtU9rM2aYJXJbksiyYUQpuAcyxE
 cxfQ==
X-Gm-Message-State: AAQBX9czvcWdeFHWePu7wAvpFgfoaRtjp3+st4OTQhoiWX0fWxItFyqj
 65lNGAHci+VYjfpIKXrqUj0=
X-Google-Smtp-Source: AKy350ZcY3oLmiF4wDab6nhMKU9+AzhQFiWjQFrMeN775fJZ9qEf5nnH8cHD0k8y0tiEK1CJCRb2Ag==
X-Received: by 2002:aa7:d04e:0:b0:505:7d54:db93 with SMTP id
 n14-20020aa7d04e000000b005057d54db93mr11408339edo.21.1681650997751; 
 Sun, 16 Apr 2023 06:16:37 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05640204c900b005068d7ccfb0sm2396594edw.83.2023.04.16.06.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 06:16:37 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v3 0/3] Add Samsung S6D7AA0 panel controller driver
Date: Sun, 16 Apr 2023 15:16:29 +0200
Message-Id: <20230416131632.31673-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds initial support for Samsung S6D7AA0-based panels.
Currently, only the S6D7AA0-LSL080AL02 panel used in the Samsung
Galaxy Tab 3 8.0 family of tablets is supported; other panels can be
added in the future.

Changed in v2:
 - Added commit messages for dt-bindings and MAINTAINERS entry commits
 - dt-bindings: Applied suggestions from Krzysztof Kozlowski
 - driver: Removed unused panel_name property from desc struct

Changed in v3:
 - Correctly applied patch for dt-bindings

Artur Weber (3):
  dt-bindings: display: panel: Add Samsung S6D7AA0 LCD panel controller
  drm/panel: Add Samsung S6D7AA0 panel controller driver
  MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel controller driver

 .../display/panel/samsung,s6d7aa0.yaml        |  52 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   7 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 395 ++++++++++++++++++
 5 files changed, 461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c

-- 
2.40.0

