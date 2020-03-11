Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E97182ABD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BED6EA82;
	Thu, 12 Mar 2020 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B0A89D56
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 12:51:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x3so3110450wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=6mmjs1zoy21HGdXRuhBisBs86sD1UMcUpSzszzdWpvA=;
 b=b4DElPDmtlbb1xvN5jVD3o8QZeGR+7PKcSdOSRtSbXEFwkPrylJcMqnZvKNSJRh14V
 6aqZwiXB5y2Av1kqYMGRFyyVSV3hRn51Jy2RF+Aq6a2j0g1Mf/fUv7KjHILYBHyInEdv
 c5nB8+tBPOpMZgR4su7kn0zyVCJ/DZr2rT7LmbjigMSE74S+SNtoV6NIRDD1zpCuGcMV
 TIP2Ui1s9OocJKnffxQPNBM+2cwn0nrQMe0Q11kYSdT43tjYvZJOEoOo+Fv0mlbQL4d3
 aRgfdZLWl/+ZZvGmp+v4pwZpEdLZsof/+5jRrn7XJP6H0cnzRseS16efUHf3bVll7sxL
 APOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6mmjs1zoy21HGdXRuhBisBs86sD1UMcUpSzszzdWpvA=;
 b=ZLkJ1TpgtnsQ/iAut8W8Dkf9BXr9nZMEa6aA+q01+YWypD6MsY6LuyWADpqRCV7Yv+
 iT9KQxrR9Oy8pz2fFx5RKUu/OBRvl/xPAyieBH7dbHpucgkR1AwbnOYYuWwc0uJPX+tf
 0DrFutKiwR2h3K4o9eZyboIP4lnhexqT4ZXIofPscPHuBp5gYmFUrgCyhfGeDBH6b5Zq
 G30hgmDHKu4QQIwfd3VyvvXFrElo3+qGA5Ddv/OZuaSVwkeKC3L8pxFwwwSWcOFzz/sc
 ercku+cK7qROA30Vlrqiw+0Ilk5aLWN3Y3pMP9H/Y3/+jXx5dvzS+J8oCrazuZtmrQBO
 vZLg==
X-Gm-Message-State: ANhLgQ2if6OgZVF3euRkzKN1CxWfeNV5792jDXw7XyaGYsQh5juuOIgq
 Y5xQct7IpnoIIlg+Rf9Ns3EzeA==
X-Google-Smtp-Source: ADFU+vvH+0ONZuHFXRlr54VYaPW++G9wGrbF1sWPr8MKp+jdH72w07T55RveDBX31y81xSMCnFPsBA==
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr3536712wmh.187.1583931102518; 
 Wed, 11 Mar 2020 05:51:42 -0700 (PDT)
Received: from robin.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o3sm8843538wme.36.2020.03.11.05.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 05:51:41 -0700 (PDT)
From: Phong LE <ple@baylibre.com>
To: narmstrong@baylibre.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com, a.hajda@samsung.com
Subject: [PATCH v2 0/4] Add it66121 driver
Date: Wed, 11 Mar 2020 13:51:31 +0100
Message-Id: <20200311125135.30832-1-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
 heiko.stuebner@theobroma-systems.com, Jonathan.Cameron@huawei.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 Laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
 mchehab+samsung@kernel.org, andriy.shevchenko@linux.intel.com,
 sam@ravnborg.org, davem@davemloft.net, icenowy@aosc.io
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

Phong LE (4):
  dt-bindings: add ITE vendor
  dt-bindings: display: bridge: add it66121 bindings
  drm: bridge: add it66121 driver
  MAINTAINERS: add it66121 HDMI bridge driver entry

 .../bindings/display/bridge/ite,it66121.yaml  |  98 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/bridge/Kconfig                |   8 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 997 ++++++++++++++++++
 6 files changed, 1114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
