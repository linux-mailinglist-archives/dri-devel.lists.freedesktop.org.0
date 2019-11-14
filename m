Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB07FC535
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 12:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E001B6E8B0;
	Thu, 14 Nov 2019 11:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476546E8B0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 11:19:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205523] AMDGPU display lockup during boot with 5.4 RC on Ryzen
 2700u
Date: Thu, 14 Nov 2019 11:19:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: briancschott@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205523-2300-GE4XWyasfX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205523-2300@https.bugzilla.kernel.org/>
References: <bug-205523-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1MjMKCi0tLSBD
b21tZW50ICMxIGZyb20gYnJpYW5jc2Nob3R0QGdtYWlsLmNvbSAtLS0KMWM0MjU5MTU5MTMyYWU0
Y2VhZjdjNmRiMzdhNmNmNzY0MTdmNzNkOSBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdApjb21taXQg
MWM0MjU5MTU5MTMyYWU0Y2VhZjdjNmRiMzdhNmNmNzY0MTdmNzNkOQpBdXRob3I6IFNoaXJpc2gg
UyA8c2hpcmlzaC5zQGFtZC5jb20+CkRhdGU6ICAgVHVlIEp1bCAxNiAxNDo0OTo0OCAyMDE5ICsw
NTMwCgogICAgZHJtL2FtZC9kaXNwbGF5OiBlbmFibGUgUy9HIGZvciBSQVZFTiBjaGlwCgogICAg
ZW5hYmxlcyBncHVfdm1fc3VwcG9ydCBpbiBkbSBhbmQgYWRkcwogICAgQU1ER1BVX0dFTV9ET01B
SU5fR1RUIGFzIHN1cHBvcnRlZCBkb21haW4KCiAgICB2MjoKICAgIE1vdmUgQk8gcGxhY2VtZW50
IGxvZ2ljIGludG8gYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMKCiAgICB2MzoKICAg
IFVzZSBhbWRncHVfYm9fdmFsaWRhdGVfdXN3YyBpbiBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRf
ZG9tYWlucy4KCiAgICB2NDoKICAgIGFtZGdwdV9ib192YWxpZGF0ZV91c3djIG1vdmVkIHRvIHNl
cHBlcmF0ZSBwYXRjaC4KCiAgICBTaWduZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2guc0Bh
bWQuY29tPgogICAgU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9k
em92c2t5QGFtZC5jb20+CiAgICBSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmlj
aG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgogICAgU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kaXNwbGF5LmMgICAgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWls
IGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
