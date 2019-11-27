Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8437E10B1B1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 15:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117FE88E87;
	Wed, 27 Nov 2019 14:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDFA88E87
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 14:56:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Wed, 27 Nov 2019 14:56:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205675-2300-OSoxWGw2jl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205675-2300@https.bugzilla.kernel.org/>
References: <bug-205675-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU2NzUKClBpZXJy
ZS1FcmljIFBlbGxvdXgtUHJheWVyIChwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29t
KSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAg
ICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAgICAgICAgICBDQ3wgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfHBpZXJyZS1lcmljLnBlbGxvdXgtcHJheWVyQAogICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8YW1kLmNvbQoKLS0tIENv
bW1lbnQgIzEgZnJvbSBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciAocGllcnJlLWVyaWMucGVs
bG91eC1wcmF5ZXJAYW1kLmNvbSkgLS0tClRoYW5rcyBmb3IgdGhlIGJ1ZyByZXBvcnQuCgpUaGUg
c2RtYTAgdGltZW91dCBpc3N1ZSAoZnJvbSB5b3UgZG1lc2cpIGhhcyBhbHJlYWR5IGJlZW4gcmVw
b3J0ZWQuIFRoZSBtb3N0CmFjdGl2ZSBidWcgcmVwb3J0IGlzOiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL2FtZC9pc3N1ZXMvODkyCgpOb3RlIHRoYXQgc2RtYSB1c2FnZSBmb3Ig
TmF2aSBpcyBkaXNhYmxlZCBmb3IgTWVzYSAxOS4zIGFuZCAxOS4yLjUgc28gdGhpcwppc3N1ZSBz
aG91bGRuJ3Qgb2NjdXIgaWYgeW91IHVzZSBvbmUgb2YgdGhlc2UgcmVsZWFzZXMuCgpPdGhlciBy
ZWxhdGVkIGlzc3VlczoKIC0gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNn
aT9pZD0yMDUxNjkgLSBoYXMgYSBwYXRjaCBidXQgbmVlZCB0bwpiZSBhcHBsaWVkIG1hbnVhbGx5
IHVudGlsIGl0IG1ha2VzIGl0IHRvIGFuIHVwc3RyZWFtIHJlbGVhc2UKIC0gZ2Z4IHRpbWVvdXQg
aXNzdWVzOiB0aG9zZSBhcmUgbGlrZWx5IHRvIGJlIGdhbWUgc3BlY2lmaWMgYW5kIGFyZSBwcm9i
YWJseSBhCmJ1ZyBpbiBNZXNhIChodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9t
ZXNhL2lzc3VlcykKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91
IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
