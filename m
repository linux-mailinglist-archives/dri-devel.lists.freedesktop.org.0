Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45A77BE8B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 12:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F8589C21;
	Wed, 31 Jul 2019 10:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70BC89C21
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 10:41:06 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 22635228C8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 10:41:04 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 16DD626224; Wed, 31 Jul 2019 10:41:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204391] New: Overdrive on AMDGPU does not allow clocks above
 official clocks.
Date: Wed, 31 Jul 2019 10:41:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204391-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQzOTEKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0MzkxCiAgICAgICAgICAgU3VtbWFyeTogT3ZlcmRyaXZlIG9uIEFN
REdQVSBkb2VzIG5vdCBhbGxvdyBjbG9ja3MgYWJvdmUKICAgICAgICAgICAgICAgICAgICBvZmZp
Y2lhbCBjbG9ja3MuCiAgICAgICAgICAgUHJvZHVjdDogRHJpdmVycwogICAgICAgICAgIFZlcnNp
b246IDIuNQogICAgS2VybmVsIFZlcnNpb246IDUuM3JjMQogICAgICAgICAgSGFyZHdhcmU6IEFs
bAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJlZTogTWFpbmxpbmUK
ICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBub3JtYWwKICAgICAg
ICAgIFByaW9yaXR5OiBQMQogICAgICAgICBDb21wb25lbnQ6IFZpZGVvKERSSSAtIG5vbiBJbnRl
bCkKICAgICAgICAgIEFzc2lnbmVlOiBkcml2ZXJzX3ZpZGVvLWRyaUBrZXJuZWwtYnVncy5vc2Rs
Lm9yZwogICAgICAgICAgUmVwb3J0ZXI6IGhheGs2MTJAZ21haWwuY29tCiAgICAgICAgUmVncmVz
c2lvbjogTm8KCkNyZWF0ZWQgYXR0YWNobWVudCAyODQwNjMKICAtLT4gaHR0cHM6Ly9idWd6aWxs
YS5rZXJuZWwub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTI4NDA2MyZhY3Rpb249ZWRpdApkbWVzZyB3
aXRoIE92ZXJkcml2ZSBlbmFibGVkLgoKQXMgdGhlIHRpdGxlIG9mIHRoZSBidWcgc2F5cyBvdmVy
ZHJpdmUgaGFzIGEgcmFuZ2UgdGhhdCBpdCBvcGVyYXRlcyBpbiBhbmQKdGhhdHMgZ29vZCB0byBu
b3QgYWxsb3cgdXNlcnMgdG8gb3ZlcmNsb2NrIHRoZSBjYXJkIHRvIGl0cyBkZWF0aCBidXQgdGhl
cmUgaXMgYQpidWcgd2hlbiBvdmVyZHJpdmUgaXMgZW5hYmxlZCBpdCBkb2VzIG5vdCBhbGxvdyBj
bG9ja3MgZm9yIGNvcmUgb3IgbWVtb3J5IHRvIGJlCm91dHNpZGUgb2ZmaWNpYWwgY2xvY2tzLgpJ
IGhhdmUgUlg1NjBYIHdpdGggMTI3NSBNaHogb24gQ29yZSBhbmQgMTQ1ME1oeiBvbiBNZW1vcnkg
YW5kIHdoZW4gaSBlbmFibGUKb3ZlcmRyaXZlIGkgY2FuIGluY3JlYXNlIHZvbHRhZ2Ugc3VwbGll
ZCB0byBjb3JlIG9yIG1lbW9yeSBidXQgaW0gbm90IGFsbG93ZWQKdG8gc2V0IGFueSBjbG9jayBh
Ym92ZSB0aGUgb2ZmaWNpYWwgY2xvY2tzLgpJZiB3ZSB0cnkgdG8gZG8gc28gaXQgcmV0dXJucyBp
bnZhbGlkIGFyZ3VtZW50IGFzIHRoZSBmaWxlIGV4cGVjdGVkIHRoZSBjbG9jawp0byBiZSBpbiBy
YW5nZS4KWyAgOTE0LjUxOTkxOV0gYW1kZ3B1OiBbcG93ZXJwbGF5XSBPRCBlbmdpbmUgY2xvY2sg
aXMgb3V0IG9mIHJhbmdlIFsyMTQgLSAxMjc1XQpNSHoKWyAxMDk2LjA5Njg0MF0gYW1kZ3B1OiBb
cG93ZXJwbGF5XSBPRCBtZW1vcnkgY2xvY2sgaXMgb3V0IG9mIHJhbmdlIFszMDAgLSAxNDUwXQpN
SHoKCkkga25vdyBmb3Igc3VyZSB0aGF0IHRoaXMgaXMgbm90IGFuIEdQVSBCSU9TIGlzc3VlIGFz
IGluIFdpbmRvd3Mgd2UgY2FuIGluZGVlZApvdmVyY2xvY2sgdGhlIEdQVSB3YXkgYWJvdmUgdGhl
IG9mZmljaWFsIGNsb2NrcyB3aXRoIHNvbWUgbmljZSBGUFMgYm9vc3QgaW4gYWxsCmdhbWVzIHNv
IHRoZSBvdmVyY2xvY2sgdGhlcmUgd29ya3MuCgpCdXQgd2hhdHMgd2VpcmQgaXMgYWxzbyB0aGF0
IGlmIHdlIGRpc2FibGUgT3ZlcmRyaXZlIGltIGFsbG93ZWQgdG8gb3ZlcmNsb2NrCkNvcmUgZnJl
cXVlbmN5IGJ1dCBpbSBub3QgYWJsZSB0byBvdmVyY2xvY2sgbWVtb3J5IGZyZXF1ZW5jeS4KCkkg
dGhpbmsgYXMgaW0gbG9va2luZyBhdCB0aGUgZG1lc2cgdGhhdCBpdCBtYXkgaGF2ZSB0byBkbyBz
b21ldGhpbmcgd2l0aCB0aGlzOgpbICAzODMuMTYzNzgzXSBhbWRncHU6IFtwb3dlcnBsYXldIHBw
X2RwbV9nZXRfc2Nsa19vZCB3YXMgbm90IGltcGxlbWVudGVkLgpbICAzODMuMTYzODU4XSBhbWRn
cHU6IFtwb3dlcnBsYXldIHBwX2RwbV9nZXRfbWNsa19vZCB3YXMgbm90IGltcGxlbWVudGVkLgpB
bmQgaW5kZWVkIHdoZW4gdHJ5aW5nIHRvIGxvb2sgaW50byB0aGF0IGZpbGUgaXQgZG9lcyBub3Qg
ZXhpc3QgYW55d2hlcmUuIE9ubHkKZmlsZSB0aGF0IGV4aXN0cyB0aGF0IGlzIGNsb3NlIHRvIGl0
IGlzIHBwX2RwbV9tY2xrL3NjbGsuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJl
Y2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
