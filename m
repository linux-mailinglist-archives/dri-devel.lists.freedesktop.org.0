Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24F9DA13
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 01:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5F9892FD;
	Mon, 26 Aug 2019 23:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4E4892FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 23:42:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204227] Visual artefacts and crash from suspend on amdgpu
Date: Mon, 26 Aug 2019 23:42:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tones111@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204227-2300-BDgQK7LzQS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204227-2300@https.bugzilla.kernel.org/>
References: <bug-204227-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyMjcKCnRvbmVz
MTExQGhvdG1haWwuY29tIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAg
ICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAgICAgICAg
ICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8dG9uZXMxMTFAaG90bWFpbC5jb20K
Ci0tLSBDb21tZW50ICM0IGZyb20gdG9uZXMxMTFAaG90bWFpbC5jb20gLS0tCkknbSBzZWVpbmcg
dGhlIHNhbWUgcHJvYmxlbXMgd2hlbiBydW5uaW5nIDUuMi54IHRoYXQgd2VyZSBub3QgcHJlc2Vu
dCBpbiA1LjEuIApUaGUgY29tbWl0IGFib3ZlIGlzIHRoZSBzb3VyY2Ugb2YgdGhlIHZpc3VhbCBh
cnRpZmFjdHMsIGJ1dCBJIGJlbGlldmUgdGhlCmxvY2t1cCBpc3N1ZSB3YXMgaW50cm9kdWNlZCBs
YXRlci4gIElzIHRoZXJlIGFueSBoZWxwIEkgY2FuIHByb3ZpZGUgaW4gdGVzdGluZwphIGZpeD8g
IAoKSXQgbG9va3MgbGlrZSB0aGVyZSBtaWdodCBoYXZlIGJlZW4gc29tZSBwcmV2aW91cyBlZmZv
cnQgaGVyZToKaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvYW1kLWdmeC9tc2czMjE5Mi5o
dG1sCgoKSSBjcmVhdGVkIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MjA0NjExIHRoYXQgY2FuIGJlIHVzZWQKdG8gdHJhY2sgdGhlIGxvY2t1cCBpc3N1ZS4KCi0t
IApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0
aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
