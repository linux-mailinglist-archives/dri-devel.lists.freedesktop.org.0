Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567075EDFF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BA310E286;
	Mon, 24 Jul 2023 08:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDD310E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 08:42:10 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8YYq57RlzBRx5M
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 16:42:07 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690188127; x=1692780128; bh=eE7sNKxG4/rjsPDu9gJ/H3YFqzO
 mN4jtb9Ah4UwXSdc=; b=kxCrOKJ/X6KDq2G5oEObom94SRx7CYjqrqZRkIa/JSN
 w+gWM1YSu4rSANtBoTB5Hl9EqTUk5OIpxorjDfwo6t6qp9EcW+m8j6Tt+/zRvl1B
 k+lkwemajkgxmRlEdM6blOU9BNJsoOPPphNAasDoLyQWFfkpYETFmiaShf2TzYWC
 tEaEOg5skrZsLBL382oYRUlX8nUywcH/go7lkJDlrQ4ncAPLfhUQC62Aweupystc
 OH+KPGzVGT8FEg+gg7j+cmX7mnZTfATZlHH3tbLXX3ugy1qWlEUev5s1+X2aiQuF
 saP9nS8DZCwkzazLOJhvaWPLRiHsZDRtIhbRMWmM2BQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X-iZjR1tDnY5 for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 16:42:07 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8YYq2NgkzB7Bvn;
 Mon, 24 Jul 2023 16:42:07 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 16:42:07 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: that open brace { should be on the previous line
In-Reply-To: <20230724084109.9496-1-xujianghui@cdjrlc.com>
References: <20230724084109.9496-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <7fde0c4213bf401813918ac05f313fbb@208suo.com>
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

ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h 
b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h
index beab6d7b28b7..630132c4a76b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h
@@ -52,8 +52,7 @@ static unsigned int DbiPrbs7[] =


  //4096 bytes, 256 byte aligned
-static unsigned int NoDbiPrbs7[] =
-{
+static unsigned int NoDbiPrbs7[] = {
      0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0xf0f00f0f, 0x0f0f0f0f, 
0x0f0f0f0f, 0xf0f0f0f0, 0x0f0f0f0f, 0x0f0f0f0f, 0xf0f00f0f, 0xf0f00f0f, 
0x0f0f0f0f, 0xf0f0f0f0, 0xf0f0f0f0, 0x0f0f0f0f, 0xf0f00f0f,
      0x0f0f0f0f, 0xf0f00f0f, 0xf0f0f0f0, 0x0f0f0f0f, 0xf0f0f0f0, 
0xf0f00f0f, 0xf0f00f0f, 0xf0f00f0f, 0x0f0ff0f0, 0xf0f0f0f0, 0xf0f0f0f0, 
0x0f0ff0f0, 0x0f0f0f0f, 0x0f0f0f0f, 0xf0f0f0f0, 0xf0f00f0f,
      0x0f0f0f0f, 0xf0f00f0f, 0x0f0ff0f0, 0x0f0f0f0f, 0xf0f0f0f0, 
0x0f0ff0f0, 0xf0f00f0f, 0xf0f00f0f, 0xf0f0f0f0, 0x0f0ff0f0, 0xf0f0f0f0, 
0xf0f00f0f, 0xf0f0f0f0, 0x0f0f0f0f, 0x0f0ff0f0, 0xf0f00f0f,
@@ -121,8 +120,7 @@ static unsigned int NoDbiPrbs7[] =
  };

  // 4096 bytes, 256 byte aligned
-static unsigned int DbiPrbs7[] =
-{
+static unsigned int DbiPrbs7[] = {
      0xffffffff, 0xffffffff, 0xffffffff, 0x0000ffff, 0xffffffff, 
0xffffffff, 0x00000000, 0xffffffff, 0xffffffff, 0x0000ffff, 0x0000ffff, 
0xffffffff, 0x00000000, 0x00000000, 0xffffffff, 0x0000ffff,
      0xffffffff, 0x0000ffff, 0x00000000, 0xffffffff, 0x00000000, 
0x0000ffff, 0x0000ffff, 0x0000ffff, 0xffff0000, 0x00000000, 0x00000000, 
0xffff0000, 0xffffffff, 0xffffffff, 0x00000000, 0x0000ffff,
      0xffffffff, 0x0000ffff, 0xffff0000, 0xffffffff, 0x00000000, 
0xffff0000, 0x0000ffff, 0x0000ffff, 0x00000000, 0xffff0000, 0x00000000, 
0x0000ffff, 0x00000000, 0xffffffff, 0xffff0000, 0x0000ffff,
