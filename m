Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBAtDFHIkmm6xgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 08:33:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C21114146D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 08:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8F810E19F;
	Mon, 16 Feb 2026 07:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EABC10E178
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 07:33:33 +0000 (UTC)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-66b612efb4aso23790000eaf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771227212; x=1771832012;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oszJiYXW2jUdIYGvJwGOEYJrCKpsxyEFKRztwldFWfQ=;
 b=CvDsrBnDwMBZ09Ns57p+s4mXxEO7MAVWFOcK7+TlU2MhBWReD8vOrMrLaejavq2B68
 oEmT84HQFwmhrKu1Z0uAeWyZxePAFmGdXn4RT1KF2Y18x/fqq9CmRM86zNZ7U7dlJVCa
 B+Vorqc28Q9WKFRG36wE7v4Q740GJehFyHGhF39ATBEioOZv5677lajeHZ/FJ2Lu+JtD
 RodMP44FLKbL76waRTItnY7sr8ojhc4Jxbx6hfbGgFFnRFqV8pUVSrdByjv6LDKZZ/0U
 Txb6z9959bHfKnXCbqk5zF3u1klJLIwkFr1HOwkTo4aErSLe8WCVOX2nvYpn/txQwGyL
 c5EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT+IdtoybTsqEV4qwOcHb7B2WbZsKmUr8lQhyjCeEbvwyW5l8TQ7phSFW1Tjl2Qdm0Zoaqc/fGfjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNWIZDCcCu0BZqOBC69aiaTt0R7VQZGlfjXG+N815GHQ1MMvZI
 /l4qAJB7f0TERN+6cjyWl288H7SmSf6ZIMbIrQIIVeuVBeWcX4YMPLH53EvGVd7DXa/PTbjNy0v
 rvBdV2q55eM/zF22HKUfQn2UPC8QN3SQl7ywrEUEMSysAa588YPbGTPTAstE=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4513:b0:676:9bb8:6c4f with SMTP id
 006d021491bc7-67822b6e9b5mr3909631eaf.29.1771227212647; Sun, 15 Feb 2026
 23:33:32 -0800 (PST)
Date: Sun, 15 Feb 2026 23:33:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6992c84c.a70a0220.2c38d7.00e8.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (Feb 2026)
From: syzbot <syzbot+list8fe82fc6b86d74c9049a@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,lists.freedesktop.org,vger.kernel.org,googlegroups.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_FROM(0.00)[list8fe82fc6b86d74c9049a];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,googlegroups.com:email,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 7C21114146D
X-Rspamd-Action: no action

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 29 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1321    Yes   KASAN: slab-out-of-bounds Read in fbcon_prepare_logo
                  https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083
<2> 1281    Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (6)
                  https://syzkaller.appspot.com/bug?extid=5a40432dfe8f86ee657a
<3> 161     No    KASAN: vmalloc-out-of-bounds Write in fillrect
                  https://syzkaller.appspot.com/bug?extid=7a63ce155648954e749b
<4> 9       No    KASAN: slab-out-of-bounds Read in soft_cursor (2)
                  https://syzkaller.appspot.com/bug?extid=ae44b38396335bd847cd

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
