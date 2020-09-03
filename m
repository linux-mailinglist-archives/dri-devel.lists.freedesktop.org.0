Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954825C802
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 19:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58886EA38;
	Thu,  3 Sep 2020 17:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351DF6EA38
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 17:25:07 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id s204so2354890pfs.18
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 10:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=6AY1T/BYMaOLM6rrW9aeA8hU+X+YyLXOqbaG+RF8H0M=;
 b=aS2kG58bmMLSnKgjV5uEDm0tPHq+R8jtjxNbrRy2V7rw4UlPNV+91ze6MbVHZvYObX
 lW2EoKI2aZjjZmHcpM6QvUKdG0mukKQa7r8c1gCixJ6zhYAZSt6n2BhgyHUdoKc5WiJi
 /14i55JenJbdbQ+r6Z1vGXUVaezcatB2RC1A297WWeQ78MVbnPqp4xnfQUMHsACMHYRb
 X4vQy2bo0C1REFI5Oz2oiq5SFTnwWWrKKoe1O4/QMOI+a9WlO/qSMd1+h8B/o3GLdBQE
 eZVwPfRF2x9CExIGunojMFGRWbLV1tfVkojP0YYcPy9c0MIeDyRtcCcY572whhT9CO4I
 qf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=6AY1T/BYMaOLM6rrW9aeA8hU+X+YyLXOqbaG+RF8H0M=;
 b=XAzTadHYpUcICINTkGew0xNcFeLAfsFbzKUdwWcM7f8m45yrzc2NS88WZPGSK6VnYs
 Bf+hcML6rlBiRaIvNZWIN6Lq1gc6ptrBn2w9lyW0+k0HkXdRrmxMnIPTu2/YO+CtxFFH
 4mAFifA+ttb+j4Ls3vPD8t5RHw6tX6x0ZYemTmuuCTSX/ej2QX/6utnF9e2jZEfoBtlA
 XvK/pkUPJMc0OZaj5KhT9TrC92pF189gnuEzY5JDfFySh0L2ZMgKa0mEMuEF4l+PEL3+
 JHYmq0SV2qA89QTrguQVj+bnoI43qT3dv6g2Hei3ggsweuIJxzJOrxKMWaN5tw+4d4yD
 n7Kg==
X-Gm-Message-State: AOAM533VrBLPSAop1dR+rR78jMWlxSlNh9qOFcfPc/ujWWjCI48XLo30
 Qs2nw+YQG1pDB5W4Hhw2VpYt1SpG57VxWXjJgMGabRRqYlJqUhEJaFQgPMYXzwJXuS7iTeMllKz
 sIlq+AAU7IlhKyIBMTgRd0DaSoFKki2SYi7cYya/6HfIF+pV4oVDKNQqaDGfq4qL36nzXQmqyMD
 /k1nw1hA==
X-Google-Smtp-Source: ABdhPJwQdoGEYC03qYkQyO88gWP8C1DlQ/DBvKGXVSZBrqaDBjJ7f6s+WXVjKs8mfwj5R8mo8rmJtG6afNGYUM0=
X-Received: from ikelos.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:5eca])
 (user=hoegsberg job=sendgmr) by 2002:a17:902:ff12:: with SMTP id
 f18mr4903465plj.118.1599153906488; Thu, 03 Sep 2020 10:25:06 -0700 (PDT)
Date: Thu,  3 Sep 2020 17:24:54 +0000
Message-Id: <20200903172454.423798-1-hoegsberg@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH] FROMLIST: udmabuf: Add missing compact_ioctl
From: "Kristian H. Kristensen" <hoegsberg@google.com>
To: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
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
Cc: "Kristian H. Kristensen" <hoegsberg@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure we can use this on mixed systems.

Signed-off-by: Kristian H. Kristensen <hoegsberg@google.com>
(am from TBD)

BUG=b:167236452
TEST=dmabuf_test from drm-tests passes on mixed systems

Change-Id: I4e9f26aedf82a36b9888bb36d41ccd3b7a27365e
---
 drivers/dma-buf/udmabuf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 9635897458a0..6f4ff6ede050 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -270,6 +270,9 @@ static long udmabuf_ioctl(struct file *filp, unsigned int ioctl,
 static const struct file_operations udmabuf_fops = {
 	.owner		= THIS_MODULE,
 	.unlocked_ioctl = udmabuf_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl   = udmabuf_ioctl,
+#endif
 };
 
 static struct miscdevice udmabuf_misc = {
-- 
2.28.0.402.g5ffc5be6b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
