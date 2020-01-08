Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9F413502A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 00:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B08289E41;
	Wed,  8 Jan 2020 23:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53F89E41
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 23:56:14 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id b9so2288627pgk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 15:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHrL6v0Uw66YhBXxgwYhRKU+mM7wW3ICLAPhDHJZnZI=;
 b=TsV31oHuYUrTWDADB0GeSf5Ja4Tx3vAEdFTZ8j+GUSukv2yUeP3xYSVmNbL5onBIZ+
 EIQewAW2KgMjdB9iNQ5sfc4KqbA4Tk7I+jhdfxcaW42H/HIEYBeHTWFQBDdsZXAAyXSL
 IDmGATtPwKHWhODhEtheqIvBz3XaHEAO/O32HNxSYcN8WU6YPOGpgftrx23vgmanYUAC
 br9BuxyflB8m96uqOfy7ZMIKQlKRDL6r/FToT2AqhPrHtzPiHZiNOPJiMJ/vfH0Dup/1
 WyOLSVtsIOCSoHi7m38s/pDvmwgwjep8bm1gm0rOPj26Bt6MMW9zPnar3bYm/POBvnOX
 LTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHrL6v0Uw66YhBXxgwYhRKU+mM7wW3ICLAPhDHJZnZI=;
 b=q7CR558MpNb50O9WkJWnkzKe72iQQmts4k+xJRhqA94kst2Hcacga2gHhLuWc6IfY+
 FwzhO3RmeyGIIE27MqZIu8K8vMHxkM6/rhSs5gLip4QPwFyP9Pr0mv8BY6g04iT44d9k
 cSC6/kAZqiMVWUCL6U2NOrH4zXLObkMohCAFzUpoTupcW9e40U3N7OP2mSlbI84VdoRf
 kuXewnsXo5fs9wRi7ajhpdx9uutvhXpnugqlaq4+L+4kwhKAB8R3GI5HjSKpsrmbJdnK
 30HgWPQ9lMdidls8hJzw/0nXX4bNNdwiHDHG20rDT/v0yap/NvWrlFOJRxwZEx+W4/Ms
 +94w==
X-Gm-Message-State: APjAAAWysy5gnolF+x09KmxwfyBFH6OTsjA0rKrn9Y9E/zyArVQ73PQx
 T0b6xA5BB9wIyjPivRVJwnAPYT3IgNw=
X-Google-Smtp-Source: APXvYqyln/X9tK1/v1SDPoi3Eb0DxxrKu9hBOdTHuIzAqjt73KadruyPy2BLeoTIyq0V1/1+8PV8ng==
X-Received: by 2002:aa7:946c:: with SMTP id t12mr8030393pfq.137.1578527773391; 
 Wed, 08 Jan 2020 15:56:13 -0800 (PST)
Received: from localhost ([100.118.89.215])
 by smtp.gmail.com with ESMTPSA id y6sm4810131pgc.10.2020.01.08.15.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 15:56:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add AUO B116XAK01 panel
 bindings
Date: Wed,  8 Jan 2020 15:53:55 -0800
Message-Id: <20200108235356.918189-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Rob Clark <robdclark@chromium.org>, Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 090866260f4f..5f1d765447bc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -33,6 +33,8 @@ properties:
       - ampire,am-480272h3tmqw-t01h
         # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
       - ampire,am800480r3tmqwa1h
+        # AUO B116XAK01 eDP TFT LCD panel
+      - auo,b116xa01
 
   backlight: true
   enable-gpios: true
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
