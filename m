Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3577DE050
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 22:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DDF89207;
	Sun, 20 Oct 2019 20:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5154D89207
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2019 20:06:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Sun, 20 Oct 2019 20:06:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@catmail.app
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204241-2300-o7JVbNooCR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCk1hcmlv
IChrZXJuZWxAY2F0bWFpbC5hcHApIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92
ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAg
ICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8a2VybmVsQGNhdG1haWwu
YXBwCgotLS0gQ29tbWVudCAjMzYgZnJvbSBNYXJpbyAoa2VybmVsQGNhdG1haWwuYXBwKSAtLS0K
SSBjYW4gYWxzbyBjb25maXJtIHRoaXMgcGF0Y2ggKDI4NTUwNykgZml4ZWQgdGhlIHByb2JsZW0g
b24gQXJjaCBMaW51eCA1LjMuNy4gCgpUaGUgc3RvY2sga2VybmVsIGZhaWxlZCBhZnRlciB+NSBz
bGVlcC13YWtlIGN5Y2xlcy4gUGF0Y2hlZCBrZXJuZWwgd2FzIGFibGUgdG8Kc3Vydml2ZSB0aGUg
Y29tcGxldGUgMzAgY3ljbGVzOgoKYGBgZm9yIGkgaW4gJChzZXEgMzApOyBkbyBzdWRvIHJ0Y3dh
a2UgLW0gbWVtIC1zIDU7IHNsZWVwIDE1OyBkb25lYGBgCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4g
SSBhbHNvIHN1c3BlY3QgdGhhdCBidWcgMjA0OTY1IGlzIGEgZHVwbGljYXRlIG9mIHRoaXMKb25l
LgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNo
aW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
