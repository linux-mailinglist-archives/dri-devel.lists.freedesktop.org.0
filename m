Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01018226EDE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6F589C89;
	Mon, 20 Jul 2020 19:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BCF89C89
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595272738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=1Kbu8ZJB+PbpYpnvxeXN5DGnvBoImp+SwBun1XbwpDw=;
 b=aOXA4FCQus5Itc3vMr6FD/o8xcf0sxckTgJLJgHCCmOCIin6I9eH0uOiRazOefTIQNelPE
 ygPs0ai5s7s6ssODxKiuiRX9mY93BrC49+Q0k6sR6OhP7UiLp5rlFn5NVG0fMlIDSGmVBa
 /tS0A6fYKjCIHP8ntGledXwe10+dDzI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-eO3LTH5hNEGg_MwHf3iHtQ-1; Mon, 20 Jul 2020 15:18:53 -0400
X-MC-Unique: eO3LTH5hNEGg_MwHf3iHtQ-1
Received: by mail-qk1-f198.google.com with SMTP id k16so12075155qkh.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 12:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1Kbu8ZJB+PbpYpnvxeXN5DGnvBoImp+SwBun1XbwpDw=;
 b=XW9LHb6d5wpLeO9gd38XvOBqNcl27RWmTmi1hLmpIaqdg1LnS0oyaw9JLSh5+bnkyp
 AiNORWw+8loCE6ccNKJv2ltojotVVk3SvG3+W0bcNrQFzBw5bjERskZSyZU1o/yclIIn
 q2qeCS2XouuR80FsbmAJgbvqaHN+HtsF+Ba2YdQnhNktDJc3atVGEjt5oB7JSUceUI0e
 ACG0+8Fkvccxh7DQNIB711u6WTDNyfm0zJg4SPqXVwoMnLKMZYQAvc9hVpubqRV3zrkU
 yZV5GdUT2C59HPFu6xPcEo/JvI8VkUdug68WBT00lFyNLj/d5WWtsaW70qo8h9rEWgHu
 9JHw==
X-Gm-Message-State: AOAM532tyxvbOv9JylzTPH+46uhDbPNkYhRWwiDVcpWSNl42Fv+2Qid2
 2Rop6M4hAKl9aL3TZTvUXjOK9T/XJ9b0os1RHI1ytwdVbPFOAqj/52maskAXFz3t5RJXK+8DRbw
 DmqCAt9sBfT1LXK4IIVLl/Uw55wLY
X-Received: by 2002:ac8:bc2:: with SMTP id p2mr26252069qti.374.1595272733356; 
 Mon, 20 Jul 2020 12:18:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnHhkZMNBQS0nyRzKMd1uLYdyrRKd2rgZ6H9zo8r0jm3gmVaJyLQcNPC2s6t9n52ICM5SvqQ==
X-Received: by 2002:ac8:bc2:: with SMTP id p2mr26252034qti.374.1595272733050; 
 Mon, 20 Jul 2020 12:18:53 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id c80sm335957qkg.72.2020.07.20.12.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 12:18:52 -0700 (PDT)
From: trix@redhat.com
To: b.zolnierkie@samsung.com, jhubbard@nvidia.com, sam@ravnborg.org,
 daniel.vetter@ffwll.ch, gustavo@embeddedor.com, arnd@arndb.de,
 jani.nikula@intel.com
Subject: [PATCH] video: fbdev: pvr2fb: initialize variables
Date: Mon, 20 Jul 2020 12:18:45 -0700
Message-Id: <20200720191845.20115-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis reports this repesentative error

pvr2fb.c:1049:2: warning: 1st function call argument
  is an uninitialized value [core.CallAndMessage]
        if (*cable_arg)
        ^~~~~~~~~~~~~~~

Problem is that cable_arg depends on the input loop to
set the cable_arg[0].  If it does not, then some random
value from the stack is used.

A similar problem exists for output_arg.

So initialize cable_arg and output_arg.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/pvr2fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 2d9f69b93392..f4add36cb5f4 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -1028,6 +1028,8 @@ static int __init pvr2fb_setup(char *options)
 	if (!options || !*options)
 		return 0;
 
+	cable_arg[0] = output_arg[0] = 0;
+
 	while ((this_opt = strsep(&options, ","))) {
 		if (!*this_opt)
 			continue;
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
