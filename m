Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB472D0C4F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BDA6E5C0;
	Mon,  7 Dec 2020 08:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B026E0B7
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 13:34:08 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k4so10847035edl.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 05:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=rTYlIsnBZhZ1gkeFipGqwBYR2ZwA9h+V8hdArOoD/aqyF5pkPdp8UG2LN6I69z6Z8o
 v/qbG4Tg4fZZwxqHLkJYXWphkFevKqRhcDiftdm7cW4FMW5B019iie6IKUAuqmmYoUAC
 0iceP/n6IV1kELlWzcM85oQXUlG0r5De0IpNKYpyCZHCEDp/DLhjlp1GZVhocDQQDnMl
 u2Oz4gy+73Xl0m0TmM47nRaMMFdcR46by+7wcEOQ/GWQwlNrIEZiODOYsEyHFCbh4lB6
 5SQr9x1xqbwElGItP8zmvF7oCyhW0zak8lRn7Iwsp+b+GoTEOWX/A2ymxinWVs5hZywF
 rk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=XfpIPbscHhj5A/cpPB/pFtZiX/0/L7ggoNR3WhoPdWRgxmPvCTW3yLFkG9tAAeShx5
 G0epGL7MmGTmYZQj0JCAcPcO9oUyBcX/Fml6E+Cn0eDzrjaog9uoGdCTcV56FSNU4y0e
 AdK0gJ4v4F/fDefJuQXBVjMT6cLN2c5GhdQfU1HxEGsakUshF5OcDW8yt/1kP2d3SjZv
 6F0yjt1FlqZuBgjymbmAfTKxUO3lR+AM+J4zaRIPRW+BMm8uXSTuncQ4Df6Wj+DwIO7K
 2t9EMTXQV/0Pw0UFi95NiyDAoAUkm76x2ri/JywBCfianlG3t9gCdWEQqJv7LwLkNzvK
 DPhQ==
X-Gm-Message-State: AOAM532efRyvnLSj16pXH7snLIK/nhVrpvsIlRxgBqlcEMh76+Q+VVDo
 zDbJJijBCy+q40aDIUqyvEf1e88L6fI5tQ==
X-Google-Smtp-Source: ABdhPJz+2tgBllNF3mr0DriE1oUWiJyqUX1uRzwk3HN0LdYKtYRiu18qL/KrCGFwmIWGbACXPv7meQ==
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr16355837eds.32.1607261646808; 
 Sun, 06 Dec 2020 05:34:06 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id qh23sm7770129ejb.71.2020.12.06.05.34.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 05:34:06 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v6 1/5] dt-bindings: display: add #sound-dai-cells property to
 rockchip rk3066 hdmi
Date: Sun,  6 Dec 2020 14:33:51 +0100
Message-Id: <20201206133355.16007-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201206133355.16007-1-jbx6244@gmail.com>
References: <20201206133355.16007-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, broonie@kernel.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
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
