Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9A490B0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D52589E1A;
	Mon, 17 Jun 2019 20:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B13289E1A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:01:01 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 1D1992886F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:01:01 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 117A82887E; Mon, 17 Jun 2019 20:01:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203879] hard freeze on high single threaded load when Xorg is
 active (AMD Ryzen 7 2700X CPU, AMD Radeon RX 580 GPU)
Date: Mon, 17 Jun 2019 20:01:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: claude@mathr.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-203879-2300-4ZUDeNfinv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203879-2300@https.bugzilla.kernel.org/>
References: <bug-203879-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM4NzkKCi0tLSBD
b21tZW50ICM0IGZyb20gQ2xhdWRlIEhlaWxhbmQtQWxsZW4gKGNsYXVkZUBtYXRoci5jby51aykg
LS0tCkNyZWF0ZWQgYXR0YWNobWVudCAyODMzMTMKICAtLT4gaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTI4MzMxMyZhY3Rpb249ZWRpdApkbWVzZyBhZnRlciBi
b290IHdpdGggaWRsZT1ub213YWl0IChiZWZvcmUgZnJlZXplIHdoaWNoIG9jY3VyZWQgc29tZSBo
b3VycwpsYXRlcikKCkkgZ290IG9uZSBmcmVlemUgc28gZmFyIGFmdGVyIGFib3V0IGFuIGhvdXIg
b24gbXkgd29ya2xvYWQgd2l0aCBpZGxlPW5vbXdhaXQsCnRyeWluZyBhIHNlY29uZCB0aW1lIGp1
c3QgdG8gdmVyaWZ5IHRoYXQgaXQgZG9lc24ndCBoZWxwLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5n
IHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUg
YnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
