Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0551618BD3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 23:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C4410E64E;
	Thu,  3 Nov 2022 22:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6498F10E64E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 22:47:04 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id io19so3291297plb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 15:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62F2OEfjiQohqbU6sN5IcLCXyh2FVhzQsYQeHkUyEnk=;
 b=Mr2eDstZWkl7rG9GuxUwoPcf10TNjUbyMNE7QoZfN7g0lHtRM9603ErR0ybCFW5u4M
 jH98g5omf1ZOTtXsf2G74Pl4IjhUL2jVc/88ytnF/smKJi3iQaTQQvoOXsltnspsgJN7
 dQAX4YpFVZnW62RLUisonW5WsajwAvIthR5Pt/eoarGDnQzxq9zf7ai3xYFnvxmlvtYa
 4sJD75VSH63aSOCZgJsY9WeiNmbb56Ejo6uYJaAZhhGwKmtgnJrMHKGt7GCd55H7yRSX
 78VuCa4PXfL5fjZgZoF41JXB7j+4V8n1FczMBILQo60kK4XMcxICdvXBfdSicOX1ryRP
 sUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62F2OEfjiQohqbU6sN5IcLCXyh2FVhzQsYQeHkUyEnk=;
 b=2fYiYQ4IdK3skQpmcKKY0137IF+eId+ikhsTqbvx/+Nctxcn+XCSKutnwNNEdujnS4
 bXomPfa5apWofK7KnnwBjOj5taJ8fQTWeke7rLxNk/jbBVYCkX3oMZTFXxkrmA89mxyi
 l5q5+6DVT8IQWBMg+KaW0esgL8MN4/i/MPizfL7EKrIk3Nw8aFITe5n/PiOVmW94oyoK
 GsfU6gQET8scygCSor0YTFUasWHpxZ7UYVIVlH3WKXvBDlYPc0LkXd0dfAlKjZt38c57
 Zgj1o47CE6AgRhr2mI1ZxdJBc+wIHSu7zP/OnGThogmBV9hp6J1mYEr/9X1xX10xs/zt
 n0dA==
X-Gm-Message-State: ACrzQf1cmQSoK8pzJCVSAuFVb7wLfazIikIC5dsvaXYXgJX7xTMSodQn
 RqkBBBvy7Vr9FIwWjF53yAU=
X-Google-Smtp-Source: AMsMyM6qBW2zWz3GrytPL0bVRkK76t5nEo/iJdPDnrHA2dI45imfBq4xdE4zxzXXvtYSVApsW4sn0w==
X-Received: by 2002:a17:902:ce81:b0:187:2f28:bfa5 with SMTP id
 f1-20020a170902ce8100b001872f28bfa5mr18917403plg.51.1667515623775; 
 Thu, 03 Nov 2022 15:47:03 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa796ad000000b0056be1d7d4a3sm1280421pfk.73.2022.11.03.15.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:47:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: 
Subject: [PATCH 0/7] Convert omapfb drivers to gpiod API
Date: Thu,  3 Nov 2022 15:46:36 -0700
Message-Id: <20221103-omapfb-gpiod-v1-0-5cc59257f7be@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series converts various OMAPFB drivers to use the newer gpiod API
that respects line polarity specified in DTS.

Unfortunately existing DTS files specify incorrect (active high) polarity
for reset lines. As discussed in [1] we will not try to correct existing
DTSes, but instead follow the path established by DRM drivers for the same
components, and continue using inverted polarity in the FB drivers.

[1] https://lore.kernel.org/all/20221004213503.848262-1-dmitry.torokhov@gmail.com/

To: Helge Deller <deller@gmx.de>
To: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Torokhov (7):
      omapfb: connector-hdmi: switch to using gpiod API
      omapfb: panel-sony-acx565akm: remove support for platform data
      omapfb: panel-sony-acx565akm: switch to using gpiod API
      omapfb: encoder-tfp410: switch to using gpiod API
      omapfb: panel-dsi-cm: switch to using gpiod API
      omapfb: panel-tpo-td043mtea1: switch to using gpiod API
      omapfb: panel-nec-nl8048hl11: switch to using gpiod API

 .../fbdev/omap2/omapfb/displays/connector-hdmi.c   |  49 +++------
 .../fbdev/omap2/omapfb/displays/encoder-tfp410.c   |  67 ++++--------
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     | 116 ++++++++-------------
 .../omap2/omapfb/displays/panel-nec-nl8048hl11.c   |  72 ++++---------
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 105 ++++++-------------
 .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   |  59 +++--------
 include/video/omap-panel-data.h                    |  16 ---
 7 files changed, 151 insertions(+), 333 deletions(-)
---
base-commit: 61c3426aca2c71052ddcd06c32e29d92304990fd
change-id: 20221103-omapfb-gpiod-87ca2550bd90

-- 
Dmitry

