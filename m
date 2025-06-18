Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925E4ADF056
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B6310E867;
	Wed, 18 Jun 2025 14:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F4DQF/OF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD0B10E867
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:55:55 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b2c4e46a89fso5740545a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750258555; x=1750863355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=O0+ApZGPK8hxvj2a8PRGTgxGTWYM7Y+VlHmPdB1ZKT4=;
 b=F4DQF/OFYngZtvnVGFtozNoiwy3F8zAmNp5L3GConGtLd5T8Y0m9rdlmr9H8qVHuRP
 ziCXBLRf4dRwDkxBKJ65yt9zQ7DEhWN8u7R1i56ccWEoJfdOgxllHQu55q7BKCbjPj9e
 bo2O/gp+ZFCnlGslVJnj4iFCzre99Fx2PMWgFp1nCHbY/cejcIrYTHBRqTSVM/F8hgjg
 OpuESqn2wBjHTx/lziQ4WpzEa/pCeGHPJouyf/S8jRwtGjlMD4a2iPv75TbWFTeCHbQa
 Dd1iVZhSVhAjfiv/v2Yz9DWcrZ3QjBOM90gNjOfimORBU4vsWgwWpzTTskvC/2uyB68N
 QjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750258555; x=1750863355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O0+ApZGPK8hxvj2a8PRGTgxGTWYM7Y+VlHmPdB1ZKT4=;
 b=A4b/L9jaZpdnhzrreabkfa9hBgdEsni/r9sHwwhT7ucTX+eWDkqwelpHGTFL6cuFri
 B+F4KMkG1V3PHNgNkNnyUt+F/SIg3k2bj6rpe2l7sb9UHkEg3J7l2XWDaUm6ncNcC7r0
 xVp9+Gj1tncpk1FQULzjOxxNKwK7Aun4XfQvnKbpj2h8pAXA+uz2aUXXwKmuCcry3hu3
 X460v1TS4RSOsKpyEz67shZ1X+Xfv0IArL9zA17g/qvpeyPpP1mTV0fyTnn52eUSm/Zp
 Ff0sLla/fdTOAQ1rwGgPPMshsVik1KZHzDhY5Nvlnf/dModdO25vFglLpAfuk5gDaVay
 GN6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7F1pv9XcrMUR6Ok/UD1NewUbWBUkGhCnPdQLQnJtaPgaYJAbSvgvPFQ1keT1mtmR3sgTIPew2EN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlGj5+3ApGahWLWhMO4NGfcd2hIysDGtinyfcYtkzy0HHJS7Qc
 PpJkeDECVUCstohMTg87ROpVWgwZx0oS8ibGltxNlnbNlw79euw5X+lT
X-Gm-Gg: ASbGncurQvz+PyIglhT9npk+ICTVsZKlD/pCNWCGFu7ulWBJEJlQqlL9NRTVWaLYvxT
 yZNck795gPdtef1rfx12wuBeSHT4jfS1aRIFSsHrLX6boIOmlcuhRdoozOaiOxaVlcQjhWhXZ9j
 bMXPKek+cypkVCupztbt/HIQuqbRzrJolH447ucR9ysRkbJAxIgy+s+q3e/O8ufwZRF4AkQRx5l
 QUxPNQvySCSBScHPfpt9sw1BSeEyCgPeLakojK20q3JfxiuqK0entiA/S4AofHK87hGqVl57yEE
 c749R2UNq/FFm49NDJv6Qq4/vpd5MB2gVEfVShmqMmuMIBkTAPUlKO9bBqaFMgYza1r6GnM94qF
 sYnU8+nv0FzYHiO6TUFe9
X-Google-Smtp-Source: AGHT+IGpGCrlyY3byltTmOzl5uTsCXlaknteykndOb57J/GEID8SRTtCeTktYUWgs9uY+GuI0NIIhA==
X-Received: by 2002:a05:6a21:b97:b0:1f3:1eb8:7597 with SMTP id
 adf61e73a8af0-21fbd596405mr28892958637.35.1750258554894; 
 Wed, 18 Jun 2025 07:55:54 -0700 (PDT)
Received: from localhost (21.203.125.34.bc.googleusercontent.com.
 [34.125.203.21]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b2fe1643e9esm11093646a12.25.2025.06.18.07.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:55:54 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: always set fence errors on CS_FAULT
Date: Wed, 18 Jun 2025 07:55:49 -0700
Message-ID: <20250618145550.1901618-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
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

It is unclear why fence errors were set only for CS_INHERIT_FAULT.
Downstream driver also does not treat CS_INHERIT_FAULT specially.
Remove the check.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a2248f692a030..1a3b1c49f7d7b 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1399,7 +1399,7 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 	fault = cs_iface->output->fault;
 	info = cs_iface->output->fault_info;
 
-	if (queue && CS_EXCEPTION_TYPE(fault) == DRM_PANTHOR_EXCEPTION_CS_INHERIT_FAULT) {
+	if (queue) {
 		u64 cs_extract = queue->iface.output->extract;
 		struct panthor_job *job;
 
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

