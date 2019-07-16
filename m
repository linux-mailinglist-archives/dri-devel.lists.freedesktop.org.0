Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D976ABBF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 17:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AC16E13D;
	Tue, 16 Jul 2019 15:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDECC6E13D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 15:29:08 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id B4C50285FF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 15:29:08 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id A94F92861D; Tue, 16 Jul 2019 15:29:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Tue, 16 Jul 2019 15:29:06 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204181-2300-iD2Tm37ATN@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKClNlcmdl
eSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBX
aGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIEF0dGFjaG1lbnQgIzI4MzY5NXwwICAgICAgICAgICAgICAgICAgICAgICAgICAgfDEK
ICAgICAgICBpcyBvYnNvbGV0ZXwgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAoKLS0tIENv
bW1lbnQgIzEyIGZyb20gU2VyZ2V5IEtvbmRha292ICh2aXJ0dW91c2ZveEBnbWFpbC5jb20pIC0t
LQpDcmVhdGVkIGF0dGFjaG1lbnQgMjgzNzQxCiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODM3NDEmYWN0aW9uPWVkaXQKZG1lc2cgd2l0aCAiZHJt
LmRlYnVnPTQiCgpIZXJlJ3MgYWN0dWFsIGRlYnVnIGRtZXNnLiBwY2kgc3Vic3lzdGVtIHVzZXMg
J3BjaT14PXknIHN5bnRheCwgc28gSSB3b3VsZG4ndApoYXZlIHRob3VnaHQgdGhhdCBmb3IgZHJt
IHRoYXQgd291bGRuJ3QgYmUgdmFsaWQuCgpSaWdodCB3aGVuIEkgd2FudGVkIHRvIHVwbG9hZCB0
aGUgZmlyc3QgZHVtcCBmcm9tIGhhbmcgd2l0aCBkZWJ1ZyB0aGF0IGhhcHBlbmVkCmluID4xNiBo
b3VycyBvZiB1cHRpbWUgYW5kID4zMCBtaW51dGVzIG9mIHZpZGVvLCBpdCBjcmFzaGVkIGJlZm9y
ZSBGaXJlZm94IGV2ZW4KaGFkIGEgY2hhbmNlIHRvIHJlbmRlciBzaW5nbGUgcGFnZSB3aGljaCBo
YXBwZW5lZCB0byBiZSBzYW1lIFlvdXR1YmUgcGFnZQpldmVyeXRoaW5nIGhhbmdlZCBvbiBiZWNh
dXNlIGl0IHN0YXJ0cyBhdCBsYXN0IG9wZW5lZCBwYWdlLiBTbywgYWZ0ZXIgPjMwCm1pbnV0ZXMg
aXQgd2Fzbid0IGV2ZW4gYSBzZWNvbmQgdG8gaGFuZyBhZ2Fpbi4gVGhpcyBkdW1wIGlzIGZyb20g
dGhhdCB0aW1lLgoKSGF2ZW4ndCB0cmllZCBsYXVuY2hpbmcgYSBsb2NhbCB2aWRlbyBwbGF5ZXIg
b3IgYSAzRCBhcHAuIFdpdGhvdXQgb3BlbmluZwpZb3V0dWJlIGluIEZpcmVmb3ggb3IgdmlkZW8g
b3BlbmluZyBGaXJlZm94LCBkb2luZyBhbGwgMkQgbm9uLWFjY2VsZXJhdGVkCmRlc2t0b3Agc3R1
ZmYgZG9lc24ndCBzZWVtIHRvIHRyaWdnZXIgaXQuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhp
cyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
