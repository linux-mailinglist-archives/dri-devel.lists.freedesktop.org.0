Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5249228392
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 17:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884BF6E2A3;
	Tue, 21 Jul 2020 15:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5E889C99
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:22:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208647] persistent amdgpu: [mmhub] page faults
Date: Tue, 21 Jul 2020 15:22:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nhaehnle@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208647-2300-2MtFs4Q7iK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208647-2300@https.bugzilla.kernel.org/>
References: <bug-208647-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDg2NDcKCk5pY29s
YWkgSMOkaG5sZSAobmhhZWhubGVAZ21haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfG5oYWVo
bmxlQGdtYWlsLmNvbQoKLS0tIENvbW1lbnQgIzMgZnJvbSBOaWNvbGFpIEjDpGhubGUgKG5oYWVo
bmxlQGdtYWlsLmNvbSkgLS0tCkhpIEFsZXgsIEkgYXNrZWQgSmF5IHRvIHJlcG9ydCB0aGlzIGJl
Y2F1c2UgKDEpIHRoZSBmYWN0IHRoYXQgdGhlcmUncyBhIGZhdWx0CmR1cmluZyBib290IGlzIHN1
c3BpY2lvdXMgYW5kIHBvaW50cyBpbiB0aGUgZGlyZWN0aW9uIG9mIHRoaXMgYmVpbmcgdGhlCmtl
cm5lbCdzIGZhdWx0IGFuZCAoMikgdGhlIGZhY3QgdGhhdCBpdCdzIGFuICptbWh1YiogZmF1bHQg
aXMgZXZlbiBtb3JlCnN1c3BpY2lvdXMuCgpDZXJ0YWlubHkgdGhpcyBzZWVtcyB0byBoYXBwZW4g
d2l0aG91dCBNZXNhIHZpZGVvIGVuY29kZS9kZWNvZGUgYWN0aXZpdHksIHNvIGl0CmNhbid0IHJl
YWxseSBiZSBNZXNhJ3MgKG9yIGFueSBncmFwaGljcyBkcml2ZXIncykgZmF1bHQuCgpTb21lb25l
IHN1Z2dlc3RlZCB0aGF0IGF1ZGlvIHN1cHBvcnQgYWxzbyBnb2VzIHRocm91Z2ggbW1odWIgYW5k
IHRoYXQgaXQgbWF5IGJlCnJlbGF0ZWQuIEkgaGF2ZSBubyBpZGVhIGlmIHRoYXQncyB0cnVlLgoK
LS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5n
IHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
