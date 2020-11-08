Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BFB2AABF6
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 16:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0345289683;
	Sun,  8 Nov 2020 15:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAF389683
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 15:38:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so5709928wme.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 07:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jsDKCT+fDh9zznucKxAI3bxSzPYa/luSBd9FYGoCaQ=;
 b=Nh7Jcy1zGb0+54t8DufVMmRruQrGl2Cj+nuXAZsZjiDClPcnYSO6e27SWkLt+XOGwN
 ogHz/0aUlId1cRuYn8RVuPW+7qdhYm/B0gnvaLAGa9r1g9a37s/+cm0rGYbqCyBzQMS2
 /DCFvouJnhdWBTxsp64nfS7PbxH1NwWSzUNrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1jsDKCT+fDh9zznucKxAI3bxSzPYa/luSBd9FYGoCaQ=;
 b=cZSrNabHOpPKpHZ/s3yEsQjiRNYKdo6rnlL9Ao92P4o3eTLQhg+v9Gg3m3KNhpbQyW
 M1CSedEXiA8OyNaOdkzJ0bZE8efWkXm3g1BOCIBhaN+3odeYYTUKKkUjaJWtedJ1/hBa
 2sPVPUspyv8Y8iT772LAUyYgYEld47OqLQJ3XiqNs7sUP7448GiEn0G4Yc0TYRJ49Eyf
 zSmIzNhWcYovBTsFYrHbZIEhA2rG1hYZWeWCEBvMlmu3xYKMPa3FFH+t3C9CkzAFa7Sk
 X5V4dd/0dIxqGvxmLHRri7TRMfubHVtnGy/yOznBTvexbTAot5G8WteAAbO3yqSC72bn
 Y33w==
X-Gm-Message-State: AOAM533UYFCwzEtWMSa2I0mj60LtSFvq58Igle8bkbRBg3umAN9s11sv
 /uLrENdaatSA3mLP3bgRPqtlJtGF+NpM+SKh
X-Google-Smtp-Source: ABdhPJwFHVFXB8UiGb7b6/3ceqvK6NEYqSegYC6uY4s+bVj4LhzqQxTZUPigLuw8No4bvNvkcdcr8A==
X-Received: by 2002:a1c:7e87:: with SMTP id
 z129mr10005677wmc.176.1604849898806; 
 Sun, 08 Nov 2020 07:38:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j71sm9836041wmj.10.2020.11.08.07.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 07:38:17 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] vt: Disable KD_FONT_OP_COPY
Date: Sun,  8 Nov 2020 16:38:06 +0100
Message-Id: <20201108153806.3140315-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Greg KH <greg@kroah.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Minh Yuan <yuanmingbuaa@gmail.com>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's buggy:

On Fri, Nov 06, 2020 at 10:30:08PM +0800, Minh Yuan wrote:
> We recently discovered a slab-out-of-bounds read in fbcon in the latest
> kernel ( v5.10-rc2 for now ).  The root cause of this vulnerability is that
> "fbcon_do_set_font" did not handle "vc->vc_font.data" and
> "vc->vc_font.height" correctly, and the patch
> <https://lkml.org/lkml/2020/9/27/223> for VT_RESIZEX can't handle this
> issue.
>
> Specifically, we use KD_FONT_OP_SET to set a small font.data for tty6, and
> use  KD_FONT_OP_SET again to set a large font.height for tty1. After that,
> we use KD_FONT_OP_COPY to assign tty6's vc_font.data to tty1's vc_font.data
> in "fbcon_do_set_font", while tty1 retains the original larger
> height. Obviously, this will cause an out-of-bounds read, because we can
> access a smaller vc_font.data with a larger vc_font.height.

Further there was only one user ever.
- Android's loadfont, busybox and console-tools only ever use OP_GET
  and OP_SET
- fbset documentation only mentions the kernel cmdline font: option,
  not anything else.
- systemd used OP_COPY before release 232 published in Nov 2016

Now unfortunately the crucial report seems to have gone down with
gmane, and the commit message doesn't say much. But the pull request
hints at OP_COPY being broken

https://github.com/systemd/systemd/pull/3651

So in other words, this never worked, and the only project which
foolishly every tried to use it, realized that rather quickly too.

Instead of trying to fix security issues here on dead code by adding
missing checks, fix the entire thing by removing the functionality.

Note that systemd code using the OP_COPY function ignored the return
value, so it doesn't matter what we're doing here really - just in
case a lone server somewhere happens to be extremely unlucky and
running an affected old version of systemd. The relevant code from
font_copy_to_all_vcs() in systemd was:

	/* copy font from active VT, where the font was uploaded to */
	cfo.op = KD_FONT_OP_COPY;
	cfo.height = vcs.v_active-1; /* tty1 == index 0 */
	(void) ioctl(vcfd, KDFONTOP, &cfo);

Note this just disables the ioctl, garbage collecting the now unused
callbacks is left for -next.

v2: Tetsuo found the old mail, which allowed me to find it on another
archive. Add the link too.

Acked-by: Peilin Ye <yepeilin.cs@gmail.com>
Reported-by: Minh Yuan <yuanmingbuaa@gmail.com>
References: https://lists.freedesktop.org/archives/systemd-devel/2016-June/036935.html
References: https://github.com/systemd/systemd/pull/3651
Cc: Minh Yuan <yuanmingbuaa@gmail.com>
Cc: Greg KH <greg@kroah.com>
Cc: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/tty/vt/vt.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 9506a76f3ab6..d04a162939a4 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4704,27 +4704,6 @@ static int con_font_default(struct vc_data *vc, struct console_font_op *op)
 	return rc;
 }
 
-static int con_font_copy(struct vc_data *vc, struct console_font_op *op)
-{
-	int con = op->height;
-	int rc;
-
-
-	console_lock();
-	if (vc->vc_mode != KD_TEXT)
-		rc = -EINVAL;
-	else if (!vc->vc_sw->con_font_copy)
-		rc = -ENOSYS;
-	else if (con < 0 || !vc_cons_allocated(con))
-		rc = -ENOTTY;
-	else if (con == vc->vc_num)	/* nothing to do */
-		rc = 0;
-	else
-		rc = vc->vc_sw->con_font_copy(vc, con);
-	console_unlock();
-	return rc;
-}
-
 int con_font_op(struct vc_data *vc, struct console_font_op *op)
 {
 	switch (op->op) {
@@ -4735,7 +4714,8 @@ int con_font_op(struct vc_data *vc, struct console_font_op *op)
 	case KD_FONT_OP_SET_DEFAULT:
 		return con_font_default(vc, op);
 	case KD_FONT_OP_COPY:
-		return con_font_copy(vc, op);
+		/* was buggy and never really used */
+		return -EINVAL;
 	}
 	return -ENOSYS;
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
