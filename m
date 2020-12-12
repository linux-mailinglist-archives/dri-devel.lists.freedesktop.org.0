Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4162D8633
	for <lists+dri-devel@lfdr.de>; Sat, 12 Dec 2020 12:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFB46E5BD;
	Sat, 12 Dec 2020 11:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84AD6E5BD
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 11:21:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Sat, 12 Dec 2020 11:21:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilya@ilya.pp.ua
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-YfxNmm1lGQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDk0NTcKCi0tLSBD
b21tZW50ICMxOCBmcm9tINCY0LvRjNGPINCY0L3QtNC40LPQviAoaWx5YUBpbHlhLnBwLnVhKSAt
LS0KKEluIHJlcGx5IHRvINCY0LvRjNGPINCY0L3QtNC40LPQviBmcm9tIGNvbW1lbnQgIzE3KQo+
IEkgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtIHdpdGggdGhlIFJhZGVvbiBIRCA3NzcwLgpJIGhhdmUg
dGhlIHNhbWUgcHJvYmxlbSB3aXRoIHRoZSBSYWRlb24gSEQgNzc3MC4KVGhpcyBhbHNvIGhhcHBl
bnMgd2l0aCB0aGUgYW1kZ3B1IGFuZCByYWRlb25zaSBkcml2ZXJzLgpJdCBlbnRlcnMgdGhlIFMx
IG1vZGUgKGFsdGhvdWdoIGluIHRoZSBCSU9TIEkgc3BlY2lmaWVkIHRvIHVzZSBvbmx5IFMzKSBh
bmQKZG9lcyBub3QgZXhpdCBpdC4KV2l0aCB0aGUgb2xkIHZpZGVvY2FyZCwgdGhlIDg2MDBHVCB3
aXRoIG5vdXZlYXUgZW50ZXJlZCBTMyBtb2RlIGFuZCBleGl0ZWQKbm9ybWFsbHkuCgotLSAKWW91
IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFz
c2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
