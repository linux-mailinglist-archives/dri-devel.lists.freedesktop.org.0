Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0B774C37
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 12:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021826E6F3;
	Thu, 25 Jul 2019 10:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDEC6E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:52:45 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id D75232899F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:52:44 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id CA80A2899D; Thu, 25 Jul 2019 10:52:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Thu, 25 Jul 2019 10:52:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: accs@21xayah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204181-2300-aNHaPaAp6d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCllhbm4g
SE4gKGFjY3NAMjF4YXlhaC5jb20pIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92
ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAg
ICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8YWNjc0AyMXhheWFoLmNv
bQoKLS0tIENvbW1lbnQgIzE3IGZyb20gWWFubiBITiAoYWNjc0AyMXhheWFoLmNvbSkgLS0tCkkg
d2FzIGZhY2luZyB0aGUgc2FtZSBpc3N1ZSwgQ29tcGxldGUgVmlkZW8gb3V0cHV0IHN0b3AsIFgg
U2VydmVyIHByb2Nlc3Mgd2VudAp1bnJlc3BvbnNpdmUuCgpJIGRpZCBhIEhhcmR3YXJlIHN3aXRj
aCBhIGRheSBiZWZvcmUuCkdQVTogUE5ZIEdUWCAxMDYwIC0+IEFzdXMgVmVnYSA1NgpNYWluYm9h
cmQ6IEFzdXMgWjM3MFAgLT4gTVNJIFozOTBBIFBybwoKQSBmcmllbmQgc3VnZ2VzdGVkIG1lIHRv
IGluc3RhbGwgc29tZSBwYWNrYWdlcyB0byBlbmhhbmNlIHRoZSBHUFUgU3VwcG9ydCwgb25lCm9m
IHRoZW0gd2FzICJ4Zjg2LXZpZGVvLWFtZGdwdSIuCgpTZWFtcyBsaWtlIHRoYXQgcGFja2FnZSB3
YXMgcmVzcG9uc2libGUgZm9yIHRoZSBpc3N1ZXMuClJlbW92aW5nIGl0IGZpeGVkIHRoZSBpc3N1
ZSB3aXRob3V0IGFueSBvdGhlciAobm90YWJsZSkgZWZmZWN0cy4KClNvbWUgbW9yZSBpbmZvIGZv
ciBjb250ZXh0OgpYOiBYLk9yZyBYIFNlcnZlciAxLjIwLjUKRGVza3RvcDogcGxhc21hc2hlbGwg
NS4xNi4zCktlcm5lbDogNS4yLjItYXJjaDEtMS1BUkNIICMxIFNNUCBQUkVFTVBUIFN1biBKdWwg
MjEgMTk6MTg6MzQgVVRDIDIwMTkgeDg2XzY0CkdOVS9MaW51eAoKLS0gCllvdSBhcmUgcmVjZWl2
aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0
aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
