Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A01751A28
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 09:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B7C10E618;
	Thu, 13 Jul 2023 07:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D4510E053
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 03:17:35 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R1ftL1PLDzBJBfn
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 11:17:30 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689218250; x=1691810251; bh=vy2hpwLqIbN4V8wU9/R2s/5gk++
 9S9+eXX9ZvB2DiBg=; b=NcdAuoR974e/19vTeBX57gNMOJW+huU5uXZ4cj40BRa
 ZSyFIDs6VOmtOZmQgt9AQSt4+nsLNLTcLrJvPDpQfenPw5dIXC3kHJXnV7SE5RQP
 svAYc3Cq2wLHebpEjC23Aq8WLHqwc6TkZKXbdXpjCvye3rMjk5qviwjb1Z+Py/co
 YGuCAj9JsGBG+p6uog8zalWmA3icbCmEVD8guOQ/k2SMteYFnhkPijXiWIE0/nhK
 iWSJIYdLBw9VN0+Ei/oBlJVyZwBhC/Y2aMqDNNcr4zkjZfgYYsBROryowrF36aMU
 OO+kIpoAXSvrOVXN9Ae5r1xNCUxwESyTyI/LzaFivFg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JaPrQKhm17cB for <dri-devel@lists.freedesktop.org>;
 Thu, 13 Jul 2023 11:17:30 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R1ftK6NTSzBHXgq;
 Thu, 13 Jul 2023 11:17:29 +0800 (CST)
MIME-Version: 1.0
Date: Thu, 13 Jul 2023 11:17:29 +0800
From: liubin001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: "foo* const bar" should be "foo * const bar"\
 that ope- n brace { should be on the previous line
In-Reply-To: <tencent_4F166AB6DC9C757B0454E3F4875027411F08@qq.com>
References: <tencent_4F166AB6DC9C757B0454E3F4875027411F08@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <7d2a5aba980cd6b7928c15e65fd94086@208suo.com>
X-Sender: liubin001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 13 Jul 2023 07:44:19 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(1)The standard format for declaring a pointer is to add a space bet-
ween the type name and the * symbol, as well as between the * symbol and 
the variable name.
(2) that open brace { should be on the previous line
Signed-off-by: 	Bin Liu <liubin001@208suo.com>
---
  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c 
b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 96504a320c2a..b56936f95d31 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -87,7 +87,7 @@ struct rpc_channel {

  #if IS_ENABLED(CONFIG_DRM_VMWGFX_MKSSTATS)
  /* Kernel mksGuestStats counter names and desciptions; same order as 
enum mksstat_kern_stats_t */
-static const char* const mksstat_kern_name_desc[MKSSTAT_KERN_COUNT][2] 
=
{
         { "vmw_execbuf_ioctl", "vmw_execbuf_ioctl" },
         { "vmw_cotable_resize", "vmw_cotable_resize" },
};

+static const char * const mksstat_kern_name_desc[MKSSTAT_KERN_COUNT][2] 
= {
      { "vmw_execbuf_ioctl", "vmw_execbuf_ioctl" },
      { "vmw_cotable_resize", "vmw_cotable_resize" },
  };
