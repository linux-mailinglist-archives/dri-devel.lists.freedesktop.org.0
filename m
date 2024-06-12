Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486A905434
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F8B10E1E4;
	Wed, 12 Jun 2024 13:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA5510E193
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:53:06 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42165f6645fso19520385e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718200385; x=1718805185;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdcbJPuvm/SOnoBP3pphclytefXjwVWNFObDahPD+Oc=;
 b=S835Ncm5/J+0T9ORVc+lPf4BfTGde2ZEOuxI3wAJLBRgLBczWgaxfVwmXVf7Q84i6R
 lNDGiRMtLwWnN8nVhBTntoNN+F6+6ay6DDQDAYy0rztmLoOJUuKIRkcRp/nyKtwFlDRM
 dy9NUaGjG5S0InDGikI3cLzIR/qxpqX3rNCmuphGw+NKQH0BN9nTco2ZmQV/YsYwcI4W
 dLMAe+Dj8asqYV4r9WFlkeCzJe7YXu9gLH0C7gQ1LZLxoWO3E6CNqsVinwQguXRKBmIq
 DfI5KM5xIQaN1qytXeOxSLFeb2QL65sXKP21tdoYTZ/wbdxpqenLEErGqxaodERhPari
 3KsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuHW2rLZfV+0T/haB1McoM+AWSQCADg5RcFTJ1xG4cuKjTf3axeAntwElUmFLuUZdGDKPUvRjYq5cpxabOXtn9Nc9gVEoZTazoXweA6QW7
X-Gm-Message-State: AOJu0YyB2pcwlPoq3j0dpjqpkw4ztbTHTpk44MKgdtfJtnG7MV44KCZA
 NG+5jceWqMakiisTGGDoYbURKprbJEFvt2xbS9dJwaQlcI9uaKyET821KMdw
X-Google-Smtp-Source: AGHT+IFJ6HaoLtBMH/sfOyJVvqVCohkpotBVV3isMd0LH8wFPWn4nrbmoRl/1VKV0QqTF75zWTXtLw==
X-Received: by 2002:a05:600c:a46:b0:422:683b:df2a with SMTP id
 5b1f17b1804b1-422862acc15mr18775005e9.13.1718200384503; 
 Wed, 12 Jun 2024 06:53:04 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:53:04 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:54 +0200
Subject: [PATCH 1/9] iommu/rockchip: Add compatible for rockchip,rk3588-iommu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-1-060e48eea250@tomeuvizoso.net>
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

So far, seems to be fully compatible with the one in the RK3568.

The bindings already had this compatible, but the driver didn't
advertise it.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/iommu/rockchip-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4b369419b32c..f5629515bd78 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1363,6 +1363,9 @@ static const struct of_device_id rk_iommu_dt_ids[] = {
 	{	.compatible = "rockchip,rk3568-iommu",
 		.data = &iommu_data_ops_v2,
 	},
+	{	.compatible = "rockchip,rk3588-iommu",
+		.data = &iommu_data_ops_v2,
+	},
 	{ /* sentinel */ }
 };
 

-- 
2.45.2

