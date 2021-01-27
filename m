Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E53058DD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 11:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892D86E3D0;
	Wed, 27 Jan 2021 10:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6C66E3D0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 10:54:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 035A564D93
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611744866;
 bh=fCBbqMpSaHK3fuEHqWH7dh+yoDogfCZF4klWUY/8kik=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=B36Tm9NL89u4NPC525AJo8QA4yZ/AAVt0mvL5Gcf9fEivUATlvZz0uq34TLv20mCZ
 aws6Hno0uV1ltDbo3N12CnrUSRNqubEao4omIIIZXvJ14Zf+j2ko/nTotqU1z3y9at
 rwBKW5OikSHu3fvBsP/PbvaEVJhRmEJ49SoS9TO4xCbYFcR7PXzBVWgGV7Tl7Zn8mU
 w1wqusOCFcVE7JeLfgcAaO3JI86TfRJ64J8vj4xqAkMUnEGwRSjAZn7YT7f8T5XCj0
 VxPTwJdI53QW33ij+VVVle8vf+L+3YJ27QvpOHBWYxHPO4uLOvdLpBjDpyPGaBrt0K
 4QmNL7Ubxv7qA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E9B776529F; Wed, 27 Jan 2021 10:54:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211349] IB test failed on sdma0 ! AMDGPU driver for Raven APU
 (ryzen 2400G) hangs!
Date: Wed, 27 Jan 2021 10:54:25 +0000
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
Message-ID: <bug-211349-2300-GNWR5iCYzi@https.bugzilla.kernel.org/>
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
b21tZW50ICMxMyBmcm9tIGJvbGFuZG9AMTYzLmNvbSAtLS0KKEluIHJlcGx5IHRvIE1pY2hlbCBE
w6RuemVyIGZyb20gY29tbWVudCAjMTIpCj4gSSdkIHJlY29tbWVuZCBydW5uaW5nIGEgNjQtYml0
IGtlcm5lbCwgZXZlbiBpZiBhbGwgdXNlci1zcGFjZSBpcyAzMi1iaXQuCgpJIGp1c3QgaGF2ZSBm
aW5pc2hlZCBMRlMtMTAuMCBpbiBzZXZlcmFsIHdlZWtzLGl0J3MgYSB2ZXJ5IGhhcmQgd29yay4g
SWYgZW5hYmxlCjY0Yml0IGtlcm5lbCBzdXBwb3J0LEkgbmVlZCB0byByZWNvbXBpbGUgZXZlcnl0
aGluZyBvbiBMRlMxMC4wIGluIG5leHQKd2Vla3MuSGF2ZSBhbnkgb3RoZXIgc29sdXRpb25zIGZv
ciAzMmJpdCBhcmNoID8KCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEg
Y29tbWVudC4KCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdh
dGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
