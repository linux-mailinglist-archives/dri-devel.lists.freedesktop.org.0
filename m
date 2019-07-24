Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A26736A2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4296E615;
	Wed, 24 Jul 2019 18:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A556E615
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:33:05 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id CA20B28913
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:33:04 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id BECE32891B; Wed, 24 Jul 2019 18:33:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Wed, 24 Jul 2019 18:33:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: virtuousfox@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-nueSKxM8gv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCi0tLSBD
b21tZW50ICMxNiBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KKEluIHJlcGx5IHRvIE5pY2hvbGFzIEthemxhdXNrYXMgZnJvbSBjb21tZW50ICMxNSkKPiBU
aGFua3MgZm9yIHRoZSBsb2dzLiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgcmVsYXRlZCB0byB5b3Vy
IG92ZXJjbG9jay4KPiAKPiBTaW5jZSB0aGlzIGJlaGF2aW9yIHdhc24ndCBwcmV2aW91c2x5IG9i
c2VydmVkIGR1cmluZyBvdXIgNS4yIHRlc3RpbmcgSQo+IHRoaW5rIHRoYXQgZWl0aGVyIGEgcGF0
Y2ggZ290IGxvc3Qgb3IgY2hhbmdlZCBkdXJpbmcgdGhlIHN1Ym1pc3Npb24gcHJvY2VzcywKPiBv
ciBzb21ldGhpbmcgZnJvbSA1LjMgd2FzIGJhY2twb3J0ZWQgaW50byA1LjIgdGhhdCBzaG91bGRu
J3QgaGF2ZSBiZWVuLgo+IAo+IEkgZG9uJ3QgdGhpbmsgaXQncyBuZWNlc3NhaXJseSBzZXR1cCBz
cGVjaWZpYy4KClRoYXQgbWVhbnMgdGhhdCB5b3Ugd2VyZSBhYmxlIHRvIHJlcHJvZHVjZSBpdCA/
IElmIHNvLCBhbnkga25vd24gd29ya2Fyb3VuZCBvcgpFVEEgb24gdGhlIGZpeCA/IElzIHJjMSBv
ZiA1LjMgYWZmZWN0ZWQgPyBBbnkgcGxhbnMgb24gYmFja3BvcnQgdG8gNS4yLnggPwoKLS0gCllv
dSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBh
c3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
