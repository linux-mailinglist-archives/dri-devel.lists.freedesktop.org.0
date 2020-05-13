Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC41D2166
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2C6EA9A;
	Wed, 13 May 2020 21:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59D26EA98
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y3so1357087wrt.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJdGXsHD0zUd2QbzbW/I0cKeP4IeBGCB2rpC+2MAeZI=;
 b=bdantqXwbJZtRf8K1mYSwY3s0rsnkVOn4KOdiGMmYTUs2SRGH3Jv8v3lfKjmVpKb0D
 dq+FPq86JI3gIcoKzUP72wPP275IDQqCyyRzzT29Cg8g61hXhvCo+Wu3kAFP2fv5wWre
 V7KVHZzm1R9X4+9eZLkyH86XAgi+HzvJ8nf1b050sHdvLfNZWcBZw96lLSpiVhW7MLae
 ts42GPrel78Xz6ct/586YopmRohDVkg+pQlWMfmWz067xJv8WxBGOk66DgtySkRuUEga
 xxjCqmxTf59JQK+NYgzHnegqg+aUHIA/7WfBrp9NoHOfdUKH8hsydlFTyWhHiZOIEdEg
 DoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJdGXsHD0zUd2QbzbW/I0cKeP4IeBGCB2rpC+2MAeZI=;
 b=Sq5hqHygwA4bszBhkXIGjj1YnOV1q7fMT9SQnaBfYIT8m3xlPuoZPk9A9zH2PSISl8
 gYXr3+3TM83viAGdtww4QEehB82ihCXK//mKpunQ0sjCwNxgF/lSa5wyTrrOjV0MuJNw
 cZjkLDGFbTwyd2f15dLfV3alB8PTaFSJj5piKCt3RtEW/fyFOrmpYLB3SmBO4nP4p8AZ
 uPFL+LN6KMl6e0x9hWx+0bFeLsZIRHr3YbKMQRYNWzOCNlDYMEY73iMlE9UaqMuCJj29
 vFOnHpi2BSEBkMm0Bwxizz1FarHvD457wJv6ZdUyNd79VLu81s4LpUYH3ZURwNyBWJIj
 Ii7Q==
X-Gm-Message-State: AOAM530gbRTgzj9QihcViz+9yTI2FtQ2Qz84WlLi67xKxsDTmw9iEhMU
 7esys+GNmzGiHQGG85pIdPDTNTT+
X-Google-Smtp-Source: ABdhPJwOW0a96inUowDYevyxA5bBc6FGdx6sWbOmF82NP31eWee/F6lJtgBgJewXU8AVUAr+23bjgg==
X-Received: by 2002:a5d:684f:: with SMTP id o15mr1481873wrw.89.1589406408323; 
 Wed, 13 May 2020 14:46:48 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:47 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/11] kernel/power: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:50 +0100
Message-Id: <20200513214351.2138580-10-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
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
Cc: Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 emil.l.velikov@gmail.com, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <len.brown@intel.com>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 kernel/power/poweroff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/power/poweroff.c b/kernel/power/poweroff.c
index 6d475281c730..562aa0e450ed 100644
--- a/kernel/power/poweroff.c
+++ b/kernel/power/poweroff.c
@@ -29,7 +29,7 @@ static void handle_poweroff(int key)
 	schedule_work_on(cpumask_first(cpu_online_mask), &poweroff_work);
 }
 
-static struct sysrq_key_op	sysrq_poweroff_op = {
+static const struct sysrq_key_op	sysrq_poweroff_op = {
 	.handler        = handle_poweroff,
 	.help_msg       = "poweroff(o)",
 	.action_msg     = "Power Off",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
