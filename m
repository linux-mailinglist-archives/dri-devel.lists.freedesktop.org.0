Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1032B824
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1169B6E8D9;
	Wed,  3 Mar 2021 13:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761F86E8E4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:44 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o16so6405334wmh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=Lt9BZLEKeX6vZm5O1anyCQVHXnHAylqWnmLnxySRpm1uwZYBNJrww3+26dI4sP4eTZ
 3zZSDTnpns8MDlaOgJfHoN6qh+cm4BiWZzB1zBpqrWLL+E7kmxRHVKPXKqHib53fQIiD
 vhgBOjv906Y8rlLoQzee6gXFbwV4KGSgzl83yL9lO2lzIb4ewpLRrwJzPyeFn8nJb88x
 GM3CPy0U1XHTu697oiHMzETTXMJZjVYfe4oMQpLdhMuQ2LTsEoaqGxNeZLtU5stvUbeQ
 dlSdbiTfPzFjWFK3xqPiapITv1hmqABmayWWM7trUot3POqVeapO2PX4C25ehIPmg3ez
 rvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3+jQ9deg+F+hwlthzV/g98whTMSIMZPgh43ftXDf7Y=;
 b=reZ53NSKzao3mdIXrGkg97NxUaVeY+1QyY89UFpmNrtR26GdJh2eM3iqYBEGYwhZL8
 9riJvevMeaX8vQOmtwT6MDHDk/TNa5V6u2M64/IezCxA7C7IOwUKe0zINtSxPgViWEMt
 F4lwBFNvOL6V5AGuWmg5occRPRZCEoCGm0H5EEz8mAMW5ALGx9mDUnr9xfRpvzS0RMY4
 0WFOMngso+ZnvieIweipiG4/DRqxQMGG3pJp6m5yjgTLsKbjIJ7rsdiRedJBGU2V76z1
 +FfVyV+ns/2M8iepDNs4Aj8iXzZbk2BDq009oupUTps/BU5mKvpYJR7rQH789vZ/IAZx
 QsIg==
X-Gm-Message-State: AOAM533taa1pf0kzNrnWKFeD4YP0oQrX2XDH2JuFIsUueeV4ke+B9m/D
 gi4Rgiz3M0z/6U9NjXSwcKe6uwh2XdoSvQ==
X-Google-Smtp-Source: ABdhPJxnR8YWXV0kvaiGo4Fnh/JzG/G0i6PnEYHzmg21U6zym4qPrzBpBFNjcyj/LMiLGdnMfETvwg==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr9540066wmq.159.1614779023095; 
 Wed, 03 Mar 2021 05:43:43 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/53] drm/nouveau/nvkm/engine/gr/gf100: Demote non-conformant
 kernel-doc header
Date: Wed,  3 Mar 2021 13:42:38 +0000
Message-Id: <20210303134319.3160762-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:992: warning: Function parameter or member 'gr' not described in 'gf100_gr_wait_idle'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 397ff4fe9df89..69e6008f99196 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -982,7 +982,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
 	}
 }
 
-/**
+/*
  * Wait until GR goes idle. GR is considered idle if it is disabled by the
  * MC (0x200) register, or GR is not busy and a context switch is not in
  * progress.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
