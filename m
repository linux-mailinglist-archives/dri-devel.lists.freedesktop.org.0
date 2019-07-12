Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8F66487
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 04:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C916E2A4;
	Fri, 12 Jul 2019 02:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E726E2A4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 02:43:43 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id EB71C28BB5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 02:43:42 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id DFE2628BB9; Fri, 12 Jul 2019 02:43:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204145] New: amdgpu video playback causes host to hard reset
 (checkstop) on POWER9 with RX 580
Date: Fri, 12 Jul 2019 02:43:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: shawn@anastas.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204145-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxNDUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0MTQ1CiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1IHZpZGVvIHBs
YXliYWNrIGNhdXNlcyBob3N0IHRvIGhhcmQgcmVzZXQKICAgICAgICAgICAgICAgICAgICAoY2hl
Y2tzdG9wKSBvbiBQT1dFUjkgd2l0aCBSWCA1ODAKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJz
CiAgICAgICAgICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4xLjE1CiAgICAg
ICAgICBIYXJkd2FyZTogUFBDLTY0CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAg
ICAgICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2
ZXJpdHk6IGhpZ2gKICAgICAgICAgIFByaW9yaXR5OiBQMQogICAgICAgICBDb21wb25lbnQ6IFZp
ZGVvKERSSSAtIG5vbiBJbnRlbCkKICAgICAgICAgIEFzc2lnbmVlOiBkcml2ZXJzX3ZpZGVvLWRy
aUBrZXJuZWwtYnVncy5vc2RsLm9yZwogICAgICAgICAgUmVwb3J0ZXI6IHNoYXduQGFuYXN0YXMu
aW8KICAgICAgICBSZWdyZXNzaW9uOiBObwoKQ3JlYXRlZCBhdHRhY2htZW50IDI4MzYzNQogIC0t
PiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9MjgzNjM1JmFj
dGlvbj1lZGl0CjUuMS4xNSBrY29uZmlnCgpPbiByZWNlbnQga2VybmVscyAoYXQgbGVhc3Qgc2lu
Y2UgNS4xLjE1KSwgdmlkZW8gcGxheWJhY2sgd2lsbCAoc29tZXRpbWVzKSBoYXJkIApyZXNldCBt
eSBQT1dFUjkgc3lzdGVtIHdpdGggYW4gQU1EIFJYIDU4MC4gRHVlIHRvIHRoZSBuYXR1cmUgb2Yg
dGhlIGNyYXNoLCBpdApkb2VzIG5vdCBzZWVtIHRoYXQgYW55IGtlcm5lbCBsb2dzIGFyZSBwcm9k
dWNlZCBieSB0aGUgZXZlbnQuIFRoZSBzeXN0ZW0KSG9zdGJvb3QgZmlybXdhcmUgZG9lcyByZWNv
cmQgdGhlIGNyYXNoIHRob3VnaCwgYW5kIGl0IHByb2R1Y2VzIGEgR1VBUkQgZXZlbnQKd2hpY2gg
ZGlzYWJsZXMgdGhlIENQVSBzbGljZSB0aGUgY3Jhc2ggb2NjdXJyZWQgb24gZm9yIHN1YnNlcXVl
bnQgYm9vdHMgdW50aWwgCml0IGlzIGNsZWFyZWQuCgpBbiB1cHN0cmVhbSBIb3N0Ym9vdCBpc3N1
ZSBoYXMgYmVlbiBzdWJtaXR0ZWQgYnkgYW5vdGhlciBwZXJzb24gd2hvIGhhcwplbmNvdW50ZXJl
ZCB0aGlzIGJlaGF2aW9yIGFzIHdlbGw6Cmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBvd2VyL2hv
c3Rib290L2lzc3Vlcy8xODAKCkkgaGF2ZSBiZWVuIHVuYWJsZSB0byByZXByb2R1Y2UgdGhlIGlz
c3VlIG9uIGtlcm5lbCA1LjAuOSwgaW5kaWNhdGluZyBhIApyZWdyZXNzaW9uIHNvbWV3aGVyZSBp
biBiZXR3ZWVuLgoKQXR0YWNoZWQgaXMgbXkgNS4xLjE1IGtlcm5lbCBjb25maWcsIHRoZSBvdXRw
dXQgb2YgbHNwY2kgLXZ2LCBhbmQgdGhlIGNvbnRlbnRzCm9mIC9wcm9jL2NwdWluZm8uCgotLSAK
WW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhl
IGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
