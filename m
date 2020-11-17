Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0F2B77CA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C646E3D2;
	Wed, 18 Nov 2020 08:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BD66E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:45:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id ay21so23798435edb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/M45YtMWBHvWX7HJgiaCX3duzycDxACgeh25TxK15Eg=;
 b=gv9iMNUExdomLmhZ6/3RtkBaW3AhpWBSUWSrMO1oLfdXYLZKQ0dl9R4nUwEcxPz1V0
 mijrwHA55UDncYNgagM9CjzpkasGyZQoc3OpbH5CXsWqB2RXLkTBzhyOkCyKX2oxJpeb
 Cwkb3M6jllsXM2EVpeBVtFwAtu16JC1xGqamfyB9l0yrXPxgPasdkyldRj/5V4DH6Awd
 iNOINqDFXEiDXichdp0Q/ygBI5MghrASAsL7lKCJ8uR6kmH3Q5B2JU5Dl2Czrb8IMnf+
 ndjcDuDSRacZCVEFgjLl1RQo58XMQZZ6lrS28sjX1rAs/o4SH4t8XgaWKHyUJXwmiPpv
 ov7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/M45YtMWBHvWX7HJgiaCX3duzycDxACgeh25TxK15Eg=;
 b=onzWCdUia81+vpoeaEWLEM3b6otWZdUIR2XswCEGdzOJvAGsVED3PzIBeLdkHhEcRh
 d9uwGGEmftqXL+Hn9vMMzoXDLPo/dK0AYq/hCPAWUlGN2aIWUOJIhNkr5aLcITZch8Se
 yLi6475nAIv1h5wj3OyCaXv+a9fuLuXxAiB2B0edtqPLaP7y+utxmfvxbc6wqZxtU/Jg
 cj7DUR9DMnIeGUZSLhDihWkctH45QHHxrjBPCe34LpdPYZV9jYa2X65Wz8mOiNkSsqMU
 B82ShoooCNvHo/EKGceYAlMrHCpOq9ukwRth29X6TR14w2drpGFXVItXmi0wSpg6zR+V
 Qpgg==
X-Gm-Message-State: AOAM530+hixqHI4lmkHKCeKh/eKAZDkQQ4q8VM1HjT9Ejsjrowazh+SU
 no/Js0i5sooJhlzxpaRYPSo=
X-Google-Smtp-Source: ABdhPJw0SEhxpFWNTsu1mkMrCWY8UFWsWPMj03LOTEeqmIC1KaMO+Jigt4JOZdpDCQfeyl7XDV8vHQ==
X-Received: by 2002:a05:6402:6d6:: with SMTP id
 n22mr23176808edy.82.1605642323246; 
 Tue, 17 Nov 2020 11:45:23 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:22 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 6/7] ARM: dts: rockchip: add hdmi-sound node to rk3066a.dtsi
Date: Tue, 17 Nov 2020 20:45:06 +0100
Message-Id: <20201117194507.14843-7-jbx6244@gmail.com>
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

Add hdmi-sound node to rk3066a.dtsi, so that it
can be reused by boards with HDMI support.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 67fcb0dc9..f91ce3054 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -49,6 +49,22 @@
 		ports = <&vop0_out>, <&vop1_out>;
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "HDMI";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0>;
+		};
+	};
+
 	sram: sram@10080000 {
 		compatible = "mmio-sram";
 		reg = <0x10080000 0x10000>;
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
