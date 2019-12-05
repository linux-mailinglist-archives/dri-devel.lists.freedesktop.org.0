Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC50114541
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 18:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24F66E98E;
	Thu,  5 Dec 2019 17:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5D36E98E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 17:00:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Thu, 05 Dec 2019 17:00:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkbugs@deegan.id.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201539-2300-BKLkoSwO3y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCk1pY2hh
ZWwgKGxrYnVnc0BkZWVnYW4uaWQuYXUpIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJl
bW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAg
ICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8bGtidWdzQGRlZWdh
bi5pZC5hdQoKLS0tIENvbW1lbnQgIzM1IGZyb20gTWljaGFlbCAobGtidWdzQGRlZWdhbi5pZC5h
dSkgLS0tCkkgZGlzY292ZXJlZCBhIHdvcmthcm91bmQgdGhhdCB3b3JrcyBmb3IgbXkgUjktMjkw
IGFuZCBEZWJpYW4gNS4zLjAga2VybmVsOgoKICByb290QGpveW9sYTp+IyBlY2hvICIyIgo+Pi9z
eXMvY2xhc3MvZHJtL2NhcmQwL2RldmljZS9od21vbi9od21vbjMvcHdtMV9lbmFibGUgCiAgcm9v
dEBqb3lvbGE6fiMgZWNobyAiMCIKPj4vc3lzL2NsYXNzL2RybS9jYXJkMC9kZXZpY2UvaHdtb24v
aHdtb24zL3B3bTFfZW5hYmxlIAoKcHdtMV9lbmFibGUgd2lsbCBzdGlsbCBiZSAyIGFmdGVyd2Fy
ZHMsIGJ1dCAoYWZ0ZXIgc3Bpbm5pbmcgdGhlIGZhbnMgYXQgbWF4IGZvcgphIGJpdCkgYXV0b21h
dGljIGZhbiBjb250cm9sIHdvcmtzIGZvciBtZS4gSSBhbHNvIGhhdmUgdG8gZG8gdGhlIHNhbWUK
cHdtMV9lbmFibGUgcHJvZGRpbmcgYWZ0ZXIgcmVzdW1pbmcgZnJvbSBzdXNwZW5kLgoKKElmIGl0
IG1hdHRlcnMsIEkgYm9vdCB3aXRoIHJhZGVvbi5jaWtfc3VwcG9ydD0wIGFtZGdwdS5jaWtfc3Vw
cG9ydD0xCnJhZGVvbi5zaV9zdXBwb3J0PTAgYW1kZ3B1LnNpX3N1cHBvcnQ9MSBhbWRncHUuZGNf
bG9nPTEgYW1kZ3B1LmdwdV9yZWNvdmVyeT0xKQoKSSBzdGlsbCBoYXZlIHRoZSBzYW1lIGJyb2tl
bm5lc3MgYXMgcmVwb3J0ZWQgaW4gY29tbWVudCAxNCB0aG91Z2guCgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9m
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
