Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2C769FBC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 02:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B78589FAD;
	Tue, 16 Jul 2019 00:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7895689FAD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 00:13:33 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 3FDBE2854F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 00:13:33 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 2657C28563; Tue, 16 Jul 2019 00:13:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204145] amdgpu video playback causes host to hard reset
 (checkstop) on POWER9 with RX 580
Date: Tue, 16 Jul 2019 00:13:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tpearson@raptorengineering.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204145-2300-DvlW20R49N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204145-2300@https.bugzilla.kernel.org/>
References: <bug-204145-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxNDUKClRpbW90
aHkgUGVhcnNvbiAodHBlYXJzb25AcmFwdG9yZW5naW5lZXJpbmcuY29tKSBjaGFuZ2VkOgoKICAg
ICAgICAgICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfHRwZWFyc29uQHJhcHRvcmVuZ2luZWVyaW5nLgogICAgICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8Y29tCgotLS0gQ29tbWVudCAjNiBmcm9tIFRpbW90
aHkgUGVhcnNvbiAodHBlYXJzb25AcmFwdG9yZW5naW5lZXJpbmcuY29tKSAtLS0KSSBqdXN0IHRl
c3RlZCBhbmQgY29uZmlybWVkIHRoaXMgYnVnIGlzIHN0aWxsIHByZXNlbnQgb24gdGhlIGxhdGVz
dCA1LjIuMCsgR0lUCkhFQUQuICBJIGNhbiByZWxpYWJseSByZXByb2R1Y2UgdGhpcyBidWcgYXQg
d2lsbCwgYnV0IGl0IGlzIGEgc29tZXdoYXQgaW52b2x2ZWQKcHJvY2VzcyB0byBnZXQgdGhlIG1h
Y2hpbmUgdXAgYW5kIHJ1bm5pbmcgdG8gdGhlIHBvaW50IHdoZXJlIEkgY2FuIHRyaWdnZXIgaXQK
ZWFjaCB0aW1lIHNvIGJpc2VjdCB3aWxsIGJlIHNsb3cuCgotLSAKWW91IGFyZSByZWNlaXZpbmcg
dGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBi
dWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
