Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ABA5A5E29
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0919810EC7F;
	Tue, 30 Aug 2022 08:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A16510EC7F;
 Tue, 30 Aug 2022 08:32:53 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c2so10424406plo.3;
 Tue, 30 Aug 2022 01:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=7DbBF1+oaDwBQvC8cRC9cxy+Yq2Vsxw50yfZErPMASA=;
 b=QHRjtpH1TXzAXZ6WC+IKgw21HECpC8KBem/uLNhOg0vQcIwSamzdyqro17MpnY/0/W
 LvlANBt2PduRRiB5Tn9XQ7zQhJhU0LUUjVom+bXKdg1086zex3X82U0Flur5UsOQGzO6
 +QtnBOATJesYl7DjuZ6hl6yl71xHogrA8gWVPHIyO+eFfj+Dlki/SmrZ7f23827S/0eB
 1scPzxQu5OlizfrcK9q5M7lPlo34XwwKNqOkED0Fm/1/xzBF1PdLS68DXQokPtbCXS7a
 QNO3pOGfxSo+Dlx/pulyQ4IE6dQroCZGR2024tTr5rgb15rzKV9xwSxEjE4wMy/Y7K+j
 DJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=7DbBF1+oaDwBQvC8cRC9cxy+Yq2Vsxw50yfZErPMASA=;
 b=4hsNJeJxchu6Lor7FaZCM9r9M5oEri0K4woMUczhB0sQCjJ94sKQFkXI+0NKIMBW7c
 EQTu5zOxC4sgT5/jwXF7P/gsoOM7j8lljGiV3XHr7t4wt3PSGe40ng90t1faNh4i96+P
 V43PDXAst/CBe1lcVyRpkehP+gBsB3jndRbrjEHeK2nlBFTQKVOvqIO/ZAaZLtfnmL8c
 /zVBVpJH+/a7HNiakl7ud9BEU2+FjoyL1EX+e1lmPaQhrS8EwxN4kDvNDtDNOKmLcLL9
 +ZHDVRdYq3gzHPQCYyAL7cbX2AFs5o3e5k328VS9PEZunLWEAFcrFEuHfPC4Mxw7Rhgz
 IdAQ==
X-Gm-Message-State: ACgBeo2bj0PSWM0s+FG9xI7cV6IAubXwJFoirCMLfO0BmhLJsH+tu4lg
 AD7AosACsGhNu2AoP0RaRBo=
X-Google-Smtp-Source: AA6agR4Is8dMqZl7uCk/1vuQ+NNemcLnEcQJRsIuv652D6FMEB1n52aGDtSlrjjQDs4ov4EvP0MG2g==
X-Received: by 2002:a17:902:c949:b0:172:d2cd:a9b2 with SMTP id
 i9-20020a170902c94900b00172d2cda9b2mr20599799pla.38.1661848372968; 
 Tue, 30 Aug 2022 01:32:52 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b00172f4835f65sm7032761pln.271.2022.08.30.01.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 01:32:52 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH linux-next] drm/amdgpu: Remove the unneeded result variable 'r'
Date: Tue, 30 Aug 2022 08:32:43 +0000
Message-Id: <20220830083243.276646-1-ye.xingchen@zte.com.cn>
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
Cc: Jack.Xiao@amd.com, tao.zhou1@amd.com, airlied@linux.ie,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rajib.mahapatra@amd.com, YiPeng.Chai@amd.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value sdma_v4_0_start() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 65181efba50e..0cf9d3b486b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2002,7 +2002,6 @@ static int sdma_v4_0_sw_fini(void *handle)
 
 static int sdma_v4_0_hw_init(void *handle)
 {
-	int r;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	if (adev->flags & AMD_IS_APU)
@@ -2011,9 +2010,7 @@ static int sdma_v4_0_hw_init(void *handle)
 	if (!amdgpu_sriov_vf(adev))
 		sdma_v4_0_init_golden_registers(adev);
 
-	r = sdma_v4_0_start(adev);
-
-	return r;
+	return sdma_v4_0_start(adev);
 }
 
 static int sdma_v4_0_hw_fini(void *handle)
-- 
2.25.1
