Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A91432B9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 21:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9D66EA83;
	Mon, 20 Jan 2020 20:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611246EA83
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 20:06:58 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y19so241111lfl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 12:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5FL32bHaS8nfyXz1mQQIzdzLjz5B0ZDSg8dlC9DoT6E=;
 b=W9zyeElqSKpsXbUWbKSxkOicXHP8N6G8qLJZxrOqsY//4BFO5G9S16Mq5N0IZ2oGXv
 ytBEFLCodBuoLkU43zTfBwQGedTXvmV+kbkWr26/iKrDRgACzdIIcp/36D/ecbjxpmM1
 7DLB9hfma2zafXbkJ4y/qM6BNZClwhAblgyTlLYi94PydEjI+AlTFTpS59iHzN6OLXTk
 rdfIIXFuUNJQAsSs1F/SGevQlWvTnYqnVIJlJwEIJbsGk+GOn01dqjPifI21qkcImprC
 /In+fZ5q/l4Tgi4E4ff8tXUAU0NavePmU9frRal/IW1LJVbhrLk87zkYs3baAAXFLKMn
 31BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5FL32bHaS8nfyXz1mQQIzdzLjz5B0ZDSg8dlC9DoT6E=;
 b=bGKSWe55CGF95s4UZZmr76aDX+iY/8yplGeYkL73leiuvCx9KWF6phcPYJG0PgoyV7
 hnNu4uanThZZ+bdzM/mVTPtNhDXtsPFCBv1cPYEY2smQDT5GfhmdOKLSBlxRUPpD2RV2
 Asoxc8PPV91EQ1rVCjW9akOH92MYqm8eLKTBrqUUJCl61rB3VVtcr96hks2K4nyDGG5B
 bmeIt4iyoH33RjMv1Oc4gUjeFJQKcXh1FiiUoZwFonSYZxic+AcxeAp7sJfy1hIA2Pzi
 9EGlEq8ZK90GQsYKpxyFJCpst+zIx1J54rdmMV4KgYFCDcFMNfAyHncEcADNZOA56RzV
 s8Sg==
X-Gm-Message-State: APjAAAXIrJa96ufalNgZtwWZNwuD30MrLeECjtSvj923R5uSD+j6LqRF
 Ymu9B30wBapfAS47iabM8J0mH12RcoQ=
X-Google-Smtp-Source: APXvYqy1EeeGOi/vIE+zij/0Kic9meZSEaxyH7Okhtvky/es1JnSbkjfYGZZ2ltcUQMGLpOO9l2TwQ==
X-Received: by 2002:ac2:4add:: with SMTP id m29mr545652lfp.190.1579550816750; 
 Mon, 20 Jan 2020 12:06:56 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o12sm17332476ljj.79.2020.01.20.12.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 12:06:55 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] dt-bindings: convert timing + panel-dpi to DT schema
Date: Mon, 20 Jan 2020 21:06:38 +0100
Message-Id: <20200120200641.15047-1-sam@ravnborg.org>
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
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This set of patches convert display-timing.txt to DT schema.
To do that add a panel-timing.yaml file that include all the
panel-timing properties and use this in panel-common and in display-timings.

panel-dpi was also converted so we have no .txt users left of panel-timing
in panel/

Everything passed dt_binding_check - and the trivial errors I tried in
the examples was all catched during validation.

This work was triggered by a patch-set from Oleksandr Suvorov aiming
at updating panel-lvds to support panel-dpi too.
This will make it simple to add additional properties to panel-dpi.

The .yaml file are all (GPL-2.0-only OR BSD-2-Clause).
There are some parts copied or inspired from other files,
but there is also a lot of content written by me.

The license can be questioned - and I just used
the default for new bindings.

Feedback welcome!

	Sam

Sam Ravnborg (3):
      dt-bindings: display: add panel-timing.yaml
      dt-bindings: display: convert display-timings to DT schema
      dt-bindings: display: convert panel-dpi to DT schema

 .../bindings/display/panel/display-timing.txt      | 124 +---------
 .../bindings/display/panel/display-timings.yaml    |  67 ++++++
 .../bindings/display/panel/panel-common.yaml       |   7 +-
 .../bindings/display/panel/panel-dpi.txt           |  50 ----
 .../bindings/display/panel/panel-dpi.yaml          |  71 ++++++
 .../bindings/display/panel/panel-timing.yaml       | 253 +++++++++++++++++++++
 6 files changed, 395 insertions(+), 177 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
