Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D12455AA92C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0840710E79B;
	Fri,  2 Sep 2022 07:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7661910E78A;
 Fri,  2 Sep 2022 07:55:00 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id y1so1138504plb.2;
 Fri, 02 Sep 2022 00:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=olRYQnYmrRIOGNSywKQ9G4nuley//Yo3uY1jFefZG7o=;
 b=bhXeAh6NCcFpvJlv7XLzcG3X3zIgANLNUE4MmeQDW8WfdAahPXa8g0WRdHkW4TOqmC
 yBd9xg/SSs0xMYBtSy4N4iQXPq17adhaIpZHsj0MmiDd0oOfQgPVdqtuIB9fx4NimvDe
 ZInR8r6HJQuDDhInEdF23uSoUn5/vgxjMfJbq7dvhYAboZtF1Jo8al3BA+ZTnIEHotcQ
 uUIrEfYfV6xDv6A4JqX837duDfoYhtPgj96kVrljzZlHKsddFfJ3nUhRs7h801RNIwHj
 peX819TppTZqOAjYqpzhWZf46daEiiMfsy7swZZcJjOtYsWc2cXQCiG1cWNfUcA6n3gW
 sc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=olRYQnYmrRIOGNSywKQ9G4nuley//Yo3uY1jFefZG7o=;
 b=tOZOX/1OjB3N+X33kElc/f8U+cxipAzcauxnd6uqmDgzvqyYhFu/vtFDRLS0/QEwM8
 //XMySy9ejpEUgfd6ueeCLVfApz8sOuYsd4P1bTj9cSdavYDvi0FWFWtLhTMTQUwNgYO
 lV/znLMCi7hzwLJMl2tjiF12Q+8Op1U9GsgZTLdE5KfM0RvWM1BwCH0u+3Uo40c8AgHC
 hTphgbm5NUwqalXtH+WOiFKFqFI/zCKYNQ+Vi5CVFr1wJFu5T+DcDxhQg+1zpP+jHLdN
 AL6hbOdNQc/nLTtsjYoXLZTGTq8ysmo8WA1r5KZHILkyzCUdmxo0WBKQDcNEMftuEivE
 JXQA==
X-Gm-Message-State: ACgBeo0K6RSgleCU1TJtq2JtwzRXmtbeNNOKSI8EC+u/Kk+xqlirM4Wj
 Zb2cBS11O9GZp37wONcJOjo=
X-Google-Smtp-Source: AA6agR4XOQ2iEpSSKN5Yz5XMLIr6LdDI5VoI9vYEvx9vlTdzzxag0lMZfhF1mY/cUxVhW5mba0hqjQ==
X-Received: by 2002:a17:90b:1d89:b0:1f5:a59:46b1 with SMTP id
 pf9-20020a17090b1d8900b001f50a5946b1mr3426825pjb.173.1662105300133; 
 Fri, 02 Sep 2022 00:55:00 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170903124700b00170d34cf7f3sm922697plh.257.2022.09.02.00.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 00:54:59 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: zhang.songyi@zte.com.cn
To: harry.wentland@amd.com
Subject: [PATCH linux-next] drm/amd/display: Remove the unneeded result
 variable
Date: Fri,  2 Sep 2022 07:54:50 +0000
Message-Id: <20220902075450.319982-1-zhang.songyi@zte.com.cn>
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
Cc: sunpeng.li@amd.com, wenjing.liu@amd.com, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, meenakshikumar.somasundaram@amd.com,
 airlied@linux.ie, Jerry.Zuo@amd.com, zhang songyi <zhang.songyi@zte.com.cn>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hanghong.ma@amd.com, Jun.Lei@amd.com, christian.koenig@amd.com,
 Jimmy.Kizito@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhang songyi <zhang.songyi@zte.com.cn>

Return the enable_link_dp() directly instead of storing it in another
redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index f9b798b7933c..4ab27e231337 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -2077,11 +2077,7 @@ static enum dc_status enable_link_edp(
 		struct dc_state *state,
 		struct pipe_ctx *pipe_ctx)
 {
-	enum dc_status status;
-
-	status = enable_link_dp(state, pipe_ctx);
-
-	return status;
+	return enable_link_dp(state, pipe_ctx);
 }
 
 static enum dc_status enable_link_dp_mst(
-- 
2.25.1


