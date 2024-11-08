Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0A9C17F8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 09:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5E010E926;
	Fri,  8 Nov 2024 08:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jge4bNJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED3110E926
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 08:31:37 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43155afca99so16793025e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 00:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731054696; x=1731659496; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vUkgaqwyt5Dlc7iDZVCwHIHNWekO6hntBT7gAU7XDeo=;
 b=jge4bNJUrVfPktc5diYx+gXsCGOCHwLtnECzRkr0q8oe47s5ngPFpewvp+CpDgk6x2
 Z2ALroCbtPOL/dRt8cx+VGxQ92MgsQS3E4Y6syNvxADtMA10YCF2w5nd7hV/WMsm9Dai
 Zqj2WBuZ1cTAM6zNaae9or7xXYnP49oyYusZWYGpkmi4iEu2/q8LBtlWOFr9g14EwDVu
 qOARhK8o+JMLdmGnXUNikrI01sfKdWWhUcKdS+3W06hUiCO4CA0xeR/QFlP63fKKsRN+
 kSJwp45ORizkGmfCI1YQ8wvD2Yf6VW9W+wMjD4uihN+UacfTxKy+/HnqQKFocAomzBk7
 uIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731054696; x=1731659496;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUkgaqwyt5Dlc7iDZVCwHIHNWekO6hntBT7gAU7XDeo=;
 b=UO9xfWXKmDl+cu9dsYK3aiV8uBwOHgyfEcDANBFcNxdN/hKgC1/rc75LxO2z9Qx1+1
 m3y3ARYgrlm21doSqCvrE05vto9mB37PhzBR4mLw8ZC+KOD9vl8CFVU7BCSmrQpmwwkv
 q2r0i6fKatr4AkSs8yj3ruOG83e5HsjGolMD0u7IlNSOACP1+euomWYvBTMjoq1WkULI
 VoxgEuDhp5Nor0TpQk5XkfUHwbTJoFJJXZm0rvNSrzIFypWagXfheY99rwsht2BfW5IH
 S/egj0tLLFjRWhoCXOR+reFjauZSi3TZmayyW5dQMxet+8xXh5SSv2EKUjBfWkwbuzFZ
 7I1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4UhPW+sybKuKOPtFEzaKKTwdrZn7wE9tFuMOwkzPx8FRJKvKVcLPd4zJm05euhuYNgYF8h4GtA80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwSbA4bLyNlc7ExulTa5d8hm/wgZEEfA76kaWo+kRXPLPrxh/b
 a7Ot7160rqe5oOyuzsG1YMinnbDtud2Lh59axVlyIKDT5mkXcyAYdcizhCuV45I=
X-Google-Smtp-Source: AGHT+IEsoJ3YYVkQUti7IVhr3Z0+dq+6Xl3WZ+t4JLD73b47E793gKcg9Qge20p3M1HTDRIVWOPK6A==
X-Received: by 2002:a05:600c:8716:b0:431:7c25:8600 with SMTP id
 5b1f17b1804b1-432b684f31cmr21029305e9.2.1731054695706; 
 Fri, 08 Nov 2024 00:31:35 -0800 (PST)
Received: from aspen.lan ([154.14.63.34]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04ad0sm3876370f8f.100.2024.11.08.00.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 00:31:34 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 08 Nov 2024 08:30:44 +0000
Subject: [PATCH 1/2] MAINTAINERS: Use Daniel Thompson's korg address for
 backlight work
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-new-maintainer-address-2-v1-1-47c9d71aac11@linaro.org>
References: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
In-Reply-To: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=714;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=fd79AVP0NEtKFNsBkKcFdlWuoNK8n9iFc6De80oNWbo=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBnLcxJf2uFCuowNCWEnRWy2nCSehvg0Xwgx/nW9
 BdgbE2FM42JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZy3MSQAKCRB84yVdOfeI
 ockoD/0YN1BMEfZrSdBx9g+VGHKLAC/CE6SHaG24UkJMt7C95zghZSCaEiC1Ry6vxYBl0s3bL/e
 K7pkCn+qCOnR2EaETk5R88qB6cTezKUVUSJn0dbAQcJfAE7sOYE3pocEJPPplr/4g7tDlbNxZRb
 yPxs4ZYM3cZu2IBHNfmpUNZnr8Iav7nH6t6XPreAVYZYUCWdEHbN3RC6elzP6IA6K7Z70WaKftq
 L2ieguRMwpVuBJsqPSXaBinsxiyfuxQrusV3teOy6iNrGAcAJjA0T2SY3XgLNCGm+5fpTTT6clm
 4AJOF55j5WGRxR9xtJpc+23RE/VEV4AAlEEryLcfmGksA/MlqK+M5kIAhPdhTr5KzQxT7z5Uj/q
 QqnPNwVgIpjkHrAyj/YzHWP4rvgPEQkwbewq3YRAUlzkjOiqfJfeqwTgQv3GXXrz1yQfl9M0/d7
 ri1h2/oGGwm3cihv93r2Sl2fCBdOgQVpC7SxIqdb8rQIZtJbfCVBB408vtRunWpz5jJzuY8OwEZ
 oGGGsfuUE+q2jW+Pc7lCtYNXRQHxN/pk9T+2R4ZkwMM9BHwYUMtqFvp+8E7PznL/gN9obZsRnIu
 x4diqAib4mo+gumVXtHGTiViKJyTCdWqnbAH0xBEIsnPumjXj8S6IBU7QlCN5FUmLSveuNiIq+7
 6n/tsDwvxxfRgrA==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
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

Going forward, I'll be using my kernel.org address for upstream work.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a274079502426887da55d55b83b9a17e74ec6b13..5396fd1b15aee1eb2a234ba8963c57571d532a91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3790,7 +3790,7 @@ F:	drivers/net/wireless/broadcom/b43legacy/
 
 BACKLIGHT CLASS/SUBSYSTEM
 M:	Lee Jones <lee@kernel.org>
-M:	Daniel Thompson <daniel.thompson@linaro.org>
+M:	Daniel Thompson <danielt@kernel.org>
 M:	Jingoo Han <jingoohan1@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained

-- 
2.45.2

