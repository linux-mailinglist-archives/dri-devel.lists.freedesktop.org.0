Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3442975A4CB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 05:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F6410E550;
	Thu, 20 Jul 2023 03:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7971F10E551
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 03:32:36 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R5ytR6gZ3zBRDrC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 11:32:31 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689823951; x=1692415952; bh=7Vqv8tfjJj3dYvjSYbQJwUzBoso
 1s7DkYVwhfz0M8e0=; b=fn35EcSKLXg+nNIpxSp+KmT7Uowb+Kr68kH7cNzooWg
 ELVkPMw3i0IeNXqdIp0LbAe0eNpxSbfLdIj0I+FCPFfruf5gchaNbEiQI2hiw/hI
 VCOUehVRspCbmAH2FynAkGK6B7cimHdAG9FcaA/YvQH64vyNZZPgNNmQD5eJpKx+
 BUGUqD+2WFNJT13n+GHx00au6cVJbqqx2AhFSb35dyaPRRNtBAE4ETKlG8MJgYpI
 bo+vI/hChoPo+yenBX+t5M1p3Ufv1MUeXfLEqJgq6m1r1qwzslD0dSMAddzszT8b
 8Mc+QOZDiRyNouZpA+8QkI5T0pkBvdehJHngE3l0CPQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3L8QdDR4pNwS for <dri-devel@lists.freedesktop.org>;
 Thu, 20 Jul 2023 11:32:31 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R5ytR3ywkzBR1P6;
 Thu, 20 Jul 2023 11:32:31 +0800 (CST)
MIME-Version: 1.0
Date: Thu, 20 Jul 2023 11:32:31 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] vt: remove spaces after '*'
In-Reply-To: <20230720032846.1980-1-xujianghui@cdjrlc.com>
References: <20230720032846.1980-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <ac611801abfacd368376321f259a577a@208suo.com>
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

remove redundant spaces to clear checkpatch errors.

ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  include/linux/kbd_kern.h | 20 ++++++++++----------
  1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/kbd_kern.h b/include/linux/kbd_kern.h
index c40811d79769..6cb4ab685a84 100644
--- a/include/linux/kbd_kern.h
+++ b/include/linux/kbd_kern.h
@@ -69,52 +69,52 @@ extern void (*kbd_ledfunc)(unsigned int led);
  extern int set_console(int nr);
  extern void schedule_console_callback(void);

-static inline int vc_kbd_mode(struct kbd_struct * kbd, int flag)
+static inline int vc_kbd_mode(struct kbd_struct *kbd, int flag)
  {
  	return ((kbd->modeflags >> flag) & 1);
  }

-static inline int vc_kbd_led(struct kbd_struct * kbd, int flag)
+static inline int vc_kbd_led(struct kbd_struct *kbd, int flag)
  {
  	return ((kbd->ledflagstate >> flag) & 1);
  }

-static inline void set_vc_kbd_mode(struct kbd_struct * kbd, int flag)
+static inline void set_vc_kbd_mode(struct kbd_struct *kbd, int flag)
  {
  	kbd->modeflags |= 1 << flag;
  }

-static inline void set_vc_kbd_led(struct kbd_struct * kbd, int flag)
+static inline void set_vc_kbd_led(struct kbd_struct *kbd, int flag)
  {
  	kbd->ledflagstate |= 1 << flag;
  }

-static inline void clr_vc_kbd_mode(struct kbd_struct * kbd, int flag)
+static inline void clr_vc_kbd_mode(struct kbd_struct *kbd, int flag)
  {
  	kbd->modeflags &= ~(1 << flag);
  }

-static inline void clr_vc_kbd_led(struct kbd_struct * kbd, int flag)
+static inline void clr_vc_kbd_led(struct kbd_struct *kbd, int flag)
  {
  	kbd->ledflagstate &= ~(1 << flag);
  }

-static inline void chg_vc_kbd_lock(struct kbd_struct * kbd, int flag)
+static inline void chg_vc_kbd_lock(struct kbd_struct *kbd, int flag)
  {
  	kbd->lockstate ^= 1 << flag;
  }

-static inline void chg_vc_kbd_slock(struct kbd_struct * kbd, int flag)
+static inline void chg_vc_kbd_slock(struct kbd_struct *kbd, int flag)
  {
  	kbd->slockstate ^= 1 << flag;
  }

-static inline void chg_vc_kbd_mode(struct kbd_struct * kbd, int flag)
+static inline void chg_vc_kbd_mode(struct kbd_struct *kbd, int flag)
  {
  	kbd->modeflags ^= 1 << flag;
  }

-static inline void chg_vc_kbd_led(struct kbd_struct * kbd, int flag)
+static inline void chg_vc_kbd_led(struct kbd_struct *kbd, int flag)
  {
  	kbd->ledflagstate ^= 1 << flag;
  }
