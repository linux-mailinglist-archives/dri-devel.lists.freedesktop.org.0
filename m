Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EF88F60A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 22:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4716D6EA7D;
	Thu, 15 Aug 2019 20:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C37A6EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 20:55:42 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id E52A828991
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 20:55:41 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id D8AA6289D6; Thu, 15 Aug 2019 20:55:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Thu, 15 Aug 2019 20:55:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrey.grodzovsky@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204241-2300-jz4vNR28un@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCi0tLSBD
b21tZW50ICMxMCBmcm9tIEFuZHJleSBHcm9kem92c2t5IChhbmRyZXkuZ3JvZHpvdnNreUBhbWQu
Y29tKSAtLS0KQ3JlYXRlZCBhdHRhY2htZW50IDI4NDQ0NQogIC0tPiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9Mjg0NDQ1JmFjdGlvbj1lZGl0CnJlc3VtZV9m
YWlsdXJlLmxvZwoKVGhlIGtlcm5lbCBPT1BTIGlzIGp1c3QgYSByZXN1bHQgb2YgcHJldmlvdXMg
R0ZYIHJpbmcgdGVzdCBmYWlsdXJlLiBBdHRhY2hlZApsb2cgZnJvbSBVTVIgc2hvd3MgZ2Z4IHJp
bmcgaXMgaGFuZyBhcm91bmQgKG9yIHJpZ2h0IGFmdGVyKSBmaXJzdApQS1QzX1NFVF9DT05URVhU
X1JFRyBiZWNhdXNlIGxhdGVzdCBQRlBfSEVBREVSX0RVTVAgc2hvd3MgMHhjMGQ0NjkwMCwgdGhp
cwpwb2ludHMgdG8gcG9zc2libHkgdGhhdCBzb21lIG9mIHRoZSBwYXlsb2FkIHdpdGhpbiBTRVRf
Q09OVEVYVF9SRUcgKGluCmdmeF92OF8wX2dldF9jc2JfYnVmZmVyKSBjYXVzZXMgaGFuZyBhbmQg
bGF0ZXIgdGhpcyByZXN1bHRzIGluIHJpbmcgdGVzdApmYWlsdXJlLgoKQWxleCBEZXVjaGVyIC0g
QW55IGlkZWEgaG93IHRvIGNvbmZpcm0gdGhpcyA/CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhp
cyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
