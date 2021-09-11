Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D814074F2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 05:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323AB6EB49;
	Sat, 11 Sep 2021 03:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772086EB49
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Sep 2021 03:49:05 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id v1so2379277plo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 20:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=DzaIdSdfFubKopkCOrptYgOiLd7HKVfZtJyuoqzoNt8=;
 b=C8UBBiko8kEn/wSOUZVcwwN7OH6XGDrT1X48dR7/CZ7kTBkVKWQu5rR/jHct9gqFnU
 h/gmZWSW2MGUKMqlW7/AA/WhBbDPTc3n1mKjHYCPYj2+0f8ffubhgbjvujGkWobH/uAl
 ATnCNhGYlbPR0TLuymKV1KyJIfIN5aJ8Ry+iBkaO7AtYTR6hnZTJ4Dbi0Rf83N62Y+bi
 eEemDpRXY2M7PQaHc1HZ17clcosVJFGZg76MRO/QeF0F+z2L2QqOo9aQB/qkJn5ctKC9
 plth2//1t4vWhVWIdxFprrxCz92FN+zRf4bNKfPudl2oeQSiLHus29sp6gNmLY7+7jNz
 lJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=DzaIdSdfFubKopkCOrptYgOiLd7HKVfZtJyuoqzoNt8=;
 b=gCYL9smrzmboJB1YxAYNteXF/SV5OFq5sypJqMaPdykZNA9G9rxl8TNa61la8ZM15E
 8FyXXnj1UxiIAES1SrP76239vg6Or4v5IqBAqY3oJ5nM0Fv0oOMIqMu4M+VvmF5niozF
 NqtyAKMiCYtISLX1bhptFZEN8RmwmSYQ0W+kdItVspCmw7pfdGez1JMkKxppf5xejGso
 TDH4ppa0ieS+AWBe0xLYZCVaYeT/qMi4ASI8O1JUp93MkmlAK3KZLpVU0CsaMvy876bN
 2dW53DQ9Qdsu9ke9wESb2SbYTlJoF7+H0mBlUS4X2Fda1p89LBEtGwQwaHKOFD3KK2Ah
 OpWA==
X-Gm-Message-State: AOAM533OWJLoGTRYsWvwbgNgaOP7TnjSiNro3/uJ5ok90bbSH29t8WWl
 niaf59c4udmCemjYzoE5negoNw==
X-Google-Smtp-Source: ABdhPJwvLN8bfHfGluy9Iw3pbtnJt2AuK5+jLiz6yCRmD84GF/OziqDW9kPdqQEWqXQfc8FHYONa2g==
X-Received: by 2002:a17:90a:da02:: with SMTP id
 e2mr1051170pjv.89.1631332144742; 
 Fri, 10 Sep 2021 20:49:04 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n1sm301315pfv.209.2021.09.10.20.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 20:49:04 -0700 (PDT)
Subject: [PATCH v2] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume unused warning
Date: Fri, 10 Sep 2021 20:43:18 -0700
Message-Id: <20210911034317.1719619-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: hjc@rock-chips.com, heiko@sntech.de, Arnd Bergmann <arnd@arndb.de>
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

cdn_dp_resume is only used under PM_SLEEP, and now that it's static an
unused function warning is triggered undner !PM_SLEEP.  This marks the
function as possibly unused, to avoid triggering compiler warnings.

Fixes: 7c49abb4c2f8 ("drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume static")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
This is breaking my builds and looks like it'll land after -rc1, so I've put it
on a shared tag for-rockchip-cdn_dp_resume-v2 which will let me pull it in to
my fixes.  LMK if you guys want me to send this up on my own, but I'm assuming
that the drm/rockchip folks will handle it.
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 8ab3247dbc4a..13c6b857158f 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1123,7 +1123,7 @@ static int cdn_dp_suspend(struct device *dev)
 	return ret;
 }
 
-static int cdn_dp_resume(struct device *dev)
+static __maybe_unused int cdn_dp_resume(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 
-- 
2.33.0.309.g3052b89438-goog

