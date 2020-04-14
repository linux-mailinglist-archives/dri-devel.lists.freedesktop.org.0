Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE11A7660
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 10:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22BA6E499;
	Tue, 14 Apr 2020 08:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FEA6E499
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 08:47:37 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z26so11562488ljz.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ljl5+BwdHIBF7fsWFemFIeV6fRgEdvNWeKI3Xl/4UVc=;
 b=iPII0NIKUsH+XiAUh6QtLAjlK7GiIAzK6GtA8+fQ4GSdldW7jTEAifOUmAUuBqbsFB
 DLsUGIRsAf654+wHQTNcwcbAwQBnXPMKLWUDNLpJJ0hQ7GbWgW9Af7qC7VHHTzz2smdH
 hQIkg7BFh4XHCa6ouxCqeVswxPnH2Em+Zd9r7SF++BSE0qZFu/kdojGQZjQVvKkpiokC
 kd1QruDK43PrVVolLvuy7x+uCfppkwwT9G9x0uNY4dwXqwHe5OQF5yookMgFbNp9EPGy
 ntmliskB14tGzsbK+zfGJCx8XyODpJrqpMQ9RSESyLxDCKrMmc3hdszU5nu/fpzreLMT
 uDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ljl5+BwdHIBF7fsWFemFIeV6fRgEdvNWeKI3Xl/4UVc=;
 b=q2w9N4FuZIwWEBlzqe07FgfSW1YnK4JjvXcsbZaE6WU0TgIZLKGd1cL8h067XpG91/
 ZSnr25Ma59frwDhd8KgDvYQsmSFsMHA5zZSPFHSWTZ+8h/nAcAJOY4ktsM0kGkzTDEzh
 xvnQ56JPUo3aKDcHip09/rbCtZmY/Ma7IsnCdY2mqoivfYUc04+iA4e+j+KUTGZNptzW
 a9zRZtPXJ4qROxJLZQrhdU7IcSRer84kCJJTkJEFGfvyfr2E7XWpxkkPNqnv0dmVKzNh
 BhxekTnGQ7XkaEIdXFIJixaS1twh22jAQhDKMKEOaz16QfSeVCQKFijXjrU3LdKZ/FfH
 lrVA==
X-Gm-Message-State: AGi0PuaLii+QOrUwbDfchtyt4pN5JH4uJJ8cxO6fAy2ucoyPONt/bs3u
 LtJ0DUfkDmPqkeScsIb7VLt8bzQdPHk=
X-Google-Smtp-Source: APiQypLdtkhf0PwiWGHbwcr0jVcE/fwzN2m4+1IV5bMcYCQ4WknuY3n3acEonIuHkwK4x91GyjJNdQ==
X-Received: by 2002:a2e:9712:: with SMTP id r18mr5491737lji.225.1586854055512; 
 Tue, 14 Apr 2020 01:47:35 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 q10sm9834979lfa.29.2020.04.14.01.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 01:47:34 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v1 0/4] drm: tc358764: support drm bridge connector helper
Date: Tue, 14 Apr 2020 10:47:23 +0200
Message-Id: <20200414084727.8326-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Somehow Laurent tricked me into updating a bridge driver.
In reality, having updated a driver yourself makes for much
better understanding of what is going on.
So in order to provide proper review feedback I deciced to give
it a spin. tc358764 was selected as it is a simple bridge driver,
so a good driver to start out with.

We are moving to a model where the panel tell what connector
it uses - so this patch assumes this model is in place.

The only device tree in the kernel that uses tc358764
use the boe,hv070wsa-100 panel, so update this panel to report
the correct connector type to support the model described above.

The "drop drm_connector_(un)register" patch drops some
unnessesary calls related to drm_connector.

Next update tc358764 to use drm_panel_bridge - which was a
nice simplification of the driver.

The last patch to support optional connector creation was
then simple to implement.

The patchset has not seen any run-time test.
So testing feedback is appreciated. The only in-kernel
user seems to be: exynos5250-arndale

Review feedback is likewise appreciated/expected - bridge
drivers is not my expertise area.

	Sam


Sam Ravnborg (4):
      drm/panel: add connector type to boe,hv070wsa-100 panel
      drm/bridge: tc358764: drop drm_connector_(un)register
      drm/bridge: tc358764: add drm_panel_bridge support
      drm/bridge: tc358764: make connector creation optional

 drivers/gpu/drm/bridge/tc358764.c    | 68 ++++++++++--------------------------
 drivers/gpu/drm/panel/panel-simple.c |  1 +
 2 files changed, 19 insertions(+), 50 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
