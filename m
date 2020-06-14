Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A111F8FC5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489446E265;
	Mon, 15 Jun 2020 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33A889F63
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:31:43 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49kxXM6clRz9vC91
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYZ3ZVfDs5rE for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:22:27 -0500 (CDT)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49kxXM4mzxz9vC94
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 20:22:26 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49kxXM4mzxz9vC94
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49kxXM4mzxz9vC94
Received: by mail-il1-f197.google.com with SMTP id o12so9408055ilf.6
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 18:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hWaD4fQyHbWq3bbusGJa3obvcK40dmIFPt4HBS/vC+8=;
 b=dnGgxZhWilGEvZAkDKg8+Db3hNX1+NOCy/4oK32fpCcuIBiSCLn37R9dMCTvR5yOnN
 m9KEtdopyhDK6ah8M4C/7Ae9EnXaPpr7b6yJHQL8m/jac7VXpHQVtKYFn8bmbq9lSJro
 ABG7Whrj7bznZW+sAz3bnIzAN9MG0WAH84cqBVbc+2zq+fJd22+zK1m/hZozqp6+NbrO
 +6OwzFLwRZau6lJ11+eb9xfW5Ew88zoMf1Wlg/Gw79N1J7+tFJJ6PK4TcLjrugCBhiro
 AgHbHwNXra0eLZ2T1ZjYU+QKKaraFrGqUywmBUY+NPz1nwRsriTRIle/R+A6z7qIMd3d
 FvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hWaD4fQyHbWq3bbusGJa3obvcK40dmIFPt4HBS/vC+8=;
 b=Us0vOSH7X7fSRZPjtstou3upCPIjm5tdg/V4UdhN8hvgmP0tdLmDd/4qkF8LKINdqL
 mEgwHDrvfLmRu9FiTD/r6KlTTIacAi9ybmV6vZZdEoTXx47maUh9NZ9cSVZghXDJzNid
 8VSZMsR4Kyx/XujNKJV0VPtmSZq6+rmCNT67belldnEy76be0ZDS4+7sYOsv8DSshQWM
 hEYr9znM/YSGYFyxmFllbG3A+m1ZvxQ+xWAVuYf3hGNJfRPb4cLD5VMG/5sen57jPES1
 d9XODwbnoQxL6f5kQ9wfCXaII/xeMMhH3j0DJoVzkBrR5g6OtKgSsEZfSK8PJaIOr24x
 kK1g==
X-Gm-Message-State: AOAM532YltIBw2sVFc1hrrAYTSQk4mwx9maE0jq2VxHzDXGklafq6s/X
 heGL5TMgtmCmxFgULUWQeTQK6TNDPaqncUDWoTVuD827FmQs5gh3paD0+Wkl2hqZN9zjqy8oXUL
 IOSGZtg9NdxcnvYwP0IQw0RR4hsySAHQp
X-Received: by 2002:a5e:dd07:: with SMTP id t7mr21202634iop.21.1592097746366; 
 Sat, 13 Jun 2020 18:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG9/5j6jwcpTDWma6pdM8Bkh2xp31WtVsWXYi2gCUmVJhMzt5E2i8yikc3nH8lOVjzJe+aTg==
X-Received: by 2002:a5e:dd07:: with SMTP id t7mr21202621iop.21.1592097746172; 
 Sat, 13 Jun 2020 18:22:26 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:d65:8ac4:1b02:86ac])
 by smtp.gmail.com with ESMTPSA id j63sm5760966ilg.50.2020.06.13.18.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:22:25 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/nouveau: Fix reference count leak in
 nouveau_connector_detect
Date: Sat, 13 Jun 2020 20:22:23 -0500
Message-Id: <20200614012223.121019-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_connector_detect() calls pm_runtime_get_sync and in turn
increments the reference count. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 1b383ae0248f..ef8ddbe44581 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -572,8 +572,10 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 		pm_runtime_get_noresume(dev->dev);
 	} else {
 		ret = pm_runtime_get_sync(dev->dev);
-		if (ret < 0 && ret != -EACCES)
+		if (ret < 0 && ret != -EACCES) {
+			pm_runtime_put_autosuspend(dev->dev);
 			return conn_status;
+		}
 	}
 
 	nv_encoder = nouveau_connector_ddc_detect(connector);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
