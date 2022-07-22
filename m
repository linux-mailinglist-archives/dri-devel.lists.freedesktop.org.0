Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0957D832
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 03:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E7311285D;
	Fri, 22 Jul 2022 01:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9E710E835
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 01:57:35 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 17so3369858pfy.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3RzxpAVVByCjwBrnRNMmteMftmAUf7kNK0naWg1+X0=;
 b=DRJrCdqYrCZqsdPfa+8CWArPfpN54dSzOiYKbuoWrzIzRmBBhB6ny95JaOZ9roe3NR
 tu/1aArvhUmRb9rDa5sZ0ai5HlYmM9UAkbtvU0pCXFnCMX1wAUUZXIEHjqEHoICKmAF9
 0o+ANpCYv2BWcXifheR+NTZD/OhWVARKjkl7SrBdM/J2DTIGxZTbdoImFhSrRXKIG8ib
 HXa1eM3jN0Fk5O5cmWczEF6VxaOnW8blZWVyYnk3LXY0CUgvjdfxxgRahezP7TD3Sfgk
 GQIP3BTYADTS8JVF0CbWVlhHlfVxO4UhwJNKMVFnoSI0jxyLy7enI1xd57b86lquOd0B
 6avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3RzxpAVVByCjwBrnRNMmteMftmAUf7kNK0naWg1+X0=;
 b=c9EWErzEmeoRWWe28n71RNF8d/MInMSmRN6nwvTF0YEEZIlg96e9rQ7aYFE7Llf/7x
 tatde9KpRZiKiCHY1cbuxiB+zQvJnuxB0PdpDIQdDUfHIEDV+NjiEvCFHB7eVEbd50Qm
 +HYA/hPTl1A0keAhOuTH+Rap2gnihKDkDlMQ3oWAnuR1yGSs0HOjMjCMlJxwR+ZbtJq4
 jNyTxJNxuquURFd+dnRvm2EBUr0uE3kDzp1emg0V0BlJZlODC31GYskOBqVXWT4tyKpk
 AS/t3u4ELe/f/ZSxDbizhfsRyxQuywrOUk8xo6YZRRptqe70wLfZU1iV9b2T4bCF/lbS
 VRSA==
X-Gm-Message-State: AJIora86j8GsHwRG2qnusjEVj+HcjxL+Mr3PoNQNS/7M1WmLJQegvrDl
 H6YmCCVWAAoCcfXctq/Gmws=
X-Google-Smtp-Source: AGRyM1uQ9TVglu4x0aMb9atG3TbJswbQcXq59N03iTJjd28Ma/TnbozmfRE6FNtJGCsw8k+4coABfw==
X-Received: by 2002:a05:6a00:1a46:b0:525:82e2:a0d3 with SMTP id
 h6-20020a056a001a4600b0052582e2a0d3mr1108603pfv.48.1658455054839; 
 Thu, 21 Jul 2022 18:57:34 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170902d50800b0016c50179b1esm2398861plg.152.2022.07.21.18.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 18:57:34 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH linux-next] drm/bridge: anx7625: Remove redundant
 'flush_workqueue()' calls 'destroy_workqueue()' already drains the queue
 before destroying it, so there is no need to flush it explicitly.So,
 remove the redundant 'flush_workqueue()' calls.
Date: Fri, 22 Jul 2022 01:57:24 +0000
Message-Id: <20220722015724.1500787-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ye xingchen <ye.xingchen@zte.com.cn>, tzimmermann@suse.de, jonas@kwiboo.se,
 airlied@linux.ie, robert.foss@linaro.org, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 hsinyi@chromium.org, sam@ravnborg.org, xji@analogixsemi.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Reported-by: Zeal Robot<ye.xingchen@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index d1f1d525aeb6..732647beb2ef 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2700,7 +2700,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	if (platform->hdcp_workqueue) {
 		cancel_delayed_work(&platform->hdcp_work);
-		flush_workqueue(platform->hdcp_workqueue);
 		destroy_workqueue(platform->hdcp_workqueue);
 	}
 
-- 
2.25.1
