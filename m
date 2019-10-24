Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F2E3779
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B756E46D;
	Thu, 24 Oct 2019 16:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8886E46D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:10:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205277] [amd powerplay] vega10: soc voltage for power state 7
 is not changed by overdrive.
Date: Thu, 24 Oct 2019 16:10:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pelle@vangils.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205277-2300-32wugYh6YS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205277-2300@https.bugzilla.kernel.org/>
References: <bug-205277-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUyNzcKCi0tLSBD
b21tZW50ICM3IGZyb20gUGVsbGUgdmFuIEdpbHMgKHBlbGxlQHZhbmdpbHMueHl6KSAtLS0KKElu
IHJlcGx5IHRvIGhhcm80MSBmcm9tIGNvbW1lbnQgIzMpCj4gRGlkIHlvdSBkZWJ1ZyB0aGlzIGlz
c3VlPyBJIHRoaW5rIHRoZSBwcm9ibGVtIGNvdWxkIGJlIG91dHNpZGUgdGhpcyBjb2RlLiAKPiAK
PiBJIHdvdWxkIG91dGNvbW1lbnQgdGhlIGlmLXN0YXRlbWVudCBmb2xsb3dpbmcgZm9yLWxvb3Ag
aW4geW91ciBwcm9wb3NlZAo+IHBhdGNoLCBiZWNhdXNlIG90aGVyd2lzZSAnaScgcG9pbnRzIG91
dHNpZGUgdGhlIGFycmF5IGJvdW5kYXJ5cyBoZXJlLgoKVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5
LiBJIGhhdmUgdXBsb2FkZWQgYSBuZXcgcGF0Y2ggd2l0aCB5b3VyIHN1Z2dlc3Rpb24uCgpJdCBs
b29rcyB0byBtZSBub3cgdGhhdCB0aGlzIGlzIG5vdCBzbyBtdWNoIGEgYnVnIGJ1dCBpbnRlbmRl
ZCBiZXZpb3VyLiBJIHdvdWxkCnN0aWxsIGxpa2UgdG8gc2VlIHRoaXMgY2hhbmdlZCB0aG91Z2gu
CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hp
bmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
