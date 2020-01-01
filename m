Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41512DEAB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 12:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77688995F;
	Wed,  1 Jan 2020 11:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCAA8995F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 11:25:11 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id t101so2115324pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 03:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xjl26WjVPVTED+/xAzYPIrEiiwgVbZ+1Lffk83rGuXg=;
 b=pCxOBBMQfuNezDx4YUqo3tQFY05m/gmgb6vvLxTF1ZUJ9v4q6PEKGVmPi2bbETWWhT
 pzFB4Tb9qeC4RQfaf0V5Uxb+jdQSpJg5E9QYSfKS3pOf0Z7ev/fLwfGEDFiEe0jE/q0u
 OgCyU8qt5jPl38RFDgBoFS7stpw5HIzC4VgDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xjl26WjVPVTED+/xAzYPIrEiiwgVbZ+1Lffk83rGuXg=;
 b=P9XYt+3koE+bryxfi+8sfN7bhrRx81z8UVD7yv4I4TMDvzD3XsP69tW2b95pPZZV9R
 yxKEFSe6SCJhapYMXYN6dcX1eWV0i00KeNnncfYOuli9FPKEJ9qSrUJEPQ5/eeLsJR1c
 hECnr/fD/uM4ghg7dEl8kv3ev5WvWutU+B01Yow7Y173C5vBczXc5oD/WCmAhUk14kxl
 ee7Uthq1r8+EvP6zzyknigG3Pe2cfuQTpuOAbAWkFOA7r9aTXSAboZ8pxRB6ufapwc3g
 9h1p7m2GGNOtKTUFXgm7vw6wRQPM57txWUCC+TX/nRGOU1rZM5TXGgrQpyuR5k5kBaOu
 ysLg==
X-Gm-Message-State: APjAAAVomSM3bUQrMYj1oZMJ+FiYuPE0FOLUN/JYi6Gb+90qZHs2A4T9
 Mi7eG2QSDZ50S9idzWj2t/MUCw==
X-Google-Smtp-Source: APXvYqzpUhwfAbGzLwKIL383B6Symz9HyuWU2vN+KQyIbBQzrtLHY7UohuWPzGTkdsMfQfTFtGfikA==
X-Received: by 2002:a17:90a:a386:: with SMTP id
 x6mr13658293pjp.116.1577877910967; 
 Wed, 01 Jan 2020 03:25:10 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:d0fe:8978:1b04:ff94])
 by smtp.gmail.com with ESMTPSA id y7sm51945439pfb.139.2020.01.01.03.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 03:25:10 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/6] dt-bindings: display: Update few panel bindings with YAML
Date: Wed,  1 Jan 2020 16:54:38 +0530
Message-Id: <20200101112444.16250-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These panel bindings are owned by me, so updated all of them into
YAML DT schema.

Any inputs?
Jagan.

Jagan Teki (6):
  dt-bindings: display: panel: Convert feiyang,fy07024di26a30d to DT
    schema
  dt-bindings: display: panel: Convert sitronix,st7701 to DT schema
  MAINTAINERS: Update feiyang, st7701 panel bindings converted as YAML
  dt-bindings: display: panel: Convert friendlyarm,hd702e to DT schema
  dt-bindings: display: panel: Convert rocktech,rk070er9427 to DT schema
  dt-bindings: display: panel: Convert koe,tx31d200vm0baa to DT schema

 .../display/panel/feiyang,fy07024di26a30d.txt | 20 ------
 .../panel/feiyang,fy07024di26a30d.yaml        | 50 +++++++++++++++
 .../display/panel/friendlyarm,hd702e.txt      | 32 ----------
 .../display/panel/friendlyarm,hd702e.yaml     | 47 ++++++++++++++
 .../display/panel/koe,tx31d200vm0baa.txt      | 25 --------
 .../display/panel/koe,tx31d200vm0baa.yaml     | 37 +++++++++++
 .../display/panel/rocktech,rk070er9427.txt    | 25 --------
 .../display/panel/rocktech,rk070er9427.yaml   | 37 +++++++++++
 .../display/panel/sitronix,st7701.txt         | 30 ---------
 .../display/panel/sitronix,st7701.yaml        | 61 +++++++++++++++++++
 MAINTAINERS                                   |  4 +-
 11 files changed, 234 insertions(+), 134 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx31d200vm0baa.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml

-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
