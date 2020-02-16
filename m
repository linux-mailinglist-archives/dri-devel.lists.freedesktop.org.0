Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F32F160537
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 19:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA416E182;
	Sun, 16 Feb 2020 18:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4926E107
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 18:15:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e18so16160700ljn.12
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 10:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SfHlVAnH/ccSjGXvc2AU7CfY4JiqCtEZu0lrLGdWkG8=;
 b=LS6eYJ4jE18P0XW64xlvQPq9yX54ItuCELBjzkOeGY669IvJufudSr/bu29DYTuQuG
 oboKilMMlajKzbEy8GHC9UDabTFKLE3TYx7RAyj5YJW4Li8HSPgch6M0XQGD/y28DfGF
 96wJxmSuWZd9CHPDqXOaND6DwHu5jGGfzBroGPHRTnlwQUjWDRAKTsK0st9q/lWg0ht2
 USTTPvoY3bDsnQqPbLNUS5H5HydiKx9xMKbrD7wq9wesRVWtXB2ktjkwbGrkdOEtkA5z
 BR9sbsY2XAxaufgght22aVMIbPI+jeagR3MaEz24+8ccpaQPbxOIcuRtMMjvzWCQF1no
 DTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SfHlVAnH/ccSjGXvc2AU7CfY4JiqCtEZu0lrLGdWkG8=;
 b=a/qQ13RbqLS4HvHWi5fpt6LxjLnZX8z+Oe/w/dFnkxcmocuGoBabrMGImhPVfSmrV/
 YpLAxRh1KN/JGUKbWhrUwOIeCIhgLMTE70ZqBho4lw5334upprCn5ad2wHr6J/PV2P7b
 Fz0mFG/1YZyiVGIhPCV+UPyFn6tptuNjM4wLnCwTCmKXEWifa44xuTPMOWmZBT1PA0kO
 VHFIhbHSp0RC9yjC16A6aIgQLXM1DNjl0O0g7XwRRt8MYPyZN5vEXlB8dMY1qyO8fkSm
 AihtZn8GPgv9uJLNbcxSRbtoQ5NuIx4wOs0s6m0Oq+yH2MRUm69wFzvB32xw49qUd51H
 vtlw==
X-Gm-Message-State: APjAAAXNcE4gmKiWCZ0SKUs3ECMvIGEfAzuEkGpQzCR4M0Z9JJbz70LS
 H3fWmMG079bVXzxZwxmrrjo=
X-Google-Smtp-Source: APXvYqx/41CIvs7Q4tFA4Bw/bUOPzDWehieZO6S867gJzb9e1HNuprIU2zKmYJZWhPdcgXmRb+nXKw==
X-Received: by 2002:a2e:965a:: with SMTP id z26mr8151145ljh.104.1581876928759; 
 Sun, 16 Feb 2020 10:15:28 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u15sm6157431lfl.87.2020.02.16.10.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 10:15:27 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 0/5] dt-bindings: convert timing + panel-dpi to DT schema
Date: Sun, 16 Feb 2020 19:15:08 +0100
Message-Id: <20200216181513.28109-1-sam@ravnborg.org>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>
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
at updating panel-lvds to support panel-dpi.
This will make it simple to add additional properties to panel-dpi.

Thanks for the quick responses on v2 and likewise the quick
feedback on the request for the license change!

Highlight from v3 - se individual patches for details.
- Added panel-dpi support to panel-simple.
  We can now add a simple panel just by addding timing parameters
  in a DT node
  The patch [5/5] is RFC as test is pending
- To support panel-dpi in panel-simple - add a data-mapping
  property to panel-dpi

Highlights from v2 - see individual patches for details.
- Got acks for the license change
- Simplfied panel-timings bindings
- panel-dpi can now be used without a panel specific compatible
  So panel-dpi can be used as a generic binding for dumb panels

Feedback welcome!

	Sam

Sam Ravnborg (5):
      dt-bindings: display: add panel-timing.yaml
      dt-bindings: display: convert display-timings to DT schema
      dt-bindings: display: convert panel-dpi to DT schema
      dt-bindings: display: add data-mapping to panel-dpi
      drm/panel: simple: add panel-dpi support

 .../bindings/display/panel/display-timing.txt      | 124 +----------
 .../bindings/display/panel/display-timings.yaml    |  77 +++++++
 .../bindings/display/panel/panel-common.yaml       |  15 +-
 .../bindings/display/panel/panel-dpi.txt           |  50 -----
 .../bindings/display/panel/panel-dpi.yaml          |  82 ++++++++
 .../bindings/display/panel/panel-timing.yaml       | 227 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  74 ++++++-
 7 files changed, 470 insertions(+), 179 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
