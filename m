Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D566986DD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 23:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCF66E398;
	Wed, 21 Aug 2019 21:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB7A6E398
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 21:51:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Wed, 21 Aug 2019 21:51:32 +0000
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
Message-ID: <bug-204181-2300-GgpBheRb6v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCi0tLSBD
b21tZW50ICM0MSBmcm9tIEFsZXggRGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSAtLS0K
KEluIHJlcGx5IHRvIFNlcmdleSBLb25kYWtvdiBmcm9tIGNvbW1lbnQgIzQwKQoKPiAKPiBJIGxp
dHRsZSBiaXQgc3RyYW5nZSB0byBjYWxsIDJ4MTA4MHAgb24gQU1EJ3MgZmFuY3kgNS1wb3J0IEdQ
VSAoKyBwb3NzaWJsZQo+IERQIG11bHRpcGxleGluZykgIm15IGlzc3VlIi4gCgpJdCdzIGEgbGlt
aXRhdGlvbiBvZiBkZXNrdG9wIGVudmlyb25tZW50cyBvbiBMaW51eCBpbiBnZW5lcmFsLiAgT3Ro
ZXIgT1NlcwpoYW5kbGUgdGhpcyBkaWZmZXJlbnRseSwgYnV0IGluIGdlbmVyYWwsIHJlZ2FyZGxl
c3Mgb2YgT1MsIGl0J3MgYSBoYXJkIHByb2JsZW0KdG8gc29sdmUuICBJZiB5b3UgaGF2ZSBtdWx0
aXBsZSBkaXNwbGF5cyBydW5uaW5nIGF0IGRpZmZlcmVudCByZWZyZXNoIHJhdGVzIGhvdwpkbyB5
b3UgdXBkYXRlIHRoZW0gd2l0aG91dCB0ZWFyaW5nIGFuZCBhbHNvIHdpdGhvdXQgbm9uLXN5bmNo
cm9uaXplZCBjb250ZW50IG9uCnNvbWUgb2YgdGhlIGRpc3BsYXlzPwoKLS0gCllvdSBhcmUgcmVj
ZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBv
ZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
