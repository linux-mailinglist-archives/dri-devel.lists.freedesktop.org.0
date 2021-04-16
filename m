Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AA0362292
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFF76EC1E;
	Fri, 16 Apr 2021 14:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B436EC04
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:49 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u17so42505554ejk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=61oKXxvl+24t+oBgcuj4NfG+vBqO/3mKOMoXwskYVGU=;
 b=X4BXqdfG23NXa84B1Vlw8fBJx1H23dD737fq31AW5KzaRwv5QkDL16paKDhgU1wF8W
 GOL7iCorZFDYIS0EemuA5lDQa4FHfNL/wr/A1E0/ig2HuqDN7oxizMG/QdnscB4oBsDP
 5WIgMUlhpojZQs9TK06RF1Nrwj9zyQTJbO8BI0VWmYwcphGIQsks2Bps/emwiy+CH/Wk
 o67Nj1MfKAlRF3jncWbu3AUTyN36ebEjkndRCtA6nkAWNOFo5+SKbfsQIh4rpmjt6Dow
 F6NMyDFABd2NhOpbIqURgxg4QjDROUlAYJxrkg3GXO/KZ9XSpWXilAKay+z0Aj7Zc9lU
 0d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=61oKXxvl+24t+oBgcuj4NfG+vBqO/3mKOMoXwskYVGU=;
 b=X8iDNfr2CxEI1px34P/KH5sdQSehQg9d2k74CMqmlpwlCtAJG/CP1sqAo6mu04PaSv
 wTglNQcLhm8c+Hkrz/1+iAuQ/Nyy9PpZWRtzb2X5ww3cqX5o+uoEJ/71sXYtBXzg+mtf
 R9ZaVVdoaUX15h8KkCDEuPGYSuKRVgXfzGWKbADDrS8Z/WlytMZlJQyHqHkv1Zb6g6DY
 hpBgU3sijxOy8Dm8/hkmGhb9OLe5M8301aRAaOZVrxk9emzvJh7UHpsfNEUWPi6VrfyW
 Bkcx7VhI7eXE+SyKtd1meLeNaENQcflCobLvLh3yRv27zOEmlNZqaDqXwDdBh7uwkVwj
 uMSQ==
X-Gm-Message-State: AOAM533fm2g0yjoxyJCG/rgCNz3GmCYBC/d1HlSLfayNDCfn0kwb+lFg
 YIl1iF7BbBV3gMKUKQeJeyxCVg==
X-Google-Smtp-Source: ABdhPJxfs0dO3k/tSuzZR0zH09FpnzlHYRFLRl3kEj7fOswxtkCOFLd/lE/Wsujn8Z016ric4zI1mQ==
X-Received: by 2002:a17:906:9bd3:: with SMTP id
 de19mr8318214ejc.329.1618583868141; 
 Fri, 16 Apr 2021 07:37:48 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:47 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/40] gpu: host1x: bus: Remove superfluous param description
 'key'
Date: Fri, 16 Apr 2021 15:37:02 +0100
Message-Id: <20210416143725.2769053-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/host1x/bus.c:774: warning: Excess function parameter 'key' description in '__host1x_client_register'

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/host1x/bus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 218e3718fd68c..e293b68acc348 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -761,7 +761,6 @@ EXPORT_SYMBOL(host1x_client_exit);
 /**
  * __host1x_client_register() - register a host1x client
  * @client: host1x client
- * @key: lock class key for the client-specific mutex
  *
  * Registers a host1x client with each host1x controller instance. Note that
  * each client will only match their parent host1x controller and will only be
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
