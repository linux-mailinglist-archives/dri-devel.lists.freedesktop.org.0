Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF29D245D5A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856C6E527;
	Mon, 17 Aug 2020 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3306D6E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 05:50:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x25so6559626pff.4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 22:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=y8IbMlSvYeV7TuMHFK5bjwWRDCnF/ixMBMv2DD2BAzY=;
 b=LqDQw0LGtg9nA50EIOSJkM9B61pEAaPXaGH5qyL7I9qrqz1Nx8wkt+MLpmcLyvNaX/
 xnOObUry8iqHpBity5FlQc56RHZUl5crwoygjMZLQJ+Pta5nP+IXJaiQ76qWuVdULIiY
 0JgB8aPdi34Ea0xNg3fCR7YS+Wkta7TSnKxr73qYz0m8aTO9cM7uP6yDQYzrCMSL+lna
 1xVophSU5jJHQS8Jo43ysexFTF6lwuOvZXuv7F0dOLwX/MUHLskt68N2nnEnwdgwiKOe
 BlFC9IGWFAXpk8adM16j43T7E2VOtGNs8/nrthEZvIo922lo2mmJb4sZYc7GuJQpX/pb
 W/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=y8IbMlSvYeV7TuMHFK5bjwWRDCnF/ixMBMv2DD2BAzY=;
 b=BFs3/aYLPsn7YxjBhLcUR6GTQdtw85JeqhfoPxOKeZ44E5DrR7zxRiEUEktBOtkB7O
 3XdSdzYyFiKI87w4sCsb3GjIOkOfAf/Ax0GHzbuAZFoDYjqdXKVOq59GmyH/yuNwrFDF
 eEBGKMmqMAgYknWKzix5J/I+4DpdtlSrPdcBlMCepICbgIvpuW7reTFgShJ84m/HZXWl
 NUHb79Ek0xhCCv22CNz0iLgtK416EZHVDXqb947hqvoS0EKr+F0j6Exva+dYLnOZ3t9q
 jgEd7jnpC4cbM8zwtUsgPvc3sxSlfFWBpe7DL7SDQYCSIPAcIGSLbUdxtVtoYHX0pY5F
 rm2A==
X-Gm-Message-State: AOAM533Ydmnj730/HOjqtiMJiG1D7D4TWMF7GaJGfU2CXSciTI8dvkSA
 Odpawj7Tr5yAJNgQUgXozaY=
X-Google-Smtp-Source: ABdhPJw9jizrjHsIQvcg5ILlLHHR92ovY96FJUYVDQwtTLE0Gtl06KnhM4Bdb8wPIROjVDZiktAWhw==
X-Received: by 2002:aa7:95b8:: with SMTP id a24mr6942242pfk.219.1597557056656; 
 Sat, 15 Aug 2020 22:50:56 -0700 (PDT)
Received: from inforce-server-Z9PE-D8-WS.routereb3c90.com ([106.51.138.45])
 by smtp.gmail.com with ESMTPSA id x22sm14009310pfn.41.2020.08.15.22.50.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Aug 2020 22:50:56 -0700 (PDT)
From: Vinay Simha BN <simhavcs@gmail.com>
To: 
Subject: [PATCH] drm/bridge/tc358775: Fix for PTR_ERR
Date: Sun, 16 Aug 2020 11:20:41 +0530
Message-Id: <1597557042-5154-1-git-send-email-simhavcs@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:42 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha BN <simhavcs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

passing zero to 'PTR_ERR'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 7da15cd..d951cdc 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -684,7 +684,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	tc->vdd = devm_regulator_get(dev, "vdd-supply");
 	if (IS_ERR(tc->vdd)) {
-		ret = PTR_ERR(tc->vddio);
+		ret = PTR_ERR(tc->vdd);
 		dev_err(dev, "vdd-supply not found\n");
 		return ret;
 	}
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
