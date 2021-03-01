Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E8327CA2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 11:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E576E59B;
	Mon,  1 Mar 2021 10:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397576E59B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 10:53:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E8CA464EBE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 10:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614596025;
 bh=aofSsz1ubFh2Ce7HBmi/IyMCUxIAQd4roLCeimb7kD4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ouba2zfw+aXv1yrF2gn5SN2o6llZthcCjDIwkiZIbc2ylPbXT3TPNQ3mk5Q8KRGre
 jnxbHyCN8QF794+emDLu6Z/mf7jZdDTYbLEdadWvjZCcml7CU38/dURSUea/d4t8c/
 nmnALglCvAG1hw3mBk9e0em+I7bUb7nWwBjE1GKg3TAaehZvZGrEfyzgfj0PSSoAI5
 2Nf7200walHSaklLBHL1AULR/rmFQqE7IIL3J0xYijMsvdYKTKEqz9mBakH+PgM9kY
 HMxFTF9+uJdclH0EzNwcHPIE2zwOKI639zl9ewllYznCCe24BvSmq9K288UZGg5Quo
 9S3C0mi4pSOag==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DDEA260C3E; Mon,  1 Mar 2021 10:53:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211997] sys-kernel/gentoo-sources-5.11.2 crash upon disconnect
 HDMI monitor AMDGPU
Date: Mon, 01 Mar 2021 10:53:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211997-2300-x4IlUJJNIt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211997-2300@https.bugzilla.kernel.org/>
References: <bug-211997-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTE5OTcKClBhdWwg
TWVuemVsIChwbWVuemVsK2J1Z3ppbGxhLmtlcm5lbC5vcmdAbW9sZ2VuLm1wZy5kZSkgY2hhbmdl
ZDoKCiAgICAgICAgICAgV2hhdCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRl
ZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHxhbGV4ZGV1Y2hlckBnbWFpbC5jb20KCi0tLSBDb21tZW50ICMyIGZyb20g
UGF1bCBNZW56ZWwgKHBtZW56ZWwrYnVnemlsbGEua2VybmVsLm9yZ0Btb2xnZW4ubXBnLmRlKSAt
LS0KSXTigJlkIGJlIGdyZWF0LCBpZiB5b3UgY291bGQgYmlzZWN0IHRoZSBpc3N1ZT8KCkFsc28s
IEkgdGhpbmsgdGhlIEFNREdQVSBpc3N1ZSB0cmFja2VyIGlzIGF0Cmh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0vYW1kLCBhbmQgeW91IG1pZ2h0IGdldCBxdWlja2VyIHJlc3BvbnNl
cwp0aGVyZS4KCi0tIApZb3UgbWF5IHJlcGx5IHRvIHRoaXMgZW1haWwgdG8gYWRkIGEgY29tbWVu
dC4KCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5n
IHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
