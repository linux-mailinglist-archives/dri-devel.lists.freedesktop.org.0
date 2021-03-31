Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E134FF60
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADC96EA5E;
	Wed, 31 Mar 2021 11:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846F26EA5E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 11:21:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b9so19251194wrt.8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxJTD5mQDwNagQLECc0eo1ZB/OdesKUiap5HG3t0c0w=;
 b=boVk5uxYJN8eSN/mQkqoPq2CECXsbN1oAfrFIs57gVeeGrtpUvy8I8mktRJY4ICb4W
 kcut/VBqbKIZaVXM1Qj7EZ3mA4qyI+lofpSQDcBmscM0snWhggmA+2siQbjIcfEkUjk4
 GJzT80ewey6WOnulNh5n0VZ6LMmiHiVSD0YM0dgdbqRQ7log1Lm580BtL/T1uq+uXXAx
 QngDIRzcfKCEHCy9fW/9Pz7Eyf5nq21aC7nVHiAX0JdPBaJ9k3JkgkiW0PVRdrzw485M
 s/f8xTNzYLmMHpOD+zK35UIOc8S6T3IsYsTOl9MtVfSNOcVkow61VIARVv+8ZT99P83t
 LK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxJTD5mQDwNagQLECc0eo1ZB/OdesKUiap5HG3t0c0w=;
 b=VBC9Io0WSYNpOfWzTQWHHOg6nPBvic2KUwFJeceyxpj54bDDkzr0xmV+weJrVET9K+
 AY1ylFYzxjnTXplSH2iFqydBYRQ1ugArFrc/NBxld4QOyJsCXmjUtg4Iv0pHSezj51d1
 h5hJ1uyd3dAPHHtaF4H9zWL3rBQYmg7ua19hW6jbztjAXOF3PWf5eJWach1qaRvZOySq
 gCzIOvdgBN+KOehQ3PdWtFde735F0sBVw4Xk+qiQWhwn8HrCPIv3oJhLGFA7I87jrhTz
 D8pxHGiLBA6SELc95BJOwUw9LVHmR1uIm1wBZbTg13W0/MDUMY51sdjyCsEwALqrQJbz
 RHQw==
X-Gm-Message-State: AOAM5316/yD9pMICFV2uMAK4SW+OP31p3iJrfVICUi40B8Rr7uUWgi4z
 zdECsBouOo1SVRX7tCJJkMsx0TUbZjI=
X-Google-Smtp-Source: ABdhPJynnk0Djk7RwgET2I302hSrsDwuW0zPfm8L0/O1hCZJjTCceKmKRuLt1n6wTevKN+etPgb+Aw==
X-Received: by 2002:adf:c401:: with SMTP id v1mr3189260wrf.242.1617189707281; 
 Wed, 31 Mar 2021 04:21:47 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id c11sm4095442wrm.67.2021.03.31.04.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 04:21:47 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v3 0/1] Fixes 30e2ae943c26 "drm/bridge: Introduce LT8912B DSI
 to HDMI"
Date: Wed, 31 Mar 2021 13:21:36 +0200
Message-Id: <20210331112137.368641-1-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org, dan.carpenter@oracle.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch fixes issues found by a static checker.

Thanks,

Adrien Grassein (1):
  drm/bridge: lt8912b: Fix issues found during static analysis

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 27 +++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
