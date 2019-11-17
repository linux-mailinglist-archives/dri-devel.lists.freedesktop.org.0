Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27900FF637
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 01:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA656E095;
	Sun, 17 Nov 2019 00:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D5C6E095
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 00:43:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sun, 17 Nov 2019 00:43:11 +0000
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
Message-ID: <bug-201539-2300-x75wKnZgxF@https.bugzilla.kernel.org/>
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
b21tZW50ICMzMyBmcm9tIE1hc3RlckNBVFogKG1hc3RlcmNhdHpAaG90bWFpbC5jb20pIC0tLQph
bm90aGVyIHBsYW4gCgpkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5j
IAoKaHdtZ3ItPmRwbV9sZXZlbCA9IEFNRF9EUE1fRk9SQ0VEX0xFVkVMX0FVVE87CiAgICAgICAg
aHdtZ3JfaW5pdF9kZWZhdWx0X2NhcHMoaHdtZ3IpOwogICAgICAgIGh3bWdyX2luaXRfZGVmYXVs
dF9jYXBzKGh3bWdyKTsKICAgICAgICBod21ncl9zZXRfdXNlcl9zcGVjaWZ5X2NhcHMoaHdtZ3Ip
OwogICAgICAgIGh3bWdyX3NldF91c2VyX3NwZWNpZnlfY2Fwcyhod21ncik7CiAgICAgICAgaHdt
Z3ItPmZhbl9jdHJsX2lzX2luX2RlZmF1bHRfbW9kZSA9IHRydWU7CgpjaGFuZ2UgdG8gZmFsc2Ug
dG8gZGlzYWJsZSBhdXRvIC4uIG5vdCBsaWtlIGl0cyBnb2luZyB0byBiZSBhbnkgd29yc2UgZm9y
IHVzIAoKdGhlbiBHUFUncyB0aGVybWFsIHN5c3RlbSB3aWxsIHJ1biBhbmQgeW91IGNhbiBhY3R1
YWxseSBtYW51YWxseSBydW4gdGhlIGZhbnMgCmJ1dCB1bnN1cmUgaWYgdGhpcyB3aWxsIHN0b3Ag
YXV0byBjb3JlIHNwZWVkIHBvd2VyIHNhdmUgZmVhdHVyZXMgYXMgd2VsbAoKLS0gCllvdSBhcmUg
cmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25l
ZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
