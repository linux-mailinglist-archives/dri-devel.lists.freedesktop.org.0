Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80F2B77CC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D5D6E3D8;
	Wed, 18 Nov 2020 08:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0016E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:45:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k4so7031133edl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=UIOGOw6hK+SW6PZnTFb6Ge3JqTDe/NwtTmNJTO4P+2RtdCxVwpi7Rq/Aqdy7x6Adcp
 wRP88fBy5dFJaM2aQnbeAQ86OaDGwNfxN12gzmJ3dkqFpVnOiTua1TOmWPi7J28YErO5
 +vT7F/x1TgHqtmEhUwh1PGspoG99p7+7gC8IC1SqDzWM6y+6IByo7u7LnARJsyzVo3vk
 EGBbLldPVSZ2FfdplHh31JJWObz6Q/AbWGttToOaFGaxQ4Bnap+uRazajLZG+ZNqt8mO
 LDNPLKADpPwuoYQpU5npEVkcgsD8/4BWY1DBz+1+56qMZZS+niS+ovqyTi/ggQR6pvM/
 lMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=LBTyYHIdwxRLQp38XHbU+KYyEs4b6UOJ3EH4+EYknv7ITt3rHTojfXkoxZAsLdzY9U
 0ooT7gxtAddkluNROqsVNcx3gMPcM/7jHoIUeEhbg1YIm7vZon03FRryikcDrqsygwai
 JS7F/vNvZh9rWgCZbkEyrqD7F8PyomKBenjtYp7DqIBJcdBUNUDxThyaxdq0n0s5xIDe
 tKYBqM2MIDxBApSpU01A9zYZnC/SH/nl8F7DpGKV4X6Vp/pK05YCbbksJoNiX3LFmcWA
 gFuXCl9acZojno3TW/wsJzD7fvW3chgUwCbrmrN2+K4Va5bcyb21u6ckqLLWFNRD2cqi
 8ifQ==
X-Gm-Message-State: AOAM532rpwsWhuAacf30pSnVHE4SFDtoVLPdfZx7zD0nUsXlX+2X0BsC
 pjaBuxe+97WYI7u+3KWWWo8=
X-Google-Smtp-Source: ABdhPJzm63HVDveFpEYpiHWpLCJrGBMkWK296r8Fu/+E5TNgbXn9uz3U4HX7amby2EJhlwkYrbPUvQ==
X-Received: by 2002:a05:6402:1389:: with SMTP id
 b9mr12408755edv.178.1605642319735; 
 Tue, 17 Nov 2020 11:45:19 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:19 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 3/7] dt-bindings: display: add #sound-dai-cells property to
 rockchip rk3066 hdmi
Date: Tue, 17 Nov 2020 20:45:03 +0100
Message-Id: <20201117194507.14843-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201117194507.14843-1-jbx6244@gmail.com>
References: <20201117194507.14843-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
