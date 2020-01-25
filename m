Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A461497D1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 21:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729906E914;
	Sat, 25 Jan 2020 20:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466506E914
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 20:35:10 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n18so6521176ljo.7
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=18PPmbY6hPiGovJ5z5goIi7VokDaAvZuAdkPLRQyUjI=;
 b=Czn3kAjRf2v/csMfGRAjKgqpM7hw9JzVjU5ktPmxuz/R9pDPKXAuFpOdryQYgYJow0
 8brrI3pc5+tQoCbz1tNq0OSB7k8xlp1ZP32saK6uxpF8NQv2NkfS88Iq/7tDNT2LExHg
 Q4GeAnOtTAMwglVH0cpIOzxHp8kq/8x/2+YcEwxRP88z7UDJhM07NNu0xauTDU4Hi4zc
 HOavhgdU9mBO1tp2HR/0E/rczQV85r4V6q+OyFZozCBqPyM7LhoSA9/Zf5gAVFu77WK+
 CuL/dD7lJnuSLySM+bSBvCbgWXUux1jduYDuBI89rPUt0GB0Nuf9y56QiAgfuqOmFM1G
 BnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=18PPmbY6hPiGovJ5z5goIi7VokDaAvZuAdkPLRQyUjI=;
 b=NPpAdWLGW2nAEVn6Q03pYO0eeQXE43bRKKtkRJdhYsWrsX8wRkvL2muZJc1bIjF7Px
 TIvk7aMSQmCWOly8osLKP4B8L8dOPZrZcA1GzT07M1Pp5r9jFSNRWQFCY0h5v4E4snbI
 yXYKZNH3HwsNx9JW94tGuTYr2/bCvsph5KNVWoNIVNANiJLWlZRzxxaAuBCtWM+HYR6z
 W5m7ojnf2WHkiSUE+gc9v3z/8h9REcVd32ZtfsweqXTjQem8b5YYyqtyVU1K8rErwewb
 mvXH+fdujae745KaTyO1qV/2nQZ6wopll9NAkpNJPtc0hxIaWBqeFaIdOyNQisKRMniA
 qz+g==
X-Gm-Message-State: APjAAAV+QrpkJUjddj7hwh/A/cJwPVXP6u7ZBiaT55Fy3ueyZzb94gfy
 IgJALHkCI+ZeIgE8+Xc5Wt0onrpxFeE=
X-Google-Smtp-Source: APXvYqwLhPKl9twree9pXIPVv83eRpZtn00E6hqeV5l31ik+OJQkcaEEBeZR7/Ae46t/+EAe0uZvyg==
X-Received: by 2002:a2e:804b:: with SMTP id p11mr935608ljg.235.1579984508529; 
 Sat, 25 Jan 2020 12:35:08 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u17sm5393937ljk.62.2020.01.25.12.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2020 12:35:07 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] dt-bindings: convert timing + panel-dpi to DT schema
Date: Sat, 25 Jan 2020 21:34:51 +0100
Message-Id: <20200125203454.7450-1-sam@ravnborg.org>
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
at updating panel-lvds to support panel-dpi too.
This will make it simple to add additional properties to panel-dpi.

Thanks for the quick responses on v2 and likewise the quick
feedback on the request for the license change!

Highlights from v2 - see individual patches for details.
- Got acks for the license change
- Simplfied panel-timings bindings
- panel-dpi can now be used without a panel specific compatible
  So panel-dpi can be used as a generic binding for dumb panels


Feedback welcome!

	Sam

Sam Ravnborg (3):
      dt-bindings: display: add panel-timing.yaml
      dt-bindings: display: convert display-timings to DT schema
      dt-bindings: display: convert panel-dpi to DT schema

 .../bindings/display/panel/display-timing.txt      | 124 +----------
 .../bindings/display/panel/display-timings.yaml    |  68 ++++++
 .../bindings/display/panel/panel-common.yaml       |   7 +-
 .../bindings/display/panel/panel-dpi.txt           |  50 -----
 .../bindings/display/panel/panel-dpi.yaml          |  71 +++++++
 .../bindings/display/panel/panel-timing.yaml       | 227 +++++++++++++++++++++
 6 files changed, 370 insertions(+), 177 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
