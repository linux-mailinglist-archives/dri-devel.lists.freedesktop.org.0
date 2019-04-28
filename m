Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19699B4B4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2019 02:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC3589261;
	Sun, 28 Apr 2019 00:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2866689261
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2019 00:58:00 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 806CF28A62
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2019 00:57:59 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 74C6928AFA; Sun, 28 Apr 2019 00:57:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 202445] amdgpu/dc: framerate dropping below adaptive sync range
 causes screen flickering
Date: Sun, 28 Apr 2019 00:57:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: libcg@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-202445-2300-eGrdGPjDyu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-202445-2300@https.bugzilla.kernel.org/>
References: <bug-202445-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDI0NDUKCi0tLSBD
b21tZW50ICMzMCBmcm9tIENsw6ltZW50IEd1w6lyaW4gKGxpYmNnQHByb3Rvbm1haWwuY29tKSAt
LS0KSSBqdXN0IHRlc3RlZCBkcm0tbmV4dC01LjIgd2l0aCBNYXJpbyBLbGVpbmVyJ3MgVlJSIEJU
UiBwYXRjaCBzZXJpZXMgYXBwbGllZCBvbgp0b3A6IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL2FyY2hpdmVzL2FtZC1nZngvMjAxOS1BcHJpbC8wMzM0NzAuaHRtbAoKVGhlIHNpdHVhdGlv
biBpbXByb3ZlZCBhIGxvdC4gVW5pZ2luZSBWYWxsZXkgaXMgbm93IHNtb290aCBhdCBsb3cgZnJh
bWVyYXRlcwp3aXRoIHNvbWUgb2NjYXNpb25hbCBmbGlja2VyaW5nIHdoZW4gdGhlIEJUUiBsaW1p
dCBpcyBjcm9zc2VkLiBSb2NrZXQgTGVhZ3VlCnN0aWxsIGZsaWNrZXJzIHdoZW4gdGhlIGdhbWUg
c3R1dHRlcnMuCgpBdCB0aGlzIHBvaW50IEknbSBub3Qgc3VyZSBpZiB0aGUgYnVnIGlzIGZ1bGx5
IGZpeGVkIG9yIGlmIGl0J3MganVzdCBhIGhhcmR3YXJlCmxpbWl0YXRpb24uIEFueWhvdywgaXQn
cyBnb29kIHByb2dyZXNzLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNl
OgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
