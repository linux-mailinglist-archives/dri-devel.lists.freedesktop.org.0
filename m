Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0378B6CB27D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D8A10E7C3;
	Mon, 27 Mar 2023 23:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7835F10E7C1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 23:35:10 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bi31so7682908oib.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAF560UdJX0GEGh8pB1EAaLbRBoRHEw96H0zayNQKjc=;
 b=s5BGJnAq7jaEqaXyIrghhFPGN9hy259iqKpXXpXaLj6L2JgntWwWRT6UwzgFlL+a6W
 br0qVZmkEWUZydrOQC4RCcT08aprE/usdIisKmADVQTJWZ9gkn3qOoRxa6xH/VwZdZYd
 H6xJ8snIaCAxI8OR/2rpEpjvQxq4fo8hn1T+N4L/9gP+EFRzPFNqq40G34MBOLW5+ltB
 xJiKW4lWmTocpeyGW60GYjyY67U9OI3/VgY814ZUnRKxgLIgyQ9UbU9XRVQF4vEaidER
 SQpbiRtTQMZRqidHy2/13vqKJSjrBZDDVKUU5qEqOj/9JRRRZkVpXovfI+KwpabwKJ9B
 yg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAF560UdJX0GEGh8pB1EAaLbRBoRHEw96H0zayNQKjc=;
 b=vHkZBzv9bFCEwh1zCq5IgWXwa/fs2UtZZjXNYHdq+tDU1e4niG5G5HZ+VILZpnIUAi
 tCaKOF81OOqDC9HMS19EEKk2Gc++R1gXNxF/yb2aW1NQT8aw1AqjgAVMWK6yKJayTOy5
 bI0nFgpztG1hY6dUyam1n3b3q4j/7Fp832gZCknVJEpXPiJG+7xh063U7nHV1AAy9Muz
 k12a4GhpTTxXhFwVo3zHrKUgj9DHu1aXxp7ssUTt3Bc7l/FNYBBYLewUobiZ11+L871G
 6AmklxENZflsoldoqv0wXxpNKdXqk9gxVFBlFPswwlH2Eu5kF2U5VJHVahIXxiTXMU5I
 otkw==
X-Gm-Message-State: AAQBX9f9+F6lWGZqjRlUX6pKn1eVj3/PB3PpdAu+TIjgE2Iq5IBAUoWO
 zBmK/1y2vXZsz6nLm7Bi5620+g==
X-Google-Smtp-Source: AKy350aHN1ssxfd7wdlDmSEKxo8G+lYPHr4FVFNdyq/GmsDYlksjWmJHcmWgoxbY/wLtygfAH8HgwA==
X-Received: by 2002:a05:6808:9b3:b0:389:545c:a95f with SMTP id
 e19-20020a05680809b300b00389545ca95fmr5474oig.42.1679960109737; 
 Mon, 27 Mar 2023 16:35:09 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:35:09 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] drm/amd/display: Remove unused variable
 'mc_vm_apt_default'
Date: Mon, 27 Mar 2023 20:33:47 -0300
Message-Id: <20230327233353.64081-7-caionovais@usp.br>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327233353.64081-1-caionovais@usp.br>
References: <20230327233353.64081-1-caionovais@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
Cc: Felipe Clark <felipe.clark@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Mario Limonciello <mario.limonciello@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>, Gabe Teeger <gabe.teeger@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Taimur Hassan <Syed.Hassan@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 George Shen <George.Shen@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Jingwen Zhu <Jingwen.Zhu@amd.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 Leo Li <sunpeng.li@amd.com>, Melissa Wen <mwen@igalia.com>,
 Le Ma <le.ma@amd.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Caio Novais <caionovais@usp.br>, Martin Leung <Martin.Leung@amd.com>,
 Ryan Lin <tsung-hua.lin@amd.com>, Brian Chang <Brian.Chang@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Dillon Varone <Dillon.Varone@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Zhan Liu <zhan.liu@amd.com>, Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Ethan Wellenreiter <Ethan.Wellenreiter@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compiling AMD GPU drivers displays a warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.c: In function ‘hubp3_set_vm_system_aperture_settings’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubp.c:50:30: warning: variable ‘mc_vm_apt_default’ set but not used [-Wunused-but-set-variable]

Get rid of it by removing the variable.

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
index dc3e8df706b3..e46bbe7ddcc9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
@@ -47,13 +47,9 @@ void hubp3_set_vm_system_aperture_settings(struct hubp *hubp,
 {
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
 
-	PHYSICAL_ADDRESS_LOC mc_vm_apt_default;
 	PHYSICAL_ADDRESS_LOC mc_vm_apt_low;
 	PHYSICAL_ADDRESS_LOC mc_vm_apt_high;
 
-	// The format of default addr is 48:12 of the 48 bit addr
-	mc_vm_apt_default.quad_part = apt->sys_default.quad_part >> 12;
-
 	// The format of high/low are 48:18 of the 48 bit addr
 	mc_vm_apt_low.quad_part = apt->sys_low.quad_part >> 18;
 	mc_vm_apt_high.quad_part = apt->sys_high.quad_part >> 18;
-- 
2.40.0

