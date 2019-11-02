Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A81ED0A3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 22:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB040892D2;
	Sat,  2 Nov 2019 21:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D175892D2
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 21:26:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205393] New: [amdgpu powerplay] vega10: custom pp_table, AVFS
 accidentally reenabled after display powersave
Date: Sat, 02 Nov 2019 21:26:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haro41@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205393-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUzOTMKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1MzkzCiAgICAgICAgICAgU3VtbWFyeTogW2FtZGdwdSBwb3dlcnBs
YXldIHZlZ2ExMDogY3VzdG9tIHBwX3RhYmxlLCBBVkZTCiAgICAgICAgICAgICAgICAgICAgYWNj
aWRlbnRhbGx5IHJlZW5hYmxlZCBhZnRlciBkaXNwbGF5IHBvd2Vyc2F2ZQogICAgICAgICAgIFBy
b2R1Y3Q6IERyaXZlcnMKICAgICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9u
OiA1LjQtcmM1CiAgICAgICAgICBIYXJkd2FyZTogQWxsCiAgICAgICAgICAgICAgICBPUzogTGlu
dXgKICAgICAgICAgICAgICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwog
ICAgICAgICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAg
IENvbXBvbmVudDogVmlkZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRy
aXZlcnNfdmlkZW8tZHJpQGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjog
aGFybzQxQGdteC5kZQogICAgICAgIFJlZ3Jlc3Npb246IE5vCgpDcmVhdGVkIGF0dGFjaG1lbnQg
Mjg1NzU1CiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9p
ZD0yODU3NTUmYWN0aW9uPWVkaXQKcGF0Y2ggdG8gcHJldmVudCBBVkZTIHJlZW5hYmxpbmcgKGFn
YWluc3QgNS40LXJjNSkKCldoZW4gdXBsb2FkaW5nIGEgY3VzdG9taXplZCBwb3dlcnBsYXkgdGFi
bGUsIEFWRlMgZmVhdHVyZSBiZWNvbWVzIGNvcnJlY3RseQpkaXNhYmxlZC4KCkJ1dCBhZnRlciBh
IHBvd2VyIHNhdmUgKGJsYW5jIHNjcmVlbikgZXZlbnQsIEFWRlMgYmVjb21lcyBhY2NpZGVudGFs
bHkgZW5hYmxlZAphZ2Fpbi4gVGhpcyByZXN1bHRzIGluIHVud2FudGVkIGdmeCB2b2x0YWdlIGNo
YW5nZXMuCgpFeGFtcGxlOgoKdmRkYyA9IDEuMDc1ViBhZnRlciBwcCB0YWJsZSB1cGxvYWQgKGNv
cnJlY3QpLgoKdmRkYyA9IDEuMTUwViBhZnRlciBwb3dlciBzYXZlIGV2ZW50IChzZXQgYnkgc21j
IGJlY2F1c2UgQVZGUyBmZWF0dXJlCnJlZW5hYmxlZCkuCgpJIGhhdmUgZGVidWdnZWQgdGhpcyBp
c3N1ZSBhbmQgZm91bmQgYSBzaW1wbGUgc29sdXRpb24uIFRoZXJlIGlzIGEgcGF0Y2gKYXR0YWNo
ZWQsIHRoYXQgc29sdmVzIHRoZSBwcm9ibGVtLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMg
bWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
