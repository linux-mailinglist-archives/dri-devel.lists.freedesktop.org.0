Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482708143CA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 09:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10C10E9B5;
	Fri, 15 Dec 2023 08:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1304F10E32B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:30:43 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d350dff621so2074495ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 21:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702618242; x=1703223042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OIvU2rMOTpvQeMXLzE6AgfO3UsG3x1FAaRngC/8R2RU=;
 b=d5P7L0W4dDIizlHwixCJ0dzxyau5JrVoOj64kvN0JHbLd3tHMSEAhGKVey3texiuVU
 d+/u9dZwaI8ItFpjZakv5fLAQPjM9FziLQzasR5dV3bZy1gM9JGqw4H7yXhlomMfq7ke
 4gez+nlC77bvCj5xUmqzxmH2bly3M5qpsMdGD3cKWs5JdI10ouc3ybzduwG5bVVnALTA
 YiexVac475+dNQ39naXDHOa+LinYswrGffTAS/4pge5UMGJZ9ZVinRXkZb4mTpvh24pc
 1FYVvm+i+7iCTMUccSZbeyG0zzQFeEBVTrAh69SdXGsX3dfRlhSVkxeR13WLb4bjfiKI
 VsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702618242; x=1703223042;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OIvU2rMOTpvQeMXLzE6AgfO3UsG3x1FAaRngC/8R2RU=;
 b=H7wIdxtChBa4Xuhi7wrQLRupkmvMHQtLUDvskW+u3+zSGz4UC1yB5UjmU8kdOn3vcE
 WVhns8FQLd0kVZjswI0eo6Pq1wYc38Ge1BvqHJ2NUirmAPwm3wF3zwL69VQlN4oj+YHk
 Tbu/U5eRrwz3cx/gHmbD5etvfX3fLoPxU+TCLF95v8wbHa+5bCG4v25DrXwT9BGJ7CE+
 zBdPRy2UV96UdFyd8CABxpexrwdjaQGqC/kwWOsii27X7JJQRfe5O+NZ2bbQxLaMN3nQ
 JIUayWA+dnWd5q1cUcphl9xvbUmzitTdxweBM9OcwY4VUL+5NAHyLlgabrRDVFQhEJdg
 kQww==
X-Gm-Message-State: AOJu0Yw5aAhR3KcYbJF0olm9XoOsCk2xlBtVCbt9qEOtI2tE9pTyD9Ja
 ROtpXQuaT2u8v7sn+joAF9Y=
X-Google-Smtp-Source: AGHT+IFljRxhBOcaFOlEZE3V2qqM+fQ4vtaLInFtl2lkBjp/59h6M25sWQrddIYScyIhzZcF+t1AOg==
X-Received: by 2002:a17:902:c212:b0:1d3:492c:faa4 with SMTP id
 18-20020a170902c21200b001d3492cfaa4mr4159521pll.127.1702618242381; 
 Thu, 14 Dec 2023 21:30:42 -0800 (PST)
Received: from localhost.localdomain ([202.137.218.19])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a170902da8f00b001c9db5e2929sm13370158plx.93.2023.12.14.21.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 21:30:41 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drivers: gpu: drm: vmwgfx: fixed typos
Date: Fri, 15 Dec 2023 11:00:16 +0530
Message-Id: <20231215053016.552019-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Dec 2023 08:39:42 +0000
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
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed some typos in vmwgfx_execbuf.c

Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 36987ef3fc30..272141b6164c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -621,10 +621,10 @@ static int vmw_resources_reserve(struct vmw_sw_context *sw_context)
  * @sw_context: Pointer to the software context.
  * @res_type: Resource type.
  * @dirty: Whether to change dirty status.
- * @converter: User-space visisble type specific information.
+ * @converter: User-space visible type specific information.
  * @id_loc: Pointer to the location in the command buffer currently being parsed
  * from where the user-space resource id handle is located.
- * @p_res: Pointer to pointer to resource validalidation node. Populated on
+ * @p_res: Pointer to pointer to resource validation node. Populated on
  * exit.
  */
 static int
-- 
2.25.1

