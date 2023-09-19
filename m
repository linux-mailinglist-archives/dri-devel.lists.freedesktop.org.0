Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D07A7523
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D8610E448;
	Wed, 20 Sep 2023 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E691C10E239;
 Tue, 19 Sep 2023 09:34:19 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c44a25bd0bso22058175ad.0; 
 Tue, 19 Sep 2023 02:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695116059; x=1695720859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QVf5D/+j5N+ia+SFzQBn7+4Q88aksoEeF9OLLDBHLuM=;
 b=Ad8MGuOLVZ+lrHCZeozgWwlzTRtB8uFWHlR5alvqryv5oQBxvR8wnJfBCvTitQ+vTN
 K9i7hkg3SdazdDlZViW0Z1BNNse9lO4Fb70dpjXW6JMh2bA2EYjuxcyDeTmIzeE73S9q
 6l2bzRTmthix6nW2WQXy662/wtIBg5PWHas5j0iqcIy8zWtFusC3fWnPjXgckr0MA9lM
 qm85uSuV6/RhOQUnL+Npdt4k6pBMzSC6GTk2v8W7Xvhp01iSfUEUwzMG/qzDTkNZCEXG
 GXyUYfBkVdOVj4cSYlRjVOWGC7nBEj1qxKh9GlEb/flRd+UIb9tYHZYgqYgFzxJkzRkX
 9X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695116059; x=1695720859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QVf5D/+j5N+ia+SFzQBn7+4Q88aksoEeF9OLLDBHLuM=;
 b=di/6THuZ/o1v1XnoP5Omg9idsyOVigxev+3+HtCfgfUalEEi4ygzsmxjca5DexOfe9
 QayqZTqFXj6/xKLwKhHQUaA5AQQEW2+7q7XGCUqI8Q/nHW1bmHY+muSV5zQ4heSU/cNv
 1vxct7p5SJaiF+BgsdNn3sOfeNuk+eo3zyqr0I8h5PcV0dCesPC5tQbu2N5O8hBbOyjP
 9o9sQXLGT7JXCXjeNOKzaWQt2Gz3+9SehRbaM8ltKSNGhzxg3yN0N5E1cqp8ByKALyE1
 pwwLwlQrR1uJLdyEqwV8vAkic4mfwpYHLSpPO0eNDRyImXU63ZErGzuC214P970l/EuM
 4ndw==
X-Gm-Message-State: AOJu0YwdFlx5qSgD4+0UsfpB8/cd5E7wpJ773CcYB5gwsEshx2zTDb2B
 T+9ShN5R+yEYXHe6VFmX8P0=
X-Google-Smtp-Source: AGHT+IFEM34YO2uN1IhUDPCwqvzRc2cQqob4GZnt3NU716uhhFhKM1D0NXBeVCyJWYwKQ2stjepyvQ==
X-Received: by 2002:a17:902:d507:b0:1c1:d5d1:a364 with SMTP id
 b7-20020a170902d50700b001c1d5d1a364mr2849526plg.33.1695116059209; 
 Tue, 19 Sep 2023 02:34:19 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 ji1-20020a170903324100b001c44489ee55sm6487608plb.273.2023.09.19.02.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 02:34:18 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 swarupkotikalapudi@gmail.com
Subject: [PATCH] gpu: drm: amd: display: fix kernel-doc warnings
Date: Tue, 19 Sep 2023 15:03:11 +0530
Message-Id: <20230919093318.16407-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Sep 2023 08:01:17 +0000
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel-doc warnings discovered in AMD gpu display driver.
Fixes these warnings:
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
Function parameter or member 'overlap_only'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
Function parameter or member 'bottom_gain_mode'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
Function parameter or member 'background_color_bpc'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
warning: Function parameter or member 'top_gain'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
warning: Function parameter or member 'bottom_inside_gain'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
warning: Function parameter or member 'bottom_outside_gain'
not described in 'mpcc_blnd_cfg'.

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 8d86159d9de0..61a2406dcc53 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -91,6 +91,12 @@ enum mpcc_alpha_blend_mode {
  * @global_gain: used when blend mode considers both pixel alpha and plane
  * alpha value and assumes the global alpha value.
  * @global_alpha: plane alpha value
+ * @overlap_only: whether overlapping of different planes is allowed
+ * @bottom_gain_mode: blend mode for bottom gain setting
+ * @background_color_bpc: background color for bpc
+ * @top_gain: top gain setting
+ * @bottom_inside_gain: blend mode for bottom inside
+ * @bottom_outside_gain:  blend mode for bottom outside
  */
 struct mpcc_blnd_cfg {
 	struct tg_color black_color;	/* background color */
-- 
2.34.1

