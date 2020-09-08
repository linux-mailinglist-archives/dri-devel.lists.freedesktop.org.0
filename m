Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD73260C8D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24676E17F;
	Tue,  8 Sep 2020 07:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE466E18E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 07:54:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id e11so13754688wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 00:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/f+R+j91elfFPYf4zfHO7Bzdv43BgZ5CODvbZ0Vzlb0=;
 b=MxNjfFU5x28KJlZdrPqrtuP/t/v6fpMsOEGKTByYw9wYcIW0u58tAcThwi5E3fhxqB
 h21f/DHXzKl4OvbTBs3aSplhH2HVm6KfAHFRK5SZUmHpJR1dta3Aj0gP5K5CbBkPqK9z
 0x2pd1lMp81JR0y7njeN0eyfuVcHKkSKMFviptB0N2mLXjOWQ4tpYGJGg9BgWrEGv740
 Q1lfR/LQhdaE7+f41hH2B4x8Zm9GU2tWmojTn1qlBm3qzwcRnyR9ySDG+xvRyZ6DtsDw
 vxtKdPOFunXKV4iEh70MZOt8aCBPi89cWCv7xWN6VH0CoLMosxpvCCF4nyG2bA2GK5iM
 vAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/f+R+j91elfFPYf4zfHO7Bzdv43BgZ5CODvbZ0Vzlb0=;
 b=XIFoufJWiLDO9mlfkrq3bp+TzS7gFiPBOQGXHB7DLS0b3mtZYRatWQq0c3+WWRYNI8
 l+Hmhjx1I+Y8K4RCEz1fyH9/ma/6ZeS5x57ysQNmI8t/xti06lp2GfYkFQdeT+QEcQAL
 +ZzFcxKh70Kirc4KDIEAOony0PlFcoDMtB2PXUMdPQ+lwgHtli7TCXubq8j5YIH6yAJm
 GzP49/9AtzTWlTe364wk7Uyq76C46nnfXXEzqTO4F9VOLJ99JgfTiPmoDMXBZfBnLKt9
 ZHaHKIYGaO0EtKcOP9VLFtEhJyHrdCbg8it+Dehb9ESccE95DLJU/5M/NOaYjOTWAWMb
 rfMw==
X-Gm-Message-State: AOAM533UM1peGeehDSBez/0bLBUEFd1RlgL8a0MvcWvGZonVl+/80VFE
 lkadSjEERUNi3WEyduIqB428rQ==
X-Google-Smtp-Source: ABdhPJw2+vRPCVSoCJ8uTyZkM4qdXjUF9o+idDfbH3aRRZ1MhJ6/KLpRbqP0cqmVYb5dpgJwHdOuUg==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr3013678wma.158.1599551669694; 
 Tue, 08 Sep 2020 00:54:29 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id f14sm33788291wrv.72.2020.09.08.00.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:54:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: display: panel-simple-dsi: add optional
 reset gpio
Date: Tue,  8 Sep 2020 09:54:19 +0200
Message-Id: <20200908075421.17344-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908075421.17344-1-narmstrong@baylibre.com>
References: <20200908075421.17344-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simple DSI panels can also have a reset GPIO signal in addition/instead of an
enable GPIO signal.

This adds an optional reset-gpios property.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index c0dd9fa29f1d..4d08e746cb21 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -54,6 +54,7 @@ properties:
 
   backlight: true
   enable-gpios: true
+  reset-gpios: true
   port: true
   power-supply: true
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
