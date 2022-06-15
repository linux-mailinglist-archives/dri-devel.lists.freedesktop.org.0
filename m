Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D06F354D482
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 00:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8A1112844;
	Wed, 15 Jun 2022 22:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E39112844
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 22:25:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c2so18164209edf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 15:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=8znYIfEaEVt09OzYM/EQpid5mF6s7TkBS4JSqx18ajs=;
 b=Rxs3FHAFio23LDCBA4IeD8l+fcHd66FCnBOrPLfNSi2dVhM8fu8Y1ngMRzF7u1v+sy
 hlefXfMtku384wVo/5W0u2f2rJnSv4ag6unfliQwBOUB7HrMcYzKuWswjVzoYYsYyFPq
 f2z/a5nF+rv77KTWfTQ/RCbq8qmA6URiHF8va2BmYDZ9iEQYi6VDJeDb2Q/mNPt9ozqU
 RKGn00XbxP6+fKacZeDftwoFWJa9vwmOVg9VdThDZ1LTMWbdvvf1TwgRXCnV9H2hpD2O
 4zMy8y6NoKDhwt7X+DjGX3BFUwJr6DPdqvEKyLpN+yZc+SueKKD7pBpbS9/4jAEZ5A7G
 KvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8znYIfEaEVt09OzYM/EQpid5mF6s7TkBS4JSqx18ajs=;
 b=T1kb7gIycy4EgeGviV1FgQgSvHtJd8F378C+9jKPkqkcErSsPp8fJE9dZI8U6SvdvR
 oqjcx5Sn3IXzfmsdTH630y3m36SprTPuITTz47pjOxVT+TLjnMUlrF+Mgqe34ZALVEAf
 CMStn+OAiF2el7ewzSGZVLK8qlWKwuKcz2xv5KaejDsJF3bIrB+ytcGyrkgxwW33DuzH
 SnLRy06Ghbc6toFcVi2mAoJD0cIdp8uq1svHPMP+XURk7G1KkTO63DXtUjdJz87HyxRP
 CMlK3CDtAGvNp0O6ORgJMkY+d34ZLHZWYOMLAg/uxcvOrsxtnbLiRSwIC2exQg8zH9VX
 UZ4w==
X-Gm-Message-State: AJIora94tD4MTdT7nFhf9GnaAxw6bQC36wqD2hfl+y9LYPMaDp/dbMEQ
 3gJ17Xt72AT9vKDAiy92eVk=
X-Google-Smtp-Source: AGRyM1u7nc9AWz6dTB7DXAlxJkR+1iKtO5UNs2icGj0/pfNLt9KsQsQMsb4LGENkZGk8827Dahz3yw==
X-Received: by 2002:a05:6402:f:b0:42e:561:a1c0 with SMTP id
 d15-20020a056402000f00b0042e0561a1c0mr2533963edu.309.1655331904913; 
 Wed, 15 Jun 2022 15:25:04 -0700 (PDT)
Received: from debian.home (90-180-208-18.rcn.o2.cz. [90.180.208.18])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056402358300b0042dc25fdf5bsm350427edc.29.2022.06.15.15.25.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jun 2022 15:25:04 -0700 (PDT)
From: Jiri Vanek <jirivanek1@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH 0/2] Fixes for TC358775 DSI to LVDS bridge
Date: Thu, 16 Jun 2022 00:22:19 +0200
Message-Id: <20220615222221.1501-1-jirivanek1@gmail.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jiri Vanek <jirivanek1@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha B N <simhavcs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset fixes two bugs in the driver for TC358775 DSI to LVDS bridge.

Jiri Vanek (2):
  drm/bridge/tc358775: Return before displaying inappropriate error
    message
  drm/bridge/tc358775: Fix DSI clock division for vsync delay
    calculation

 drivers/gpu/drm/bridge/tc358775.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.30.2

