Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A94AFEA6B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 04:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61DD893D1;
	Sat, 16 Nov 2019 03:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18DE893D1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 03:32:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205497] Attempt to read amd gpu id causes a freeze
Date: Sat, 16 Nov 2019 03:32:05 +0000
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
Message-ID: <bug-205497-2300-iiSBqzCKyv@https.bugzilla.kernel.org/>
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
b21tZW50ICMxMyBmcm9tIEx1eWEgVHNoaW1iYWxhbmdhIChsdXlhQGZlZG9yYXByb2plY3Qub3Jn
KSAtLS0KKEluIHJlcGx5IHRvIEFsZXggRGV1Y2hlciBmcm9tIGNvbW1lbnQgIzExKQo+IChJbiBy
ZXBseSB0byBUcmVrIGZyb20gY29tbWVudCAjNykKPiA+IGJ5IGRlZmF1bHQsIHJhZGVvbnRvcCBj
YWxscyBhbWRncHVfcmVhZF9tbV9yZWdpc3RlcnMsIGFtZGdwdV9xdWVyeV9pbmZvIGFuZAo+ID4g
YW1kZ3B1X3F1ZXJ5X3NlbnNvcl9pbmZvLCBidXQgaXQgY2FuIGJlIGZvcmNlZCBieSB0aGUgY29t
bWFuZCBsaW5lIHRvIHJlYWQKPiA+IEJBUiBmcm9tIC9kZXYvbWVtCj4gCj4gSWYgeW91IGFjY2Vz
cyB0aGUgQkFSIGRpcmVjdGx5IHlvdSB3aWxsIGxpa2VseSBoYXZlIHByb2JsZW1zIGluIGNlcnRh
aW4KPiBwb3dlciBzYXZpbmcgbW9kZXMuCj4gCj4gQ2FuIHNvbWVvbmUgdGVzdCB0aGUgcGF0Y2g/
CgpDdXJyZW50bHkgYnVpbGRpbmcgb24KaHR0cHM6Ly9jb3ByLmZlZG9yYWluZnJhY2xvdWQub3Jn
L2NvcHJzL2x1eWEva2VybmVsLWFtZ3B1LWdmeG9mZi9idWlsZC8xMDk1NjYwLwoKLS0gCllvdSBh
cmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3Np
Z25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
