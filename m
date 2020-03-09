Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3EE17F19E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA85F6E821;
	Tue, 10 Mar 2020 08:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCC06E484
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 15:37:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so11808999wro.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=CMCkUGWyUXDY9/+1nPPFR1H/NZon6xyDpMv3o0wXpjk=;
 b=sp3+MRjNFqYl1GEuzhd871RKEOfmb0kxaisfmQpLADTlUCnc3CyzZ92nDd2XD/DFyq
 s8sJNi6cTdoQnqaW6AQkeGQ5Jq+x9QhsCVhCY2aOCiwRW1Gm7oeBxTtd+29zSOxNCeob
 FSrdeVW8or6WRIphIRP/RiAK0THwtXdSI/XqRFPkPBlYbD2BlHfj+Rs5j2Ff8SbIOC7y
 qQGWzKU+09/9nNbRvt7IFIhtQIdvQqBoaSaw9nPVPX5CGa8bll6yJ+OYEHi/A/I9qalN
 tRG1hJ1U9m2kNdxN38+8yzgaeyaxpetIyCHBlBAvWZFDP47gc5kA37bsZF02RXfH5dan
 EAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CMCkUGWyUXDY9/+1nPPFR1H/NZon6xyDpMv3o0wXpjk=;
 b=UqXHkSPP6mHbEr3BdTMb0ojRvo81dX2s4nt5P7sQOlIRuNzW76jnM8E4nDN3WNwrDJ
 xVEAIrv03sxdKRolx9F65ycX7Enaoe7/I3ktzIguhHYucO0XHRTqpngH++EIwUCQmwgZ
 O7U4ChQ9KBxx1jh0z9mgXkjwd/pnkAhR4Nwc+WvI/LZWB1xt/N+cVNXI/JUdnJvtp3+9
 V4/erGnHtsYCM34ZmGxyp4VFAE6/w6yzQ4srGMgVrnQ6sOG30mdZKS56NDKKPy6RHMjG
 qANfC9prhfCnLGHEN3Z+Ec9iUlzrqlrvAWeoSP5eQ9EgfBP4QxDubOcww2BUG5NF2Pfe
 sFuw==
X-Gm-Message-State: ANhLgQ3WpYVHWzPxkA9Y9qNGijHijF3t8HKcZ823LmyjiV1AXKoVxN+P
 3iBllLmziIHcOAGKv/oQuQsvFg==
X-Google-Smtp-Source: ADFU+vsvlJG1/jN/ClMPn1XK0ZP5cUyfrfwHKGeur1VcrE/o6jEioa58ZpxOLpU6/PnTdXryQ6vpMA==
X-Received: by 2002:a5d:69cc:: with SMTP id s12mr8476355wrw.20.1583768220640; 
 Mon, 09 Mar 2020 08:37:00 -0700 (PDT)
Received: from localhost.localdomain (232.240.140.77.rev.sfr.net.
 [77.140.240.232])
 by smtp.gmail.com with ESMTPSA id h17sm63426792wro.52.2020.03.09.08.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 08:37:00 -0700 (PDT)
From: Phong LE <ple@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com
Subject: [PATCH 0/3] Add it66121 driver
Date: Mon,  9 Mar 2020 16:36:51 +0100
Message-Id: <20200309153654.11481-1-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 dri-devel@lists.freedesktop.org, stephan@gerhold.net, jonas@kwiboo.se,
 heiko.stuebner@theobroma-systems.com, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IT66121 is a high-performance and low-power single channel HDMI
transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward
compatible to DVI 1.0 specifications.
It supports pixel rates from 25MHz to 165MHz.

This series contains document bindings, add vendor prefix, Kconfig to
enable or not.
For now, the driver handles only RGB without color conversion.
Audio, CEC and HDCP are not implemented yet.

Phong LE (3):
  dt-bindings: add ITE vendor
  dt-bindings: display: bridge: add it66121 bindings
  drm: bridge: add it66121 driver

 .../bindings/display/bridge/ite,it66121.yaml  |  95 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/bridge/Kconfig                |   8 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 983 ++++++++++++++++++
 5 files changed, 1089 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
