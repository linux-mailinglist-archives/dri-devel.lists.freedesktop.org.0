Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B547CAD7A3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 13:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A715E8993B;
	Mon,  9 Sep 2019 11:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9F08993B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 11:07:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204227] Visual artefacts and crash from suspend on amdgpu
Date: Mon, 09 Sep 2019 11:07:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tones111@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204227-2300-1pC48zFuTU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204227-2300@https.bugzilla.kernel.org/>
References: <bug-204227-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyMjcKCi0tLSBD
b21tZW50ICMxMSBmcm9tIHRvbmVzMTExQGhvdG1haWwuY29tIC0tLQpTb21lIGdvb2QgbmV3cy4g
IEFmdGVyIGEgYmlvcyB1cGRhdGUgdG8gTGVub3ZvJ3MgRTQ4NS9FNTg1IDEuNTQgSSBubyBsb25n
ZXIKbmVlZCB0byBwcm92aWRlIGFkZGl0aW9uYWwgYm9vdCBhcmd1bWVudHMgaW4gb3JkZXIgZm9y
IHRoZSBtYWNoaW5lIHRvIGNvbWUgdXAKYW5kIHRoZSB2aXN1YWwgYXJ0aWZhY3RzIGhhdmUgZ29u
ZSBhd2F5LgoKSSB3b3VsZCBzZWUgaXNzdWVzIHdpdGggc29tZSBmb250cyBpbiBGaXJlZm94IHRo
YXQgbG9va2VkIHNpbWlsYXIgdG8geW91cgpzY3JlZW5zaG90LiAgVGhlIGVhc2llc3Qgd2F5IGZv
ciBtZSB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0gd2FzIHRvIHJlc2l6ZSBteQp0ZXJtaW5hbCAo
QWxhY3JpdHR5KSBvciBzY3JvbGwgYXJvdW5kIGluIGdpdGsgb3IgZ3ZpbS4KCkFmdGVyIGEgZmV3
IGRheXMgcnVubmluZyBvbiB0aGUgbmV3IGJpb3MgSSBoYXZlbid0IHNlZW4gdGhlIGFydGlmYWN0
cywgc28gdGhpcwpidWcgbG9va3MgdG8gYmUgcmVzb2x2ZWQgZm9yIG1lIHNpbmNlIGtlcm5lbCA1
LjIuMTEuCgpUaGFua3MhCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6
CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
