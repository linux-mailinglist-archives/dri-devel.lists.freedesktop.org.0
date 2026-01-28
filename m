Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF0oMS2Qemmz7wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:39:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBCA9AD8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB54510E778;
	Wed, 28 Jan 2026 22:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A1C10E778
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 22:39:36 +0000 (UTC)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-662c6dddba6so1087495eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:39:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769639976; x=1770244776;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iq4sx9bn40pQioEMzOi1lwCHZAwjSgbYPk4fZJYF7VM=;
 b=Vu9Oo3A+cN7U9QFDLW5F77jDZ2K76NplmcqUmrP3riMYCK9/wzLhZAKD5Am+KJlwOy
 ro//HAO6vykpfapGI0mBhTJ+722X4Ns834AR5Ts0dU75HEXBYW+slUpywE/ivFCvm9Q7
 aKqUN9QSmY2+5c9FjKp93EarRuh7pMVirhnvI6t3yvCaLExvPU96noa7cQ38/Zimd/F+
 WLUbOZyEdW6xrTrGUu7AjohBfFypuf4PMs/4UKUEhK6M4Jxyz/zEKLWg6XFZK9hhmQzJ
 38i7myKg5izGXvOgkLN4oqKQ77QB3znIwY0EBPRqUuHEKwOg4pnNbIYcbsDX0RycvYsH
 64jg==
X-Gm-Message-State: AOJu0Yyy4PCvnmVF5OpwMiJqct0tYg5MVuKw5D/mks/ZIR0crCYgCrpM
 r5js7zaoSIh8vULUsbFXkR9p0PKmkqR1sfCeQmPvX+8NBNiG3In5CndD8H9tJEpd+T64pJfiJGV
 u1M7fpIL/NN7IaVfSLNNLojb7uQ/7J5qD1qdzGOQzFHStglDC6swQAQR/iLE=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:82a:b0:662:ffc4:8349 with SMTP id
 006d021491bc7-662ffc4857amr1161846eaf.81.1769639976196; Wed, 28 Jan 2026
 14:39:36 -0800 (PST)
Date: Wed, 28 Jan 2026 14:39:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <697a9028.a70a0220.9914.000b.GAE@google.com>
Subject: [syzbot] Monthly dri report (Jan 2026)
From: syzbot <syzbot+list8add4c53cbe5ac19965e@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[list8add4c53cbe5ac19965e];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 42BBCA9AD8
X-Rspamd-Action: no action

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 1 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 34 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3101    Yes   WARNING in drm_syncobj_array_find
                  https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<2> 2145    Yes   WARNING in drm_wait_one_vblank (3)
                  https://syzkaller.appspot.com/bug?extid=f59157955aba9d0cb43b
<3> 162     Yes   WARNING in drm_atomic_helper_wait_for_vblanks (5)
                  https://syzkaller.appspot.com/bug?extid=fcede535e7eb57cf5b43
<4> 45      Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                  https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<5> 15      Yes   WARNING in dma_buf_vmap
                  https://syzkaller.appspot.com/bug?extid=4317d7108e14e5d56308

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
