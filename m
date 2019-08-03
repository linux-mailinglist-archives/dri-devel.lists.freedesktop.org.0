Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B1880898
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 01:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C916E15E;
	Sat,  3 Aug 2019 23:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B851B6E15E
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 23:21:23 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 411422887A
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Aug 2019 23:21:22 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 3516828889; Sat,  3 Aug 2019 23:21:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204391] Overdrive on AMDGPU does not allow clocks above
 official clocks.
Date: Sat, 03 Aug 2019 23:21:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204391-2300-8qPEgNdqpM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204391-2300@https.bugzilla.kernel.org/>
References: <bug-204391-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQzOTEKCi0tLSBD
b21tZW50ICM0IGZyb20gSGF4azIwIChoYXhrNjEyQGdtYWlsLmNvbSkgLS0tCkFmdGVyIGxvb2tp
bmcgYXQgT3ZlckRyaXZlIGNvZGUgaXQgbG9va3MgbGlrZSB0aGlzIGlzIFBQIHRhYmxlIGlzc3Vl
IG9mIG15IEdQVQpWQklPUyBhcyBpdCBkb2VzbnQgaGF2ZSBPRCByYW5nZSBhbmQgc28gaXQgY2Fu
dCBmaW5kIGl0IHRodXMgb25seSB1bmRlcmNsb2NraW5nCmlzIGFsbG93ZWQuIEhhcmRjb2Rpbmcg
dGhlIHJhbmdlIGluIHRoZSBrZXJuZWwgaXMgc3VyZWx5IGEgaHVnZSBoYWNrIGJ1dCBpbmRlZWQK
d29ya3MgYW5kIGltIGFibGUgdG8gb3ZlcmNsb2NrIHRoZSBjYXJkLgpJdCB3b3VsZCBiZSB1c2Vm
dWwgdG8gaGF2ZSBhbiBrZXJuZWwgYXJndW1lbnQgdGhhdCB3ZSBjYW4gcGFzcyB0cm91Z2ggR1JV
QiB0aGF0CndvdWxkIGp1c3QgZGlzYWJsZSB0aGlzIGNoZWNrIGFzIHNvbWUgbGFwdG9wcyBkb250
IGhhdmUgdGhpcyB0YWJsZS4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVz
ZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
