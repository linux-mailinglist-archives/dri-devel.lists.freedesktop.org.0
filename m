Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D751855EA
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 16:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3926E17C;
	Sat, 14 Mar 2020 15:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021586E17C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 15:30:58 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id s1so10352869lfd.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Mar 2020 08:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7DU2t7m+cderg8EaFPtaxoNn5hdLKVNHAy6HvbA6dc=;
 b=mWIjeJP0nPIupxChcDDlB54fia4NXdGKZF0e4EDtiifIbpvl6Zm4hhE7J8QlRFZggE
 69lH1XwtORjB5Oar3rJWx5oDXqn7sjtgj0mFSSfmuWAyJGs9wc8o8pFtnrFeB+47isuK
 V65ixdoWDA7pPmR0b9UrAsdpFx4EAqSzhjQRHEviQPxZZ1ZcXy/G6p4nrYu1Kj2evFAS
 tJOPcsHyOaKZlMv159hBMcq4fclyLtSAiGmzTYT1H8A2yKVlo4gTnur3AOUTLJoKQFbb
 BMV3cotzSYuNtMFHyp+M/IMJYxiiD0aQvci5e8C+Vx0CNOpORejskDHs2+/QfLPwgGbq
 6dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z7DU2t7m+cderg8EaFPtaxoNn5hdLKVNHAy6HvbA6dc=;
 b=j9mGgfVkFT/EHWWRZsNlLOd2Uu8w58nUrAfTkmsPpwE3OrpKjNXIwK2U0mjLDrRCzB
 k5b3+BrpV8+05nIVAuLNZSV5ClNH9gM+p1KFQDKtrtvkjkLo8ZY+e3V74+R9hWC2/XoS
 jP8VpAXImBuC4ub/VHzQukITrIKq/kWF8umX/IeMyUHRcM9i05DT4+WAguLfYIi6QnAp
 HA9kMgQ3ZZew0NpU+3jjrfeWZ/5mkV9Gn8SlItX02Bt5Jhg4zYT21qeh2Az1vG1D6uo5
 hFtTaH2xb3xu/i9oaGUz9YvqKDhsN7RO2JGxxXZy9P20+aC+Wu3ik87XVKo0V/IiRJhV
 LwGw==
X-Gm-Message-State: ANhLgQ040xf13zUhoi2mcEmiY+5MT9YwexnuAFHDLonZUpxr5NkN4+E1
 ERXHTFoJbm6+EExNJM7RsTg=
X-Google-Smtp-Source: ADFU+vvMNhFlIzGt4mHsSF+8Dtoa4Q7tmYluiY7kijokV6DgmoM/JC2yCdvw1k3HvS9iYBpzGhEUVg==
X-Received: by 2002:a19:c7cd:: with SMTP id
 x196mr11508387lff.106.1584199857333; 
 Sat, 14 Mar 2020 08:30:57 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n200sm15650418lfa.50.2020.03.14.08.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2020 08:30:56 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: display: drop data-mapping from panel-dpi
Date: Sat, 14 Mar 2020 16:30:45 +0100
Message-Id: <20200314153047.2486-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200314153047.2486-1-sam@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

data-mapping may not be the best way to describe the
data format used between panels and display interface.

Drop it from the panel-dpi binding so we do not start to rely on it.
We can then work out how to best describe this mapping and when
we know it, we can add it to this binding.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-dpi.yaml   | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index f63870384c00..0cd74c8dab42 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -21,15 +21,6 @@ properties:
       - {}
       - const: panel-dpi
 
-  data-mapping:
-    enum:
-      - rgb24
-      - rgb565
-      - bgr666
-    description: |
-      Describes the media format, how the display panel is connected
-      to the display interface.
-
   backlight: true
   enable-gpios: true
   height-mm: true
@@ -52,7 +43,6 @@ examples:
         compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
         label = "osddisplay";
         power-supply = <&vcc_supply>;
-        data-mapping = "rgb565";
         backlight = <&backlight>;
 
         port {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
