Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6854FF36
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 04:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6035C898C4;
	Mon, 24 Jun 2019 02:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365E2898C4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 02:18:46 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id E147328B0B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 02:18:45 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id E040E28733; Mon, 24 Jun 2019 02:18:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Mon, 24 Jun 2019 02:18:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supasean@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-lmXKACcteG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICMxOSBmcm9tIFNlYW4gQmlya2hvbHogKHN1cGFzZWFuQGhvdG1haWwuY29tKSAtLS0K
SSd2ZSBkb25lIGEgYml0IG9mIGRpZ2dpbmcgYW5kIEkndmUgbWFuYWdlZCB0byBnZXQgYSBwcm9w
ZXIgaHlzdGVyZXNpcyB2YWx1ZSB0bwphcHBlYXIgaW4gYSA1LjEuMTQga2VybmVsIGJ1aWx0IGZy
b20gc291cmNlLgoKSSBub3cgaGF2ZSB0aGlzIG91dHB1dCBmcm9tIHNlbnNvcnM6CgphbWRncHUt
cGNpLTAxMDAKQWRhcHRlcjogUENJIGFkYXB0ZXIKdmRkZ2Z4OiAgICAgICArMS4wMCBWICAKZmFu
MTogICAgICAgICAgICAgTi9BICAobWluID0gICAgMCBSUE0sIG1heCA9ICAgIDAgUlBNKQp0ZW1w
MTogICAgICAgICs2Ni4wwrBDICAoY3JpdCA9ICsxMDQwMDAuMMKwQywgaHlzdCA9ICs5MC4wwrBD
KQpwb3dlcjE6ICAgICAgIDI5LjAyIFcgIChjYXAgPSAyMDguMDAgVykKCkkgZG9uJ3Qga25vdyB3
aHkgcHJvcGVyIHZhbHVlcyBhcmUgbm90IHNldCBhdXRvbWF0aWNhbGx5IGJlY2F1c2UgSSd2ZSBm
b3VuZCB0aGUKY29ycmVjdCB2YWx1ZXMgaW4gdG9ucyBvZiBzb3VyY2UgZmlsZXMgYnV0IG5vbmUg
b2YgdGhlICNkZWZpbmVzIGFwcGVhciB0byBiZQp1c2VkPyAgQW5kIG11Y2ggb2YgdGhlIHNvdXJj
ZSBkb2Vzbid0IGFwcGVhciB0byBkaWZmZXIgYmV0d2VlbiA1LjEuMTQgYW5kCjQuMTgueAoKSSBt
b2RpZmllZCAoa2VybmVsIHNyYykvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3Bw
X3RoZXJtYWwuaCBhbmQKY2hhbmdlZCB0aGUgdmFsdWVzIG9mIC0yNzMxNTAgdG8gOTAwMDAuICBU
aGlzIGNvcnJlY3RzIHRoZSBoeXN0ZXJlc2lzIHZhbHVlIGJ1dApJJ20gc3RpbGwgc2VhcmNoaW5n
IGZvciB3aGVyZSB0aGUgY3JpdGljYWwgdGVtcCB2YWx1ZSBpcyBhY3R1YWxseSBzZXQuCgpJICp0
aGluayogZml4aW5nIHRoZXNlIHZhbHVlcyBtYXkgZml4IHRoZSBmYW4gcHJvYmxlbSBiZWNhdXNl
IHdoeSB3b3VsZCBhIGZhbgpzcGluIHVwIGlmIGl0cyBub3doZXJlIG5lYXIgdGhlIGNyaXRpY2Fs
IG9yIGh5c3RlcmVzaXMgdmFsdWVzPyAgTm8gbmVlZC4gCkV4Y2VwdCB3aGVuIHRoZSBjcml0aWNh
bCB2YWx1ZSBpcyAxOXggdGhlIHRlbXAgb2YgdGhlIHN1biwgdGhlIGNhcmQgZ2V0cyBzbyBob3QK
aXQgcHJvdGVjdHMgaXRzZWxmIGJ5IG1heGluZyB0aGUgZmFucyBmb3IgYSBzaG9ydCBidXJzdC4g
IFRoYXQgaXMgbXkgdGhlb3J5CmFueXdheSwgaG9wZSB0byBiZSBhYmxlIHRvIHRlc3QgaXQgc29v
biBidXQgbm8gcHJvbWlzZXMuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1
c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
