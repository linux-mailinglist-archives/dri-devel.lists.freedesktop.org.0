Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976533E15CD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570446EA4D;
	Thu,  5 Aug 2021 13:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A476EA4D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 13:36:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y34so11106604lfa.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30uracpthIuXSs44lu6RRxWBv7NJjXzBaQjU8TB5510=;
 b=M/nP1CM7xn+CZ7274z8465Yq2jf1/nVPXJZvFxFte+iStx8VnQzGCydzYwV9YZ3qy/
 gi1PXGbBbs5VP7TKvXrabWmLYmPeGBazgZwyQAYFHrELvuVr+pFw1pCo6EgU4ftFslUE
 ftS58qvHPqAbZB6Li/DVMVhdK7saB3qktcqvII94alvZpJD4MBWqyi79yTlXv8G1WH4q
 uG3zZ20UNTUFzyoymNHt8ocDr/X3LRpbCg3U4zrYMxzp9LORkhCZe3phYxq1Wf377x7Q
 SppvoPu7U/pBFw4MbqqqEVMvhm8I9OJPOu4bzzX7YnMPZmsu/c9yilWQhdXpdznDfHhw
 /HdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30uracpthIuXSs44lu6RRxWBv7NJjXzBaQjU8TB5510=;
 b=odDHhlYAX7nHWJjhaOROpi1eE0zYO+glmfoI/iuLEoLUzuvJH7AfhBb1rhkT2+JHhn
 2gO9IdiJzceDbufPWRvqUrG0ZmwztXaBXyBsOHK4EhrTIxX09hLj6Wu9RXslBljHq73Z
 ucbJhlZvzzqZXqEEAAOScceL9KOiPe2hWz1+yVP+v9LwQlJnD6tZQjcg0ZBiC8sfp0Ub
 60ZDXGSnWRiHJp033fcKALyWaIPmNyYu9IO/WJm+rf+pmIKCaNj+vk+6DqqR9FHTpvWp
 3yXKlETBjSN411+EFvA4ZycuddR3RTOvsM59sbWM3TQBCeySKbyqz9zd+x0kVncDr3iq
 EUXg==
X-Gm-Message-State: AOAM533ePBWwXa07572J12aAsIF+wc5gONri8WgJiaZJMvvi5cWPS+fJ
 vMDkU2MmNGqbGF6RBxNgikk=
X-Google-Smtp-Source: ABdhPJw2fPHEeV+vd6pzesnCmhAxkmBbMI0INtbdI/2mGN2zSGItLyeYPaCet25Itf6BhkoHATeH+A==
X-Received: by 2002:a19:5202:: with SMTP id m2mr247398lfb.581.1628170566923;
 Thu, 05 Aug 2021 06:36:06 -0700 (PDT)
Received: from nergzd-desktop.localdomain ([62.122.67.26])
 by smtp.gmail.com with ESMTPSA id t3sm516232lfe.241.2021.08.05.06.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 06:36:06 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, phone-devel@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 0/2] Add support for Samsung S6D27A1 display panel
Date: Thu,  5 Aug 2021 16:33:40 +0300
Message-Id: <20210805133343.27032-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <YQmG6EbBherV+8px@ravnborg.org>
References: <YQmG6EbBherV+8px@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Samsung Mobile Displays(SMD) Samsung S6D27A1 panel.
This display panel is used on Samsung mobile devices such as
Samsung Galaxy Ace 2 (GT-I8160) also known as Codina.

Markuss Broks (2):
  drm/panel: Add DT bindings for Samsung S6D27A1 display panel
  drm/panel: s6d27a1: Add driver for Samsung S6D27A1 display panel

 .../display/panel/samsung,s6d27a1.yaml        |  97 ++++++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c | 323 ++++++++++++++++++
 4 files changed, 432 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c

-- 
2.32.0

