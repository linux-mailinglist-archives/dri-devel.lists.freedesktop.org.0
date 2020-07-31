Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D6234949
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 18:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557646EB1B;
	Fri, 31 Jul 2020 16:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9756EB1B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 16:38:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Fri, 31 Jul 2020 16:38:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-FP2MreQz32@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDczODMKCi0tLSBD
b21tZW50ICMxMTIgZnJvbSBEdW5jYW4gKDFpNXQ1LmR1bmNhbkBjb3gubmV0KSAtLS0KKEluIHJl
cGx5IHRvIFBhdWwgTWVuemVsIGZyb20gY29tbWVudCAjMTA3KQo+IEV2ZXJ5b25lIHNlZWluZyB0
aGlzLCBpdOKAmWQgYmUgZ3JlYXQsIGlmIHlvdSB0ZXN0ZWQKPiAKPiAgICAgW1BBVENIXSBkcm0v
YW1kL2Rpc3BsYXk6IENsZWFyIGRtX3N0YXRlIGZvciBmYXN0IHVwZGF0ZXMKCkZvciB0aGUgcmVj
b3JkLCB3aXRoIG5vIHJlcG9ydGVkIHByb2JsZW1zIHRoYXQncyBpbiA1LjgtcG9zdC1yYzcgbm93
IGFzCmZkZTlmMzlhYywgbWVyZ2VkIGludG8gdGhlIGRybSB0cmVlIHdpdGggbWVyZ2UtY29tbWl0
IDg4N2M5MDlkZCwgd2hpY2ggaW4gdHVybgp3YXMgbWVyZ2VkIGludG8gbWFpbmxpbmUgb24gVGh1
cnNkYXkgSnVseSAzMCB3aXRoIG1lcmdlLWNvbW1pdCBkOGI5ZmFlYzUuCgpUaGFua3MsIGV2ZXJ5
b25lLiA9Ol4pCgpDbG9zZSB0aGUgYnVnIG9uIDUuOC4wIHJlbGVhc2U/CgotLSAKWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVl
IG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
