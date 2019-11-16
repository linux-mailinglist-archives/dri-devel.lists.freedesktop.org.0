Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76843FECA1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 15:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF7C6E118;
	Sat, 16 Nov 2019 14:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C936E118
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 14:15:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 16 Nov 2019 14:15:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201539-2300-LuNnaHQTWy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDE1MzkKCi0tLSBD
b21tZW50ICMzMSBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQpv
aCBJIGxvdmUgaXQgdGhleSBrbm93IHRoZSBkcml2ZXJzIGZpbGUgaXMgY3JhcCAKCmFueWhvdyBp
dCBsb29rcyBsaWtlIHRoZSByZWFsIGlzc3VlIGlzIGluIHRoZSBHUFUgZHJpdmVyIAoKZmFuIHNw
ZWVkcyB0ZW1wcyBldmVyeXRoaW5nIGlzIGluIHRoZWlyICwgb2ZjYXVzZSB0aGlzIHdvdWxkIG5v
dCBiZSBhbiBpc3N1ZSBpZiAKcHdtMV9lbmFibGUgIHdhcyBOT1QgU1RVQ0sgIE9OIEFVVE8gCgoK
I2lmIDAKICAgICAgICAgICAgICAgIC8qIFhYWDogbmVlZCB0byBmaWd1cmUgb3V0IGhvdyB0byBo
YW5kbGUgdGhpcyBwcm9wZXJseSAqLwogICAgICAgICAgICAgICAgdG1wID0gUlJFRzMyX1NNQyhp
eENHX1RIRVJNQUxfQ1RSTCk7CiAgICAgICAgICAgICAgICB0bXAgJj0gRFBNX0VWRU5UX1NSQ19N
QVNLOwogICAgICAgICAgICAgICAgdG1wIHw9IERQTV9FVkVOVF9TUkMoZHBtX2V2ZW50X3NyYyk7
CiAgICAgICAgICAgICAgICBXUkVHMzJfU01DKGl4Q0dfVEhFUk1BTF9DVFJMLCB0bXApOwojZW5k
aWYKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRj
aGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
