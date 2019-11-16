Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351D1FF55F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 21:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A5B6E1B2;
	Sat, 16 Nov 2019 20:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022C26E1B2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 20:06:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205497] Attempt to read amd gpu id causes a freeze
Date: Sat, 16 Nov 2019 20:06:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205497-2300-xVjbtEtoLE@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU0OTcKCi0tLSBD
b21tZW50ICMxOCBmcm9tIEx1eWEgVHNoaW1iYWxhbmdhIChsdXlhQGZlZG9yYXByb2plY3Qub3Jn
KSAtLS0KUmVhZGluZyBhbm90aGVyIGJ1ZyByZXBvcnQgb24KaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2ODkgdGFrZW4gZnJvbSBhbWRnZnggbWFpbGluZwps
aXN0LCBjb3VsZCB0aGF0IGlzc3VlIHJlbGF0ZWQ/CgpBbnl3YXksIHJhZGVvbnRvcCBzdGlsbCBy
dW5zIHdpdGggdGhlIHBhdGNoZWQga2VybmVsLiBObyBub3RpY2VhYmxlIGZyZWV6ZSBhbmQKSSB0
ZXN0ZWQgd2l0aCBCbGVuZGVyIHJlbmRlcmluZyB0aGUgb2xkIFJ5emVuIENQVSAzRCBtb2RlbCB3
aXRoIEdQVSBjb21wdXRlCnJ1bm5pbmcgb24gcm9jbS1vcGVuY2wgKHdoaWNoIG5lZWRzIG9wdGlt
aXphdGlvbiBjb21wYXJlZCB0bwphbWRncHUtcHJvLW9wZW5jbCkuCgpUbyBBbGV4LCB3aWxsIGl0
IHBvc3NpYmxlIHRvIHByZXBhcmUgdGhlIHBhdGNoIGluIHRoZSBwYXRjaHdvcmsua2VybmVsLm9y
Zz8KVGhhbmtzLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3Ug
YXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
