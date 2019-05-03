Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94112B85
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 12:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F401899DB;
	Fri,  3 May 2019 10:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E96899DB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 10:33:02 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id D2CF62851A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 10:33:01 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id B57352851E; Fri,  3 May 2019 10:33:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201273] Fatal error during GPU init amdgpu RX560
Date: Fri, 03 May 2019 10:33:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodomar705@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201273-2300-7nisnAx4jU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201273-2300@https.bugzilla.kernel.org/>
References: <bug-201273-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDEyNzMKCi0tLSBD
b21tZW50ICM1MSBmcm9tIE1hcmNvIChyb2RvbWFyNzA1QHByb3Rvbm1haWwuY29tKSAtLS0KKElu
IHJlcGx5IHRvIEFsZXggRGV1Y2hlciBmcm9tIGNvbW1lbnQgIzQ5KQo+IENhbiB5b3Ugc3RpbGwg
bG9nIGluIHJlbW90ZWx5IHZpYSBzc2ggYW5kIGdldCBhbiB1cGRhdGVkIGRtZXNnPyAgSWYgaXQn
cyBhCj4gYmxhbmsgc2NyZWVuLCBjYW4geW91IHRyeSBhbm90aGVyIGRpc3BsYXkgY29ubmVjdG9y
IG9uIHRoZSBib2FyZD8gIFRoZQo+IGFtZGdwdS5kYyBvcHRpb24gc3dpdGNoZXMgYmV0d2VlbiB0
aGUgb2xkIHNpbXBsZXIgZGlzcGxheSBjb2RlIChkYz0wKSBhbmQKPiB0aGUgbmV3ZXIgZGlzcGxh
eSBjb2RlIHRoYXQgc3VwcG9ydCBtb3JlIGFkdmFuY2VkIGZlYXR1cmVzIGxpa2UgYXVkaW8gYW5k
IERQCj4gTVNUIChkYz0xKS4gIFRoZXJlIGlzIG5vIGZpcm13YXJlIGluIHRoZSBkaXNwbGF5IGVu
Z2luZSBmb3IgdGhpcyBhc2ljLgoKQXMgc3RhdGVkIGFib3ZlLCBpdCB3YXMgY29ubmVjdGVkIHRo
cm91Z2ggRFZJLUQgYW5kIEkgYWxyZWFkeSB0cmllZCB3aXRoIEhETUksCmJ1dCBubyBzaWduYWwg
ZnJvbSBhbnl3aGVyZS4KCkZvciB0aGUgZmlybXdhcmUsIGl0IHdhcyBteSBtaXN0YWtlIHNpbmNl
IEkgd2FzIHJlYWRpbmcgYSB2ZXJzaW9uIG51bWJlciB3aGVuCml0IHdhcyBlbmFibGVkIGluIHRo
ZSBtb2R1bGUsIGFuZCBJIGF1dG9tYXRpY2FsbHkgYXNzdW1lZCB0aGF0IHdhcyBhIGZpcm13YXJl
CnZlcnNpb24gdXBsb2FkZWQgdG8gdGhlIEFTSUMsIG15IGJhZC4KClJlZ2FyZGxlc3MgYXMgdGhl
IGFib3ZlLCBJJ3ZlIHJlYm9vdGVkIDI1IHRpbWVzIHllc3RlcmRheSwgYW5kIEkgY2FuJ3QKcmVw
cm9kdWNlIHRoZSBwcm9ibGVtIGFnYWluLCB1bmZvcnR1bmF0ZWx5ICh0byBtZSBhbnl3YXkgaXMg
ZmluZSA6UCk7IGlmIEkgZ2V0CnRoZSBwcm9ibGVtIGFnYWluIG5vdyBJIGhhdmUgYW4gU1NIIHNl
cnZlciBlbmFibGVkIHNvIEknbGwgc3VyZWx5IHBvc3QgdGhlCmRtZXNnIChldmVuIGlmIEkgZG91
YnQgSSdsbCBiZSBhYmxlIHRvIGNvbm5lY3QsIHNpbmNlIHdoZW4gaXQgd2FzIHByZXNlbnRpbmcg
SQp3YXNuJ3QgZXZlbiBhYmxlIHRvIHRyaWdnZXIgYW4gQUNQSSBncmFjZWZ1bCBwb3dlcmRvd24g
YnkgcHJlc3NpbmcgdGhlIHBvd2VyCmJ1dHRvbikuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhp
cyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
