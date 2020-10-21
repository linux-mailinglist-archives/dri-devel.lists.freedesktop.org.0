Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2D295926
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0ECB6F51E;
	Thu, 22 Oct 2020 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063E36EE48;
 Wed, 21 Oct 2020 18:26:15 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id n16so1954753pgv.13;
 Wed, 21 Oct 2020 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=1FO9M9j075wuOALfoXxDUJe5XnERWTNac+Lhpl+//0M=;
 b=Gs0RQUdBzH+ye2gZxvGyB0vM44Vo1uzip3av9KXrzGiFzj6YVV0VumoXinNm+HrTGF
 a41sMv9p0md1kZicJUhprFfUc2BB4N5GTHHfL2/53CllymaxHzYWG3QlNvGhsWXHM1pO
 HVTwVuGQpK6iQIswHqk4r/fLpwesA1BVIPVKhHlesT4AYpwXtVOTZ5PYgNdMz0m4Cb0i
 wordHDyvWIPqUWCOjd7BYH0vG6llIyahcJ+PaLnLGlGlKtkBrCEO2OwG1EcFGudjEb4S
 DyyBwT22QxYCsC1524F991wBE4KrUgar6bkJqGLUz53wW0YbQAuEZvUKOIj57R/49kYh
 Cepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=1FO9M9j075wuOALfoXxDUJe5XnERWTNac+Lhpl+//0M=;
 b=mzmcU/TtMkF0mKkjg1WYtw99akCrHSAUvbmepCQwDVLdneyk9CztklYZ0TdlQmjVzF
 5LJKyWsFQnw5e4+YG/7JvTQDaSJtx6iF+GF6/1Gr2H7jPxWaV32T0kd/QDUoeZd7KqR4
 7CPYeXew1Rq3RCNebJRAmU4xmEmhjvN5bT8SFcRvPLoa+NFTG8nTG+MWKEvFy3CfsvS4
 LYH/E30x9vLHKKCe5K92F2VukGUZY0WIrcF5oMDwXEt3tcsM8L1FVNjGt6avsuJUfBY7
 Yg194eDVITA+0PjOd8lGcBZvqNMHBPIhJ4+4AOcj6P98X0mYx1jP7JJt1CCtnfFSPTE9
 fk/Q==
X-Gm-Message-State: AOAM532NVNe/fxm3cwHxZoqyGuvF8c7DFGMB4y+U5lpoDBOkhc/A4r22
 JdJiReimkzb1WQ1Hsb6+6D1Pa1K/CJsroiht
X-Google-Smtp-Source: ABdhPJwP7EAt/uDM8x/2lBeocMVF3gYnnutiOkf68MN0f4x419/TMu9i75QIWYZrPndftnu7GsLn+g==
X-Received: by 2002:a63:5d03:: with SMTP id r3mr4341644pgb.2.1603304775269;
 Wed, 21 Oct 2020 11:26:15 -0700 (PDT)
Received: from adolin ([49.207.215.109])
 by smtp.gmail.com with ESMTPSA id a22sm3074560pfk.29.2020.10.21.11.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 11:26:14 -0700 (PDT)
Date: Wed, 21 Oct 2020 23:56:10 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [Outreachy kernel][PATCH] gpu: amd: Return boolean types instead of
 integer values
Message-ID: <20201021182610.4l65yg3y3nhzcac4@adolin>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, melissa.srw@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return statements for functions returning bool should use truth
and false instead of 1 and 0 respectively.

Modify cik_event_interrupt.c to return false instead of 0.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
index 24b471734117..8e64c01565ac 100644
--- a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
@@ -66,12 +66,12 @@ static bool cik_event_interrupt_isr(struct kfd_dev *dev,
 	vmid  = (ihre->ring_id & 0x0000ff00) >> 8;
 	if (vmid < dev->vm_info.first_vmid_kfd ||
 	    vmid > dev->vm_info.last_vmid_kfd)
-		return 0;
+		return false;
 
 	/* If there is no valid PASID, it's likely a firmware bug */
 	pasid = (ihre->ring_id & 0xffff0000) >> 16;
 	if (WARN_ONCE(pasid == 0, "FW bug: No PASID in KFD interrupt"))
-		return 0;
+		return false;
 
 	/* Interrupt types we care about: various signals and faults.
 	 * They will be forwarded to a work queue (see below).
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
