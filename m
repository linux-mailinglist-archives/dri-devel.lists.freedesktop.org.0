Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01419C18E4
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 20:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417E6E311;
	Sun, 29 Sep 2019 18:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27A96E311
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 18:10:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Sun, 29 Sep 2019 18:10:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: spam@nowaker.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204181-2300-5ecEWoqEnR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCkRhbWlh
biBOb3dhayAoc3BhbUBub3dha2VyLm5ldCkgY2hhbmdlZDoKCiAgICAgICAgICAgV2hhdCAgICB8
UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAg
ICAgICAgICAgICAgICAgQ0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxzcGFtQG5vd2Fr
ZXIubmV0CgotLS0gQ29tbWVudCAjNTggZnJvbSBEYW1pYW4gTm93YWsgKHNwYW1Abm93YWtlci5u
ZXQpIC0tLQpJIGVuY291bnRlciB0aGlzIGVycm9yIG9uY2UgYSB3ZWVrIG9uIGF2ZXJhZ2Ugb24g
bXkgUmFkZW9uIDcgKFZlZ2EgMjApLiBHcmVhdApvbiBzZWUgeW91IGd1eXMgYWN0aXZlbHkgd29y
a2luZyBvbiBpdC4gV2hlbiA1LjMuMiByZWxlYXNlcyB0byBBcmNoLCBJJ2xsIGtlZXAKdXNpbmcg
aXQgZm9yIGEgd2VlayBvciB0d28gYW5kIHJlcG9ydCBiYWNrIHdoZXRoZXIgSSBlbmNvdW50ZXIg
YW4gaXNzdWUgYWdhaW4Kb3Igbm90LiBUaGFua3MhIAoKQFNlcmdleSBZb3UgY291bGQgcmV2ZXJ0
IHRvIGRlZmF1bHRzIGp1c3QgZm9yIHRoZSBkdXJhdGlvbiBvZgp0ZXN0aW5nL2RlYnVnZ2luZy4g
SXQnbGwgc3VyZSBtYWtlIHRoaW5ncyBlYXNpZXIgZm9yIGRldmVsb3BlcnMsIGFuZCB5b3UgY2Fu
CnN0aWxsIGdvIGJhY2sgdG8geW91ciBzZXR0aW5ncyBvbmNlIHRoZSBpc3N1ZSBpcyBmaXhlZC4g
R3JlYXQgc2V0dGluZ3MKbm9uZXRoZWxlc3MsIGRvIHRoZXNlIGtlcm5lbCBwYXJhbWV0ZXJzIHJl
YWxseSBpbXByb3ZlIHRoZSBwb3dlciBwZXJmb3JtYW5jZSBvZgpSWCA1ODAsIG9yIGRpZCB5b3Ug
bmVlZCB0byBkbyBzb21ldGhpbmcgaW4gYWRkaXRpb24gdG9vPyBCeSB0aGUgd2F5LCBJIHVzZWQg
UlgKNTgwIG9uIGRlZmF1bHQgQXJjaCBMaW51eCBzZXR0aW5ncyAoc28gbW9zdCBsaWtlbHkga2Vy
bmVsIGRlZmF1bHRzKSBmb3IgYSB5ZWFyCmFuZCBpdCB3YXMgZmluZSBzbyB5b3UgcHJvYmFibHkg
ZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCBmcnlpbmcgaXQuIE5vdyBJJ20KdXNpbmcgUmFkZW9u
IDcsIHdoaWxlIFJYIDU4MCBpcyBzdGlsbCBhbGl2ZSBpbiBhIGRpZmZlcmVudCBXaW5kb3dzLWJh
c2VkCmNvbXB1dGVyLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZ
b3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
