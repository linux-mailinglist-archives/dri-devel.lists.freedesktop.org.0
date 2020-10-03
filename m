Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24CE2823F1
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 13:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9BF6E113;
	Sat,  3 Oct 2020 11:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4796E113
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 11:42:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203439] amdgpu: [REG 4.20 -> 5.0] Brightness minimum level is
 too high
Date: Sat, 03 Oct 2020 11:42:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: acomagu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203439-2300-2ug7VXTxrV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203439-2300@https.bugzilla.kernel.org/>
References: <bug-203439-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM0MzkKCmFjb21h
Z3VAZ21haWwuY29tIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAg
ICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAgICAgICAgICAg
IENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8YWNvbWFndUBnbWFpbC5jb20KCi0tLSBD
b21tZW50ICM0IGZyb20gYWNvbWFndUBnbWFpbC5jb20gLS0tCkkgYWxzbyBuZWVkIHRoaXMgZml4
LgoKQXMgQsWCYcW8ZWogU3pjenlnaWXFgiBzYXlzLCB0aGUgbWluaW11bSBiYWNrbGlnaHQgbGV2
ZWwgaXMgdG9vIGJyaWdodCBhdCBuaWdodApmb3IgbWUuIFRoYXQncyB3aHkgSSdtIHN0YXlpbmcg
YXQgNC4xOSBpbnN0ZWFkIG9mIDUueC4KCkkgaG9wZSBhbnlvbmUgY29uc2lkZXJzIGJldHRlciBz
dHJhdGVneSBsaWtlIGJhc2VkIG9uIHN1Y2ggZGV2aWNlIGxpc3QuCgotLSAKWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9m
IHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
