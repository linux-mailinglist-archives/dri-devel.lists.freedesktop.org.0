Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9C33DFEE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 22:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155116E446;
	Tue, 16 Mar 2021 21:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FC66E446
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 21:09:00 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so155447pjv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 14:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ckCy2DNLTFsurQYOeBCucFOTgTIh9F4lDkIMXpfp3E=;
 b=EXULXbCbiguUB9WJ14EumXRl/eZVdBDFbhjQVofG2rcVniE4EQg33oVRIMix+ZusLa
 +8MB143a5/pM7LdnjT+8wtbrqBRVMqORX/Vf6AjSR/nW5F4k3NJWdIESIus0aExuPQbQ
 mrpxY6qS757zZMH0Z9V3B+PEEx4N0ZpUFMXgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ckCy2DNLTFsurQYOeBCucFOTgTIh9F4lDkIMXpfp3E=;
 b=Gq9IZMbxJ42XcMRXK2+Qp/iuK/mb2WiVVxnW1dZgDzkemQE1HDtY0jC2aGL7gsD/YX
 IqwFV/KWk+69hsIJ0F5XOCeC97knnsCdqLAD+xWERewR9SDkxfCENvOTJF89A2VxXqOH
 mkaZvX7At42A2BF3GSA70BLgUTntvBK80Eh6lYv3PrOYOFaZNelS7vMFPgw8bI+Wr272
 xFDCQpnzDRnxRzac2p6zj+xDFoAy8DVpQc+oAoXHWonRnTyVDeJrL2NgBoyeAFT8vGjz
 FoTXrCS+ur3mZvDfsJU6cQVl/JC9fubz1FJSp1XBpgE0LJSXshh+mtcVgChp+0WsTLwx
 pJBg==
X-Gm-Message-State: AOAM532romvOESJKcuKBerohPkpdN3LQLUOL0E8hQ6j+TKYmNowRgQbC
 qhqDWJdTVwB9UpFcSxMk+S/ovw==
X-Google-Smtp-Source: ABdhPJw15Vdgd1+PLOyaEZb9iqRLOxaBungyupgVM9vCCQtdviVgnn9XFWzvSCOChSmWPYvbHpV5bw==
X-Received: by 2002:a17:90b:4c87:: with SMTP id
 my7mr937342pjb.162.1615928939826; 
 Tue, 16 Mar 2021 14:08:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:84d6:7fd1:d469:351f])
 by smtp.gmail.com with ESMTPSA id 192sm17358072pfa.122.2021.03.16.14.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:08:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
Date: Tue, 16 Mar 2021 14:08:19 -0700
Message-Id: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Andy Gross <agross@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sc7180-trogdor-pompom board might be attached to any number of a
pile of eDP panels. At the moment I'm told that the list might include:
- KD KD116N21-30NV-A010
- KD KD116N09-30NH-A016
- Starry 2081116HHD028001-51D
- Sharp LQ116M1JW10

It should be noted that while the EDID programmed in the first 3
panels indicates that they should run with exactly the same timing (to
keep things simple), the 4th panel not only needs different timing but
has a different resolution.

As is true in general with eDP panels, we can figure out which panel
we have and all the info needed to drive its pixel clock by reading
the EDID. However, we can do this only after we've powered the panel
on. Powering on the panels requires following the timing diagram in
each panel's datasheet which specifies delays between certain
actions. This means that, while we can be quite dynamic about handling
things we can't just totally skip out on describing the panel like we
could do if it was connected to an external-facing DP port.

While the different panels have slightly different delays, it's
possible to come up with a set of unified delays that will work on all
the panels. From reading the datasheets:
* KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
  - HPD absent delay: 200 ms
  - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
* Starry 2081116HHD028001-51D
  - HPD absent delay: 100 ms
  - Enable delay: (link training done till enable BL): 200 ms
  - Unprepare delay: 500 ms
* Sharp LQ116M1JW10
  - HPD absent delay: 200 ms
  - Unprepare delay: 500 ms
  - Prepare to enable delay (power on till backlight): 100 ms

Unified:
- HPD absent delay: 200 ms
- Unprepare delay: 500 ms
- Enable delay: 200 ms

NOTE: in theory the only thing that we _really_ need unity on is the
"HPD absent delay" since once the panel asserts HPD we can read the
EDID and could make per-panel decisions if we wanted.

Let's create a definition of "a panel that can be attached to pompom"
as a panel that provides a valid EDID and can work with the standard
pompom power sequencing. If more panels are later attached to pompom
then it's fine as long as they work in a compatible way.

One might ask why we can't just use a generic string here and provide
the timings directly in the device tree file. As I understand it,
trying to describe generic power sequencing in the device tree is
frowned upon and the one instance (SD/MMC) is regarded as a mistake
that shouldn't be repeated. Specifying a power sequence per board (or
per board class) feels like a reasonable compromise. We're not trying
to define fully generic power sequence bindings but we can also take
advantage of the semi-probable properties of the attached device.

NOTE: I believe that past instances of supporting this type of thing
have used the "white lie" approach. One representative panel was
listed in the device tree. The power sequencings of this
representative panel were OK to use across all panels that might be
attached and other differences were handled by EDID. This patch
attempts to set a new precedent and avoid the need for the white lie.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 62b0d54d87b7..9807dbc1cceb 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -140,6 +140,10 @@ properties:
       - giantplus,gpg48273qs5
         # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
       - giantplus,gpm940b0
+        # A panel connected to a google,pompom board. Panel is guaranteed to
+        # confirm to google,pompom-panel power sequencing requirements and then
+        # the specific panel will be probed via EDID.
+      - google,pompom-panel
         # HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
-- 
2.31.0.rc2.261.g7f71774620-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
