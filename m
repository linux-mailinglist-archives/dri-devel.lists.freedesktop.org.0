Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE94A7B98
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97FD10E658;
	Wed,  2 Feb 2022 23:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D805110E233;
 Wed,  2 Feb 2022 21:43:04 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id t199so875770oie.10;
 Wed, 02 Feb 2022 13:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W3C86wM4RRIil8SxMQCDDt7pq/c7kC+1ToUwcaauhcY=;
 b=bcf0lTZn99V9oVeN3ea94gI1jVOL8i6cIyNZAtSXBbrZbPkj8NiwExPSavIGezwB08
 Yt2kEnAKIfK+aMT4IMo13Lf2CI613trgWsAu4Xz7yme4kxZTHYcGto0WkIrYeqeJ2paT
 28Laff0Gxkao9X+felx3/7XAyw5d+vPztBfK2aBiCnNS2KLhhgYku9YK3wc5FwDD98aI
 GuRSCHSGpXjmhiq+79D/+vguYkybVKv6rM+Qmswkz29/ARg/whzqyxkQIqtY90nsJCB9
 ewRk0pOkfGjjbCxd9KVqKUXTYPjmxbargNak9k85YpPdHIQKt+5zr5g+F5J4deC7ebCm
 wG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W3C86wM4RRIil8SxMQCDDt7pq/c7kC+1ToUwcaauhcY=;
 b=teewMlvlr0J3y+bbzqufkGhqUkjpq6RzS0e4uMk1f6CJSkKAbKQ5XHR+DY7+3ymL/+
 gtbTdeTLB3OXyXxDLpO0BOHww/YQQPnB6jMBt5m6dqJ5yxz1OVA2fihyCDc70f9Bkq3Y
 p/toGbbxFJuD4gaI7rBI2ZyBaOFzGluhYnNdh61+PR7T7RsFzyNS2LwpGi8sXgNwOp1Y
 QfK7wh9WAjcUXkpSn+PtxwaKF/7pC4Hje8AesbnpFtfijg+mxUvoeB0YFW53F97tSscB
 UE2tq+IafZoqLdmWLHUQsi9nKEmiV+6fKEIvIRoqT1/nLpVjFqhoO3Lfgnx5OqwMEGv0
 jipg==
X-Gm-Message-State: AOAM532yESRWyG/hfIBSzXSQTHclMdyLkiWsOdhNqyFll6zOyL04a9Yt
 myClxQ6ptpuLLoS2kN4epA0=
X-Google-Smtp-Source: ABdhPJxX0n9uNpXvgGpEUqJyCL3sYTi8+QyGIJtIaJ57BLSpqMGEySXmBI0EIFOhg4b3VrVTjkeuvw==
X-Received: by 2002:a05:6808:10ce:: with SMTP id
 s14mr1474773ois.164.1643838183932; 
 Wed, 02 Feb 2022 13:43:03 -0800 (PST)
Received: from magali.lan ([191.181.56.252])
 by smtp.gmail.com with ESMTPSA id y15sm11701268oof.37.2022.02.02.13.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 13:43:03 -0800 (PST)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: Use NULL pointer instead of plain integer
Date: Wed,  2 Feb 2022 18:38:56 -0300
Message-Id: <20220202213856.409403-1-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Feb 2022 23:17:36 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, amd-gfx@lists.freedesktop.org,
 Magali Lemes <magalilemes00@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assigning 0L to a pointer variable caused the following warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:71:40:
warning: Using plain integer as NULL pointer

In order to remove this warning, this commit assigns a NULL pointer to
the pointer variable that caused this issue.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
index ec636d06e18c..ef75eb7d5adc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
@@ -68,7 +68,7 @@ static void get_qp_set(qp_set qps, enum colour_mode cm, enum bits_per_comp bpc,
 	int sel = table_hash(mode, bpc, max_min);
 	int table_size = 0;
 	int index;
-	const struct qp_entry *table = 0L;
+	const struct qp_entry *table = NULL;
 
 	// alias enum
 	enum { min = DAL_MM_MIN, max = DAL_MM_MAX };
-- 
2.25.1

