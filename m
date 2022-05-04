Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1051A62A
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C50710F955;
	Wed,  4 May 2022 16:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3528910F955
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 16:50:23 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q23so2844862wra.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Vhf9YHzRt69dn6lic4YAadfvleHRgV3petNDTG/PJk=;
 b=YTFFFEPgNVZE+b2uRq2momkqdGIL0JX8CDOuxzGHEunbUIcTIKHDp5Xgrp6k8REBZA
 G4bIcHKqkRkS59TNzzWRvfdWIyBSGBVK1XYbvaNCDUlRRlLm1YOjDLEevf5P4yDpFHr+
 B/EvzJpW1MnJVVxuXvZ4WeCm6izWesujWXvfzTP5AFG8QyXXFUlCShysrrO1BY7Advrj
 IGi7R9cLMhqsbbetxtmdmJzX6OQU4MpJKtlzQlKkZOkGj+ph7uuoShFHhX7P5aBpMgLh
 4pqFdDK3QWLynMHmPVBbyRGXOTy82HRtwC4HB90tty+WUtYuGxSmhtiwCVo+kXAUXJ/m
 jMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Vhf9YHzRt69dn6lic4YAadfvleHRgV3petNDTG/PJk=;
 b=DtFzMPdR0xznPGsHdPxuvYNEOk74rPEHduz9lz6TRKYWtw2Urvj7qHtsSbzy+zDLP6
 pxV+Bc3QVJH7aKhwQyizHKfjjyFVySOu4fery2lRp6eZLcRDx5V1zQzc6zF25KwiCTk+
 KtawbbbgK8FV/73AEzKjgUHLc/QYBXd6q3RujSNY+gkszMmHklvl+SZGgK9Obj/GHPby
 5zF8MtYhBKpy4fUpDZVwn9QNyTGmvdClqZc93FQvIASxNd5FFtYghqu5LLfF8y+Yu6gI
 hxA2aXaLuqIQ7GUgR654YVIQbJyphNtzJCt6sYtxEoyHjKqZLrKFqdRxG3x3vdRp3/cT
 /g7A==
X-Gm-Message-State: AOAM530iJ9r4lwLtF6ixmojDdd3Jf25b32udTh9lQ7IMfMhkJo7sg2ll
 AIbpZieINHQgfxXt430lnhIeMvG5lS+cUA==
X-Google-Smtp-Source: ABdhPJxxVCY7o6nmnvKhBKPKdlEbYWF6E6fJQxupSh9sH6iSZlyfzm/cdWIHGB4NDG/s2uRhNtGLSQ==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr17746171wrw.231.1651683021177; 
 Wed, 04 May 2022 09:50:21 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:f40e:900::24e])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfba41000000b0020c6fa5a797sm5930593wrg.91.2022.05.04.09.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 09:50:20 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu/gfx11: Add missing break
Date: Wed,  4 May 2022 17:50:09 +0100
Message-Id: <20220504165009.82557-4-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504165009.82557-1-mike@fireburn.co.uk>
References: <20220504165009.82557-1-mike@fireburn.co.uk>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This stops clang complaining:

drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5895:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
        default:
        ^
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5895:2: note: insert 'break;' to avoid fall-through
        default:
        ^
        break;

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index b6fc39edc862..e26f97f77db6 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -5892,6 +5892,7 @@ static int gfx_v11_0_set_priv_inst_fault_state(struct amdgpu_device *adev,
 		WREG32_FIELD15_PREREG(GC, 0, CP_INT_CNTL_RING0,
 			       PRIV_INSTR_INT_ENABLE,
 			       state == AMDGPU_IRQ_STATE_ENABLE ? 1 : 0);
+		break;
 	default:
 		break;
 	}
-- 
2.35.1

