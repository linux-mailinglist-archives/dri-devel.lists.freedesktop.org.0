Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334F241F99
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 20:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F85C6E527;
	Tue, 11 Aug 2020 18:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50066E527
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 18:21:17 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id m34so7083528pgl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DmcHWuf2v+3wV2AD0mGNYgT+VY5ydtvubi2qH/7HZXw=;
 b=awMoBXKow61xwOaSEK8foUmARLBgX2Gjc5NemuqQ+u+zr/6iL8Wlsjmt57+TU5sw3T
 7NVhcphc0qo/jF38mnBxS3Ox4C2E5WjVu9pDoWHl77+hseWYj0leqw+QDmOQxgihBiut
 oML0ZtWsJ/clSU5Qiv5dviSFCcgouDXNxFVlfe8kaYX9XRtVRWXHmVd8x/3uA7PejlKh
 xlyJ8OXubECBeXln5+g8YZTmPKeiTJtHKWPnKn6OEud8YkpsmWSROyPvDEDdaXpxJpD+
 3QdyEi8Zu0NgdAfbEPmejz47s6bpMRKcLC6QFNFBP8ZHMnsecIkQ13ujRfP8h7AyAN7F
 +Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DmcHWuf2v+3wV2AD0mGNYgT+VY5ydtvubi2qH/7HZXw=;
 b=birWISSO/DLyZWq7vlO+loU9Np7LGd1E43gVm0+nQLreB1tB8r0MiIYgv+V8aa46/K
 VAs99uMKEidizl3E593p2fu3+EDek1RYiiamG4dyIKAhyVDxuD9Gxa+xJOIv0ELxUqCc
 A3O8etQenujL0+J9Yu6iNgdchdYRjBS4oGUWIvaSMil70eveaUzji4+vpTZprn0GnVD4
 LGbBKhfcQYf7ELbKtzuJ+TNzNeIWXZD0uG2kxCnp+EoxJbcWbMorL4/MsFj/cDyBC9Me
 pKT98yF8Jyr5LdCeN0d+vaVTXnY8j+OFUMvesFTNloj49grWHL00ho1oSUcSYBoubvw3
 +77A==
X-Gm-Message-State: AOAM5324Cn3WKe9avdgoE3RLxxkO1CaKc398jpmoF/QturJLo5v8XON2
 4CQdZxuSBieW6ucW/sQY8p0USg==
X-Google-Smtp-Source: ABdhPJxz0PuC4YfxRjlx/Cs0nOrfxWcypnJDNU7R3auDZe+MNSwJPMHKt+8nmemmZO+slEKvzzM6Yg==
X-Received: by 2002:a62:1803:: with SMTP id 3mr7912192pfy.198.1597170077136;
 Tue, 11 Aug 2020 11:21:17 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
 by smtp.gmail.com with ESMTPSA id x7sm26595162pfc.209.2020.08.11.11.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 11:21:16 -0700 (PDT)
From: Sumit Semwal <sumit.semwal@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 0/2] Add support for Tianma nt36672a video mode panel
Date: Tue, 11 Aug 2020 23:51:05 +0530
Message-Id: <20200811182107.6515-1-sumit.semwal@linaro.org>
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
v4: Since "0425662fdf05: drm: Nuke mode->vrefresh", we have to calculate
    vrefresh on demand. Update for it.

Sumit Semwal (2):
  dt-bindings: display: panel: Add bindings for Tianma nt36672a panel
  drm: panel: Add tianma nt36672a panel driver

 .../display/panel/tianma,nt36672a.yaml        |  95 ++
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-tianma-nt36672a.c | 858 ++++++++++++++++++
 5 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,nt36672a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-tianma-nt36672a.c

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
