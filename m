Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99C222751
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 17:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBE76EC7C;
	Thu, 16 Jul 2020 15:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D556EC7C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 15:39:16 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id z3so3851602pfn.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wyr3SbI1oCdH1r4F7MJGMzPIMQ8npf5yNx4WEH8ce+g=;
 b=owUjuKkkWuKV1LRfGIfOWWmzhKUI7qHe1gaoiNt0XcQEqZ6xMq8wW8NI0mfS1m1HYU
 4R4fGBNPKLx+IUkJ0Ysifp3YPvbhy7ORdKhMaXKX3Vxb95xbGV/17d1XEq3meifzV55S
 yjJiB6lRGcft7eQWmKK3wn2TFUTibh9yrv1F5X236i+2wS4PRJPCccp/sCEARqlBhtQn
 rk8DlwnQ0QHHSCCYCHzK87PQoBF0yXlkbb0uPlQLhkIyfNDnkr4xW0i2p1iTfzUQ8fKe
 mVBmJrYpgkGbFYXtg1wOKSayJFf3ijPSsQTo208/1fvJgBjiCpmgUHmM9n5inbdHkTBi
 LYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wyr3SbI1oCdH1r4F7MJGMzPIMQ8npf5yNx4WEH8ce+g=;
 b=bjjmBZ5ncbukJxgFw/9FP6o3BJj+NeYMjJzsUnLSgraT0z7Q11Wjhn7vBO5rrqBt9F
 42aHRre1zCVxnmAssBkwCo+KwvhOCWEJEKRBRBdYE8YqTER2aoM1+h35fLv4tPYC4tHO
 S2estVFlISmpg3/hif93wR+XpBY5mK0ylPj/eaRkmjIREk7xsVGEfuD2CuATuPKfKbmb
 oCA7uQmg6pe2XQSTGekzqhhpzoYq0tySLABuKQF+12WNTeb+CIRxK1i4TJ0TXldC5jyU
 lG4Nc4mNJci3CpU8+LhijDMoSTTudnhWDaB4Sv17mg+SXFWzzNiyDquVg4NH6DjMeIlg
 fqHA==
X-Gm-Message-State: AOAM532gFVZzEtRSLdtHVrdJX7QNEVvsaP0A3l7mbtL9ywuvkuR8aMrQ
 F606ri+99waOFDrxcAGH0Twt7Q==
X-Google-Smtp-Source: ABdhPJyH762SfP1/MeevRjOltGL0CLXQaQ3GApf3PLejmWvDLXcok6iAh0HwkKFpK57hxEPywYJUvw==
X-Received: by 2002:a63:d605:: with SMTP id q5mr5009426pgg.344.1594913955686; 
 Thu, 16 Jul 2020 08:39:15 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id f14sm417056pjq.36.2020.07.16.08.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 08:39:15 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] Add support for Tianma nt36672a video mode panel
Date: Thu, 16 Jul 2020 21:08:56 +0530
Message-Id: <20200716153858.526-1-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
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

Some Poco F1 phones from Xiaomi have an nt36672a video mode panel; add support
for the same.
Most of the panel data is taken from downstream panel dts, and is converted to
drm-panel based driver by me.
It has been validated with v5.8-rc5 on Poco F1 phone; my tree with other
dependent patches is here [1]

[1]: https://git.linaro.org/people/sumit.semwal/linux-dev.git/log/?h=dev/poco-panel-upstreaming

Sumit Semwal (2):
  dt-bindings: display: panel: Add bindings for Tianma nt36672a panel
  drm: panel: Add tianma nt36672a panel driver

 .../display/panel/tianma,nt36672a.yaml        | 110 +++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-tianma-nt36672a.c | 859 ++++++++++++++++++
 5 files changed, 988 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-nt36672a.c

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
