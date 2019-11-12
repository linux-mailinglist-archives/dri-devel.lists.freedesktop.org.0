Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E86F8F0C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EAE6E3B8;
	Tue, 12 Nov 2019 11:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4786E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:58:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205497] Attempt to read amd gpu id causes a freeze
Date: Tue, 12 Nov 2019 11:58:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: claudius+kernel@hausnetz.lettenbach.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205497-2300-EfBpTqS5CX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205497-2300@https.bugzilla.kernel.org/>
References: <bug-205497-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU0OTcKCmNsc3Qg
KGNsYXVkaXVzK2tlcm5lbEBoYXVzbmV0ei5sZXR0ZW5iYWNoLmNvbSkgY2hhbmdlZDoKCiAgICAg
ICAgICAgV2hhdCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHxjbGF1ZGl1cytrZXJuZWxAaGF1c25ldHoubGUKICAgICAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfHR0ZW5iYWNoLmNvbQoKLS0tIENvbW1lbnQgIzIgZnJv
bSBjbHN0IChjbGF1ZGl1cytrZXJuZWxAaGF1c25ldHoubGV0dGVuYmFjaC5jb20pIC0tLQpJIHRo
aW5rIHRoaXMgbWlnaHQgYmUgYSByZWdyZXNzaW9uIHNpbmNlIHJhZGVvbnRvcCB3b3JrZWQgZmlu
ZSB3aXRoIDQuMTkgb24gbXkKQWNlciBOaXRybyB3aXRoIFJ5emVuIDUgMjUwMFUgUmF2ZW4gKyBQ
b2xhcmlzIFJYIDU2MCAgCgoKVGhlIGZyZWV6ZXMgYXJlIGFsc28gbm90IGluc3RhbnQgSSBnZXQg
YWJvdXQgYSBmZXcgc2Vjb25kcyB1cCB0byBhIGZldyBtaW51dGVzCmJlZm9yZSBpdCBoYW5ncyAo
bWlnaHQgYmUgZGVwZW5kZW50IG9uIGxvYWQpLgoKU29tZSBtb3JlIGluZm9ybWF0aW9uIG1pZ2h0
IGJlIGhlcmU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9jbGJyL3JhZGVvbnRvcC9pc3N1ZXMvODcKCi0t
IApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0
aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
