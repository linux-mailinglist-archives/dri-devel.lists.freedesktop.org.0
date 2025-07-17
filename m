Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8B2B094B5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 21:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A52B10E88B;
	Thu, 17 Jul 2025 19:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CEptOdbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C94F10E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 19:16:45 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so11205775e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 12:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752779803; x=1753384603; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dXS6IlzCXXiWTFVQaBT3Lr0CwTpzt5HQ3tRbwjKwIVc=;
 b=CEptOdbWA0tflvAeLG+ZGFJhV7D2WCAOG5RnnusKLb5hZaFg//3auST8hKxZCIJHdD
 22kUDDmvP1ypKC+WOWicSJ5P5cHtmozKXE/yaecJg+sQJIOhxDKypgtX6EBdibOfAUAO
 na/YKCY6dOITuPR+khpn31eieASEuyfqi66ikUgMaEyWwi4181ZY/9dGdQhLnCE7uB7+
 FY1XGEAKk2jgWY7GLvq+Wks/cqGzwXQpAByBGSl4kCzg+LXHHY92A2fzgY7WhuB4Slux
 YkO6B4carYTXMho49qmExK1nTg7638zCp5i22ZKXcr4h9xE/vvrHqtmIgec9XO6KbxBh
 vxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752779803; x=1753384603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dXS6IlzCXXiWTFVQaBT3Lr0CwTpzt5HQ3tRbwjKwIVc=;
 b=ireJhBZODsfd8TdEknjdwHG6ZGS8fIX6RqATWsqHd/P7sgQSVN3rORdCySbXtEbYYk
 wVG3uP6uP33J6D1eFBhL8WsH1msaRV83J467GPjJZWpg/NEWMUuk1576+fnKJmZAcjMQ
 CZuLH4QEoFPkijHCOB9uxMstqPQxzNlEP8bXRppzVGj6xK8qxd7Bt20il7lsijE2ffiN
 ugku8ljrltw5FKa4eVpcD8yJE999VTYjUJtgmpfqWGVw7fm9SvHpodgxzmmEuy15zIDY
 InMWIM3m5WMVJ8V6YMbZHPobQrdzlbZ4ws3ewAt+TZ/vdW3dPQKp58LGzo+dvIvyZ71G
 Xm8A==
X-Gm-Message-State: AOJu0YxpWL3MzamPFO8sqc0wDKuh/tkuYqmPh2GgIb2/FIPVwKYKpqPi
 mNfJbJ/4Ea8N8CuRaJSll78kl8Kt7sHmJMumTSes1lo7bUqC6moj9WpH
X-Gm-Gg: ASbGncv+FDKPkgudUHh7XoXgNdPthv8eInBQYR5mksNIUfusLbmS0ALfs/SgbZ3BKdp
 LFiW2xxgFYzyy0W0mXTe8KoZ5gxB+cnFCJzyfvs+GqfHBLHd9O2tHRrBGvzMQUMDPvktwSAhpEP
 pDlqoG7uw3sSe9oa2AlXJsv5Npu2DZrgSm6VV9UqL45wt9TLTe/EdtVWU68hDZ4L+03RybKK8qo
 XINEWi+yTXqjzFJ2qgRYUX6G9IMYoeRnEa/PhEwqQB18grH5HaBtVql1RbFMSg2QbTcfPWwGxdE
 YjLsDfjFinIw5Xyb3TBjPRvwbS1Kh2i638FzxJ3GD2603xWAviA5Cnc/3rmNr8Q+mHfTF8ZC63W
 nUbBt9mlIT2DGYEpS0nW6QA==
X-Google-Smtp-Source: AGHT+IFdO+XRcbjzoMbTOgsB553gBGGYSvejU7mep2+ENo9zQ9I4WEUO9p1GUi72lBKstfRX+R/XeA==
X-Received: by 2002:a05:600c:3b9b:b0:456:f22:ca49 with SMTP id
 5b1f17b1804b1-4563a498d0bmr9790875e9.0.1752779803165; 
 Thu, 17 Jul 2025 12:16:43 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-456278ab486sm70291115e9.1.2025.07.17.12.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 12:16:42 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 17 Jul 2025 21:15:32 +0200
Subject: [PATCH 1/4] drm/sti: check dma_set_coherent_mask return value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-sti-rework-v1-1-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=PyB/CZMxUn55sPN3ZHQgk/pnsj+LAy/0OIGcsrAdeRo=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwYYCgacxXo0fm/BVR90qG/tODN+dH4bygpw
 oxe1gR/9UCJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMGAAKCRDnIYpo1BLC
 tdC4D/9PsDag3hJ3pQT2IHv5rLHgtffYGReR75toGfxoxm1xIDATWpwXpz7AMz28dIoe7TBdrIa
 9HaawGMVTwTcwbJAUXtJUK5ZJKfKaTEV4O7ytjQUcLKE583M3ZKtQb2vNe1Hv4ATzGfW6RB7LGZ
 T6dHZ1PC/1J5esXSpzBZ3l0pHjcrrcgfWov8h1qqQBXjH24xsrn3xlIxSE7sukbSyOHlVXXZGrw
 B73Oduzy9HRac0Hm30rsQ74ijETnbiHKxzTmAN7fBtI131mv24arM41DW73wOFGomii8pcARPPS
 /ucgzpxx+oREkpfs+PFc0JHGSjj1DoQcwl5Xvvg0+CaEt73jSRxReU7z5837VahsAWJ07n9CiQn
 /WzTU26kGplGZHF6VXQwZolwEHSdquw5c45amV9Sa7GoX24lFThAOwAxe+Upa7jadOUKCbuq9Dp
 ldRu9H+6AXybqAAeU8MTZx+T3qWnJvPOlvxWrjJt+BQNcFJj2Hd87bz0gGgMzCyqlgCDUFqc5zE
 /jvw5El2+HA5ui3BTLbAMFp4edudZpw4XrGtVLQBhiP1qtzTzrkBsZsDXYkuv+bfpeIOL7trQU1
 baadlcUS+IgxC4wNKOqw8fkdXP6H1g866ElvJYPcxKALSNovXCapIeIeRWxadbIdbquNk8ki9uz
 z04oBK8+NQOGNug==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
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

Return value for DMA allocation was not checked.  Check it and return
error code in case of failing.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/gpu/drm/sti/sti_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 5e9332df21df0db30f10b7a6f5a41cba85c4f7ae..42f21ab91957b38cb9aef012b6ee7f4ae1683edf 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -234,8 +234,11 @@ static int sti_platform_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct device_node *child_np;
 	struct component_match *match = NULL;
+	int ret;
 
-	dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
 
 	devm_of_platform_populate(dev);
 

-- 
2.50.1

