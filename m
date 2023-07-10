Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A281874CEA3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED81E10E1FD;
	Mon, 10 Jul 2023 07:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BF310E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:38:54 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QzwqH2GBrzBHXhC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 15:38:51 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688974731; x=1691566732; bh=1pv9U2ejg50V6ues3fPMO0Cknci
 SgisMrIyVi0p4I4g=; b=0zDIx8qbSBbLhsZBxHNYyCIARocYe7tUU2eX2z8Ne37
 McN7z6lf6DaK7HoTfG6DGh/5Tqdnk9xDw7VocPVN1c5H+FywlOOl2VRvrIW4k2ob
 n8IOicj11yg9zMt7/kgKd8ByndZTzbSZbWAA8wsaSj8HvuXA9wvrDsb+ygzmHDC+
 2Uvbk89MhdsBw/1mY/r4SGPwTiu/2XBpTSOL9soAM/IvQgTGrBwPKsGqFKiVsAUo
 +hRpibTUWILfpBHy81P/4ZBTu4BjDCHOKIVoqmrK+PSiY8Vsy7JdEr3DHGfEUHGH
 N+bZSQaqHzQ/5uRPNRGqyoJN/EY9hxvTKiHchq2LBQg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fVOyFrKHE8u6 for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 15:38:51 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QzwqG6ZnlzBHXgs;
 Mon, 10 Jul 2023 15:38:50 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 15:38:50 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: ERROR: "foo * bar" should be "foo *bar"
In-Reply-To: <20230710073659.54188-1-xujianghui@cdjrlc.com>
References: <20230710073659.54188-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <656c6d33a676c141ea35fadb519ccfbc@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix nine occurrences of the checkpatch.pl error:
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/atom.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atom.c 
b/drivers/gpu/drm/radeon/atom.c
index c1bbfbe28bda..11a1940bb26d 100644
--- a/drivers/gpu/drm/radeon/atom.c
+++ b/drivers/gpu/drm/radeon/atom.c
@@ -1156,7 +1156,7 @@ static struct {
      atom_op_shr, ATOM_ARG_MC}, {
  atom_op_debug, 0},};

-static int atom_execute_table_locked(struct atom_context *ctx, int 
index, uint32_t * params)
+static int atom_execute_table_locked(struct atom_context *ctx, int 
index, uint32_t *params)
  {
      int base = CU16(ctx->cmd_table + 4 + 2 * index);
      int len, ws, ps, ptr;
@@ -1216,7 +1216,7 @@ static int atom_execute_table_locked(struct 
atom_context *ctx, int index, uint32
      return ret;
  }

-int atom_execute_table_scratch_unlocked(struct atom_context *ctx, int 
index, uint32_t * params)
+int atom_execute_table_scratch_unlocked(struct atom_context *ctx, int 
index, uint32_t *params)
  {
      int r;

@@ -1237,7 +1237,7 @@ int atom_execute_table_scratch_unlocked(struct 
atom_context *ctx, int index, uin
      return r;
  }

-int atom_execute_table(struct atom_context *ctx, int index, uint32_t * 
params)
+int atom_execute_table(struct atom_context *ctx, int index, uint32_t 
*params)
  {
      int r;
      mutex_lock(&ctx->scratch_mutex);
@@ -1359,8 +1359,8 @@ void atom_destroy(struct atom_context *ctx)
  }

  bool atom_parse_data_header(struct atom_context *ctx, int index,
-                uint16_t * size, uint8_t * frev, uint8_t * crev,
-                uint16_t * data_start)
+                uint16_t *size, uint8_t *frev, uint8_t *crev,
+                uint16_t *data_start)
  {
      int offset = index * 2 + 4;
      int idx = CU16(ctx->data_table + offset);
@@ -1379,8 +1379,8 @@ bool atom_parse_data_header(struct atom_context 
*ctx, int index,
      return true;
  }

-bool atom_parse_cmd_header(struct atom_context *ctx, int index, uint8_t 
* frev,
-               uint8_t * crev)
+bool atom_parse_cmd_header(struct atom_context *ctx, int index, uint8_t 
*frev,
+               uint8_t *crev)
  {
      int offset = index * 2 + 4;
      int idx = CU16(ctx->cmd_table + offset);
