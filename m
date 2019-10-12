Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D41D4F07
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 12:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04056E48D;
	Sat, 12 Oct 2019 10:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3C56E48C
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 10:37:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Sat, 12 Oct 2019 10:37:51 +0000
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
Message-ID: <bug-204241-2300-KVoC4KlX28@https.bugzilla.kernel.org/>
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
b21tZW50ICMyNCBmcm9tIEFoem9AdHV0YW5vdGEuY29tIC0tLQooSW4gcmVwbHkgdG8gQWxleCBE
ZXVjaGVyIGZyb20gY29tbWVudCAjMjIpCj4gQ3JlYXRlZCBhdHRhY2htZW50IDI4NTQ3MyBbZGV0
YWlsc10KPiBwb3NzaWJsZSBmaXggdXZkNgo+IAo+IE5pY2Ugd29yay4gIEkgdGhpbmsgdGhlIGF0
dGFjaGVkIHBhdGNoIHNob3VsZCBmaXggaXQuCgpUaGFua3MgZm9yIGZpbmRpbmcgdGhlIGNvcnJl
Y3Qgc29sdXRpb24uIEkgY2FuIGNvbmZpcm0gdGhhdCB0aGUgcGF0Y2ggZm9yIHV2ZDYKd29ya3Mu
IFRoZSBvbmUgZm9yIHV2ZDcgYWxzbyBsb29rcyBnb29kLCBidXQgSSBkb24ndCBoYXZlIHRoZSBo
YXJkd2FyZSB0byB0ZXN0Cml0LgpGdXJ0aGVybW9yZSwgSSB0aGluayB2Y24gYWxzbyBuZWVkcyBh
IHNpbWlsYXIgY2hhbmdlLiBJJ20gbm90IHN1cmUgYWJvdXQgdmNlLAphcyB0aGF0IHVzZXMgJ2li
X3NpemVfZHcgPSAxMDI0JyB0aHVzIGFsbG9jYXRpbmcgYSBtdWNoIGxhcmdlciBidWZmZXIuCgot
LSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcg
dGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
