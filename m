Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E62D0C33
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996489DA5;
	Mon,  7 Dec 2020 08:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9656E0FD
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 13:34:11 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cm17so10832647edb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/M45YtMWBHvWX7HJgiaCX3duzycDxACgeh25TxK15Eg=;
 b=VyMr2Z2Y2FxVMjApnc35MnfMrKlfVe62MA73cWFUYFKdSao13p18AZKDCQ+AunENQJ
 0smVDtZJueGCSqpz90+Q0ghFZy0UViSu31AEWd+pH6kF9OrNDBnodljF3Qy1MOMO58D5
 xKBgYx6mK431AusxL2+qYZ3hU0+QZf7tmbPdtREX/jsFaUVKjlzkkEd6nokY+CZEoK8e
 DJzHQ0qWdcPIdsqqNdLd1pFK4HJ5+t24UPV5b7Hfp0V19a8gLDU/jd8jwIpAgEvA/4WM
 cyxB2IpQUGhhs4YMLz/fi/zrcf59//JIl7DLjaXmj72PowGdVJkZfVYHw7ifH/kjhoDG
 45Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/M45YtMWBHvWX7HJgiaCX3duzycDxACgeh25TxK15Eg=;
 b=anB+2LuWbMFP4tV2M1wUGmNyjgrTWOxLXOnCFXei7mTIPgtNes19if0PEXNi/7O09z
 qwdflkAqO7cess1VZp4X3g2jiEZnPMrNr1Kub9erzfjm60fWn7SeXARlSfhZhsmrxZfV
 l737qcrm7+NsrNNYvSzzoILMpgeuElfnhggpZnBdDANh9RADWUW4GCApAAdjwZljEgio
 w+IEsKCKWJSXnFPTGpCWiz7mpTC0SqArw23gvjjd3LvNlAWGrYh4BtnuxS6TR7oYLaS2
 Lmiaf0wZ0QjLR5IszJ97OMip7UKvKWMSbTJfWQei+piTHW/QWQJZbYphLMdj1Wpvku/Q
 NJbw==
X-Gm-Message-State: AOAM532+PfjcRMZaw6ezpfzTSg7hUCrGYXKuuUdEMSzEvoDd8nFm3nbo
 fHiiCvbQl5Bw8W5Fp40h0Rc=
X-Google-Smtp-Source: ABdhPJw1Wm1W5qPXXa98kmLBiwpshvAAU1dUvFzjqg3/KeUGfBrmVqaOo4gngpFc6QMwaVBCy31C+w==
X-Received: by 2002:a50:dac7:: with SMTP id s7mr15721439edj.106.1607261650199; 
 Sun, 06 Dec 2020 05:34:10 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id qh23sm7770129ejb.71.2020.12.06.05.34.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 05:34:09 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v6 4/5] ARM: dts: rockchip: add hdmi-sound node to rk3066a.dtsi
Date: Sun,  6 Dec 2020 14:33:54 +0100
Message-Id: <20201206133355.16007-5-jbx6244@gmail.com>
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
