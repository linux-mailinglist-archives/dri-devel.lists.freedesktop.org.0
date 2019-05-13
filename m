Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340051B2A9
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 11:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964E5897B4;
	Mon, 13 May 2019 09:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770FF897B4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 09:16:18 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 1FBC826255
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 09:16:18 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 125E3262F2; Mon, 13 May 2019 09:16:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203471] Tearing on Raven Ridge and RX560X PRIME setup even with
 Vsync enabled
Date: Mon, 13 May 2019 09:16:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203471-2300-m6qTTokIVJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203471-2300@https.bugzilla.kernel.org/>
References: <bug-203471-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM0NzEKCk1pY2hl
bCBEw6RuemVyIChtaWNoZWxAZGFlbnplci5uZXQpIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQg
ICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogICAgICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8bmljaG9s
YXMua2F6bGF1c2thc0BhbWQuY29tCgotLS0gQ29tbWVudCAjOCBmcm9tIE1pY2hlbCBEw6RuemVy
IChtaWNoZWxAZGFlbnplci5uZXQpIC0tLQpUaGUgdGVhcmluZyBvY2N1cnMgYmVjYXVzZSBhbWRn
cHUgZG9lc24ndCBzdXBwb3J0IHNjYXR0ZXIvZ2F0aGVyIHNjYW5vdXQgd2l0aApSYXZlbiB5ZXQs
IHNvIHBhZ2UgZmxpcHBpbmcgY2Fubm90IGJlIHVzZWQuCgpGb3IgdGhlIHRpbWUgYmVpbmcsIHlv
dSBjYW4gZ2V0IHJpZCBvZiB0aGUgdGVhcmluZyBieSBlbmFibGluZyBUZWFyRnJlZToKCiB4cmFu
ZHIgLS1vdXRwdXQgZURQIC0tc2V0IFRlYXJGcmVlIG9uCgpTZWUgdGhlIGFtZGdwdSAoNCkgbWFu
cGFnZSBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCBUZWFyRnJlZS4KCi0tIApZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUg
b2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
