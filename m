Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A4256FAE
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 20:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F4189993;
	Sun, 30 Aug 2020 18:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAA789993
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 18:20:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209071] Nouveau dual monitor setup: After unlock xscreensaver,
 VGA-1 remains black
Date: Sun, 30 Aug 2020 18:20:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: megia.oscar@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-209071-2300-bniB4yzV8E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209071-2300@https.bugzilla.kernel.org/>
References: <bug-209071-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDkwNzEKCk9zY2Fy
IE1lZ8OtYSAobWVnaWEub3NjYXJAZ21haWwuY29tKSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0
ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KICAgICAgICAgICAgIFN0YXR1c3xORVcgICAgICAgICAgICAgICAgICAgICAgICAgfFJFU09M
VkVECiAgICAgICAgIFJlc29sdXRpb258LS0tICAgICAgICAgICAgICAgICAgICAgICAgIHxJTlZB
TElECgotLS0gQ29tbWVudCAjMyBmcm9tIE9zY2FyIE1lZ8OtYSAobWVnaWEub3NjYXJAZ21haWwu
Y29tKSAtLS0KQWZ0ZXIgcmVzZWFyY2ggSSBmb3VuZCB0aGUgcHJvYmxlbTogVGhlIG1vbml0b3Ig
aXMgYnJva2VuLgoKVG9kYXkgaGFzIGhhcHBlbiBhZ2Fpbi4gSSBzd2l0Y2hlZCBvZmYgbXkgcGMg
YW5kIGFmdGVyIGEgd2hpbGUgSSBzd2l0Y2hlZCBpdApvbi4KClRoZSBtb25pdG9yIHRoYXQgZmFp
bHMgc3dpdGNoZWQgb24gYW5kIGFmdGVyIGEgc2Vjb25kIHRoZSBzY3JlZW4gc3dpdGNoZWQKYmxh
Y2ssIHNvIEkgc3dpdGNoIG9mZiBteSBwYyBhbmQgZGlzY29ubmVjdGVkIHRoZSBvdGhlciBtb25p
dG9yIERWSS1ELTEgYW5kCnN3aWNoZWQgb24gbXkgcGMuIFRoZSBtb25pdG9yIFZHQS0xIHN3aXRj
aGVkIG9uIG9uZSBzZWNvbmQgZHVyaW5nIEJJT1MgbWVzc2FnZXMKYW5kIHN3aXRjaGVkIGJsYWNr
LgoKSSBzd2l0Y2hlZCBvZmYgbXkgcGMgYW5kIGRpc2Nvbm5lY3RlZCB0aGUgVkdBLTEgbW9uaXRv
ciBhbmQgY29ubmVjdGVkIHRoZQpEVkktRC0xIG1vbml0b3IgYnkgdGhlIFZHQSBwb3J0IGFuZCBz
d2l0Y2hlZCBvbiBteSBwYy4gRXZlcnl0aGluZyB3b3JrZWQgZmluZS4KClNvIEkgZ3Vlc3MgdGhh
dCBteSBtb25pdG9yIFZHQS0xIGlzIGJyb2tlbi4KClNvcnJ5IGZvciBkaXN0dXJiaW5nIHlvdSwg
YnV0IHdpdGggdGhlIGVycm9yIG1lc3NhZ2UgSSB0aG91Z2ggdGhhdCBjb3VsZCBiZSBhbgppc3N1
ZSBpbiBub3V2ZWF1IGRyaXZlciBhbmQgcmVwb3J0aW5nIHRoZSBidWcgY291bGQgaGVscCB0aGVt
IHRvIHNvbHZlIGl0LgoKSSBjbG9zZSB0aGUgYnVnIGFzIGludmFsaWQuCgpUaGFua3MgZm9yIHlv
dXIgc3VwcG9ydApPc2NhcgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNl
OgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
