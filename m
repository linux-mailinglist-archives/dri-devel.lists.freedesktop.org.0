Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA512B8D24
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613526E51C;
	Thu, 19 Nov 2020 08:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1286E428
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:58:38 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id w13so2832548eju.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/M45YtMWBHvWX7HJgiaCX3duzycDxACgeh25TxK15Eg=;
 b=WzfS5ftWkRMUzolpSh5HCyN4cmp70soK14s87h+2M08gwqkRfSM1li/SeATS7MA8CA
 n/sY36cmWUjV1SvmUdcnwVr88B4NjXCBd+xogRlmqDnN7DqOLXdQuISdhL57o6jwPxee
 IawguAG9hPu0NW7aAXvvmQ1fW4WTfO8oOP7dScEJdK0PnNfDMu27k9qRigi+sJu4VF3b
 Bxoik+iaaYnm1yT8K2F4x8HHZKjjlkbPX0lbLt7LpEQvd0TKi3Me4dyadjHW11Onb46M
 xYjT0zw3/9G6+6KLQJwPFviF+W9Sf6NNTpaw0SBLiN2PLCWcq6h5hvUlWV8NfZRGOh+h
 YOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/M45YtMWBHvWX7HJgiaCX3duzycDxACgeh25TxK15Eg=;
 b=P3PRaHMnkPy/y5qhKdSm/EHcY7aTwBRpzb9cithRdaB+JUYCeMza32395/nrSYXqFT
 PpJUGtA02FeHhYYQd2BgolkSAXpZEbqNkyln1XXeYBATIORSayb4bSfJQKJXLUijLh4+
 VC78zZHtAPH54OaJD6+1QyN5jidkCYwS/S6uWaWJbRgAx+ifepGdi0zQIQPL3e5hL9xF
 4uOPIUP8E2sTTd+G0goMkjTn7qIsAuPp5ptw+h2yZBcfiKTtrIwuLl5qbbVfzbWgSJPl
 JbcJuH4tgi3l9HqNuXsjnTrVJccF3/0AfkFOkePL9wJOUCLfo7LomMnsEiZ3/taCn9Ra
 UokQ==
X-Gm-Message-State: AOAM532AiStw4TqWyjI9F0uHD1NYQRtXOHLA6M0/8sJ5mfwxXL4EkgJ7
 AzZ62DxDgz+Vfi+X0cFDEgQ=
X-Google-Smtp-Source: ABdhPJzjtTA6aSJDvhbh3mZRYc7KQzylCh451tX0U9bpOnGQQ2ddCN9W+I66OX1Z3ial8hqeM8QM/w==
X-Received: by 2002:a17:907:4335:: with SMTP id
 ni5mr20187759ejb.459.1605707917128; 
 Wed, 18 Nov 2020 05:58:37 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:36 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 6/7] ARM: dts: rockchip: add hdmi-sound node to rk3066a.dtsi
Date: Wed, 18 Nov 2020 14:58:21 +0100
Message-Id: <20201118135822.9582-7-jbx6244@gmail.com>
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
