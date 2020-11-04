Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5852A78E9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6986E9B7;
	Thu,  5 Nov 2020 08:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7C89DB9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m8so17654487ljj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eN3ruYqKrfAyq4fQITxNWZN/YF+MM8QbZauHCJzUFj8=;
 b=TVwZDsUpQtOop2WOQclHYZgdwB7KxiVA6R6b6Ka6vX6hiO11aEcyyoBglrOZaHUTV0
 FBlAlfcq+LI3Lw8ROniDVBNNCexeo6GJZPw2yPf3ZmoTk/w08Nqj1PKSZO6RSFwz/vuG
 ZutKiRKbxKlOBUWZtceiMYEVekzmXhMZNgNKhbYpYws5gJY2CyEpjFvwMQe1mnXKLz0u
 qJuT1Dta0VmZqpT/9sZh4DHE++xDLJWMe5MTqUfl0RkJfGV4j+chzYmRqt5hAcAt9Pja
 jx097eDN8hxh3YgkAQ6KTzHe0sawnGRD9q8InlTq6NfD74dox4c1vCBimo6BzFUM940S
 MDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eN3ruYqKrfAyq4fQITxNWZN/YF+MM8QbZauHCJzUFj8=;
 b=lSsPqn/WpX5Kzc3zeYHer3mjrfkR0Y01+Be6UaYz5ZQ8V5KXLRNf9nQxTJG9+BMr9z
 1MqSuksQdII213HXS8763ssQckRhqGAGK2seEv4PkGJVqDPFHcJdG87eDAK0OURCkq0b
 XBaG4uucN1EPa+zi0OsvT2SxYbeZtDDP1rKO4w/S2a1emQz5IC6f/K7drIir8AqQnT1t
 H6N0QD4IZu7EPH0Yu/8K3c2lsg2BjFfAphaxGk7Or7rZjZgJi0xHRyCoI2P9efsKBzXY
 8viE6s45zYpVr8t3C+yUu5YuqbLPjNO7yPTJffOyWVHZxzwhYSk9PPc7Vj/vD+LL3jjg
 08Fw==
X-Gm-Message-State: AOAM531DE9cNjebscP7fvKJJoMpiulRqF998EJv/kpHsgiMawGx+gtlN
 0ie0Q9QQTBoFbw7r5vYLKik=
X-Google-Smtp-Source: ABdhPJz8F2nqtehxzpqUUCA/aUcL85BZ1uvq8mFaFu09xmcHZWeIbOxWl/DYJLu5VQOKGJT5Wkuh6Q==
X-Received: by 2002:a05:651c:112a:: with SMTP id
 e10mr11726956ljo.411.1604508599056; 
 Wed, 04 Nov 2020 08:49:59 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:58 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 24/47] ARM: tegra: Add nvidia,
 memory-controller phandle to Tegra20 EMC device-tree
Date: Wed,  4 Nov 2020 19:49:00 +0300
Message-Id: <20201104164923.21238-25-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add nvidia,memory-controller to the Tegra20 External Memory Controller
node. This allows to perform a direct lookup of the Memory Controller
instead of walking up the whole tree. This puts Tegra20 device-tree on
par with Tegra30+.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2e1304493f7d..8f8ad81916e7 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -663,6 +663,8 @@ emc: memory-controller@7000f400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interconnect-cells = <0>;
+
+		nvidia,memory-controller = <&mc>;
 	};
 
 	fuse@7000f800 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
