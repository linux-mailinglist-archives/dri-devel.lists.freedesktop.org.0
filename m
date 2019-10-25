Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A0E516B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 18:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C556EAFE;
	Fri, 25 Oct 2019 16:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DBE6EAFE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 16:38:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204559] amdgpu: kernel oops with constant gpu resets while
 using mpv
Date: Fri, 25 Oct 2019 16:38:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thejoe@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204559-2300-7RWEJYeoYv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204559-2300@https.bugzilla.kernel.org/>
References: <bug-204559-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ1NTkKCnRoZWpv
ZUBnbWFpbC5jb20gY2hhbmdlZDoKCiAgICAgICAgICAgV2hhdCAgICB8UmVtb3ZlZCAgICAgICAg
ICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAg
Q0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx0aGVqb2VAZ21haWwuY29tCgotLS0gQ29t
bWVudCAjMTIgZnJvbSB0aGVqb2VAZ21haWwuY29tIC0tLQpIYXZlIHNlZW4gdGhlIHNhbWUga2Vy
bmVsIG9vcHMgb24gYSBkZWxsIFhQUyAxNSAyLWluLTEgOTU3NSB3aXRoIHZlZ2EgbSBoeWJyaWQK
Z3JhcGhpY3MuICBBcyBmYXIgYXMgSSBjb3VsZCB0ZWxsIGl0IHdhcyBub3QgdHJpZ2dlcmVkIGJ5
IGFueXRoaW5nIHNwZWNpZmljIChlZwptcHYgcGxheWJjaykgdGhvdWdoLiAgUnVubmluZyBydW4g
cnVucG09MCBub3csIGFuZCBoYXZlbid0IHNlZW4gaXQgYWdhaW4geWV0LApidXQgb25seSBoYXZl
IHNlZW4gaXQgb25jZSBvciB0d2ljZSB3aXRob3V0IHJ1bnBtPTAuCgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9m
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
