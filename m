Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD63A89AB7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD3110E71C;
	Tue, 15 Apr 2025 10:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LvgwWRBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B826F10E71C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:44:55 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so5272384f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744713894; x=1745318694; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fdo8dneaizrUoQYs0r04kTs5qLNomw+odVlo3gYg1Fw=;
 b=LvgwWRByd5kfb6fsU3zBt9+geIRB8MNYpgB1lSeHqqdzze7+IbUz3Jt95QrdCufyJ5
 H/6KBi9UNyh+7U9+zdc4ZR3bt8UICh5DSm/wQge1HST/zt3+6K9T9zuvy+wtqiFPYoZm
 I3nZjolxyqnRVtoxV8MB1xmXJQu/5Q7m1ZRwN3slBSxuCHp2bpm7ME15FRvVsebi+M68
 3RzJfibrfvCNLtkHAyfrrApscms711C/JprAHXME+xAGwc23wjjafL3ra0TevcI94nqg
 XGm6ZUNuAJUlILKMJoqeqW4SSDDhTcG8vywCcFZd80eYUrFXnG+d46fdBNdK4Kjr2iS6
 O/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744713894; x=1745318694;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdo8dneaizrUoQYs0r04kTs5qLNomw+odVlo3gYg1Fw=;
 b=m2qm5bODq4q29s4TUlt33djOTr+EKUQqY6VbgvM5foul4Qo0ag1LghohVihjv+2O5b
 tsNotm9GHELyHJW+xMiSy1PnwnE6esHcc5pr7S5V7N9dP1iP+Q0K+R5rK8TgtnXv6wkb
 3RahahbC745Zjh6/SvoFuzNzfVAz5XkEOxugFw6XNETz3i54EQ3FqxB78W9TSvthWZgM
 9l53NBGumnS+WSruodHEQEt/OPvAcNuyTNla+NBXh53OHVyQrQmY7bHbWxt1CF+UtCYE
 A+mbN/IpSSUMI2vzU+GF68f/FZTZkmhCL85F6r8+dkgl1Rw/U2ghZG49xo4ExcGY37NZ
 sb2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQM3w4LqueW9BEiurD5BFqIGGZUrOte/fjLHRMjUP70OF+EV4z2kN2UToAYO9hTPhDl6BNK2Zvo64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbpNvp5VoyPnWhbHP/6PSRDbnM24kEe3wquY238mN/rjt/j8Yb
 S4UGAXNSgBpUHulkpMQ9XQ3KzoiguqxdqqWR7nTu/YR8zwMzdVPC7eBbjNSK+uk=
X-Gm-Gg: ASbGnctOxXl30CuioPImEJDvqp7AJO3NDnEKhBt0x2aFAm1zjWCd/oJjKZTA2Log4I/
 QufyyapWooQyR0LkmTXHV1doTtmsjhHJouze9A1bvCNyVjj/zLGEcOrpEQphEnhcqLGHJEb6ezV
 x2QTAzL1iPtVPGl68xY/rCC5qizSC5JzIZzT/Kc7Gfcz9g0dXRYBIGtZKkitiWJVxBomv5Ddh0G
 CMP6KmEmVqYAuM9tIYouOECtmTEmNFItLrsarIaYu5RbJJjNHgdpUCSmqdNpQTtms25nm3STt3x
 KXXKRiFCoRlUpO4oHvfXFfToIiGgbLpTpKjfpLGEWpnCbvXj20ze1chu
X-Google-Smtp-Source: AGHT+IGc9RW10knIr3MFj1Pzt4vKOq0H3enobQU/zlnoeN7SKpLX1yrOkCKkuW4z4l4oMeg39rDQgQ==
X-Received: by 2002:a05:6000:2403:b0:39c:30fd:ca7 with SMTP id
 ffacd0b85a97d-39ea51d10a1mr13006863f8f.7.1744713894209; 
 Tue, 15 Apr 2025 03:44:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eae977a7fsm13703803f8f.45.2025.04.15.03.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 03:44:53 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:44:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Huang <jinhuieric.huang@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kent Russell <kent.russell@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdkfd: Fix kfd_smi_event_process()
Message-ID: <Z_44oq-aSZOsvxTN@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The "pdd->drm_priv" NULL check is reversed so it will lead to a NULL
dereference on the next line.

Fixes: 4172b556fd5b ("drm/amdkfd: add smi events for process start and end")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index 727a4ce29fe6..c27fd7aec1c3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -350,7 +350,7 @@ void kfd_smi_event_process(struct kfd_process_device *pdd, bool start)
 	struct amdgpu_task_info *task_info;
 	struct amdgpu_vm *avm;
 
-	if (pdd->drm_priv)
+	if (!pdd->drm_priv)
 		return;
 
 	avm = drm_priv_to_vm(pdd->drm_priv);
-- 
2.47.2

