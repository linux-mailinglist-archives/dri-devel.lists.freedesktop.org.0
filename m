Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2E110CEA7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 19:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05DA6E0DF;
	Thu, 28 Nov 2019 18:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDDF6E0DF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 18:50:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205661] Upgrade to 5.4 from K5.3.13 fails x2 attempts
Date: Thu, 28 Nov 2019 18:50:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ivan@cyteck.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205661-2300-CKtCyGlMoJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205661-2300@https.bugzilla.kernel.org/>
References: <bug-205661-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU2NjEKCi0tLSBD
b21tZW50ICMyIGZyb20gSXZhbiBSYXRveWV2c2t5IChpdmFuQGN5dGVjay5jby51aykgLS0tCkhp
IEphbmksIFRoYW5rcyBmb3IgeW91ciByZXNwb25zZSBidXQgSSBkb24ndCByZWFsbHkgdW5kZXJz
dGFuZCB3aGF0IHlvdSBtZWFuPwoKYSkgSSBoYXZlIHJlc29sdmVkIHRoZSAxc3QgZmlybXdhcmUg
ZXJyb3IuIE1hbmFnZWQgdG8gc291cmNlIGEgY3VycmVudCBjb3B5IG9mCnRoZSBtaXNzaW5nIGZp
cm13YXJlIGZpbGUgZm9yIGEgcmVhbHRlayBOSUMuIEkgY29waWVkIHRoZSBmaWxlIHRvIHRoZSBy
ZXF1aXJlZApmb2xkZXIgYW5kIHRoZSBlcnJvciBpcyBub3cgZ29uZS4KCmIpIFRoZSBOdmlkaWEg
ZHJpdmVyIGVycm9yIGlzIHN0aWxsIGEgbWFqb3IgcHJvYmxlbS4gVGhpcyBlcnJvciBvbmx5IHNo
b3dlZCB1cAp3aXRoIEs1LjQuIEkgZG93bmdyYWRlZCBiYWNrIHRvIEs1LjMuMTMgYW5kIEkgaGF2
ZSBubyBkcml2ZXIgaXNzdWVzIG5vdy4KClNvIGl0cyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3aXRo
aW4gSzUuNCB0aGF0J3MgYSBwcm9ibGVtIHdpdGggTnZpZGlhIGdyYXBoaWNzCmRyaXZlcnMuIEl0
cyByZWxhdGVkIHRvIERLTVMgYnV0IG1vcmUgdGhhbiB0aGF0IGlzIGJleW9uZCBteSBrbm93bGVk
Z2Ugb3IKZXhwZXJpZW5jZSB3aXRoIExpbnV4ICYgdGhlIGtlcm5lbC4KCi0tIApZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUg
b2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
