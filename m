Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E9C2D9400
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B526E088;
	Mon, 14 Dec 2020 08:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FF26E850;
 Sat, 12 Dec 2020 14:56:36 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id z12so3817191pjn.1;
 Sat, 12 Dec 2020 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wWwJ669lTeCpssXldT+YJE4GyoQKhiRX94niReA0gzI=;
 b=o5dfbjaG8jXLrBxlQ6Ax9TfOP6nZDGA4umNMXsiyq2Oe3Q4ktKt3aWYU56ZgIpKnco
 IJM7Y6/4oaEdUOw9qrw+D57xQ+O8kFYcdsfOVQbyb3kU8QlWojp2Z1UDPPfjYUhnPkNR
 0Z+C97P35JhJIMHm9BSCZR5Tq9y61KWKd4Ieyd69sy62qD5ahZRMXyVLHw3k55y9Hk+g
 29sznuz45RJUuIu1lByXkMYGkY7o/fermueh6q6xyMCdlD4GO4ssvrTaHGHd2tksIWw/
 Nbovy8bPRinNr6wVLm81nrWd9CnJuha++let3QpuWo4ZbpMB8FfMKgRHrxFTYDO/wfHf
 quqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wWwJ669lTeCpssXldT+YJE4GyoQKhiRX94niReA0gzI=;
 b=C0BWQgNIR8DQnif7sTWAw/VRl/uf9YvX08W6aazjRxxxHruTzPwIgGklMesa3NeUWD
 XY6z19AlYFIAS95QFz+qE0xiAhDdUKaGB8oA7LxMfmJvwCymIQDeTL35GEF8sZuyUpF3
 iSlzps8zGuMQET0EZuWZlgxXKjhCptaySARQwAS+8FDs4XXSxUc1syN+5NFiszZTrrUS
 dx9dQuIxSKjJVt3G+j8fu2hQOBc0gokCbyf6DAlEl2a7STpN7GX60SFDdKnHLy4EawWo
 QOaT96aF64f6Y3ON1OvutEDrU3o7ykztTDQx7+FETe7YVuqbp6+6ABmjQHQJf7KGUd/y
 e8zw==
X-Gm-Message-State: AOAM533c3FS2F/XTuxbhtEfWHrVUMsT6z8+P+Je/4SNzPmzlJgPR/6+1
 lnqq+49T0pWq+aP4QocHcKI=
X-Google-Smtp-Source: ABdhPJwIQwJ4b2qAYQt5HsmV5nWvEGMjeR0Xl7sLwvLaQsHwazMfZrsMIRxw6+4ROB6RL+et6d1lrw==
X-Received: by 2002:a17:902:b213:b029:db:3a3e:d8ad with SMTP id
 t19-20020a170902b213b02900db3a3ed8admr15632490plr.73.1607784996476; 
 Sat, 12 Dec 2020 06:56:36 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.87.107])
 by smtp.gmail.com with ESMTPSA id b11sm13769005pjl.41.2020.12.12.06.56.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Dec 2020 06:56:35 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 yongqiang.sun@amd.com, bindu.r@amd.com
Subject: [PATCH linux-next] drm/amd/display: Adding prototype for
 dccg21_update_dpp_dto()
Date: Sat, 12 Dec 2020 20:26:24 +0530
Message-Id: <1607784984-4542-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel test robot throws below warning ->

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_dccg.c:46:6:
warning: no previous prototype for 'dccg21_update_dpp_dto'
[-Wmissing-prototypes]

Adding prototype for dccg21_update_dpp_dto().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h
index b7efa77..e44a374 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_dccg.h
@@ -32,5 +32,6 @@ struct dccg *dccg21_create(
 	const struct dccg_shift *dccg_shift,
 	const struct dccg_mask *dccg_mask);
 
+void dccg21_update_dpp_dto(struct dccg *dccg, int dpp_inst, int req_dppclk);
 
 #endif /* __DCN21_DCCG_H__ */
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
