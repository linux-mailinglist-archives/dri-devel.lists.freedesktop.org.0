Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFNxIYIMe2k6AwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D73AC9E2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4438010E7DB;
	Thu, 29 Jan 2026 07:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ns3RLCQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD9910E7DB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:30:07 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-45f126d4794so468145b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671806; x=1770276606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9uPR56U6+HkEMqkkUBf99O6pLy4zlZQYDhrfEEe9IY=;
 b=ns3RLCQMyQI+mespKGWSdu3/kTbZQ50KPeZRoYvkNveZOO+jxKbUanAfYRgd5QuwRQ
 fmlw1W/dfXsp++BC4oaj5061yBR2jDfMzVOyvHqLMQ4uTrgVmsRWC7sUxvRk0/xJXIOO
 WM7sxMrbOGHEmH2atxSb6O+NGJ9L3QRATCmCTxuJQpk3gVWjDL7lCORrsizo7Qp27mF2
 d+Wk0dzB0c1isFgWnwo+peYyZ1iemAD//6413T2m5Os/E4v7YanoRsqD5cgrxMrfAAli
 oYiR43bt1pc5y/rcSh+h813sdbf2zdkkSO7kZtJiNiqc/iKA7YDzNaaIeWqk6/uoB8Fe
 H+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671806; x=1770276606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g9uPR56U6+HkEMqkkUBf99O6pLy4zlZQYDhrfEEe9IY=;
 b=wRYMnFmHKB09LKlss6zaCO9U1o1vlEe3XflCeMSuAnDO4OedNqtAKtvIK3JRKHgl0g
 n9Wc6lBdvJ60OJQyCq829kmmC3ge30FrMuyIpcQ22dyKpbWRcdKpzbqqWOcZbUw9wBN8
 dTnJwiF6u0RQ1uWM6RI9CyT3bPtOU+X7lvuMeUpyxFNCnAVuJ2jgsG7UcWJUxqCU97PQ
 VsEGt+RHOU98hBGwdDez6hTAgJaffMt8RYjvkfHqjOKpjAi56M/41xfjrocLi29ucLpl
 fSdkcyWykgv3oLHzSdTI2XuljPr9RHMFArQ4Yb9F+I8FlGqeMe8izVf7wex0l6pRu+Zj
 4DfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+VcxoPKsiWJTQ5NcM9X4zUITDiYaZ2d+LAUfz+nlE5i2ehD0kSdFXVFFaCFirU7RmL3i3oxg1SVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOYZ2peBR77r+lK+odpFhsO1jgr+UCVvK2KL+LyFzU+Mdnv/DP
 LjRoLEaYop9aJr9dBMBf+34LH5M/LWsa5uqg4umrrh+SATxxcVKFqBv+
X-Gm-Gg: AZuq6aKKYQFw1sJIahwMfFM/U8Vq8Vp5/HQqPWQpMtROnfvwKBs+RjitudjOJnvn7fG
 fpgpDDcrGvQDjVHwLhGMOISKlirGUeOizZVXUjK633rvMw08fYeCD08HS/VG8n9S6wKZCNZdasf
 hKVMWHf+pC7lkWoXVjEi4TtXE9aa4gNbekxoT9MlfHQ5pGXDXPYzVk1vKkC4QDcBk7OPU367sN4
 BnVjR4NgVfibiEq86GdvsTcz8Jf9t9Zhgj5JpjQ6ffhz8OJkWBd54i7vnBxUKsRuxBkyUvuH3/B
 N1AHJ3wE7lPzdvLaQAgcr1eyckJKoTA7TuuODwCDR9kOxiKsa2cv/eQRL1e/H4YzOmOHdiC/cfU
 q3rJ7j36cU9mp8rwXJ3Y4IHRAjCrd8CALo0+ufEdL+HS6xAc+e6o5ku/JuAd4qvEGsV9p5f+Ve4
 0N8kJn2SPlPAlwdOq+EOsqhGJxWfntO+hWtcZzChMD
X-Received: by 2002:a05:6808:4fe5:b0:45e:fbe0:1c00 with SMTP id
 5614622812f47-45efc6738c8mr4346166b6e.33.1769671806536; 
 Wed, 28 Jan 2026 23:30:06 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-45f08e23c09sm2693832b6e.9.2026.01.28.23.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:30:06 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, Ye Bin <yebin10@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 04/32] docs/dyndbg: update examples \012 to \n
Date: Thu, 29 Jan 2026 00:28:50 -0700
Message-ID: <20260129072932.2190803-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:yebin10@huawei.com,m:linux-kernel@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org,lwn.net,linux-foundation.org,huawei.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 15D73AC9E2
X-Rspamd-Action: no action

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 095a63892257..4b14d9fd0300 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.52.0

