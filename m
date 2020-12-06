Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250452D0C5A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16316E81F;
	Mon,  7 Dec 2020 08:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635F16E14B
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 13:34:12 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id ga15so15595440ejb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 05:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
 b=JOVXuy3e6JymxKOPEoHBdkzfQUhgnoR1msgkoaiMxH70fRYib/t+qYr+VQpo7JKMln
 F91whwe0wS6E4TTblt2ayRevdquO+k5v8NBiIGfJfJ6kCo75D+I0zR/Vp3M9iOTClr+y
 RCD4WdS3002o8Co4VHrBS/SLNuFuYVhfulYpaFxC/YwFdKNT4An0K8Wd/1+AdipNSVDq
 DmHl6hIzKsAopuPY3pE8J0vQW+3Q5+kXiYphccbg7W1ZVI6bX+A6IWPSUqr82lBEhjME
 zxPxH0zFGmboVpKVBFPb3LvGF83sSP9eqfPZsKkrNaa7ufXKT5erD+NMFSrNFe0jGx/r
 fRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
 b=cmzuZfIM/j0k3H/3EBPGo0w5Dn/8yXt/mUCu7T592sNcZQwVu0DME8TJJQ100eHDZ9
 pEz0YrmyE8M4Pa9he1qc757jwz0sFsvTd2WBZniziUxdzWw+xdBIh+Gtzts/BzdzvuN6
 rEaqgykXRjBHSD0CJu5S0VUa3wOCI6zO6I5F59eZN0xSHQZu1i2YnUtzwPuJy9n1pz5Y
 nroeY+4Yp5s5wTOVMxIiTgNmHMlwexAJ8uLvlPrUo2EBv4lGkXp1rhRShKFSYobMPb5k
 z/02hXkFOqs22NEpakArc0hmBseQcWk+0cQuKuS2R5Ly0JgMGzuSlA1oqVzTJRBp+MTS
 VjEg==
X-Gm-Message-State: AOAM5321WLZYjSXoNCxLjl13Z0J+f/48FgKUKskq48C8i2JYPYG2ZL/h
 8E59+cScNcRpziJrEjjusCnZj0fGpuhQ6w==
X-Google-Smtp-Source: ABdhPJztME1AEa+6AzKHTpyb9Y+omIXYUc5Z2Uz2KCJGA5tPM3cmuLgOt76RoEEmj6mHLL05lTnjBQ==
X-Received: by 2002:a17:906:f05:: with SMTP id z5mr15442015eji.8.1607261651143; 
 Sun, 06 Dec 2020 05:34:11 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id qh23sm7770129ejb.71.2020.12.06.05.34.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 05:34:10 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v6 5/5] ARM: dts: rockchip: enable hdmi_sound and i2s0 for
 rk3066a-mk808
Date: Sun,  6 Dec 2020 14:33:55 +0100
Message-Id: <20201206133355.16007-6-jbx6244@gmail.com>
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
