Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF9762D9F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D109510E42C;
	Wed, 26 Jul 2023 07:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3927410E3BE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 08:13:24 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R98t96h9FzBSQMJ
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 16:13:21 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690272801; x=1692864802; bh=YgqX7QCncubAlbC1mLbNMV/XhTM
 zTbCKkfaV7JVxeTg=; b=J6dRdyKwp5IddTSZTbVGzgAIBqEK2UsdSEXy/8lwV5F
 B1RG5NWXaDTj2nmwjqhua9ES/ISpf55f1HR6aiIqiBR1E1WT1piRADBx8fQXt6P1
 Bu6iJRp70a/8ILkUmhcR2HVkRGNXArFxYHq1bKpCF+TLnsh7yd9j3ejPKxV+XdNZ
 xfZ42r4ZwrZBikFIIjyUbwIT8gCJu/24+0qaxHhnlOwKiKEdvlDaR0X9jB2OlLO9
 V6LLDva/+OHLX7vOlC6MUHk58iNP5rclAMF0W01KPI0aS/+z0flLlGaWYXff7SO9
 Ych444o99J4QiYIgRUcsvaroZkArIYQ5Ck3IemoI+NA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5Ex2bhnhdsv1 for <dri-devel@lists.freedesktop.org>;
 Tue, 25 Jul 2023 16:13:21 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R98t94CJzzBL0tD;
 Tue, 25 Jul 2023 16:13:21 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 25 Jul 2023 16:13:21 +0800
From: wuyonggang001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: ERROR: "foo * bar" should be "foo *bar"
In-Reply-To: <20230725080906.2028-1-zhanglibing@cdjrlc.com>
References: <20230725080906.2028-1-zhanglibing@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <b5933d7391b8e526894316b7e17b9637@208suo.com>
X-Sender: wuyonggang001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 26 Jul 2023 07:30:32 +0000
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

Fix the error(s):
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>
---
  drivers/gpu/drm/radeon/atom.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atom.c 
b/drivers/gpu/drm/radeon/atom.c
index 11a1940bb26d..93acb0e42bd6 100644
--- a/drivers/gpu/drm/radeon/atom.c
+++ b/drivers/gpu/drm/radeon/atom.c
@@ -68,8 +68,8 @@ typedef struct {
  } atom_exec_context;

  int atom_debug = 0;
-static int atom_execute_table_locked(struct atom_context *ctx, int 
index, uint32_t * params);
-int atom_execute_table(struct atom_context *ctx, int index, uint32_t * 
params);
+static int atom_execute_table_locked(struct atom_context *ctx, int 
index, uint32_t *params);
+int atom_execute_table(struct atom_context *ctx, int index, uint32_t 
*params);

  static uint32_t atom_arg_mask[8] = {
  	0xFFFFFFFF, 0x0000FFFF, 0x00FFFF00, 0xFFFF0000,
