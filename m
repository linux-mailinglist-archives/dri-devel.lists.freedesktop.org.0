Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCF51F4F26
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDC66E40A;
	Wed, 10 Jun 2020 07:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934456E054
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:47 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x27so12427187lfg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGygXNg/Km//fsZYaJ9FCB7/EL/aLlPnXW30j/MHS28=;
 b=mXB5SnZfqn16vRA4uYMqy5Krd7bygaAo8rS/UK4iy9Z9kcb0GP2JbBZJ1PUtLi8m9T
 fCPj1cgxlUfnjbanOJ59z+2i4USb6ocIGdXb75mzQaSAkiFWMC/UzomMXJfTjyfczbYe
 RXVvwgb35UFtAbAse/tsbcN+lfAZGMuPBqaFfQoXt58bKPjqtMsalIxULD+b7nXd5ya9
 4aHZkhv6K8DB3lf0QU7sUNVpTijh43HR+3A8JpDtUaq3X/6p6uoLt0X7xwOGZRKkjGls
 usKYKWDhrkqo+6X+fV/ZOJ+1Nfbg8Xn2VvYTgqwgpWvrzr0MwVf9K7Tw4ZwnH9pOSEwv
 pp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGygXNg/Km//fsZYaJ9FCB7/EL/aLlPnXW30j/MHS28=;
 b=nmm9XOQ1Ebg69CTS6lhJzwHzJHqP2OFOJKWBsEycnNEL4yDJQjD3BuM/Ne1hL1Vn8U
 1gOEIOy+ZmXmXOZNIVTyUVuupUICv/d9GKiSO5B05Q1lx0mDeE8zeefNKiFyWxUUp21q
 zbFala6C6PHgRoSGHvswqQsigImOFoAtDwvuQV9OiUpYUQynE5NPboPKnrC96dTFQQIk
 HLH2fQU7VW2JrD/WiecAyLrlH10cbagHH7qKmsruSKvmmSn9tcFIAI8t5Szy9pMoPQnn
 Vq6CqRUQRY0bDD3m4AACKPU0GWRoVMdxCyKIJk5DprkqZUV/ro4KyL0KQifJmpflj4Mp
 N8+g==
X-Gm-Message-State: AOAM531o11YOP0L5JofA5KPpdiJFwydcVs6g7uCxoKI0/Uvjqoh4WByM
 LUrQJdL4TWRH+0srnq0JlTE=
X-Google-Smtp-Source: ABdhPJw4Dspq+j4OlHVQWELAm+cmFDHSM2hFjfQ0yc7ewczkHde83jPV9VSqWzCREbVJLpyCRkMxjQ==
X-Received: by 2002:a19:70d:: with SMTP id 13mr15601641lfh.60.1591708485971;
 Tue, 09 Jun 2020 06:14:45 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:45 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v4 17/37] PM / devfreq: tegra20: Relax Kconfig dependency
Date: Tue,  9 Jun 2020 16:13:44 +0300
Message-Id: <20200609131404.17523-18-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Tegra EMC driver now could be compiled as a loadable kernel module.
Currently devfreq driver depends on the EMC/MC drivers in Kconfig, and
thus, devfreq is forced to be a kernel module if EMC is compiled as a
module. This build dependency could be relaxed since devfreq driver
checks MC/EMC presence on probe, allowing kernel configuration where
devfreq is a built-in driver and EMC driver is a loadable module.
This change puts Tegra20 devfreq Kconfig entry on a par with the Tegra30
devfreq entry.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/devfreq/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 37dc40d1fcfb..0ee36ae2fa79 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -123,7 +123,7 @@ config ARM_TEGRA_DEVFREQ
 
 config ARM_TEGRA20_DEVFREQ
 	tristate "NVIDIA Tegra20 DEVFREQ Driver"
-	depends on (TEGRA_MC && TEGRA20_EMC) || COMPILE_TEST
+	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
 	depends on COMMON_CLK
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	help
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
