Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CF175BF1D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 08:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F010E61D;
	Fri, 21 Jul 2023 06:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E072B10E61D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 06:53:04 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R6gHL67mpzBRDtQ
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 14:53:02 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689922382; x=1692514383; bh=bE2eoiKcgHV8FnTvBqMi4GoMdW6
 Ca5I52TBEIsR7l3M=; b=Bw0EtnLOPRDoAQ2p0VNxqxonBZE4TRQ2vhmAEptd0gz
 EpPK10M3nXr+j9w9thX/Ng+vxW5gpX7ziXn2f9+ddycgvyreg3JXyhcMkIRgPFAC
 M44873S2dafeCKqEbN41U+QcM1UfmxzoGTGWaLjlumXFY40kZ5VMuR620Tds0IeX
 XJDu4Tdu/1/bSfgUlz6eoGdnTin8SCme6AP0nYtK3azllkHZKuDlBNBkjXWsLRJk
 lwWYQo+oDrnI+KBrE4jqDjmm9jBorxCvNfpRPlnorOxfJf2L3Nb+GkzMqPzFg6g5
 zg5POFdoju+uZkIhIE1WBA08m3je9DOfqhy1/hvzZPw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EoFjXLbejCxQ for <dri-devel@lists.freedesktop.org>;
 Fri, 21 Jul 2023 14:53:02 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R6gHL3vjbzBRDrN;
 Fri, 21 Jul 2023 14:53:02 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 21 Jul 2023 06:53:02 +0000
From: sunran001@208suo.com
To: alexdeucher@gmail.com
Subject: [PATCH] drm/radeon: ERROR: "foo * bar" should be "foo *bar"
In-Reply-To: <20230721060919.5133-1-xujianghui@cdjrlc.com>
References: <20230721060919.5133-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <19d2a2414f4c2422a13ee74b502d484d@208suo.com>
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two occurrences of the checkpatch.pl error:
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Jianghui Xu <xujianghui@cdjrlc.com>
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
