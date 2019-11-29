Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA410DA86
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 21:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91266E997;
	Fri, 29 Nov 2019 20:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4446E9B5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 20:16:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205585] [Regression] [amdgpu] AMD Vega 64 GPU invalid access
 and EEH under load
Date: Fri, 29 Nov 2019 20:16:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205585-2300-c1DqQKOegz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205585-2300@https.bugzilla.kernel.org/>
References: <bug-205585-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1ODUKCi0tLSBD
b21tZW50ICM1IGZyb20gQWxleCBEZXVjaGVyIChhbGV4ZGV1Y2hlckBnbWFpbC5jb20pIC0tLQpU
aGlzIGRvZXNuJ3QgbG9vayByZWxhdGVkIHRvIHRoZSBmaXJzdCBvbmUuICBUaGUgZmlyc3Qgb25l
IGlzIGEgdmVnYTEwIGFzaWMKYWNjb3JkaW5nIHRvIHRoZSBkZXNjcmlwdGlvbiwgdGhlIHNlY29u
ZCBvbmUgaXMgZnJvbSBhIG9sZGVyIFZJIGFzaWMuIAptbUhEUF9NRU1fQ09IRVJFTkNZX0ZMVVNI
X0NOVEwgaXMgYSByZWdpc3RlciB0aGF0IHRoZSBkcml2ZXIgdXNlcyB0byBmbHVzaCBhbmQKaW52
YWxpZGF0ZSB0aGUgY2FjaGUgb24gdGhlIGZyYW1lYnVmZmVyIEJBUiAoZm9yIENQVSBhY2Nlc3Mg
dG8gdGhlCmZyYW1lYnVmZmVyKS4gIFRoaXMgcGFydGljdWxhciBjb2RlIHBhdGggaGFzIGJlZW4g
aW4gdGhlIGRyaXZlciBmb3IgeWVhcnMuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWls
IGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
