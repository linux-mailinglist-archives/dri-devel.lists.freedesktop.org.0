Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B287D527F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 22:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386B46E0CA;
	Sat, 12 Oct 2019 20:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A876E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 20:47:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Sat, 12 Oct 2019 20:47:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.jackisch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204241-2300-7EDrgQ142t@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCi0tLSBD
b21tZW50ICMyNyBmcm9tIEFuZHJlYXMgSmFja2lzY2ggKGFuZHJlYXMuamFja2lzY2hAZ21haWwu
Y29tKSAtLS0KSW4gYnJpZWYgLSB0aGUgcGF0Y2gKIjAwMDEtZHJtLWFtZGdwdS11dmQ2LWZpeC1h
bGxvY2F0aW9uLXNpemUtaW4tZW5jLXJpbmctdGVzdC5wYXRjaCIgZGlkbid0IHdvcmsKZm9yIG1l
LiBBZnRlciBhYm91dCAxMCBzdXNwZW5kL3Jlc3VtZSBjeWNsZXMgdGhlIHR5cGljYWwgaXNzdWUg
b2NjdXJyZWQgYWdhaW4KYW5kIEkgaGFkIHRvIFN5c1JxIHRoZSBzeXN0ZW0uCgpTdGF0dXMsIGFs
bCBnZW50b28ga2VybmVsczoKNS4xLnggIE9LCjQuMTkuNzQgT0sKNS4yLnggRkFJTAo1LjMuMCBG
QUlMCjUuMy4yIHcvIHBhdGNoIGZyb20gY29tbWVudCMxNCBPSwo1LjMuNiBGQUlMCjUuMy42IHcv
IHBhdGNoIDAwMDEtZHJtLWFtZGdwdS11dmQ2LWZpeC1hbGxvY2F0aW9uLXNpemUtaW4tZW5jLXJp
bmctdGVzdCBGQUlMCjUuMy42IHcvIHBhdGNoIDAwMDEtZHJtLWFtZGdwdS11dmQ2LXVzZS0wLWFz
LWR1bW15LXBvaW50ZXItaW4tZW5jLXJpbmctdCBPSwoKVGhlIGxhc3Qgc2V0dXAgaGFzIHNlZW4g
MzArIHN1c3BlbmQvcmVzdW1lIGN5Y2xlcy4gSSdsbCBjb250aW51ZSB0byB1c2UgdGhpcy4KClNv
LCB0byBtZSBpdCBsb29rcyBsaWtlIHRoYXQgaW5jcmVhc2luZyB0aGUgYWxsb2NhdGlvbiBkaWQg
bm90IGhlbHAgYnV0CmFzc2lnbmluZyAwIHRvIHRoZSBkdW1teSBwb2ludGVyIGRpZC4KCk15IGhh
cmR3YXJlIGlzIGNvbXBhcmFibGUgdG8gdGhlIG9uZSBsaXN0ZWQgaW4gY29tbWVudCMyNQotIFJh
ZGVvbiBSWDU1MAotIFJ5emVuIDE3MDAKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwg
YmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
