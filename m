Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0C509B5E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 11:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC2710F98E;
	Thu, 21 Apr 2022 09:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894A510E370;
 Thu, 21 Apr 2022 09:03:22 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id md4so4372890pjb.4;
 Thu, 21 Apr 2022 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=B0+tpECkjfe5fDGtISyAD3Lzpd0VL9h6G8D6KejEZfU=;
 b=M0YfVepMgFZBtbJpX/BDsVMwuOn2WMjeOT4HUmLIbWcrytXgyCbKQxwkC9dhJHEkJO
 pMSQBCbUeJRmVfo2LzBSfsIeandEKZhy7N2R7afD+I/CEg9KEKEv+BTPwEiwabZwqWHA
 x8b3Sa3cApk4ujtccHH0jbB1mlS9K1sfLkstVXN67bnZsctpFs6z93FE/df4hAn+UoIw
 0o3DHlKgvUIIe/f/Rp6+sFnZ9nn5ZUPxzobv9pznpnC8+BVBNd/qfxe/Ql0qPEKex5RC
 wEUSYbKMIjdLUA+ypQr2q/FP1aV7i1TjIxOiDZQ4Eg/pU9g0Bchuxcb+jYsHhu56IeLm
 PxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=B0+tpECkjfe5fDGtISyAD3Lzpd0VL9h6G8D6KejEZfU=;
 b=igZjprVv7f83U6dCqP3zqlsEnxcx2YhLSx8R5LVRliqBXviGBj/1iW505pg4fqD/zf
 NWhG5jRjDEcJlmiBJeCyyYkEW41lGURT9OE0CGcHAZs59J7ENS08T5bl/nC/FblxtwFB
 2RBTtWEKGb/4YJXsSssOStchpj93fiIp6K0stSytwgld5FGIXZVigJz6h4fz4cUAeHSI
 01kr3wZixiTyd8jPj3+5x4CxFaqoLrbjxMWxXC+OhrSgFrYcDZvFGAwf7iOVHWM0UNdI
 Bi0SY3+LPdcXrX39nolGkdlN04lT1P3Oe6zPA6dutl7yQVPuJIBOMTZy0DjJVBrOUKZG
 zMJw==
X-Gm-Message-State: AOAM533nFnLYCOOTEQT6u35Ox9i1yqA/lqXhVTvf9V8Zrksy0cAv8h4d
 Xp+xNIk4tc1B/Z0d2AbT9ZU=
X-Google-Smtp-Source: ABdhPJzGWXboLc6+AxBDqQ5cnfywyDHSQdg1utvBr/x/CsXVWXcxoOWHlY8LpPRT4YwB4syhAGVU8Q==
X-Received: by 2002:a17:90b:3503:b0:1d1:c700:e484 with SMTP id
 ls3-20020a17090b350300b001d1c700e484mr9271071pjb.245.1650531802071; 
 Thu, 21 Apr 2022 02:03:22 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 3-20020a17090a190300b001cd4989ff60sm1957980pjg.39.2022.04.21.02.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:03:21 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laktyushkin Dmytro <dmytro.laktyushkin@amd.com>,
 Solomon Chiu <solomon.chiu@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Victor Lu <victorchengchi.lu@amd.com>,
 Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Melissa Wen <mwen@igalia.com>,
 Angus Wang <angus.wang@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Isabella Basso <isabbasso@riseup.net>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix memory leak in dcn21_clock_source_create
Date: Thu, 21 Apr 2022 17:03:09 +0800
Message-Id: <20220421090313.24864-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When dcn20_clk_src_construct() fails, we need to release clk_src.

Fixes: 6f4e6361c3ff ("drm/amd/display: Add Renoir resource (v2)")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 3fe4bfbb98a0..faab59508d82 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -997,6 +997,7 @@ static struct clock_source *dcn21_clock_source_create(
 		return &clk_src->base;
 	}
 
+	kfree(clk_src);
 	BREAK_TO_DEBUGGER();
 	return NULL;
 }
-- 
2.17.1

