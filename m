Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE88674D0FE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 11:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1062310E23F;
	Mon, 10 Jul 2023 09:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3523410E241
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 09:05:59 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzylm11MmzBHXhD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 17:05:56 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688979956; x=1691571957; bh=Q7yjvxrMTbuX88XtUMgBQdXnOJS
 T6lyZeot0NWWwG5Q=; b=X6ZD9PxGa7YFna+NDYUNl2I+8C1D9MEnVNMtAwyJwEu
 UaGlzitKaMTG3Bpi67tJ1wEknhHHn3TIx40/kNnF46dVtoTBkOtFXR4yrR6/BicU
 hVeBpMD4p/82yCUJcyBscbn26M8JcrLYUKGZYYe6zTZxLTxQgUSW7pa7pejHLV0p
 LK1kfE9sKzx+gUQUvFrgstqQqDtUtLWwHMeR2QKB7rP6a1NqxupJUzOkPTC29eq/
 nnj3Xzf7WiCst4HEJCFeIRb5+l8IhCfarOlTCqVnGi7Cs4nw2SE/IBEFMqIbbaCH
 J9I4KejKDbORbqM6Ok/SSShViN8ByJ2FDhfHwLJW2jw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1SUASSBnRB5j for <dri-devel@lists.freedesktop.org>;
 Mon, 10 Jul 2023 17:05:56 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzyll5nZLzBHXR1;
 Mon, 10 Jul 2023 17:05:55 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 17:05:55 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: ERROR: that open brace { should be on the
 previous line
In-Reply-To: <20230710090421.61623-1-xujianghui@cdjrlc.com>
References: <20230710090421.61623-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <77876ef2908eda36cb7f843145ec8cec@208suo.com>
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

Fix eleven occurrences of the checkpatch.pl error:
ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/rv770.c | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rv770.c 
b/drivers/gpu/drm/radeon/rv770.c
index a5ce59d4a485..9ce12fa3c356 100644
--- a/drivers/gpu/drm/radeon/rv770.c
+++ b/drivers/gpu/drm/radeon/rv770.c
@@ -136,7 +136,7 @@ int rv770_set_uvd_clocks(struct radeon_device *rdev, 
u32 vclk, u32 dclk)
      return 0;
  }

-static const u32 r7xx_golden_registers[] ={
+static const u32 r7xx_golden_registers[] = {
      0x8d00, 0xffffffff, 0x0e0e0074,
      0x8d04, 0xffffffff, 0x013a2b34,
      0x9508, 0xffffffff, 0x00000002,
@@ -151,7 +151,7 @@ static const u32 r7xx_golden_registers[] ={
      0x7300, 0xffffffff, 0x001000f0
  };

-static const u32 r7xx_golden_dyn_gpr_registers[] ={
+static const u32 r7xx_golden_dyn_gpr_registers[] = {
      0x8db0, 0xffffffff, 0x98989898,
      0x8db4, 0xffffffff, 0x98989898,
      0x8db8, 0xffffffff, 0x98989898,
@@ -163,7 +163,7 @@ static const u32 r7xx_golden_dyn_gpr_registers[] ={
      0x88c4, 0xffffffff, 0x00000082
  };

-static const u32 rv770_golden_registers[] ={
+static const u32 rv770_golden_registers[] = {
      0x562c, 0xffffffff, 0,
      0x3f90, 0xffffffff, 0,
      0x9148, 0xffffffff, 0,
@@ -172,7 +172,7 @@ static const u32 rv770_golden_registers[] ={
      0x9698, 0x18000000, 0x18000000
  };

-static const u32 rv770ce_golden_registers[] ={
+static const u32 rv770ce_golden_registers[] = {
      0x562c, 0xffffffff, 0,
      0x3f90, 0xffffffff, 0x00cc0000,
      0x9148, 0xffffffff, 0x00cc0000,
@@ -183,7 +183,7 @@ static const u32 rv770ce_golden_registers[] ={
      0x9698, 0x18000000, 0x18000000
  };

-static const u32 rv770_mgcg_init[] ={
+static const u32 rv770_mgcg_init[] = {
      0x8bcc, 0xffffffff, 0x130300f9,
      0x5448, 0xffffffff, 0x100,
      0x55e4, 0xffffffff, 0x100,
@@ -340,7 +340,7 @@ static const u32 rv770_mgcg_init[] ={
      0x92a4, 0xffffffff, 0x00080007
  };

-static const u32 rv710_golden_registers[] ={
+static const u32 rv710_golden_registers[] = {
      0x3f90, 0x00ff0000, 0x00fc0000,
      0x9148, 0x00ff0000, 0x00fc0000,
      0x3f94, 0x00ff0000, 0x00fc0000,
@@ -349,7 +349,7 @@ static const u32 rv710_golden_registers[] ={
      0xa180, 0xffffffff, 0x00003f3f
  };

-static const u32 rv710_mgcg_init[] ={
+static const u32 rv710_mgcg_init[] = {
      0x8bcc, 0xffffffff, 0x13030040,
      0x5448, 0xffffffff, 0x100,
      0x55e4, 0xffffffff, 0x100,
@@ -407,7 +407,7 @@ static const u32 rv710_mgcg_init[] ={
      0x9150, 0xffffffff, 0x4d940000
  };

-static const u32 rv730_golden_registers[] ={
+static const u32 rv730_golden_registers[] = {
      0x3f90, 0x00ff0000, 0x00f00000,
      0x9148, 0x00ff0000, 0x00f00000,
      0x3f94, 0x00ff0000, 0x00f00000,
@@ -417,7 +417,7 @@ static const u32 rv730_golden_registers[] ={
      0xa180, 0xffffffff, 0x00003f3f
  };

-static const u32 rv730_mgcg_init[] ={
+static const u32 rv730_mgcg_init[] = {
      0x8bcc, 0xffffffff, 0x130300f9,
      0x5448, 0xffffffff, 0x100,
      0x55e4, 0xffffffff, 0x100,
@@ -538,7 +538,7 @@ static const u32 rv730_mgcg_init[] ={
      0x92a4, 0xffffffff, 0x00000005
  };

-static const u32 rv740_golden_registers[] ={
+static const u32 rv740_golden_registers[] = {
      0x88c4, 0xffffffff, 0x00000082,
      0x28a50, 0xfffffffc, 0x00000004,
      0x2650, 0x00040000, 0,
@@ -574,7 +574,7 @@ static const u32 rv740_golden_registers[] ={
      0x9698, 0x18000000, 0x18000000
  };

-static const u32 rv740_mgcg_init[] ={
+static const u32 rv740_mgcg_init[] = {
      0x8bcc, 0xffffffff, 0x13030100,
      0x5448, 0xffffffff, 0x100,
      0x55e4, 0xffffffff, 0x100,
