Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B37B336D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 04:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3B86E0E1;
	Mon, 16 Sep 2019 02:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295FC6E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 02:33:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 202445] amdgpu/dc: framerate dropping below adaptive sync range
 causes screen flickering
Date: Mon, 16 Sep 2019 02:33:32 +0000
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
Message-ID: <bug-202445-2300-x9MTZ1A9Vi@https.bugzilla.kernel.org/>
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
b21tZW50ICMzMyBmcm9tIENsw6ltZW50IEd1w6lyaW4gKGxpYmNnQHByb3Rvbm1haWwuY29tKSAt
LS0KSXQgbG9va3MgbGlrZSB0aGUgbHVtaW5hbmNlIGZsaWNrZXJpbmcgc2l0dWF0aW9uIGlzIG11
Y2ggaW1wcm92ZWQgd2hlbiB1c2luZwpsaW51eCA1LjMgd2l0aCB0aGlzICJMRkMgYmVoYXZpb3Vy
IiBwYXRjaCBhcHBsaWVkOgpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9h
bWQtZ2Z4LzIwMTktU2VwdGVtYmVyLzAzOTg1Ni5odG1sCgpUaGUgZWFzaWVzdCB3YXkgdG8gcmVw
cm9kdWNlIHRoZSBwcm9ibGVtIGlzIHRvIHBsYXkgS2VyYmFsIFNwYWNlIFByb2dyYW0sIG9wZW4K
dGhlIFZlaGljbGUgQXNzZW1ibHkgQnVpbGRpbmcgYW5kIHRoZW4gaG92ZXIgdGhlIG1vdXNlIG92
ZXIgdGhlIHBhcnRzIHNlbGVjdG9yLApvbiB0aGUgbGVmdCBvZiB0aGlzIHNjcmVlbnNob3Q6Cmh0
dHBzOi8vd3d3Lmtwcm9wbGFiLm9yZy93cC1jb250ZW50L3VwbG9hZHMvMjAxOC8wOS9lZXgtMS5w
bmcKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRj
aGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
