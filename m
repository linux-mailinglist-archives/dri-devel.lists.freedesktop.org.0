Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BEB573BB9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C13B94181;
	Wed, 13 Jul 2022 17:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB12093F42
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=/K1O7SgLZ0ZdPePWesCBoTcuEDkQEnnOdYbUhg1FBAQ=;
 b=HFch31kevpfLiBnxLEqN40tBFq0okbecdawJ6mNXQXWlwsaYykw9AjDINVI+fXBSHGMmSf0Mv1b/d
 2d9ybdyuuiMs5NdFeCcHJAmN9eOtYpY5bY1SBkLfV3xUmKwCcTymAc5EqPuEtR3eMQU21BviiczsO/
 fxn6ElUcCLckGehjlfiKer4fYVLwPKOvVQ4I2yzyE2sBNQaKpOn6o9SOHE8BvPSSmgMSSjnUYY4h6/
 4rQ+ylg8OS9eDsxGfraUwshSYflNcRfxGeCLJwrGfy5OuWjdpqrxAHZx6RYhXMo4yzmgJ/DjDLE5GU
 NuDkOzMFCcKKiyiEM3C3d0RfVQcblgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=/K1O7SgLZ0ZdPePWesCBoTcuEDkQEnnOdYbUhg1FBAQ=;
 b=8VijZGDUMFgu7ZwqSv6nez5lPq1eom2OdTN0xJExqKjxeJhyynMej+jrZjzg4x1mmSfuV0Mb7Gtl4
 j9B6euxAg==
X-HalOne-Cookie: 46935117d367935065dee16382b35956d5697f8e
X-HalOne-ID: 93ac8520-02cd-11ed-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 93ac8520-02cd-11ed-be7e-d0431ea8bb03;
 Wed, 13 Jul 2022 17:02:28 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/13] drm/via: Use SPDX tag for MIT license in via_3d_reg
 header
Date: Wed, 13 Jul 2022 19:02:00 +0200
Message-Id: <20220713170202.1798216-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713170202.1798216-1-sam@ravnborg.org>
References: <20220713170202.1798216-1-sam@ravnborg.org>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The license for the via_3d_reg header is MIT - so use the
shorter SPDX tag to identify the license.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
---
 drivers/gpu/drm/via/via_3d_reg.h | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/via/via_3d_reg.h b/drivers/gpu/drm/via/via_3d_reg.h
index fc74647f512a..8796fc9fd44b 100644
--- a/drivers/gpu/drm/via/via_3d_reg.h
+++ b/drivers/gpu/drm/via/via_3d_reg.h
@@ -1,25 +1,7 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright 1998-2011 VIA Technologies, Inc. All Rights Reserved.
  * Copyright 2001-2011 S3 Graphics, Inc. All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sub license,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef VIA_3D_REG_H
-- 
2.34.1

