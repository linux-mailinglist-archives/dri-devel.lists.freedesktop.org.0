Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3530E7CC2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 00:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEC06E084;
	Mon, 28 Oct 2019 23:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588226E084
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 23:18:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205335] [amdgpu] suspend / screen black after thaw
Date: Mon, 28 Oct 2019 23:18:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: arne_woerner@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205335-2300-dvb1hutIvf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205335-2300@https.bugzilla.kernel.org/>
References: <bug-205335-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUzMzUKCi0tLSBD
b21tZW50ICM1IGZyb20gQXJuZSBXb2VybmVyIChhcm5lX3dvZXJuZXJAeWFob28uY29tKSAtLS0K
aSBhbSB1c2luZyA1LjQuMC1yYzVBUk5FIG5vdy4uLgpteSBmaXJzdCBzZWxmLWNvbXBpbGVkIGtl
cm5lbCBzaW5jZSB5ZWFycy4uLiBnaWdnbGUKCk9wZW5HTCBhbmQgYnRyZnMgYW5kIGJjYWNoZSBh
bmQgc291bmQgd29yayBmaW5lLi4uCgppdCBjYW5ub3QgaGliZXJuYXRlIHZpYSBzMmRpc2sgKHdo
ZW4gaSB0cnkgaXQsIGl0IGdldHMgYW4gRUlPLCBpbW1lZGlhdGVseQphZnRlciBpdCBzdGFydHMg
d3JpdGluZyB0aGUgaW1hZ2UpLi4uCmJ1dAojIGVjaG8gZGlzayA+IC9zeXMvcG93ZXIvc3RhdGUK
d29ya3MgZmluZSBzbyBmYXIuLi4KCmlzIHRoZXJlIHNvbWUga2VybmVsIGNvbmZpZyBvcHRpb24g
dGhhdCBpIGhhdmUgdG8gZW5hYmxlIGZvciBzMmRpc2s/CgotYXJuZQoKLS0gCllvdSBhcmUgcmVj
ZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBv
ZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
