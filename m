Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17482241A7D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 13:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF556E362;
	Tue, 11 Aug 2020 11:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EE46E362
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 11:40:20 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t10so6678096plz.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 04:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz4TcW9rTup6J1JHf4cL+vgG/kmFz0aHv9ruePdNsKs=;
 b=OwbomwryuHmiOn5hy7eYtGyiClOiCcWJDWxsATng2SfBZjNv4F+rhN++srWChEOyIp
 IIbTu2KcACM8Io/5U+ed1Px+/yOuzl70Ed3jMBW/OjicT0u+ynAN6xcCrGSNpnrub1gb
 6kkxQCekx2kYh+Y3vxmeBHHLXi+Foh3S6MVum2Os+Qidchsd2LxSHOFbQYhV26IXzL9u
 WBCK3pXjTHbkE5ed3HrxO4Xc/a6R4L6jtqa7yHC5AfwbIBJhcn64A7ipDVSLZ4D3vuOJ
 T2B+jy7BOYY8QBro7gxWbDiG9Ir0yDSBXVCanb3s9t5A6SYmNgq2KvDOxKhOdSUjYbGY
 1uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yz4TcW9rTup6J1JHf4cL+vgG/kmFz0aHv9ruePdNsKs=;
 b=hxVYCuv9vflEVhWsXnFiDPX4QRh4CZwaxM2f3pM8QxdQhelvMtvsQNEeqbnViBE6Ad
 n8p4TW9wpZFuOy87t3AvTKAQwhvsxLEceS18oQzgbPhFZXhaFyAxcUWSwh4l/EYEoEAQ
 1/M1P9BeV+64beaCOo4ShO419tMXJNkbEmys0GRWaAXl24tnp3ZvAjXvEz1fn1Fj7J+k
 BU2Wo7mspsxBOyfPCRDSm6UjhSH1ZmZqOuZkfVODCVqcrjFwv4e2XTq2mMCuIuGEtvxo
 fyCMpngG05KBCB/llWqvW4+53FD9s1jkG9/beXEH84MU56Q0Va7t0R68kL7rjAj38Ijc
 wkYw==
X-Gm-Message-State: AOAM531aVjwXK8W2xiWJEAzc4FVT3ha8JoPzvlrvAYGASk90RrLvjU10
 wHrKLcXnmqvfRjs8t+hUt19WPg==
X-Google-Smtp-Source: ABdhPJxBcA3xjSg7J7I1G+dD1OTi46lk8vkw86E5QUA7ZoYDypIkJGMn79PaN++6AgEprAKWBFDtFg==
X-Received: by 2002:a17:90a:77c9:: with SMTP id
 e9mr654872pjs.142.1597146020082; 
 Tue, 11 Aug 2020 04:40:20 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id gj2sm2600448pjb.21.2020.08.11.04.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 04:40:19 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [RESEND PATCH v3 0/2] Add support for Tianma nt36672a video mode panel
Date: Tue, 11 Aug 2020 17:10:08 +0530
Message-Id: <20200811114010.17807-1-sumit.semwal@linaro.org>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
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

---
v2: In dt-binding, removed ports node, making port@0 directly under panel@0 node.
    Also updated the panel_on delay to a safer 200ms as needed for latest Android.
v3: Replaced port@0 with just port in panel@0 node.

[1]: 

Sumit Semwal (2):
  dt-bindings: display: panel: Add bindings for Tianma nt36672a panel
  drm: panel: Add tianma nt36672a panel driver

 .../display/panel/tianma,nt36672a.yaml        |  95 ++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-tianma-nt36672a.c | 859 ++++++++++++++++++
 5 files changed, 973 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-nt36672a.c

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
