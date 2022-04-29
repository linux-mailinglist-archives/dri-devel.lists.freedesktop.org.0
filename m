Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D85141EA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 07:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A724010FB5D;
	Fri, 29 Apr 2022 05:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DFC10FB5D;
 Fri, 29 Apr 2022 05:48:49 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id b20so2601445qkc.6;
 Thu, 28 Apr 2022 22:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRas45N/HJjKkopTpxGekJncxjNBlwm6mL3yMYGLlOo=;
 b=bc+WNUXF3c5mK3q/tzF4v4JoBy26gajoLNbPDLWyfH0Lj6WYdJCxKSXW7DRkKEfxgf
 eSEzGQdfD/gk0CK8kbNcBllob6euxIALNnI86XDvGYieK8qr6dgKhAr4DPTyuIki6NMd
 s7c+4cyP9+Q0UgielsvHPBfJh9ZV40Cfgxmh1e0ER1mRiE0QdJwHJMD4rD/GH7huQooE
 jhQu3o4gi7C6/IirN9RyFP1WgfX8UC1XCs2p8f+dEwDsdTn1WFODIQ4ZkA+O5mH7iFZh
 znNNYvUVBQBlraSHDLPriOhQZGoLQ5WSWZctA46uRE02fbX20QJAD2G3X1XrEZguVEXo
 vRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRas45N/HJjKkopTpxGekJncxjNBlwm6mL3yMYGLlOo=;
 b=hUv1MVXwEndAozJTt7MU0h0Fl4bedasDqjjE0uEtUm/kLuRH0jXcwUB28VkzPjDEUy
 m2i4LQgNietnLc3qQ2njzoDrHtqPUyl9EJ7wzsVLZyUi4rDfmf47iqR1K17EaZ6QDc4W
 B19mSdgrpgGIk1oAqCDSrXQ88VbQm7KlHL7f0jsii64LQL0IjjJ+llz6yyGUB1BVWKsE
 6NK9uUl41ZjGU/y10pGd78PjEmC1Yj5OtEgmZ+yu8fMQvEmg4tS/C/J4ToRFvfS4+VFp
 Ltn16wYy5wMZMaY7MsZHMToWoUhRnASLoIubH4ENPAaBuYdHOiOZVm5dX9hotn8fm//Q
 tUow==
X-Gm-Message-State: AOAM5301uA+pEXX9hWRDkwZYYWV4ICpeel9C1S0bCrEkrxP31VCEwVoJ
 Cncig6Xoxep9lwf/hjdpGV4=
X-Google-Smtp-Source: ABdhPJynkP2gD+cmS0OSm3ZZXXts2/yMMSLbyMogjKxpLWkfcaqVfWGHjqXfHnAWLyGQEmJ9Yc/AzQ==
X-Received: by 2002:a05:620a:1981:b0:507:4a52:f310 with SMTP id
 bm1-20020a05620a198100b005074a52f310mr22121345qkb.611.1651211328690; 
 Thu, 28 Apr 2022 22:48:48 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 y18-20020ac85f52000000b002ed08a7dc8dsm1234094qta.13.2022.04.28.22.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 22:48:48 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: simplify the return expression of
 iceland_ih_hw_init
Date: Fri, 29 Apr 2022 05:48:41 +0000
Message-Id: <20220429054841.3851915-1-chi.minghao@zte.com.cn>
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index ddfe4eaeea05..aecad530b10a 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -308,14 +308,9 @@ static int iceland_ih_sw_fini(void *handle)
 
 static int iceland_ih_hw_init(void *handle)
 {
-	int r;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	r = iceland_ih_irq_init(adev);
-	if (r)
-		return r;
-
-	return 0;
+	return iceland_ih_irq_init(adev);
 }
 
 static int iceland_ih_hw_fini(void *handle)
-- 
2.25.1


