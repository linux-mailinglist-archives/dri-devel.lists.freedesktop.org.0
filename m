Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B879823E1E0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 21:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C766E908;
	Thu,  6 Aug 2020 19:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63F6E908
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 19:10:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208839] AMDGPU: DPM is not enabled after hibernate and resume
 for CIK/Hawaii GPUs (e.g R9 390)
Date: Thu, 06 Aug 2020 19:10:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208839-2300-AMweZS8WTd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208839-2300@https.bugzilla.kernel.org/>
References: <bug-208839-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDg4MzkKCi0tLSBD
b21tZW50ICM3IGZyb20gQWxleCBEZXVjaGVyIChhbGV4ZGV1Y2hlckBnbWFpbC5jb20pIC0tLQpJ
dCBoYXMgbm90aGluZyB0byBkbyB3aXRoIGtlcm5lbHMgdGhhdCBhcmUgaW5zdGFsbGVkLiAgRnJv
bSB0aGUgbGluazoKCiJBbHRob3VnaCBpbiBwcmluY2lwbGUgdGhlIGltYWdlIG1pZ2h0IGJlIGxv
YWRlZCBpbnRvIG1lbW9yeSBhbmQgdGhlCnByZS1oaWJlcm5hdGlvbiBtZW1vcnkgY29udGVudHMg
cmVzdG9yZWQgYnkgdGhlIGJvb3QgbG9hZGVyLCBpbiBwcmFjdGljZSB0aGlzCmNhbuKAmXQgYmUg
ZG9uZSBiZWNhdXNlIGJvb3QgbG9hZGVycyBhcmVu4oCZdCBzbWFydCBlbm91Z2ggYW5kIHRoZXJl
IGlzIG5vCmVzdGFibGlzaGVkIHByb3RvY29sIGZvciBwYXNzaW5nIHRoZSBuZWNlc3NhcnkgaW5m
b3JtYXRpb24uIFNvIGluc3RlYWQsIHRoZQpib290IGxvYWRlciBsb2FkcyBhIGZyZXNoIGluc3Rh
bmNlIG9mIHRoZSBrZXJuZWwsIGNhbGxlZCDigJx0aGUgcmVzdG9yZSBrZXJuZWzigJ0sCmludG8g
bWVtb3J5IGFuZCBwYXNzZXMgY29udHJvbCB0byBpdCBpbiB0aGUgdXN1YWwgd2F5LiBUaGVuIHRo
ZSByZXN0b3JlIGtlcm5lbApyZWFkcyB0aGUgc3lzdGVtIGltYWdlLCByZXN0b3JlcyB0aGUgcHJl
LWhpYmVybmF0aW9uIG1lbW9yeSBjb250ZW50cywgYW5kCnBhc3NlcyBjb250cm9sIHRvIHRoZSBp
bWFnZSBrZXJuZWwuIFRodXMgdHdvIGRpZmZlcmVudCBrZXJuZWwgaW5zdGFuY2VzIGFyZQppbnZv
bHZlZCBpbiByZXN1bWluZyBmcm9tIGhpYmVybmF0aW9uLiBJbiBmYWN0LCB0aGUgcmVzdG9yZSBr
ZXJuZWwgbWF5IGJlCmNvbXBsZXRlbHkgZGlmZmVyZW50IGZyb20gdGhlIGltYWdlIGtlcm5lbDog
YSBkaWZmZXJlbnQgY29uZmlndXJhdGlvbiBhbmQgZXZlbgphIGRpZmZlcmVudCB2ZXJzaW9uLiIK
CkFueXdheSwgeW91ciBwYXRjaCBsb29rcyBjb3JyZWN0LgoKLS0gCllvdSBhcmUgcmVjZWl2aW5n
IHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUg
YnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
