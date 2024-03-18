Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD787F436
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 00:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D0710EF07;
	Mon, 18 Mar 2024 23:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="eK9YNxVd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8167510EF07
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 23:46:35 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-60832a48684so76736027b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1710805594; x=1711410394;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lT28vCErvodzmWvEdtP7ojnGOwo1TugtSNi45cBTyks=;
 b=eK9YNxVd6LiM0bV1Itrf1WbAy3SipSYrKiN/Xe4I62xZxtIyEfnRvhxKHJC8R/LgXe
 llAUTeSssEiEey6zvzflOvgS/noBpi/92EgJixCZMaOD6JtuSG6JFT2q/vmeZl+3ohOo
 fbhowaSxm0k0GcRuNju2HlRysxe6ngcjm5r31hW5Qjco5gZqj9/AWLfsxs5bPp70FqJa
 CFlFOLy6kwwEpIXe23TynAK2FIf+fl1jRl6Bvy7PHaCn+K0QfmYwHHVS+bP41TMI7UHS
 slKVOCQBjcPEXDGo9pUd5Sl3T/DHhGTVIgQ+6OxXkpfILIa3B9Vfr7C3PvPK6qUCmzvL
 5twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710805594; x=1711410394;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lT28vCErvodzmWvEdtP7ojnGOwo1TugtSNi45cBTyks=;
 b=sn3Swk96RgZDzUhaSeqDJgvjfN67gg2BEPIGuSCOJY3UZvlj+hcuTv3cWQlcGgYv4Q
 bAn72d6+oCU1b4A/Hvy06+94uX91goravXujcDvzbh5EFoyf/GgpzeTrzLXdkg/2oYmX
 vW4yvc0yf7E4LtjNnhTdVPVs/OkI4Alyg9jDXAehaZLAXguFos71RPfT/eFfdYjGustq
 +LgpRLfIl91Kx+/jlipPYXeg2BFpTc6MGzBlQZOmwtUUlu/gu1uFVjw6QvwE0WA3nrJV
 iuwUaq32da2k6eU37+s71j9JGInkwfzzjc+hc2kqiB327YpkZuaAErZcHWkUsKVjoFXC
 3lnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkW4RCC3yYRiqd52gACUYVptY///PS689k95oSnaOMjmQmV3zarJjdB1dlW8KOX3/+3BY59TovdoHJ8z89QX+OwNpI6Ay6HpC+DoohKwXp
X-Gm-Message-State: AOJu0Yzqz1NGz1iAxCvhqBrrb1gTRlFbplTOWsYoXg8IKcoaGBsoVoCG
 WEQETRgzqFIKTk0O6iZsr5gwVn/NZ157Z0TDnB1yFU/nySbqp6vBkU8ofpeEWxkuSanLXR+XWdm
 pGcWqonoanK3V0DYDhJxaXw==
X-Google-Smtp-Source: AGHT+IFVl8OTSlqtieEkI8wlprKnHSBkJvt5RLX/AaTjUcSMTHpdrj19ejltSZTNHQk3a+JhkINV8z81NefWgOfVyg==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a0d:d64e:0:b0:609:f0f0:20c4 with SMTP
 id y75-20020a0dd64e000000b00609f0f020c4mr2543290ywd.4.1710805594283; Mon, 18
 Mar 2024 16:46:34 -0700 (PDT)
Date: Mon, 18 Mar 2024 23:46:33 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFjS+GUC/x3NQQ7CIBBA0as0s3aSARpbvIpxUWDQ2dBmUKJpe
 vcSl2/z/w6VVbjCbdhBuUmVtXSYywDxtZQno6RusGRHcmbG+tYStx8mlcZasUniFXNI3HD5GEu
 UA0acQnRu8n4mf4Ue25SzfP+j++M4Tu6YecV4AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710805593; l=1826;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=SWuJT1od1lHkTaQ+y94pwMpDIt4RqOBKy+5+YAjUbf4=;
 b=trEZV2UKkAi41dKgex75moannI2KQl33HA1LGTyC7NWX4DdBAQaDs4goCEd3ncaVz44gcj6o8
 7tqlG14jzZGAGKGyXgxHyxdOo/JVZkY5LfpDC2UOEB9knhmDvAxhv/j
X-Mailer: b4 0.12.3
Message-ID: <20240318-strncpy-drivers-video-fbdev-au1200fb-c-v1-1-680802a9f10a@google.com>
Subject: [PATCH] video: fbdev: au1200fb: replace deprecated strncpy with
 strscpy
From: Justin Stitt <justinstitt@google.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

Let's use the new 2-argument strscpy() which guarantees NUL-termination
on the destination buffer while also simplifying the syntax. Note that
strscpy() will not NUL-pad the destination buffer like strncpy() does.

However, the NUL-padding behavior of strncpy() is not required since
fbdev is already NUL-allocated from au1200fb_drv_probe() ->
frameuffer_alloc(), rendering any additional NUL-padding redundant.
|	p = kzalloc(fb_info_size + size, GFP_KERNEL);

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/video/fbdev/au1200fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 6f20efc663d7..e718fea63662 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1557,7 +1557,7 @@ static int au1200fb_init_fbinfo(struct au1200fb_device *fbdev)
 		return ret;
 	}
 
-	strncpy(fbi->fix.id, "AU1200", sizeof(fbi->fix.id));
+	strscpy(fbi->fix.id, "AU1200");
 	fbi->fix.smem_start = fbdev->fb_phys;
 	fbi->fix.smem_len = fbdev->fb_len;
 	fbi->fix.type = FB_TYPE_PACKED_PIXELS;

---
base-commit: bf3a69c6861ff4dc7892d895c87074af7bc1c400
change-id: 20240318-strncpy-drivers-video-fbdev-au1200fb-c-7bc337998096

Best regards,
--
Justin Stitt <justinstitt@google.com>

