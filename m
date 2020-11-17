Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295CF2B77C9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84D6E3CE;
	Wed, 18 Nov 2020 08:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9428F6E0A0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:45:25 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m16so8869916edr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
 b=j/P6lB+wO6vdZOi5Agv1mqQVbIrni+q+ALO6i+QbbntEAjO3ALjbyoaIccUUaOa0Yj
 o6cvV+wMx3wOdDlbzNzxjXywYGNQbe72oR4JacgcqedptYB1kV4gPGE+9dGv9jes269G
 Bq0r064CiJxLQraZzATdDk96xLcU/rIXbMJPuKTx1omwbiBt8qZeYKJpGfqDIPuYdMfY
 kyat5CUjgA9yeRMemvobcamXiv2alDl+Dd1uzPC8Lmqx7g7WXqB3glUF4qtkFkoaYh1h
 ZI4XdciXwfyp2DhlBEthUhQgPupbBA3tggimAtRPScUSsyZY2QGd69uiH5vjBKPHREA3
 /ZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
 b=My1ff+SuNhjdMNxPsN7xeaPMgKPuN7IeenIJ7TlhSSxUDr6XIQgjf5tIgDUy/VwxT7
 A3I9vpS8tD2omne2f3/hfIQKSdg31UjNsIqoNWemkMJXWzMi+o8XVkmXPZjJKQ5EW7Xt
 UoWw7t7AhVQpABUtC9nIO6TIRTqKVSnu3GGvGQ+KHe+DVz/8otZdebBzvFtHKGALtaq1
 3DET2II2i1OTjWUQzR9c+yfnEbTqV2xj8gucRIcG89DgszNU+NAmRxjxNgQepCw1To+9
 UY6wvWgbISUwwszJiFqkktjQJKYh3tW2mfxOP/ggKUrgqiNDXgoQgKAobZ1465D7T3cd
 /eCw==
X-Gm-Message-State: AOAM531g8VY7LlXrD0oOPU3mI0BR2WqiLePZgpHOO6o6taRNNb6+v8MA
 DmUFbioZ65DHu7s8fk7Acmc=
X-Google-Smtp-Source: ABdhPJyrzzhxGF5lvPmDjYfPklRS9F51sz7rQAaESr2rA6OkcPjado8yI8xHELXCq5r82ignHt0H3A==
X-Received: by 2002:a50:a105:: with SMTP id 5mr21926061edj.165.1605642324325; 
 Tue, 17 Nov 2020 11:45:24 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:23 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 7/7] ARM: dts: rockchip: enable hdmi_sound and i2s0 for
 rk3066a-mk808
Date: Tue, 17 Nov 2020 20:45:07 +0100
Message-Id: <20201117194507.14843-8-jbx6244@gmail.com>
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

Make some noise with mk808. Enable the hdmi_sound node and
add i2s0 as sound source for hdmi.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a-mk808.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-mk808.dts b/arch/arm/boot/dts/rk3066a-mk808.dts
index eed9e60cf..5fe74c097 100644
--- a/arch/arm/boot/dts/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rk3066a-mk808.dts
@@ -116,6 +116,14 @@
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s0 {
+	status = "okay";
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
