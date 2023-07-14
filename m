Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF77532C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D7E10E7D1;
	Fri, 14 Jul 2023 07:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3E410E118
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 05:07:54 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2KHC5cfczBR9sk
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 13:07:51 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689311271; x=1691903272; bh=iLOcUk3bzPHlWtwxwuDqm4mV/on
 mtIq3hNktSDaOMh0=; b=dayk1z4nMV1fZbuidXhMI6B2QFfwaNUxjs6ELTjkeqW
 q/1uz9XY+klGvH68wDkTyfO5nzdQ8KG0m4u8aflOzh2IUb04h9/YGnZ92qWj9BOQ
 +DOgBw1GiE4R2UvijLnRUWzlIlYXOOzoQV9gEmfi66bi991CQwn8CicSG8dImCu0
 69WwSSMTUTNS7n9RkrqMAgNy8EEmvwuZiHf75p9y8IHyjXFKmKKdmsi2FhZDHg/D
 GDCh+GKbpZITWFLddjBrmHbGhXbs50AtGAwqqAFbGiLIv7RVMTu7cb9yuhdC9bnv
 7DkbK88GIaW8RPqKpBTMqHdVI/bclfwcNrEljKG5KrQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id APTRzWr_JrQs for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 13:07:51 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2KHC1hs4zBR7bB;
 Fri, 14 Jul 2023 13:07:51 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 13:07:51 +0800
From: shijie001@208suo.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: ERROR: space prohibited before that ', ' (ctx:WxV)
In-Reply-To: <tencent_E1D8F653B67C8E7FFC6D0E16C4A59D916306@qq.com>
References: <tencent_E1D8F653B67C8E7FFC6D0E16C4A59D916306@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <501c1939cf8047584b11c1af2022518a@208suo.com>
X-Sender: shijie001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 14 Jul 2023 07:14:54 +0000
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

Fix two occurrences of the checkpatch.pl error:
ERROR: space prohibited before that ',' (ctx:WxV)
ERROR: space required after that ',' (ctx:WxV)

Signed-off-by: Jie Shi <shijie001@208suo.com>
---
  drivers/gpu/drm/radeon/atom-bits.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/atom-bits.h 
b/drivers/gpu/drm/radeon/atom-bits.h
index e8fae5c77514..2bfd6d0ff050 100644
--- a/drivers/gpu/drm/radeon/atom-bits.h
+++ b/drivers/gpu/drm/radeon/atom-bits.h
@@ -33,7 +33,7 @@ static inline uint8_t get_u8(void *bios, int ptr)
  #define CU8(ptr) get_u8(ctx->bios, (ptr))
  static inline uint16_t get_u16(void *bios, int ptr)
  {
-    return get_u8(bios ,ptr)|(((uint16_t)get_u8(bios, ptr+1))<<8);
+    return get_u8(bios, ptr)|(((uint16_t)get_u8(bios, ptr+1))<<8);
  }
  #define U16(ptr) get_u16(ctx->ctx->bios, (ptr))
  #define CU16(ptr) get_u16(ctx->bios, (ptr))
