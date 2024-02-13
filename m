Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A0853F31
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 23:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAC510E816;
	Tue, 13 Feb 2024 22:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="CXCkHbJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440E210E816
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 22:52:32 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so4015585b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 14:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1707864752; x=1708469552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPJKSwZeBPbnMdgaHzTCAO+LMUvPfr/R89O0sEj9gkg=;
 b=CXCkHbJqqrqZ/9lY3vwOm1MOrVUinur5eKT7iTC06A8NfhG2vlAHY/+19ecDXev8MT
 aYuqWJpawOhmOE2nv51AWGhlSp4CNpGMBTNCQl+fbMZEANvCxsa6e9VRgtI1dwRqsiAo
 k8vzMdajzSy12FVJZKgxaEw3WTgNQirKhRpICxSNWqhgfotALt/zlwKB4PPVZZSF/Agm
 SlXjZcU/bToFGBzm2p7sNx5ggFZ/8FB0P4gfqCikv9h6HUJE3E5oEPCMDWTztx8UlmB8
 XQ2QKpVK+/NNHjRey6DrG+6ZmF3nbjKMJJo8m4ty7DM5daM1KUyREnPmZhCJ5nm5HFcV
 zn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707864752; x=1708469552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPJKSwZeBPbnMdgaHzTCAO+LMUvPfr/R89O0sEj9gkg=;
 b=EZXz1BDViV6GW51ylKD+jA1HCtGItXYyjKH3UjRwhR5SxuI6ucyDcovoleyS8GiL17
 m1hFR96tLavnkrH5L8inxsp+voVNKRS8jbjq8fhJcZV8BSEC3RKr80GX57TwNxZDLkwz
 4X0FlQT7W+gUVjEj40SjmTQtSCJypf77eb7wJBhAXcH3WtT6jUG5GTwljy4jOKCvs6Ln
 ZsLYqFUZxv6BZX7s6antQX9uwhyREu7kwc7irahFnk6gv08Csi+p/00V0UAMR6YgXSqh
 OPcIErjLZOjTV3qYb+M+wAPWlO3AF6UPCvgGB8PBMKDVueymjZQwsQEN0Vl8Ab1Jzw4t
 UJyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRiBPO5u3P6yzyUnXN9L9tarlAsMfaP+NO3GblUr9uGbloPiQsGl1KuO2HAKUHvyWGtwh83Oxb6QaWJizl1jHrOX5in0lyl9yWfar1Jyex
X-Gm-Message-State: AOJu0Ywm3f80KBNR1ko3wt3TcEBccp74InHc+wC3lv+vboCqKXoWRvHo
 wXOPIqmv38b3ysN3hMFn65zQfbtYcEa1/bt/UuYgMyGp7Ey0/KEZGyO7O7ZHMg==
X-Google-Smtp-Source: AGHT+IGSVr1+ATMwQt5rCANQn9q3OD2vEHmgNWq0lf5mwJzw3k+MmI5D9ArWdBHWaD3kaezo+zKTPw==
X-Received: by 2002:a05:6a20:c31e:b0:19e:cdca:3e56 with SMTP id
 dk30-20020a056a20c31e00b0019ecdca3e56mr867986pzb.27.1707864752221; 
 Tue, 13 Feb 2024 14:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW52IN1lDshHR0n+DFxTl/0nUBytZBx6Gn6E+V37MN90DN4GVE5nHDXjmnSmnGwA48ONfiECF3JCJZhC3TMYMK8+sdzURjVyLZrUQm+4hnwN68ihzKSyXE1M2sqjXh8qxb+1LcFikiiqnFszpbxUjkiscV4xyOzyQpN1nrNcgRada/FK2R+Ue6NG/u5tnvWZSPRMyzDwuQj/qKbayv4HSTWuGsFO7ZQ1EJ5Lyk9XdONKKwF8PLtPTV3ieueWt+wW90ePBSmy012+anstlecrNIm4DI29byFTNS7iPRSp7mp53zvMTdpv9eBG6X8hJPSm6f8h34uO5KexMW0YpmpPaIQnNIirFvR0ohn3iCN9CDEnySd9WJIffxeHG/v
Received: from fedora.. ([2804:7f4:8280:6434:9a20:a151:2d8b:d5a0])
 by smtp.gmail.com with ESMTPSA id
 r25-20020a639b19000000b005dc89142b99sm1528379pgd.84.2024.02.13.14.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 14:52:31 -0800 (PST)
From: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: jppaulo <jppaulo11@hotmail.com>,
 Joao Paulo Pereira da Silva <jppaulo11@usp.br>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amd/display: clean inconsistent indenting
Date: Tue, 13 Feb 2024 19:43:09 -0300
Message-ID: <20240213224339.379599-2-jppaulo11@usp.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213224339.379599-1-jppaulo11@usp.br>
References: <20240213224339.379599-1-jppaulo11@usp.br>
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

From: jppaulo <jppaulo11@hotmail.com>

Clean some wrong indenting that throw errors in checkpatch.

Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index aa7c02ba948e..7832832b973d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -962,7 +962,7 @@ static bool dc_construct(struct dc *dc,
 		goto fail;
 	}
 
-        dc_ctx = dc->ctx;
+	dc_ctx = dc->ctx;
 
 	/* Resource should construct all asic specific resources.
 	 * This should be the only place where we need to parse the asic id
@@ -3155,10 +3155,10 @@ static void commit_planes_do_stream_update(struct dc *dc,
 				if (stream_update->mst_bw_update->is_increase)
 					dc->link_srv->increase_mst_payload(pipe_ctx,
 							stream_update->mst_bw_update->mst_stream_bw);
- 				else
+				else
 					dc->link_srv->reduce_mst_payload(pipe_ctx,
 							stream_update->mst_bw_update->mst_stream_bw);
- 			}
+			}
 
 			if (stream_update->pending_test_pattern) {
 				dc_link_dp_set_test_pattern(stream->link,
-- 
2.43.0

