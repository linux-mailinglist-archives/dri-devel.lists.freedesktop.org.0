Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0355ADF6C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 08:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC3610E524;
	Tue,  6 Sep 2022 06:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E6D10E44E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 17:16:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e20so12119033wri.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NET4x4RxN//LkpTQU1F+09NLgubloV7JTbO9k0HaAgY=;
 b=dPN1jPhO3Ox1DPE1QeeWh7fFaJiVMYKpZrIWkTLDULG8JKbE0BG12yAZD7LUspmR4c
 5L82zH3hO5Cg2erfw//Iou0IjhGaXHrFIgoC9/Bd7LO4sWlc6besZC8bfzIYaxVYMyvX
 sl4uEY+E81PXs4qkPVQTl9qNHHS68+Qj8PQYP01hmd4MPqOguVyRpNAMjRJ/iedES2uf
 NONZestwjbNy5HZxctzLKRgZWmkSDKtqdTAJA/2amlzQZaqnvrlOCT4LBPnGYJ2tg27B
 8mzBO+i1r7IiZ3NhusdNrP/Fzb0xEKXp/ExoQYRhpQTsRSff+MLQhH13Bo7MZySuc/B9
 6MbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NET4x4RxN//LkpTQU1F+09NLgubloV7JTbO9k0HaAgY=;
 b=o9/CNNbjAXsy0xEAM664x9zhjHmvQ4EfOwhfsk03k7p91ph26JGurtVFnQR9dDpYXb
 6CbM+RUMEWhI8zWkJSuN39YzoA2PJlllacWXxxUNS+WpwWNbYdry6PrwWYIuWaOV4NoB
 kvOQXKpJlaV5J+3iJ1wuqRCf9zFs5b5pVdILHAisawsgHDBjcx+e6w+oKGDy9SaAA1M0
 5SdxOZG86j4xy+pp75/2iMjID9POUcHGDDEiNLJRGCtBpOZxvIX3lSWAX4erVmAULhfX
 QiBkNlQco+VCZXBW38gz94fMsjbGVLdbICPCREp0r/F3uPMMMVIUZb7AINxMuAOoH0Oh
 PFpQ==
X-Gm-Message-State: ACgBeo2M/asRKfzEA/a2RVyUqAd7kMpUgq6i2CkZZBzRXoTvIhY89e2k
 ONRx+RpOEeKZ0u22JC7NrMs=
X-Google-Smtp-Source: AA6agR58EyV1FL2fPMl6goDeHTg46yXYvXzdF0Scctk5jBM1pIRE9np9mQxUokCZZNVmHaVghq1qfw==
X-Received: by 2002:a05:6000:184e:b0:228:bb9d:f98a with SMTP id
 c14-20020a056000184e00b00228bb9df98amr1987643wri.479.1662398171522; 
 Mon, 05 Sep 2022 10:16:11 -0700 (PDT)
Received: from Clement-Blade14.home
 (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr.
 [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 10:16:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 4/5] drm/panfrost: devfreq: set opp to the recommended one
 to configure and enable regulator
Date: Mon,  5 Sep 2022 19:16:00 +0200
Message-Id: <20220905171601.79284-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905171601.79284-1-peron.clem@gmail.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Sep 2022 06:11:24 +0000
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
Cc: devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_pm_opp_set_regulators() doesn't enable regulator, which make
regulator framework switching it off during regulator_late_cleanup().

Call dev_pm_opp_set_opp() with the recommend OPP in
panfrost_devfreq_init() to enable the regulator and avoid any switch off
by regulator_late_cleanup().

Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 5110cd9b2425..67b242407156 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -131,6 +131,14 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return PTR_ERR(opp);
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
+
+	/* Setup and enable regulator */
+	ret = dev_pm_opp_set_opp(dev, opp);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
+		return ret;
+	}
+
 	dev_pm_opp_put(opp);
 
 	/*
-- 
2.34.1

