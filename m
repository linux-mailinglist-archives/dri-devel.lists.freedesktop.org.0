Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC4B3185D7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 08:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9371D6E3FE;
	Thu, 11 Feb 2021 07:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8826E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 07:48:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9385764E87
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613029734;
 bh=s8cbaC43clYXIoswfDHgsi/Sdby8E3N9KGr/wPRUNcs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gpx9sZOoscSVB4bgBc46qxKGwHC4Rt7GkV75k32eRVCuSJopTHM/Kw9RBRtR1c56D
 PEdK9Z4AwpN1LLll3vgNOzsJkSwDgtYfjolXKEIGGCRnVBUoP6CIi0xpVU7kanSpZ3
 C3G5x+xIb63U3QchMgyr6oEnsNJokqlMLJMAdjXxpSL9o4nCtqB2ejisY3zYp+qluq
 UIVRnD47Q5D7J2vtvTHdFNKEkDX0gvSCcynRG/V8yZFmjQpe2RLKdb3T9gPBHebn0+
 eCrfclZxLlcrMrjYOU0OgRl/VwY2U18o5BtTCU/zax0BR9yrID/oi9QTQPLI7ztRAo
 7lM2dT93s9IbA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8FDB1652F8; Thu, 11 Feb 2021 07:48:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] [drm] [amdgpu] Whole system crashes when the driver is
 in mode_support_and_system_configuration
Date: Thu, 11 Feb 2021 07:48:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jan.kokemueller@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-206987-2300-b87nXxibNj@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDY5ODcKCkphbiBL
b2tlbcO8bGxlciAoamFuLmtva2VtdWVsbGVyQGdtYWlsLmNvbSkgY2hhbmdlZDoKCiAgICAgICAg
ICAgV2hhdCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHxqYW4ua29rZW11ZWxsZXJAZ21haWwuY29tCgotLS0gQ29tbWVudCAjMzkgZnJvbSBKYW4gS29r
ZW3DvGxsZXIgKGphbi5rb2tlbXVlbGxlckBnbWFpbC5jb20pIC0tLQpDcmVhdGVkIGF0dGFjaG1l
bnQgMjk1MjI1CiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNn
aT9pZD0yOTUyMjUmYWN0aW9uPWVkaXQKQ2FsbCBEQ19GUF9TVEFSVCgpIC8gRENfRlBfRU5EKCkg
aW4gZGNuMjFfdmFsaWRhdGVfYmFuZHdpZHRoCgpDb3VsZCBpdCBiZSB0aGF0IERDX0ZQX1NUQVJU
KCkvRENfRlBfRU5EKCkgYWthCmtlcm5lbF9mcHVfYmVnaW4oKS9rZXJuZWxfZnB1X2VuZCgpIGFy
ZSBub3QgY2FsbGVkIGluIHRoZSAqX3ZhbGlkYXRlX2JhbmR3aWR0aApjb2RlIHBhdGggb24gQU1E
IFJlbm9pciBzeXN0ZW1zPyBUbyBteSB1bnRyYWluZWQgZXllIGl0IGxvb2tzIGxpa2UgaXQgaXMK
bWlzc2luZywgd2hpbGUgaXQgX2lzXyB0aGVyZSBmb3IgZGNuMjAuCgpJJ3ZlIGJlZW4gcnVubmlu
ZyB0aGUgYXR0YWNoZWQgcGF0Y2ggZm9yIDIgZGF5cyBub3cgd2l0aCBzb21lIEtWTSBWTXMgb3Bl
biBhbmQKdGhlIHN5c3RlbSBzZWVtcyBzdGFibGUuIFByZXZpb3VzbHksIEkgaGFkIHNpbWlsYXIg
Y3Jhc2hlcy9iYWNrdHJhY2VzIEBrcmFrb3BvCmRlc2NyaWJlZC4KCkknbSBoYXBweSB0byBoZWxw
IHRlc3RpbmcgYW55IHBhdGNoZXMuIEknbSBydW5uaW5nIGEgVGhpbmtwYWQgVDE0IHdpdGggYSBB
TUQKUnl6ZW4gNyBQUk8gNDc1MFUgKFJlbm9pcikuCgotLSAKWW91IG1heSByZXBseSB0byB0aGlz
IGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVj
YXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
