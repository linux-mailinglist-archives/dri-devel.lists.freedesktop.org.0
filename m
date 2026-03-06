Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCC3KJiGrWkn4AEAu9opvQ:T2
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0141230AA7
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DAD10E18D;
	Sun,  8 Mar 2026 14:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bErh4OoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610C310E3FB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 20:58:24 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b94358796a1so120308666b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772830703; x=1773435503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jwO02ZCPgD0VxK8Lt5yXmyrunUSd8TBuKbL6rr91DD0=;
 b=bErh4OoEozp+URkc8eTwhxPnVhHJIkuBNlSQ1rOTyZ9LG37atBaxJgajrqVperQYV8
 iXKH0g7XKFVweByFjpFRndM/YlaccVU5Bp7HW3/Xq5QP/gv4EBPaaFgxCYwJ3CDkdMpx
 WRH+UBCEsAIVgnB+6MuSPsWUk/c0FKEreo35tmeaEvFUTVaex0O5xS3Y0Q5QTqT1IOss
 z+/vImxptUCUduApyd+9XVnkfMeTRoaKQM+TkHYrNJYJmtJ4VO/xYex17Os6Yzbz13cx
 udMKY2xBeW0LYb2O7qRHhzEpZv5SR+odM0mTssNT4g2riamli2cau2DCsTyFYJuDYNmE
 mI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772830703; x=1773435503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwO02ZCPgD0VxK8Lt5yXmyrunUSd8TBuKbL6rr91DD0=;
 b=mbcoOxeYRsmUkXbmI+qnvYsqBVoUui+Dpae1M3dAci+tqipidjOMk3Y966TgkuP3s8
 d099CyZm8/e2MxSjK+l5s4DAfeGlc4mmJO7ZeZwGnIUhJeRkSoRbzdl8qUrhMa4I8AWu
 Kbe387gcnzQsarLwUlghniqYmhBebuNLJcSLbWg4EHe0SCpPtR46zZIqRDHHtdzMyMB5
 gzw1hFY0OrfDVXQaYYAEYsPDWE0AJwG0jUnb/SRb2dK+TIKoyWH1/Q2gPDoPu8+gjjVM
 37FWAMk5J1t4xT4kM0+z5lKwF51J6YULOUJJ9TCEgD7Dygj4XKDCZU52nymZzKQMRaMJ
 qFug==
X-Gm-Message-State: AOJu0Yx8zXtxCmry2vmqdpedHFMY9WajAkIoGQJwJ28iWxPGc941CV3J
 tgYWKLsVLcvt5twrT+PE8luLTD8K95H++QGeeWdUO7i/yEHk775E7o4j
X-Gm-Gg: ATEYQzz06qjEpQWW+aOjng4H9fBOGJCgDc8/BnLY8ssg+rxAqwviYX+x9WrQgiaeVtS
 nXd2+Lv9H6Qb4vf/pfIMIVhAgNvlJ8zKyZ9XD/3KL60IX0ebQ1SE6JKHp3jRUwOihglKYaVrdhe
 9bNCp97XcJUCkOxBPNQAgkZ5a106i5BB/8mKF91wdYEiOl4sLWfA1XebPeSXzreWX7KX4ug0OBA
 btnfWuuAfnFQg00MBeE1U6kK2+J7dyfznxwGmjlctDuTlOkXr34/oirWkTf417ITHTou0o7dQ++
 yGJsH4PlZVRE7GKnyyGnvjMgFq8dCCfFl5Gi9TvobPK16cLTjgPk+NA6sBeOdcZs+aaPxEtmJVm
 RqJpBeSayYr9GIM182Tvnz05d95TTnIBLPMLAD2Y9iUJWANeKLR847+5NaDacUZaqGZbILQfzx/
 b6P5ItzT8Pf4FVq9shGWScmLBaxV2S4NUyLe5pGmVuT8vY6G8WrdZGe3gNGTsLcvyxRltmu0S9R
 PJSheKCLufNEnE9wu8v6e41SwRBKHZFPju2hSM+q/NDyOc=
X-Received: by 2002:a17:907:3e10:b0:b8f:e424:ae56 with SMTP id
 a640c23a62f3a-b942e107988mr220848066b.44.1772830702548; 
 Fri, 06 Mar 2026 12:58:22 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl.
 [84.24.131.219]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b942f18baadsm89155066b.67.2026.03.06.12.58.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 06 Mar 2026 12:58:21 -0800 (PST)
From: Mikael Rothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mikael Rothig <mrrothig@gmail.com>
Subject: [PATCH v2] docs/gpu: fix spelling mistakes in todo.rst
Date: Fri,  6 Mar 2026 21:57:39 +0100
Message-ID: <20260306205754.65746-1-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: A0141230AA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[41];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mrrothig@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrrothig@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Signed-off-by: Mikael Rothig <mrrothig@gmail.com>
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..686a94bead07 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -269,7 +269,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -294,7 +294,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -882,7 +882,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.49.0

