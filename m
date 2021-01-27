Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 781AD305F6D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 16:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4ABD6E829;
	Wed, 27 Jan 2021 15:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B0C6E829
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 15:21:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0522064D5D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 15:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611760899;
 bh=KdSKR/LOjBTfI7LLXYRbk0TIvMZUV+Ti4FB+Tu6RcxA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E0QUFFdFrQRZbKStrTZJqc9JLApTQG7DnP7DIK0hhYSbtEE9OAsZHIMgGq5W6tZ+x
 KeG+Xq5Dv1twdXigyB2Z3UaAGsghM3UnNkfzbZlgFfSPHgZ/TxtjwLQDuNaEIXKGBN
 l+cjEcVT0s/qlJB1pzSkomO0BvSHQaHnsgzHS2xlt6Rs/GPfiqP5/nckDTh6hJtqjp
 durr8JCy9aZVI/hymhRZI5ElxvBg9/gfSYD2s2LJ+O7PKTv19zY2Rm2elUSlR4UD7N
 XNKhG5GADk+vYqjXhBaeAGBcx89Xis4RiBCKt8O3SBGB5V4C94FhsMJlgaJwgbKbw1
 N1tcnCePIvIOQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D804B6529E; Wed, 27 Jan 2021 15:21:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Wed, 27 Jan 2021 15:21:38 +0000
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
Message-ID: <bug-211349-2300-8PadryjgyW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211349-2300@https.bugzilla.kernel.org/>
References: <bug-211349-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTEzNDkKCi0tLSBD
b21tZW50ICMxNiBmcm9tIEFsZXggRGV1Y2hlciAoYWxleGRldWNoZXJAZ21haWwuY29tKSAtLS0K
KEluIHJlcGx5IHRvIGJvbGFuZG8gZnJvbSBjb21tZW50ICMxNSkKPiAoSW4gcmVwbHkgdG8gTWlj
aGVsIETDpG56ZXIgZnJvbSBjb21tZW50ICMxNCkKPiA+ID4gSWYgZW5hYmxlIDY0Yml0IGtlcm5l
bCBzdXBwb3J0LEkgbmVlZCB0byByZWNvbXBpbGUgZXZlcnl0aGluZyBvbiBMRlMxMC4wCj4gaW4K
PiA+ID4gbmV4dCB3ZWVrcy4KPiA+IAo+ID4gWW91IHNob3VsZG4ndC4gMzItYml0IHVzZXItc3Bh
Y2Ugd29ya3MgZmluZSB3aXRoIGEgNjQtYml0IGtlcm5lbC4KPiAKPiBUaGFua3MgZm9yIHJlcGx5
Lk15IExGUy0xMC4wIGlzIGJ1aWx0IGZvciAzMmJpdCxJIGNvdWxkbid0IHNlbGVjdCA2NGJpdAo+
IGtlcm5lbCBjb25maWcgd2hlbiByZWNvbXBpbGUgdGhlIExpbnV4IGtlcm5lbC5Pbmx5IDMyYml0
IGtlcm5lbCBjb3VsZAo+IGJ1aWxkLkkgcmVhbGx5IHdhbnQgdG8ga25vdyB0aGF0IHRoZSAzMmJp
dCBhcmNoIHdvbid0IGJlIHN1cHBvcnRlZCBieSBBTURHUFUKPiBkcml2ZXJzIGZyb20gbm93IG9u
PwoKQW5lY2RvdGFsbHkgaXQgd29ya3MgZm9yIHNvbWUgcGVvcGxlLiAgSXQgbWF5IGRlcGVuZCBv
biB0aGUgcGxhdGZvcm0gYW5kCmRldmljZS4KCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1h
aWwgdG8gYWRkIGEgY29tbWVudC4KCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNl
OgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
