Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8AF114BAE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 05:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50186F96B;
	Fri,  6 Dec 2019 04:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E376F96B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 04:32:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Fri, 06 Dec 2019 04:32:46 +0000
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
Message-ID: <bug-201539-2300-RHRlCFgsjT@https.bugzilla.kernel.org/>
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
b21tZW50ICM0MCBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQph
aW9AYWlvOn4kIHN1ZG8gcHdtY29uZmlnCltzdWRvXSBwYXNzd29yZCBmb3IgYWlvOiAKIyBwd21j
b25maWcgcmV2aXNpb24gJFJldmlzaW9uJCAoJERhdGUkKQpUaGlzIHByb2dyYW0gd2lsbCBzZWFy
Y2ggeW91ciBzZW5zb3JzIGZvciBwdWxzZSB3aWR0aCBtb2R1bGF0aW9uIChwd20pCmNvbnRyb2xz
LCBhbmQgdGVzdCBlYWNoIG9uZSB0byBzZWUgaWYgaXQgY29udHJvbHMgYSBmYW4gb24KeW91ciBt
b3RoZXJib2FyZC4gTm90ZSB0aGF0IG1hbnkgbW90aGVyYm9hcmRzIGRvIG5vdCBoYXZlIHB3bQpj
aXJjdWl0cnkgaW5zdGFsbGVkLCBldmVuIGlmIHlvdXIgc2Vuc29yIGNoaXAgc3VwcG9ydHMgcHdt
LgoKV2Ugd2lsbCBhdHRlbXB0IHRvIGJyaWVmbHkgc3RvcCBlYWNoIGZhbiB1c2luZyB0aGUgcHdt
IGNvbnRyb2xzLgpUaGUgcHJvZ3JhbSB3aWxsIGF0dGVtcHQgdG8gcmVzdG9yZSBlYWNoIGZhbiB0
byBmdWxsIHNwZWVkCmFmdGVyIHRlc3RpbmcuIEhvd2V2ZXIsIGl0IGlzICoqIHZlcnkgaW1wb3J0
YW50ICoqIHRoYXQgeW91CnBoeXNpY2FsbHkgdmVyaWZ5IHRoYXQgdGhlIGZhbnMgaGF2ZSBiZWVu
IHRvIGZ1bGwgc3BlZWQKYWZ0ZXIgdGhlIHByb2dyYW0gaGFzIGNvbXBsZXRlZC4KCkZvdW5kIHRo
ZSBmb2xsb3dpbmcgZGV2aWNlczoKICAgaHdtb24wIGlzIGFjcGl0egogICBod21vbjEgaXMgYW1k
Z3B1CiAgIGh3bW9uMiBpcyBjb3JldGVtcAogICBod21vbjMgaXMgaXQ4NjIwCiAgIGh3bW9uNCBp
cyBpdDg3OTIKCkZvdW5kIHRoZSBmb2xsb3dpbmcgUFdNIGNvbnRyb2xzOgogICBod21vbjEvcHdt
MSAgICAgICAgICAgY3VycmVudCB2YWx1ZTogMTA0Cmh3bW9uMS9wd20xIGlzIGN1cnJlbnRseSBz
ZXR1cCBmb3IgYXV0b21hdGljIHNwZWVkIGNvbnRyb2wuCkluIGdlbmVyYWwsIGF1dG9tYXRpYyBt
b2RlIGlzIHByZWZlcnJlZCBvdmVyIG1hbnVhbCBtb2RlLCBhcwppdCBpcyBtb3JlIGVmZmljaWVu
dCBhbmQgaXQgcmVhY3RzIGZhc3Rlci4gQXJlIHlvdSBzdXJlIHRoYXQKeW91IHdhbnQgdG8gc2V0
dXAgdGhpcyBvdXRwdXQgZm9yIG1hbnVhbCBjb250cm9sPyAobikgeQpod21vbjEvcHdtMV9lbmFi
bGUgc3R1Y2sgdG8gMgpNYW51YWwgY29udHJvbCBtb2RlIG5vdCBzdXBwb3J0ZWQsIHNraXBwaW5n
IGh3bW9uMS9wd20xLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZ
b3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
