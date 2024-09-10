Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51E972A54
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF3810E6CD;
	Tue, 10 Sep 2024 07:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jY5TzzUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AEC10E6E4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 02:10:08 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4581d2b0fbaso19701821cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 19:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725934207; x=1726539007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dUxVq/uYkeEKFMBzDLEyObgx5MyTJN7izveNlmy8shU=;
 b=jY5TzzUKffLUAWLQK12cnu3z3WUG3pcWnvlCDwwQDrsJ54AX9HEqB9opEIGbzHWcDX
 D+wykMEddH9WAaP7HnyV9MKIZgJGaLatuVQebW+Jjz2p31C7pycQnTFzidHGJJa88sH6
 7XuEHOCPdqw9ITik21nze8HjvzasNgXTjNYp8MnLGL7bCZvep6/zc4Kqo6gqCpcMHQ36
 RIw/vuK1AhqEbjdHKUdDfWwj0Oo0xS9n4S9tyu9rjsgksA6hRkgq0uZWNxxBdTEQYzZv
 9zY9DDXWYJn7kbeAt+pG5Bwj3p4ob23Yrp8GdG/KdvDXtesumhXkKSdQjmo9CHnT2gzG
 opng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725934207; x=1726539007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUxVq/uYkeEKFMBzDLEyObgx5MyTJN7izveNlmy8shU=;
 b=UpoR2x0ks+zzU5MCzFH16tvkMBzpn1+ZRfZ9uuV52ioQunZjUyqByxR7IyMEtlE2zk
 e7gKAiBoap0EINIxqa+57TsAQiDHMb/vjbXgQK8VJlF/9yR8wlc5s0s5pA5qQCR6JqOJ
 LoTsS9qGyymd2bEdWj+t5tGhNik3lNFwMaqFSufBrG59ayXT9L5NaxoPcNYl1DJiAQZi
 vL222+jwW2iPBa+1JizR8X2dftjK8bXGTknsAdfeSMYiYfrm/qbgbGiVZB4zjqcgcvIp
 bTrWUnzL6Y2/7qm4C+ilPR1urOhSXmED6KhV61apptfK86PENiPlmiVeZg058mwhKhvI
 GZjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzib8h2BEghwJqvgzyOg4rVBVVpG27KEAqm54/y/h5p834D+TolfZ5iAFXvApygXEky5iRzhq7drU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGsHtsE5xO1OFf1LphFrq2Z8vOGwQwQjvnOoc9INEE0yUubNVA
 8JAJlswZzSj4OtQOghISn7wMjE5DWz6qIzF65tmIyKu2HXrOPlgB
X-Google-Smtp-Source: AGHT+IGmeDSS1xPUmyjEW8yUJFMAPO/V2CCsh6Yw95JK0OmbyicAdVkM/O8FfObtrVcamHw/ybV/0Q==
X-Received: by 2002:a05:622a:144c:b0:457:c776:e350 with SMTP id
 d75a77b69052e-4580c75a11dmr124180981cf.46.1725934207271; 
 Mon, 09 Sep 2024 19:10:07 -0700 (PDT)
Received: from shine.lan
 (216-15-0-36.s8994.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [216.15.0.36]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45822f6097fsm25377241cf.63.2024.09.09.19.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 19:10:06 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>,
 Arthur Borsboom <arthurborsboom@gmail.com>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
Date: Mon,  9 Sep 2024 22:09:16 -0400
Message-ID: <20240910020919.5757-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Sep 2024 07:14:50 +0000
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

From: Jason Andryuk <jason.andryuk@amd.com>

Probing xen-fbfront faults in video_is_primary_device().  The passed-in
struct device is NULL since xen-fbfront doesn't assign it and the
memory is kzalloc()-ed.  Assign fb_info->device to avoid this.

This was exposed by the conversion of fb_is_primary_device() to
video_is_primary_device() which dropped a NULL check for struct device.

Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
CC: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
The other option would be to re-instate the NULL check in
video_is_primary_device()
---
 drivers/video/fbdev/xen-fbfront.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 66d4628a96ae..c90f48ebb15e 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -407,6 +407,7 @@ static int xenfb_probe(struct xenbus_device *dev,
 	/* complete the abuse: */
 	fb_info->pseudo_palette = fb_info->par;
 	fb_info->par = info;
+	fb_info->device = &dev->dev;
 
 	fb_info->screen_buffer = info->fb;
 
-- 
2.43.0

