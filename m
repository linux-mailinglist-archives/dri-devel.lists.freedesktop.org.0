Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A506D5060
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 16:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2086E02E;
	Sat, 12 Oct 2019 14:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2936E02E
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 14:24:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205169] New: AMDGPU driver with Navi card hangs Xorg in
 fullscreen only.
Date: Sat, 12 Oct 2019 14:24:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-205169-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUxNjkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MTY5CiAgICAgICAgICAgU3VtbWFyeTogQU1ER1BVIGRyaXZlciB3
aXRoIE5hdmkgY2FyZCBoYW5ncyBYb3JnIGluIGZ1bGxzY3JlZW4KICAgICAgICAgICAgICAgICAg
ICBvbmx5LgogICAgICAgICAgIFByb2R1Y3Q6IERyaXZlcnMKICAgICAgICAgICBWZXJzaW9uOiAy
LjUKICAgIEtlcm5lbCBWZXJzaW9uOiA1LjQuMC1yYzIKICAgICAgICAgIEhhcmR3YXJlOiB4ODYt
NjQKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICAgIFRyZWU6IE1haW5saW5l
CiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBTZXZlcml0eTogbm9ybWFsCiAgICAg
ICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24gSW50
ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3Nk
bC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBkcmpvbXNAZ21haWwuY29tCiAgICAgICAgUmVncmVz
c2lvbjogTm8KCkkgaGF2ZSBhbm90aGVyIHByb2JsZW0gbG9nZ2VkIHdpdGggTmF2aSArIEFNREdQ
VSBkcml2ZXJzLiBJdCdzIHRyaWdnZXJlZAppbmRlcGVuZGVudGx5IGFuZCByZWxpYWJsZS4KaHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ3MjUKCldpdGggdGhh
dCBzYWlkLCBzdGFydGluZyBzdHJpY3RseSBhbmQgc3BlY2lmaWNhbGx5IHdpdGgga2VybmVsIHZl
cnNpb24gNS40LjAqIEkKaGF2ZSBuZXcgcHJvYmxlbS4KCkkgc3VjY2Vzc2Z1bGx5IGxvYWQgaW50
byBYb3JnLiBJIGNhbiBzdGFydCBPcGVuR0wgYW5kIFZ1bGthbiBnYW1lcyBpbiBub24gZnVsbApz
Y3JlZW4uIEJ1dCBvbmNlIEkgc3RhcnQgdGhlbSAtIGlucHV0IGRldmljZXMgaGFuZywgc2NyZWVu
IGZyZWV6ZXMuIE1hY2hpbmUgaXMKcmVzcG9uc2l2ZSBvdmVyIFNTSC9ldGhlcm5ldC4gSSBjYW4g
cmFpc2Ugc2tpbm55IGVsZXBoYW50cy4KCkkgdHJpZWQgb3BlbmluZyBhIGZldyBnYW1lcyBpbiBu
b24gZnVsbCBzY3JlZW4gbW9kZSBhbmQgaW4gZnVsbCBzY3JlZW4gbW9kZS4KQW5kIGkgcmVsaWFi
bHkgaGl0IGJ1ZyBldmVyeXRpbWUgYW55dGhpbmcgd2l0aCBPcGVuR0wgZ29lcyBmdWxsIHNjcmVl
biBvbgpuYXRpdmUgcmVzb2x1dGlvbiBvZiB0aGUgc2NyZWVuLgoKSSBub3RpY2VkLCBpc3N1ZSBp
cyBsZXNzIGxpa2VseSB0byBoYXBwZW4gaWYgcHJvZ3JhbSBnb2VzIGZ1bGwgc2NyZWVuIGluIG5v
bgpuYXRpdmUgcmVzb2x1dGlvbi4KCkkgd2lsbCBhdHRhY2ggZGV0YWlscyBpbiBmaWxlcyBmb3Ig
RE1FU0csIGxzbW9kIGFuZCBzb21lIG90aGVyIHRoaW5ncyBkaXJlY3RseQphcyBtZXNzYWdlLCBp
ZiB0aGV5IGFyZSBzaG9ydCBlbm91Z2guCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWls
IGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
