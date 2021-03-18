Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24533FF86
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 07:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823956E092;
	Thu, 18 Mar 2021 06:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD666E092;
 Thu, 18 Mar 2021 06:27:14 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id x16so2691123qvk.3;
 Wed, 17 Mar 2021 23:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNT32jP7JgS237wrtS8YnRoKTooTz5SRowW1DWksDxM=;
 b=OvJV+tg9cEFf0tEjIixqrWyXv9B3ROsCHelq8dmjgbAQDe4cF0R/AWxEcQx9GbnzfU
 +WBzPtzfNN08nteo4nR9Qb8IgAB/Vbp42NCB/auQt3XGIquVkWimOcf7fdEFswB+Qk5L
 TSODw3mSqf33LC8kvG1XibPB/lhRSvFbmmdbecB7ddl+A90kf6nA8vYvVOPMylL6D+0d
 auQ+XydzUUPDl6qlz4KSyRppzDPHFDmm1Zga6462akRlIogecqu69oAJC5FBzySSxt8g
 LC8UXfjdcMuNofVvxN/9yXHFRBvMxSzOBkaPQlR9f60l3S8MoBMGHccFgDPfSAkS+GJH
 I24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNT32jP7JgS237wrtS8YnRoKTooTz5SRowW1DWksDxM=;
 b=XM/R5AuYlKgtoAS+S7aWM10KyfFG8kDTD3AedF4UlfSrxxi0dGmQcC42jp8P0pnHEj
 1ZVP/E18MazoHwQPZeG0HacLekp4waKbj7QBqZ4TX9Y+V/YfVkn0G0RWfSdrZSlXKPiB
 jdwb77lttTpYSSRERcnHBoA7r9hBhRlzQHWghqDrukf6nfVA9nCCIcyrtg9pVYsoFwdO
 nKlVO5eIgzCve/3/pOhVUg05bo/RoqCIqHAwgogXk7verPNeZSbjvLdnLnxbE5QEBll7
 o5eV8JaFSS6vCQHH6DMNQLQ7NlPlVVFKTmYU865URQMgBu9E92r1EdD5UgwoNCoRkRwr
 oLwA==
X-Gm-Message-State: AOAM5305HuCsbRzrNNHeh3lF+N50NSqRnZw6tqWp7aDGu9NoQEFEq8L1
 wqy79wpz3TVuInsSz6PYU/0=
X-Google-Smtp-Source: ABdhPJxXtydecwAhlh8IEYYSOjOAHHi0Mx6IE05vvj2WBXSc8tIQDKtpj8c4E8Ww4Ldziy9qf/+iyA==
X-Received: by 2002:a05:6214:18e5:: with SMTP id
 ep5mr2959617qvb.32.1616048833952; 
 Wed, 17 Mar 2021 23:27:13 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.26])
 by smtp.gmail.com with ESMTPSA id 124sm1050782qke.107.2021.03.17.23.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 23:27:13 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 khsieh@codeaurora.org, tanmay@codeaurora.org, chandanu@codeaurora.org,
 swboyd@chromium.org, unixbhaskar@gmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: Fixed couple of typos
Date: Thu, 18 Mar 2021 11:56:50 +0530
Message-Id: <20210318062650.19886-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/modueles/modules/ ....two different places

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_power.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 7d0327bbc0d5..e3f959ffae12 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -88,7 +88,7 @@ int dp_power_client_init(struct dp_power *power);
  * return: 0 for success, error for failure.
  *
  * This API will de-initialize the DisplayPort's clocks and regulator
- * modueles.
+ * modules.
  */
 void dp_power_client_deinit(struct dp_power *power);

@@ -100,7 +100,7 @@ void dp_power_client_deinit(struct dp_power *power);
  *
  * This API will configure the DisplayPort's power module and provides
  * methods to be called by the client to configure the power related
- * modueles.
+ * modules.
  */
 struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser);

--
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
