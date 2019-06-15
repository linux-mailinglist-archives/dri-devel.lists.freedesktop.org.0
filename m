Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3410471FB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 22:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D350D8929F;
	Sat, 15 Jun 2019 20:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046B18929F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 20:02:03 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id C6EF128723
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 20:02:02 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id BB377287B3; Sat, 15 Jun 2019 20:02:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] New: amdgpu:actual_brightness has unreal/wrong value
Date: Sat, 15 Jun 2019 20:02:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjo@nord-west.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-203905-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM5MDUKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjAzOTA1CiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1OmFjdHVhbF9i
cmlnaHRuZXNzIGhhcyB1bnJlYWwvd3JvbmcgdmFsdWUKICAgICAgICAgICBQcm9kdWN0OiBEcml2
ZXJzCiAgICAgICAgICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4xLjkKICAg
ICAgICAgIEhhcmR3YXJlOiBBbGwKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAg
ICAgIFRyZWU6IE1haW5saW5lCiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBTZXZl
cml0eTogbm9ybWFsCiAgICAgICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBW
aWRlbyhEUkkgLSBub24gSW50ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1k
cmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBiam9Abm9yZC13ZXN0
Lm9yZwogICAgICAgIFJlZ3Jlc3Npb246IE5vCgpSYWRlb24gUjUvUjYvUjcgR3JhcGhpY3MgaW4g
YSBUaGlua3BhZCBBMjc1IGhhcyB3cm9uZyB2YWx1ZXMgb24KYWN0dWFsX2JyaWdodG5lc3Mgb2Yg
YW1kZ3B1X2JsMC4gV2hpbGUgbWF4X2JyaWdodG5lc3MgaXMgMjU1IGFuZCBpdCBjYW4gYmUgc2V0
CnRvIDI1NSwgYWN0dWFsX2JyaWdodG5lc3MgcmVwb3J0cyBhIDUgZGlnaXQgbnVtYmVyIGxpa2Ug
MTI0NzAuIEFzIGEgcmVzdWx0LAp0b29scyB3aGljaCB3YW50IHRvIGNoYW5nZSB0aGUgYnJpZ2h0
bmVzcyByZWxhdGVkIHRvIGFjdHVhbF9icmlnaHRuZXNzIGZhaWwsIGFzCmJyaWdodG5lc3MgZG9l
cyBub3QgYWNjZXB0IGFueSA1IGRpZ2l0IG51bWJlciwKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0
aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1
Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
