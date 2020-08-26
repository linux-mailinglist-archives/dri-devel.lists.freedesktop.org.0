Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA00253447
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 18:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FA66E175;
	Wed, 26 Aug 2020 16:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311F56E175
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 16:03:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id v15so1252178pgh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 09:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1MaekrRirwKyLzs9+Fv4keJH6CPIXWhtw9U0PCRkCag=;
 b=je8FKIC9TGkUAFpMpoOz6n/MZ2qY+MYbDAsxEvFByHYwAys46YPtfyvinT5Tc5VoLm
 VfkjkpM0XzmxkSRNqoO9LHL6c+xnl99zoU8PzEayCX+rnKFVJjS1sNMeZlXdPasbmsSk
 asoFQHgi0de+x4c1buK756hG3y3ggRi50Iq0QQmTizbxaLpb7POgmp/WdQK7HHERY5Ha
 AqW78nNYRwAMtRXUrGe4zBbA4Tjaj8x8EO2FtzIq0gcqZLkTIM1SFym6ke4Aly7Pmat/
 SNHnLNOMjlNdyBA0LsE0m3nB0cl/BiNF09/fY31IomJ77dFQVxqN60hnWdxEHdp5KUXZ
 WyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1MaekrRirwKyLzs9+Fv4keJH6CPIXWhtw9U0PCRkCag=;
 b=s9qL3OPWl0vJXNErfL18VZe2HjQmYPjF4n43+9hy2j0WsgkFwuqB2jnQbkjrbJpzEm
 3BZFdVLNGs6kU7DaFF20Yar/JZ1DMtPPbVnEanL4m71W+61CgxRjNHyu1Aup5W+JXamH
 O4NxTdrjhhTuX5ZOLGnt/JipJV6BZ6SYcjL3ldXc6W0Qwl8kthRZWLB/IlgArw4yqL4z
 7pwRlvA0eCUPI1rg9LwtCn7pRs2SVKpnov2u8J4QJR7PrSccJm6zEyiF7BdR5fcGqoFz
 E31LYq97KRsD7j4y39vQU14Ke26gLGqT6rLwBzbHRwHxgO4QMTlbjxR85KXmJtGMPhpD
 op4g==
X-Gm-Message-State: AOAM533z9wkYi1LxA+ZKrqJxEK7NOqVEp97HcI5O3PMDPyjzKADHVtWi
 d2Q2JXid5Ctx7EnB7lYqE9cezQ==
X-Google-Smtp-Source: ABdhPJwUwvdLJh8d8dcPiKqwY4ilUtCue79cXTiTu10Mk7sjBJ9ZeCIllA/nQ9aqa41q8vlo1XzY9w==
X-Received: by 2002:a63:471b:: with SMTP id u27mr11023159pga.139.1598457800565; 
 Wed, 26 Aug 2020 09:03:20 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id u3sm2487555pjn.29.2020.08.26.09.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 09:03:19 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 0/2] Add support for Tianma nt36672a video mode panel
Date: Wed, 26 Aug 2020 21:33:06 +0530
Message-Id: <20200826160308.18911-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.28.0
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Poco F1 phones from Xiaomi have a FHD+ video mode panel based on the
Novatek NT36672A display controller; Add support for the same.

Most of the panel data is taken from downstream panel dts, and is converted to
drm-panel based driver by me.

It has been validated with v5.9-rc1 based drm-misc-next on Poco F1 phone; my tree with other
dependent patches is here [1]

[1]: https://git.linaro.org/people/sumit.semwal/linux-dev.git/log/?h=dev/poco-panel-upstreaming

---
v2: In dt-binding, removed ports node, making port@0 directly under panel@0 node.
     Also updated the panel_on delay to a safer 200ms as needed for latest Android.
v3: Replaced port@0 with just port in panel@0 node.
v4: Since "0425662fdf05: drm: Nuke mode->vrefresh", we have to calculate
     vrefresh on demand. Update for it.
v5: Fixed review comments from Sam:
      - rebased on top of drm-misc-next
           remove return of drm_panel_add()
           remove drm_panel_detach()
      - renamed the panel driver file to reflect that this is a novatek
           nt36672a display driver and not only for tianma panels.
           Adjusted some internal names also to reflect the same.
      - corrected changelog to add info about the generic Novatek DSI IC
      - corrected compatible string accordingly
      - removed pinctrl
      - used drm_panel* API for prepare/unprepare/disable/remove

Sumit Semwal (2):
  dt-bindings: display: panel: Add bindings for Novatek nt36672a
  drm: panel: Add novatek nt36672a panel driver

 .../display/panel/novatek,nt36672a.yaml       |  81 ++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 767 ++++++++++++++++++
 5 files changed, 866 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36672a.c

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
