Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADB5857B6
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 03:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77D398787;
	Sat, 30 Jul 2022 01:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CF1995BF;
 Sat, 30 Jul 2022 01:09:38 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id x125so6133797vsb.13;
 Fri, 29 Jul 2022 18:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=vARix7LjC8+V2lUGH4a8vd6kYiVRgsW91KpYoaINCzQ=;
 b=h113yoKonBCsoBgBIJRG7TYW5IdVv4PVNH8xQ8/CeD83AaZBkSm1tPLxlHGG5I3izq
 XE1LWdsManpW3WR2GsEBJzEWbaCqJRKau3bfdKkYJGf0SiPg/mHwRGDgCZoJgqGjAgwZ
 pubW0SNyRXvkcuaL1RZ6TOu3hgvThYRGYIEn54dnyCIkgwOgXK1EwUaCY6lSJn/Pgy7P
 IPbornuOuO5c14lTFpbpKB+3gTQXOEeRo8QPFNZgX04+1QRD13i/5kZrySmeCWmK80BG
 aFDOjS211eIPiWia8ebJGIKoZ5impL7Ay3b82rVVLHVGOXAmRTCoPV8jNXB995mpKbPn
 /r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=vARix7LjC8+V2lUGH4a8vd6kYiVRgsW91KpYoaINCzQ=;
 b=NR6lCZebwij8IAdicpTGquxiJGWDZOUiQmVopiL+wvt9fucy+6lDaT+AjZZ1vKT08w
 5M37SEOkSVVq95qOqGccOCdutgqTpSVVf7ikVyHr+7fGaF6a6tLBVD2sjaDVE7AOqPw8
 489EmFfUJRqqhVp4CQ2wHPmEH4P+zzyKQe/4x+87j2lpGQ2q0vN8eUY9PRrnLNoFccOc
 d931cNxbuhUs2aTIA1PQ9wP3G4wBJU+fibS/pBjFEtHZTzMmVUSAGmuxSDm/NO1s3ojk
 dyTepVAY27LgqjC40+LK4qaIpn31Foe5SRBmIArRxUgjy/hE71hEBOHXEhjtg10BhzWV
 fQpg==
X-Gm-Message-State: AJIora+JB+MMOF/DBErptgYWJDzHa211Yt4gD2CI2RkBLjWryepWAFps
 9OK33qchXfp4hHOy1m3F6FY=
X-Google-Smtp-Source: AGRyM1vUkskwW8/ECjR5ojI7xK86Qa6NccAqCTnIOvLVkS0dbaeXNnOBlj+kxpSaep33CjcVICgjcg==
X-Received: by 2002:a67:2486:0:b0:354:565c:62ec with SMTP id
 k128-20020a672486000000b00354565c62ecmr2562697vsk.26.1659143377041; 
 Fri, 29 Jul 2022 18:09:37 -0700 (PDT)
Received: from fedora.. ([2804:14c:bbe3:4370:95da:f07f:e927:6958])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a67b30b000000b0035860d6caf8sm1708047vsm.2.2022.07.29.18.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 18:09:35 -0700 (PDT)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, mwen@igalia.com, alex.hung@amd.com
Subject: [PATCH v2 1/3] drm/amd/display: make variables static
Date: Fri, 29 Jul 2022 22:06:58 -0300
Message-Id: <20220730010700.1824647-1-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As "dcn3_1_soc", "dcn3_15_soc", and "dcn3_16_soc" are not used outside
of their corresponding "dcn3*_fpu.c", make them static and remove their
extern declaration.

Fixes: 26f4712aedbd ("drm/amd/display: move FPU related code from dcn31 to dml/dcn31 folder")
Fixes: fa896297b31b ("drm/amd/display: move FPU related code from dcn315 to dml/dcn31 folder")
Fixes: 3f8951cc123f ("drm/amd/display: move FPU related code from dcn316 to dml/dcn31 folder")
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
Changes in v2:
  - remove the extern declaration of "dcn3_15_soc" and "dcn3_16_soc"
  instead of just fixing their type (Melissa and André)
  - apply this fix to "dcn3_1_soc" as well
  - update the commit message accordingly
  - add Fixes and Reviewed-by tags.

 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h   | 1 -
 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h | 1 -
 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h | 1 -
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c    | 6 +++---
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
index 41f8ec99da6b..901436591ed4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
@@ -32,7 +32,6 @@
 	container_of(pool, struct dcn31_resource_pool, base)
 
 extern struct _vcs_dpi_ip_params_st dcn3_1_ip;
-extern struct _vcs_dpi_soc_bounding_box_st dcn3_1_soc;
 
 struct dcn31_resource_pool {
 	struct resource_pool base;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
index 39929fa67a51..22849eaa6f24 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
@@ -32,7 +32,6 @@
 	container_of(pool, struct dcn315_resource_pool, base)
 
 extern struct _vcs_dpi_ip_params_st dcn3_15_ip;
-extern struct _vcs_dpi_ip_params_st dcn3_15_soc;
 
 struct dcn315_resource_pool {
 	struct resource_pool base;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
index 0dc5a6c13ae7..aba6d634131b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
@@ -32,7 +32,6 @@
 	container_of(pool, struct dcn316_resource_pool, base)
 
 extern struct _vcs_dpi_ip_params_st dcn3_16_ip;
-extern struct _vcs_dpi_ip_params_st dcn3_16_soc;
 
 struct dcn316_resource_pool {
 	struct resource_pool base;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index e36cfa5985ea..5664653ba5ac 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -114,7 +114,7 @@ struct _vcs_dpi_ip_params_st dcn3_1_ip = {
 	.dcc_supported = true,
 };
 
-struct _vcs_dpi_soc_bounding_box_st dcn3_1_soc = {
+static struct _vcs_dpi_soc_bounding_box_st dcn3_1_soc = {
 		/*TODO: correct dispclk/dppclk voltage level determination*/
 	.clock_limits = {
 		{
@@ -259,7 +259,7 @@ struct _vcs_dpi_ip_params_st dcn3_15_ip = {
 	.dcc_supported = true,
 };
 
-struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc = {
+static struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc = {
 	.sr_exit_time_us = 9.0,
 	.sr_enter_plus_exit_time_us = 11.0,
 	.sr_exit_z8_time_us = 50.0,
@@ -355,7 +355,7 @@ struct _vcs_dpi_ip_params_st dcn3_16_ip = {
 	.dcc_supported = true,
 };
 
-struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc = {
+static struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc = {
 		/*TODO: correct dispclk/dppclk voltage level determination*/
 	.clock_limits = {
 		{
-- 
2.37.1

