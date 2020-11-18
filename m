Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF612B8D71
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A62D6E58A;
	Thu, 19 Nov 2020 08:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080F26E40F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:58:35 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id oq3so2877770ejb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 05:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=fdF8xUVo3uIdHc6YyB775KnYhOIlFrGskqvtuYUq0+H0LEDxRf2FSjmE3MejSgdHTb
 8WJWYId6ImRG9GGecYu1B32uSQt7oWDTxH2x+PqtWNUitn9YCxWI0EEes+tXEV1MP+XU
 8D+YacIFqFcQzMWGR+LX6Mc6ITalnds5Ff3PCpT9y487iyq4fM4+FYc0vNpudn6aT1nA
 f/tKSRmWc1iauHA8/2II7cKUJ/ro4adTzpQmNEnWYqgZZVVWV6vKzi91xqrWu/9Z/Wbk
 IjGH8CQrSMvry7JmgYbGqaLBDpacNYpdVh4K8kq5qc3bN/DiIm8VHGvt37d6TGSFQwVl
 vKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=qROCqz3MR7hW/ai1Fpcq/89h83APaSRD21teeMxDQH1oYanCdLN9+W0wM/HKSf2wtq
 B85cKfq25NG/D1K5R7s4fRXsNmxjZAeIgUO+9BDC2szJYLBX7lYM4GS6J+Gi4NtKPC3C
 WU7dhyeDnTg4lkR6PQNaT78bSunNo00ZA3rgTJJGzlss9TCB2TsI4ZvtirVFkHdkQxvW
 k4JfFhlMVvOk//ghqJKemgg9eC5ZbymFz23ElTnJuYnMkCfma2B4NzPmuitZQbY0dqxs
 KkHs5t3/qsUdOjDkblrULtA9JWmQpAvXArZCYRTWBnq+EKJdwh7cX0TDp0LgR+bZxr8n
 KI3A==
X-Gm-Message-State: AOAM530TdKmePvtenxN2tJIYPrWd8JMJKAQ3ynd+T8QE/4LBJHDKV775
 AmCsHY1Eut4RdleCRc5mC0A=
X-Google-Smtp-Source: ABdhPJwPUth9fHvvDX++NfqTDXzoOCsJv1H/KeHB1Jjd8310pAuysjnHkPHT+Mln9kBpRXazl3YUgg==
X-Received: by 2002:a17:906:c08f:: with SMTP id
 f15mr23483362ejz.97.1605707913682; 
 Wed, 18 Nov 2020 05:58:33 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:33 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 3/7] dt-bindings: display: add #sound-dai-cells property to
 rockchip rk3066 hdmi
Date: Wed, 18 Nov 2020 14:58:18 +0100
Message-Id: <20201118135822.9582-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'#sound-dai-cells' is required to properly interpret
the list of DAI specified in the 'sound-dai' property.
Add it to rockchip,rk3066-hdmi.yaml to document that the
rk3066 HDMI TX also can be used to transmit some audio.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
index 4110d003c..585a8d3b9 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
@@ -42,6 +42,9 @@ properties:
     description:
       This soc uses GRF regs to switch the HDMI TX input between vop0 and vop1.
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     type: object
 
@@ -101,6 +104,7 @@ examples:
       pinctrl-names = "default";
       power-domains = <&power RK3066_PD_VIO>;
       rockchip,grf = <&grf>;
+      #sound-dai-cells = <0>;
 
       ports {
         #address-cells = <1>;
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
