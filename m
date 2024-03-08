Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95FD875C87
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 03:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9727C10F744;
	Fri,  8 Mar 2024 02:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lu+SQAFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49CE10F744
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 02:52:00 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1dd68d4cff1so1609975ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 18:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709866320; x=1710471120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=baVudaZS4zD+8o7ZlYXWf30QyVpCFFcOvkwKCWeTB6I=;
 b=lu+SQAFIiwJYb0xGZCnWeBIqJO/UVMxgo+M8Xd6z/ByblWn3cW3ywZI6KApgYLgjR+
 0uIPEgRoUOIlyWC/uwwt0E3zYv0fyOnAvgolpa8jMkdd2Y05xlnt4mX63a2vKDkWQedw
 Plw3I74jb7D9UOHU7Q3hxgeDjSCFmPSAzWzks6y61pQ1hb9sTGvtUU70tS+oDc3tJs2L
 I6ey53Yesi+NfMONrRytq4ImHZJX3Rtt9yk+JYPPEhT0fUmlSC6bGA2NIyu6GREOrL4L
 OqO/5pq7ZlkL8Qvmly0cazgwgXSn+V/fk5TVNhz5T5ui/QUZImt2/pxPtEj4FM32sw4l
 fiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709866320; x=1710471120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=baVudaZS4zD+8o7ZlYXWf30QyVpCFFcOvkwKCWeTB6I=;
 b=fjuGbzHjUOCp03Sj0LtzoeQ9plCITkJhS2DFxZfoKmGHk+rgk9KzQdGF3kHj1WMs5m
 EhahAWflmgqMpdXWy0xkT5fSnqmvTYNRTusP4UVci1YVzyc/U/vERgqVyjp/bw9hIHwY
 Lcn8bHIlL0XIVM9jqhL8BJZxw8eUEz8Ukwnq5yz0f2EvcD46XJre02yCiIlvbllArOF4
 orzRsDfvh1WGFOqPyK8A6tHeURfCnypkKZJVzty0C4fq1UiLfTRMYe6PccJkrJ608f9y
 a2/GU8Jt1w+7nYQ0sSR2AySNoVv4azaX9J0siZkCMIyQC+Hzw/1ZyE3vI0i4DPSWmjbJ
 pohg==
X-Gm-Message-State: AOJu0YwshVEBENcQfqfOv3RT4xZMPyHvLTwNdVXZ3jLAr1a4LexN+suX
 wQmzA+4kvyn4sO/Y8wS5fN9JydnRqF6zR0rwxj/N0dc+/YZSK1vO
X-Google-Smtp-Source: AGHT+IFvgO8ppt6dHktQcYZ7vUjAd53/vJ6tZUJHApIea34LR7LbgXp7EGr+8/vDJWidOhFELPUCAw==
X-Received: by 2002:a17:903:32c7:b0:1dc:266e:a7e2 with SMTP id
 i7-20020a17090332c700b001dc266ea7e2mr11009745plr.11.1709866319761; 
 Thu, 07 Mar 2024 18:51:59 -0800 (PST)
Received: from kernel.. ([2402:e280:214c:86:de01:1b58:d4c6:7d2f])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d48500b001dd5b86d809sm1677827plg.279.2024.03.07.18.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 18:51:59 -0800 (PST)
From: R SUNDAR <prosunofficial@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, lyude@redhat.com, imre.deak@intel.com,
 jani.nikula@intel.com, mripard@kernel.org, ville.syrjala@linux.intel.com,
 Wayne.Lin@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 R SUNDAR <prosunofficial@gmail.com>
Subject: [PATCH] Removed vcpi field description to fix kernel doc warning
Date: Fri,  8 Mar 2024 08:21:52 +0530
Message-Id: <20240308025152.17297-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
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

For linux-next repo

./include/drm/display/drm_dp_mst_helper.h:156: warning: Excess struct member 'vcpi' description in 'drm_dp_mst_port'

Signed-off-by: R SUNDAR <prosunofficial@gmail.com>
---
 include/drm/display/drm_dp_mst_helper.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 9b19d8bd520a..3ae88a383a41 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -83,7 +83,6 @@ struct drm_dp_mst_branch;
  * @passthrough_aux: parent aux to which DSC pass-through requests should be
  * sent, only set if DSC pass-through is possible.
  * @parent: branch device parent of this port
- * @vcpi: Virtual Channel Payload info for this port.
  * @connector: DRM connector this port is connected to. Protected by
  * &drm_dp_mst_topology_mgr.base.lock.
  * @mgr: topology manager this port lives under.
-- 
2.34.1

