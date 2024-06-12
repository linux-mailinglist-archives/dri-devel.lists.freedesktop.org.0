Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7E90543A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4748910E3B9;
	Wed, 12 Jun 2024 13:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDF410E3B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:53:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42179dafd6bso6219905e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718200393; x=1718805193;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0gvlL/3Hh6Rvkzj8HeRV4KajZ/sjiz7m+L1scRmwe5k=;
 b=veZ0aky+xgANiz1Gqo5SFs4JRrzsVjeglX1tw7oFRb6wRXJ5sDMHpwSDyw/s23m6br
 s/5YOAzHeCQSYxV1QX8JOx9BMUdeczzZTkQUJMnrQs6n0EN55cc5oxGLESDTP8QExGMX
 9M7VsNQsP2lXQH4Ro6ayCuI2JgvXUjRdKo61sudij2pti+KKOvFtxO4uK9h7Cif/562n
 S7u7Q8p5K5LhjqftJCYbXt+xkUYj3ZOnQ6XHapnbyGvmESUZcL2Wlq4Bdv9Uq5YhjVLb
 sujcEjmhMD3kOVlNCBkXgo0l72QzNWiwuYj8F10fIlFs1AA3mu3WryaOs1P15fJ5Qf2H
 rRlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAr+mN0hGYoCIvfjM4Tznwo3/zUkmZbKhVr+qs/lpnqOadp58955zebXOu8nyS8yMyGR0edjdCdszAKBydbFIJr1TNAPGs6v+bSoRyd6ci
X-Gm-Message-State: AOJu0Yyz9EbtYzRYVjZTzHj8xn82zF1mImmxdJvM+ZfaSJ33TMbvDWSz
 1isOeGZ3h/tovCy5zEMOjKnc6f906xfJBSnKmFHTTZ1zdp/hlVwWrehZzvtT
X-Google-Smtp-Source: AGHT+IE2T90QH80rrQ35HgVVqB20gHNtrUAWASa/gbvajU+K3eKydM1CK3LNiNDzGaMzR19vk4V0bw==
X-Received: by 2002:a05:600c:3b23:b0:421:3249:557e with SMTP id
 5b1f17b1804b1-4223c531cf9mr51588135e9.8.1718200392753; 
 Wed, 12 Jun 2024 06:53:12 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:53:12 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:58 +0200
Subject: [PATCH 5/9] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-5-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the nodes added in a previous commit to the rk3588s device tree.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index b4f22d95ac0e..9afb7efebace 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -291,6 +291,14 @@ &gpu {
 	status = "okay";
 };
 
+&rknn {
+	status = "okay";
+};
+
+&rknn_mmu {
+	status = "okay";
+};
+
 &i2c2 {
 	status = "okay";
 

-- 
2.45.2

