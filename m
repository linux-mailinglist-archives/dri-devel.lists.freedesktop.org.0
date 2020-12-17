Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C02DDFB6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E0189B67;
	Fri, 18 Dec 2020 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A696E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:08:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id h205so16304868lfd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuUSQP0OtIE+mP7axrK+mquBQR4cpQ2zlYIqVpImR1U=;
 b=MZKp8LNgdIqZ2QOb3p3qyevaT+0a/84boORQxHR3hMaNXrSC3gadV90vMzkpXywlqO
 FckztaIM7VXhOnRqguINXOzS4tF2j9k6itr8yj4O2R9bvxTZ/5XixyVBxPEKIdnIzXxo
 K9gvy8DIjfa3cSxXV0BsPlII7FabiMWQBhxX1bphvlTMt5TlBRx/Lqpr0Dj3sXiRPgcU
 tPbBkxDFx22kc8Mr/3oOm9b66RzF8/Qd6eZel5uaevmeWnNeT6xQAp9AqNyvnwQYUoKA
 ikQV9S/5J0i2cxw4+ghP0Hu85LAVoVOVLj9Qy1KHWVmv6zagA/Zo/kAP7wNFjF7gI+2L
 n4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wuUSQP0OtIE+mP7axrK+mquBQR4cpQ2zlYIqVpImR1U=;
 b=JaFj8HOmbqmIEPGdVCKpmoZPjgTFlDfy0caICAOpHGTGVzEvl1qC+s3Vc5KSGmMDNX
 wf1ERZtga97iCqcScWn7cWdf3IlzR9TM7xWfdkjsTy2yVdLtImeBVqgk8oGGi8zkq/Yk
 BKELIQzGXU+K9yr36t9wzEKFPdS0xc5W1hj7x0x3hURkiZcFMPpvqin0/Sg9mFm5YtrP
 wDj0oyckOnRFnXGXQikyQn6i6rEICvWP7fBHHtr/zBGJUHROPJac0s7O0OYI1hpjVamb
 Dc2hk0PoQqzyQ2ZIhB1rf7x6srWSR+Dt0qlgcubIBQiZdnTghT7zRJY6vimnObus9kzr
 XeaA==
X-Gm-Message-State: AOAM532eTXDDTZ4Up022Nw4BK3XjU6OwaaEtMzOIHfrCne+WESk0/SQ/
 ygwfwRGaHlieNKA9hvyBCiA=
X-Google-Smtp-Source: ABdhPJyVdNBSM8/uZCQbZq0gxNERLS7DuvcuHvgKRtpH+6ID2YxKj6LsqEKEpdk21M9tB3QssKnzhA==
X-Received: by 2002:a2e:b70f:: with SMTP id j15mr240665ljo.60.1608228485098;
 Thu, 17 Dec 2020 10:08:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:08:04 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 39/48] drm/tegra: vic: Stop channel before suspending
Date: Thu, 17 Dec 2020 21:06:29 +0300
Message-Id: <20201217180638.22748-40-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Host1x channel should be idling before hardware is turned off, hence
stop the channel in the suspend callback.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index ade56b860cf9..92d3d48c4277 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -510,8 +510,23 @@ static int vic_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static __maybe_unused int vic_suspend(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+	int err;
+
+	host1x_channel_stop(vic->channel);
+
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(vic_suspend, pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
