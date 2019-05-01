Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990510B54
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 18:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCF588E46;
	Wed,  1 May 2019 16:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F6988E46
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 16:30:34 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id E7C8328DC6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 16:30:33 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id DB34528F6A; Wed,  1 May 2019 16:30:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203471] New: Tearing on Raven Ridge and RX560X PRIME setup even
 with Vsync enabled
Date: Wed, 01 May 2019 16:30:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-203471-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM0NzEKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjAzNDcxCiAgICAgICAgICAgU3VtbWFyeTogVGVhcmluZyBvbiBSYXZl
biBSaWRnZSBhbmQgUlg1NjBYIFBSSU1FIHNldHVwIGV2ZW4KICAgICAgICAgICAgICAgICAgICB3
aXRoIFZzeW5jIGVuYWJsZWQKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAg
VmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4xIHJjNgogICAgICAgICAgSGFyZHdh
cmU6IEFsbAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJlZTogTWFp
bmxpbmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBoaWdoCiAg
ICAgICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24g
SW50ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mu
b3NkbC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBoYXhrNjEyQGdtYWlsLmNvbQogICAgICAgIFJl
Z3Jlc3Npb246IE5vCgpJIGhhdmUgQWNlciBOaXRybyA1IEFONTE1LTQyIHdpdGggUnl6ZW4gNSAy
NTAwVSBhbmQgUlg1NjBYLgpXaGVuIGkgbGF1bmNoIHNvbWUgZ2FtZSB3aXRoIERSSV9QUklNRT0x
IHRvIGhhdmUgaXQgb24gZEdQVSB0aGVyZSBpcyBodWdlCnRlYXJpbmcgb24gdG9wIG9mIHRoZSBz
Y3JlZW4gdGhhdCBpcyB0aGVyZSB3aXRoIG9yIHdpdGhvdXQgVnN5bmMuCklmIGkgbGF1bmNoIHRo
ZSBnYW1lIG9uIGlHUFUgdGhlcmUgaXMgbm8gdGVhcmluZyBhdCBhbGwuCkFsc28gdGhlIHRlYXJp
bmcgaGFwcGVucyBvbmx5IHdoZW4gdGhlIGdhbWUgaXMgaW4gZnVsbHNjcmVlbi4KSWYgaSB0YWtl
IGEgc2NyZWVuc2hvdCB0aGVyZSBpcyBubyB0ZWFyaW5nIGluIHRoZSBzY3JlZW5zaG90LgpBbmQg
aSBjYW5ub3QgcG9zdCBhIHBpY3R1cmUgYXMgbXkgcGhvbmUgY2FtZXJhIGlzIGJyb2tlbiBpbiBt
eSBsYXRlc3QgYnVpbGQgb2YKYW5kcm9pZC4KSSBoYXZlIHRyaWVkIDUuMi13aXAgYnJhbmNoIGFu
ZCB0aGVyZSBpcyB0aGUgc2FtZSBpc3N1ZS4KV2lsbCBwb3N0IGRtZXNnIGFuZCBqb3VybmFsY3Rs
IGluIGZldyBob3Vycy4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToK
WW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
