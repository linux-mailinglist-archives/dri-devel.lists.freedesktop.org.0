Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B1305DD8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 15:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756386E323;
	Wed, 27 Jan 2021 14:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429166E323
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:07:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EBE1564D96
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611756452;
 bh=wj/vEYhDwxg2NxIifsdXuEVRGr8F2UB8JZgevzmNRPw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AZtPeCdcoWu3hrYgZR33WWZ8gY/PBs7zhuS2VXpeTwV0T78CXBl0pCxg18Qb+OhP2
 +zzJzt3juotm0dh1vr+TMLGt+/h+g9uyAu9hIGRY2cJr+1DxZEwafUj4qDkIxCjARt
 d2PbmeBuyy9QldKkv0nikLehfIuv2FisTD96o2wWWIMZO9pCRbV9KwlhEyabz4lMTF
 vsz7Dl26GHmwpZ1yhQyJmbk2h2iDcSW5t1hARk39IvniZxBw/ni4ZaOvHmk+5kZEqZ
 2krAWi5kAepe+3zzda+oyRav74EBhYcJzmuklpKtiZisGfuvj2RWXW3S5vt0kwp/5X
 JprOX5QdEhV+A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DAEAE6529F; Wed, 27 Jan 2021 14:07:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Wed, 27 Jan 2021 14:07:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bolando@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211349-2300-UCKURw34Kw@https.bugzilla.kernel.org/>
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
b21tZW50ICMxNSBmcm9tIGJvbGFuZG9AMTYzLmNvbSAtLS0KKEluIHJlcGx5IHRvIE1pY2hlbCBE
w6RuemVyIGZyb20gY29tbWVudCAjMTQpCj4gPiBJZiBlbmFibGUgNjRiaXQga2VybmVsIHN1cHBv
cnQsSSBuZWVkIHRvIHJlY29tcGlsZSBldmVyeXRoaW5nIG9uIExGUzEwLjAgaW4KPiA+IG5leHQg
d2Vla3MuCj4gCj4gWW91IHNob3VsZG4ndC4gMzItYml0IHVzZXItc3BhY2Ugd29ya3MgZmluZSB3
aXRoIGEgNjQtYml0IGtlcm5lbC4KClRoYW5rcyBmb3IgcmVwbHkuTXkgTEZTLTEwLjAgaXMgYnVp
bHQgZm9yIDMyYml0LEkgY291bGRuJ3Qgc2VsZWN0IDY0Yml0IGtlcm5lbApjb25maWcgd2hlbiBy
ZWNvbXBpbGUgdGhlIExpbnV4IGtlcm5lbC5Pbmx5IDMyYml0IGtlcm5lbCBjb3VsZCBidWlsZC5J
IHJlYWxseQp3YW50IHRvIGtub3cgdGhhdCB0aGUgMzJiaXQgYXJjaCB3b24ndCBiZSBzdXBwb3J0
ZWQgYnkgQU1ER1BVIGRyaXZlcnMgZnJvbSBub3cKb24/CgotLSAKWW91IG1heSByZXBseSB0byB0
aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwg
YmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
