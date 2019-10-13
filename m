Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C255D55AE
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 12:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4606E0DF;
	Sun, 13 Oct 2019 10:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B716E0DF
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 10:47:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Sun, 13 Oct 2019 10:47:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Ahzo@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204241-2300-GjItO1lQGx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCi0tLSBD
b21tZW50ICMyOCBmcm9tIEFoem9AdHV0YW5vdGEuY29tIC0tLQooSW4gcmVwbHkgdG8gQW5kcmVh
cyBKYWNraXNjaCBmcm9tIGNvbW1lbnQgIzI3KQo+IEluIGJyaWVmIC0gdGhlIHBhdGNoCj4gIjAw
MDEtZHJtLWFtZGdwdS11dmQ2LWZpeC1hbGxvY2F0aW9uLXNpemUtaW4tZW5jLXJpbmctdGVzdC5w
YXRjaCIgZGlkbid0Cj4gd29yayBmb3IgbWUuIEFmdGVyIGFib3V0IDEwIHN1c3BlbmQvcmVzdW1l
IGN5Y2xlcyB0aGUgdHlwaWNhbCBpc3N1ZSBvY2N1cnJlZAo+IGFnYWluIGFuZCBJIGhhZCB0byBT
eXNScSB0aGUgc3lzdGVtLgoKSW5kZWVkLCB0aGUgMDAwMS1kcm0tYW1kZ3B1LXV2ZDYtZml4LWFs
bG9jYXRpb24tc2l6ZS1pbi1lbmMtcmluZy10ZXN0IHBhdGNoCihhdHRhY2hlbWVudCAyODU0NzMp
IGRvZXNuJ3Qgd29yay4KQXBwYXJlbnRseSBJIGdvdCAodW4pbHVja3kgZW5vdWdoIHRoYXQgaXQg
c3Vydml2ZWQgMzAgc3VzcGVuZC9yZXN1bWUgY3ljbGVzLApidXQgdGVzdGluZyBpdCBhZ2Fpbiwg
aXQgZmFpbGVkLgoKT24gdGhlIG90aGVyIGhhbmQsIHRoZQowMDAxLWRybS1hbWRncHUtdXZkNi11
c2UtMC1hcy1kdW1teS1wb2ludGVyLWluLWVuYy1yaW5nLXQgcGF0Y2ggKGF0dGFjaGVtZW50CjI4
NTQ2OSkgc3Vydml2ZWQgMTAwIGN5Y2xlcy4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1h
aWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
