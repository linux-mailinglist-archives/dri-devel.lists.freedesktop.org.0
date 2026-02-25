Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPx6Mxzvnmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:46:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC191978BA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6566E10E284;
	Wed, 25 Feb 2026 12:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inPWD++V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1D910E08B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 12:46:15 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so40663895e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 04:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772023574; x=1772628374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RW5tR77UgvK8ARjklYqEELQ6BbsvTHEuy834pDeZrFA=;
 b=inPWD++VGYZ3AsY7kXzol9LpHfA7RKKZggkxCs5YC53P4+iFHB8HKvqZVHFzHw/S6A
 1SeC3i6HOmOLK6jkyetnzg1FORn6ZhIhXXwgVLDsIjYYO+Gi6fu5heYfuRUfRCpUzAoN
 AIfXH20QvOn1bBB5q8ToXLsQuw6bThOWet8ks4MFidRYRhAUOm07Y7OIUdYU4VZd1mxt
 rJWWIAAntOo/yc41NbxJ61urFT/BgKXEb81vCoHpDA2tH8QSkPbZF5QX9hnEhP1QsAPo
 2ED//sEB64wy/OGwz1eSl5curFfl17fu7zfRCNJo8sABqr9nlDYiigTJ3S3+RuznvbaL
 6mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772023574; x=1772628374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RW5tR77UgvK8ARjklYqEELQ6BbsvTHEuy834pDeZrFA=;
 b=EvZ2esKWeD0f0qfrtwqxjdYPfwYygecn7ztp/D4WGXfRXsWyDfcbEmwWnWrR+2h6IH
 BMxren4OxnvV4HtX/UeTUDUEFsm4iJbXGQTtOdHM4+hyPbc6Ggy3MjzO6+VrlEUya6HI
 RvezUT3aFHFG8MJ6mmtmrhQHlCoZlP0q/BpYJscfWe8jQkES9NU7Mj9DaWnIbZaXuyjc
 7gid8iWiDXk6Qk7GnuwNHV2suGpsnRzfaIxIRMSRzy+1pMs9yongzSZy1fyxoJjyn/HL
 v7Qa1+nt348lQhhhEWy23EsFq2aVB9xFN6WeB4nWp0//LpjymdqX0bRczt6mGaf0fEQZ
 r2ug==
X-Gm-Message-State: AOJu0Yx4Q0QDw+5OAX7WdepoYsAdCmxJuWDDATvfIe5XL3aY0DuzE0ac
 5AWsHoqYxGkmvEyWjk8CxFE8qU/M7gLS4M277Vr/GCGzx69nSFsKXOkzFW7AiIRd
X-Gm-Gg: ATEYQzzJBQRBrbgh/uJQqZe3twh8imjLbeUfAHqLk8pTB+YqCeorojX+/4kVcZhUX71
 mLoH7UJAfZxpuJwYJN5F29sC78RkIA/JSrqp1/0TPvtoASf7LNpJt0e2tTdVor1WoeuloYoVBne
 13D6+gD/q0lpgFuNkgeAC0geXUY8/0WiKVUhGIAMi43gqdtqjXXq53gNmuRx1cH0rJDgfrOy0rC
 bkcTrufsiRlGo65PLyP4cLukRUOfIKGaSb8QLDIcijSlbo2mo2vbDkGSXi3fNclHJxNlqkyPipq
 INIx3IEbctw//woQTbSAOFIRqfuTSIy6hiIejf1KG+vUhHQoEY13p5xmRvx12e50jhwiSKe3fWF
 wJ9dHsaZgwt2IeQWwEIfsu1BU5TiQ6VVgc8EYmbKRnK+t3WnmnrqWRVBcBtyFAuqXMT/QWL2uhV
 7TpetJ+aujQl9w3kh0X35Ywd4D1jbH1ee6BTc0gFIWsfTcL++E9HS84b788hWKeG1tYaxI
X-Received: by 2002:a05:600c:1d12:b0:483:5310:dc67 with SMTP id
 5b1f17b1804b1-483c219b626mr3888685e9.20.1772023573831; 
 Wed, 25 Feb 2026 04:46:13 -0800 (PST)
Received: from Arch-Spectre.dur.ac.uk ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcb9b97sm18419995e9.7.2026.02.25.04.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 04:46:13 -0800 (PST)
From: Yicong Hui <yiconghui@gmail.com>
To: christian.koenig@amd.com,
	michel.daenzer@mailbox.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Yicong Hui <yiconghui@gmail.com>
Subject: [RFC PATCH v3 0/3] Querying errors from drm_syncobj
Date: Wed, 25 Feb 2026 12:46:06 +0000
Message-ID: <20260225124609.968505-1-yiconghui@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:yiconghui@gmail.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3EC191978BA
X-Rspamd-Action: no action

This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
codes from multiple syncobjs and abort early upon error of any of them.

Based on discussions from Michel Dänzer and Christian König, and a
starter task from the DRM todo documentation.

See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for discussions
on userspace implementation.

I have looked into adding sub test cases into syncobj_wait.c and
syncobj_timeline.c, igt-tests for this and I think I understand the 
process for writing tests and submitting them, however, these ioctls 
only trigger in the case that there is an error, but I am not sure what
is the best way to artifically trigger an error from userspace in order
to test that these ioctl flags work. What's the recommended way to 
approach this?

---
Changes:
v3:
* Fixed inline comments by converting to multi-line comments in
accordance to kernel style guidelines.
* No longer using a separate superfluous function to walk the fence
chain, and instead queries the last signaled fence in in the chain for
its error code
* Fixed types for error and handles array.
* Used dma_fence_get_status to query error instead of getting it
directly.

v2:
https://lore.kernel.org/dri-devel/20260220022631.2205037-1-yiconghui@gmail.com/T/#m6ab4f94a19c769193895d7728383f84e452cbbfa
* Went from adding a new ioctl to implementing flags for existing
ones.

v1:
* https://lore.kernel.org/all/20260213120836.81283-1-yiconghui@gmail.com/T/#mfdbc7f97e91ca5731b51b69c8cf8173cb0b2fb3e

Yicong Hui (3):
  drm/syncobj: Add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR to query errors
  drm/syncobj: Add DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR ioctl flag
  drm/syncobj/doc: Remove starter task from todo list

 Documentation/gpu/todo.rst    | 16 ------------
 drivers/gpu/drm/drm_syncobj.c | 49 ++++++++++++++++++++++++++++++-----
 include/uapi/drm/drm.h        | 11 ++++++++
 3 files changed, 54 insertions(+), 22 deletions(-)

-- 
2.53.0

