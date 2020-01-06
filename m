Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CE01314A2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C58B6E48F;
	Mon,  6 Jan 2020 15:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472D96E48F;
 Mon,  6 Jan 2020 15:17:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b19so15287141wmj.4;
 Mon, 06 Jan 2020 07:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpVrjWu9aDwxR+gFK4Bj/HRMRoCvr4WMHyXpeXsUZuI=;
 b=je+dzev+ahIb+/gJsOqkpI4onXujW22u4BpaQj8FJ42M0yKtlAh4aB/uHjsf6xg9g1
 WgjJ6FnDFLBP+L3LsZtOUoZQTgJqM51uW75g63ZZkhfQ/yAjtFymmtSomQ0dS6y2QL3F
 BXs2Wgjs3J/MPyMuV1haP7jSbR2JFuXqLG1cjQ1en2Ogb86GqVYUdznYsHgiywzvu4JZ
 lDwpoqUMVmzKGy3uLnBtarRx8bn5S1/+noh89RAZ3nJIpw4yGNlsV51tE/SfbAvUjcIg
 IFnV7sAGiZMS5LAwLSXS96XhhQsbaVyxINeTZBBFxZ8SJ7XtTavmjN89IEX9eM5qrTmY
 QO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zpVrjWu9aDwxR+gFK4Bj/HRMRoCvr4WMHyXpeXsUZuI=;
 b=CCJ7GA1tcC13Ckh5WV3Gfzs3G4b5oNz6Pan1yquUjpgbbaOjud/+lXHOjKVHshZIIJ
 vUgSSbyvZwtL5yqsuUrMbc5NAGr0VZ3aX1gSo9aUHak6IIuKx4lxzvK6NokpYlDD3Ikz
 8jPbLOwffrzl+23lwN3zvVIBHNvF9GZMpIvkqa/0LzbMOMOK8HgrIYWCiQMm27ycQx7g
 gFEdjD3LrZfhbBnUo+nsH+w1L2Tm6lJEa+m0PlcRUGUrAItA73N5I3W92BwesAwk6qz0
 6lsMs7MERIK1DHymq1roXUazWzVWcMtK17TeLuQ+F3vmCX6NocpVj0Oz2rMM2AaEaU1t
 RadA==
X-Gm-Message-State: APjAAAXYMZzw+U3txgiv9RN0KpkY+7oFOyKONNxPbY4gLKr9FsvQ6QbI
 uWQolXffkZuWT6iYtLT1Q0o=
X-Google-Smtp-Source: APXvYqx+bQmS7ysHaJStobb11d1QtmMIsCygBuoqMHOxm9t0UTckRame1IGMUlFK/+4C+9SKT3HLqg==
X-Received: by 2002:a1c:44d5:: with SMTP id
 r204mr36107168wma.122.1578323832989; 
 Mon, 06 Jan 2020 07:17:12 -0800 (PST)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id l3sm72122463wrt.29.2020.01.06.07.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 07:17:12 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] drm/etnaviv: update gc7000 chip identity entry
Date: Mon,  6 Jan 2020 16:16:49 +0100
Message-Id: <20200106151655.311413-5-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106151655.311413-1-christian.gmeiner@gmail.com>
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ~0U as marker for 'I do not care'. I am not sure what
GC7000 based devices are in the wild and I do not want to
break them. In the near future we should extend the hwdb.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 39b463db76c9..eb0f3eb87ced 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -9,6 +9,9 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 	{
 		.model = 0x7000,
 		.revision = 0x6214,
+		.product_id = ~0U,
+		.customer_id = ~0U,
+		.eco_id = ~0U,
 		.stream_count = 16,
 		.register_max = 64,
 		.thread_count = 1024,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
