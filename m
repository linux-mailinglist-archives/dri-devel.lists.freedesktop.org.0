Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91BB3D03
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 16:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4936E9AF;
	Mon, 16 Sep 2019 14:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229AC6E9AF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 14:58:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 202445] amdgpu/dc: framerate dropping below adaptive sync range
 causes screen flickering
Date: Mon, 16 Sep 2019 14:58:55 +0000
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
Message-ID: <bug-202445-2300-N9siZZb2NJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-202445-2300@https.bugzilla.kernel.org/>
References: <bug-202445-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDI0NDUKCi0tLSBD
b21tZW50ICMzNSBmcm9tIENsw6ltZW50IEd1w6lyaW4gKGxpYmNnQHByb3Rvbm1haWwuY29tKSAt
LS0KSWYgeW91IGhhdmVuJ3QgdXBkYXRlZCB0byBsaW51eCA1LjIgeWV0LCB5b3Ugc2hvdWxkIGJl
Y2F1c2UgaXQgZml4ZWQgY29uc3RhbnQKZmxpY2tlcmluZyB3aGVuIGluIExGQyBtb2RlLgoKVGhp
cyBhZGRpdGlvbmFsIHBhdGNoIGhlbHBzIHdoZW4gZnJlZXN5bmMgZ29lcyBpbiBhbmQgb3V0IG9m
IExGQyBtb2RlLiBJdCdzIG5vdApmdWxseSBmaXhlZCwgYnV0IHRoZSBmbGlja2VyaW5nIGlzIGEg
bG90IGxlc3Mgc2V2ZXJlLiBBY2NvcmRpbmcgdG8gdGhlIFBob3Jvbml4CmFydGljbGUgaXQgc2hv
dWxkIGluZGVlZCBsYW5kIGluIGxpbnV4IDUuNS4KCldoZW4gY29tcGlsaW5nIGEga2VybmVsIHlv
dSBzaG91bGQgYmUgYWJsZSB0byBpbnN0YWxsIGl0IG5leHQgdG8gdGhlIHJlZ3VsYXIKb25lIHNv
IHlvdSBjYW4ndCBicmVhayB5b3VyIHNldHVwLiBJIHBlcnNvbmFsbHkgdXNlZCB0aGUgbGludXgt
bWFpbmxpbmUgcGFja2FnZQpmcm9tIHRoZSBBVVIgYW5kIGFkZGVkIHRoZSBMRkMgcGF0Y2ggb24g
dG9wLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdh
dGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
