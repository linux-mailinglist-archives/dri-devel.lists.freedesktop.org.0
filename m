Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF3318D9B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 15:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A546EE12;
	Thu, 11 Feb 2021 14:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4996EE12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 14:51:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E61D764EA1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055115;
 bh=bPeL456PmnjUF3IXBvo0h2ua/k1L4ctBV0mvAvtUHA0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KcAX9dznFyg9pVHcjoPrmcocI7TUryPnp7UI0mVdUT2jtu1GhnmXhaRtJ2fU6FW0V
 sNDhIMdp3tCuxnkvrYtsviCE94Os314s/4A/EZ4GVNrvyTwyvLFQVRU1Ymc6K2ac/O
 Gw8ROfrMSMky8f8XpB2CbigH2X8OcL44nbwhrpIE1NaqhGPBPiJ+4fhx72Djdep4e7
 0O04gV8Nf0s4lMtgUtu187uxL+osQwl6Juz/ZlRCQ8sSV/St3pCBJm1MpUhLNuJNmd
 8IKdmgwHh5aZNWKxjxKXl2aMj0x8AIzS7f/bneI3nbHuibS2JAmGnoAcQGidcBuenh
 kC7l0tDB0+XJQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DD958652F8; Thu, 11 Feb 2021 14:51:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] [drm] [amdgpu] Whole system crashes when the driver is
 in mode_support_and_system_configuration
Date: Thu, 11 Feb 2021 14:51:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206987-2300-Tb7ntLRHpM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206987-2300@https.bugzilla.kernel.org/>
References: <bug-206987-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDY5ODcKCi0tLSBD
b21tZW50ICM0MCBmcm9tIEFsZXggRGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSAtLS0K
KEluIHJlcGx5IHRvIEphbiBLb2tlbcO8bGxlciBmcm9tIGNvbW1lbnQgIzM5KQo+IENyZWF0ZWQg
YXR0YWNobWVudCAyOTUyMjUgW2RldGFpbHNdCj4gQ2FsbCBEQ19GUF9TVEFSVCgpIC8gRENfRlBf
RU5EKCkgaW4gZGNuMjFfdmFsaWRhdGVfYmFuZHdpZHRoCj4gCj4gQ291bGQgaXQgYmUgdGhhdCBE
Q19GUF9TVEFSVCgpL0RDX0ZQX0VORCgpIGFrYQo+IGtlcm5lbF9mcHVfYmVnaW4oKS9rZXJuZWxf
ZnB1X2VuZCgpIGFyZSBub3QgY2FsbGVkIGluIHRoZQo+ICpfdmFsaWRhdGVfYmFuZHdpZHRoIGNv
ZGUgcGF0aCBvbiBBTUQgUmVub2lyIHN5c3RlbXM/IFRvIG15IHVudHJhaW5lZCBleWUgaXQKPiBs
b29rcyBsaWtlIGl0IGlzIG1pc3NpbmcsIHdoaWxlIGl0IF9pc18gdGhlcmUgZm9yIGRjbjIwLgo+
IAo+IEkndmUgYmVlbiBydW5uaW5nIHRoZSBhdHRhY2hlZCBwYXRjaCBmb3IgMiBkYXlzIG5vdyB3
aXRoIHNvbWUgS1ZNIFZNcyBvcGVuCj4gYW5kIHRoZSBzeXN0ZW0gc2VlbXMgc3RhYmxlLiBQcmV2
aW91c2x5LCBJIGhhZCBzaW1pbGFyIGNyYXNoZXMvYmFja3RyYWNlcwo+IEBrcmFrb3BvIGRlc2Ny
aWJlZC4KPiAKPiBJJ20gaGFwcHkgdG8gaGVscCB0ZXN0aW5nIGFueSBwYXRjaGVzLiBJJ20gcnVu
bmluZyBhIFRoaW5rcGFkIFQxNCB3aXRoIGEgQU1ECj4gUnl6ZW4gNyBQUk8gNDc1MFUgKFJlbm9p
cikuCgpMb29rcyBjb3JyZWN0LiAgQ2FyZSB0byBzZW5kIG91dCBhIHByb3BlciBnaXQgcGF0Y2g/
CgotLSAKWW91IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3Ug
YXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNz
aWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
