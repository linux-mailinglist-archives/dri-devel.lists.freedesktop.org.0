Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE9JJS3bo2kNQAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 07:22:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC591CE9A2
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 07:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928A910E1D2;
	Sun,  1 Mar 2026 06:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB8210E1D2
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 06:22:31 +0000 (UTC)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-679862e4413so64546955eaf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 22:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772346151; x=1772950951;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ax6XwEzQZPOvsauWlaZNiqZTM9jSNvqVSMHT3FjYSnI=;
 b=nCCSKsvytaVdGeJKBr4g+QV6gbHXib6P+CltzqPmSVmu429heNBFmUGTR5o4ApHw2J
 b+eleKMEnWvhbhSuoRlahCGo8NFo7FAAQ/gR5qPgEx53+dxw0Pll6ROrhveRKDToLfNS
 Ty6pgnDmIbH3JUeKxtQMIZSMOHILpKIuiri4BBgbwv+Y3cmKszkGW0B4mbFhoCRHctiu
 dLFOjv9tR5fuW49i8vbBD0DPwGirvrYgZHvCYCaGvO46k8JLw5zEU7yVbU3YyXKafLpU
 3/SDCy5YcWPkdUWCmL0k8Xa2WT5z44LV/vg5IeAii92xqSEEbcez1VnhuN9l+F2kw4oa
 zMjA==
X-Gm-Message-State: AOJu0Yw8on0PxnmLFiHbebKRVmvaH9SZf4VB+tvt7yMPSO764hXTpHhH
 5xwcXY0Rgz6aqBLmwaIuaoDLmZdT13JWUxejnhRN8uys+EZ6WWnG3ecFYgcMq00AIxa4ChY4Xt8
 wot02vO8/9OEgz2JufjqRsUIZWP+JK8GKb8W51IZbVpwQSlzfQCD36JQEkPU=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3102:b0:679:9873:5e86 with SMTP id
 006d021491bc7-679faf4bca4mr4656513eaf.61.1772346150910; Sat, 28 Feb 2026
 22:22:30 -0800 (PST)
Date: Sat, 28 Feb 2026 22:22:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a3db26.050a0220.3a55be.0050.GAE@google.com>
Subject: [syzbot] Monthly dri report (Mar 2026)
From: syzbot <syzbot+list6a446cafc8774c4f1de9@syzkaller.appspotmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[list6a446cafc8774c4f1de9];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5CC591CE9A2
X-Rspamd-Action: no action

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 0 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 34 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3350    Yes   WARNING in drm_syncobj_array_find
                  https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<2> 1239    Yes   WARNING in drm_crtc_wait_one_vblank
                  https://syzkaller.appspot.com/bug?extid=c9f3062e1f1e68af836a
<3> 230     Yes   WARNING in drm_atomic_helper_wait_for_vblanks (5)
                  https://syzkaller.appspot.com/bug?extid=fcede535e7eb57cf5b43
<4> 1       Yes   memory leak in drm_mode_atomic_ioctl
                  https://syzkaller.appspot.com/bug?extid=3fc9eecaf97147282c87

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
