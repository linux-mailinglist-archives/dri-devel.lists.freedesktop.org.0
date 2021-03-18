Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFD13404B1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 12:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCF56E8E1;
	Thu, 18 Mar 2021 11:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8D96E8E1;
 Thu, 18 Mar 2021 11:35:23 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id x16so2988591qvk.3;
 Thu, 18 Mar 2021 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KmBXAGCvFvpYqqcBHXg4z1zeVnk1DOtEJHhSo0JH5cU=;
 b=LNtv+kAqajFLJPtzOg2+/5ZoQ0rrbBDaq+s7yaPrzGyWjgOq2BYKIfxPUM8uNa/aGh
 oTFqfzaJrjSt6KoGATr76WYdgTpf4KXIle3EDGB+cVgN15YdjBVx4RrPeivFGQwjwyuz
 vcqInqMRoD/bFZVBjdaXSozC9cvb/OQO1MGGsytyYluzbUIeT6zar7mS35x+6JpktkhW
 N2N2cBuINhG/Hb7QHBTEcFOYa1W8JQS1/OJahHI4GRW31NtPt3BLnnqEi5wJTlYtWIBY
 enoDlzAl2KkSe39Ebggifsn6VL+Q88yFmEk0dj2r0JBwaPH5g0okkqVLZzuY2T88saFf
 iv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KmBXAGCvFvpYqqcBHXg4z1zeVnk1DOtEJHhSo0JH5cU=;
 b=F3uKf77V6qXWgu32PRfrjREyQUtpP748bDXImi+jsofpqNuLgUytm/MycqyFeZQZwx
 S8vPVnWAkYHuGLzrVzwmYD7VsS9WJtfgReTK7281R/BgrQgIypeTKVxmQ1bZ4EabdCWg
 mO3C8eSbJEORJTKXm6wqygeY42dkThRuQhsj3qZ/pRZeYrCOpcj8iyHZC4LQ9vf2f+hN
 N9dfVrYDTgaOShM1jI9xkMRcGSQ34t2PhUCUwQSWgpdkj2DQq92r1C2sY6Gs+aCaMBA8
 IBrrooKnoAiAkVMCcm3vRVgOVcaYYqlSPpC/wSlT5VJ18CwR7R5n23/eyWfclKq55Mcs
 Mx0w==
X-Gm-Message-State: AOAM530iM1BTgDIT4kr+aL5+g0KHYQutkmDfhjdR8xVREQ03X6YhEDR0
 RT2D5WnZLmRO+cZELRvvD0A=
X-Google-Smtp-Source: ABdhPJxs+awZjzg+I4yr1kGFNs6UNhuk8pcWqa820xZ2PBlfYTwlckQi5EFB9aagxi5sKj1rE0xDZQ==
X-Received: by 2002:a0c:a954:: with SMTP id z20mr3813029qva.29.1616067323010; 
 Thu, 18 Mar 2021 04:35:23 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.246])
 by smtp.gmail.com with ESMTPSA id k24sm1222233qtu.35.2021.03.18.04.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 04:35:22 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, John.Clements@amd.com,
 guchun.chen@amd.com, tao.zhou1@amd.com, Likun.Gao@amd.com,
 Bhawanpreet.Lakha@amd.com, Jiansong.Chen@amd.com, ray.huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix a typo
Date: Thu, 18 Mar 2021 17:03:08 +0530
Message-Id: <20210318113308.1345-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/traing/training/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index c325d6f53a71..db18e4f6cf5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -661,7 +661,7 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)

 	if (ops & PSP_MEM_TRAIN_SEND_LONG_MSG) {
 		/*
-		 * Long traing will encroach certain mount of bottom VRAM,
+		 * Long training will encroach certain mount of bottom VRAM,
 		 * saving the content of this bottom VRAM to system memory
 		 * before training, and restoring it after training to avoid
 		 * VRAM corruption.
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
