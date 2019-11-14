Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31645FBCCB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 01:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1622D6EEA0;
	Thu, 14 Nov 2019 00:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943E36EEA0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 00:02:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205517] New: nouveau MMIO read of 00000000 FAULT at 619444
Date: Thu, 14 Nov 2019 00:02:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205517-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1MTcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1NTE3CiAgICAgICAgICAgU3VtbWFyeTogbm91dmVhdSBNTUlPIHJl
YWQgb2YgMDAwMDAwMDAgRkFVTFQgYXQgNjE5NDQ0CiAgICAgICAgICAgUHJvZHVjdDogRHJpdmVy
cwogICAgICAgICAgIFZlcnNpb246IDIuNQogICAgS2VybmVsIFZlcnNpb246IDUuMy4wCiAgICAg
ICAgICBIYXJkd2FyZTogQWxsCiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAg
ICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJp
dHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlk
ZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJp
QGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogdG9kZC5lLmJyYW5kdEBs
aW51eC5pbnRlbC5jb20KICAgICAgICBSZWdyZXNzaW9uOiBObwoKQ3JlYXRlZCBhdHRhY2htZW50
IDI4NTg5MwogIC0tPiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/
aWQ9Mjg1ODkzJmFjdGlvbj1lZGl0Cmlzc3VlLmRlZgoKTlZpZGlhIEdQVSBkcml2ZXIgZmF1bHQg
b24gRGVsbCBzeXN0ZW1zIGR1cmluZyByZXN1bWUuCgpbMzMxMzMuMzk4MDkyXSBub3V2ZWF1IDAw
MDA6MDE6MDAuMDogY2FsbGluZyAgbnZfbXNpX2h0X2NhcF9xdWlya19sZWFmKzB4MC8weDMwCkAg
MjcKWzMzMTMzLjM5ODEwMl0gbm91dmVhdSAwMDAwOjAxOjAwLjA6IG52X21zaV9odF9jYXBfcXVp
cmtfbGVhZisweDAvMHgzMCB0b29rIDUKdXNlY3MKWzMzMTMzLjM5ODEwNF0gbm91dmVhdSAwMDAw
OjAxOjAwLjA6IGNhbGxpbmcgIHF1aXJrX252aWRpYV9oZGErMHgwLzB4YzAgQCAyNwpbMzMxMzMu
Mzk4MTA3XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRW5hYmxpbmcgSERBIGNvbnRyb2xsZXIKWzMz
MTMzLjM5ODExMF0gbm91dmVhdSAwMDAwOjAxOjAwLjA6IHF1aXJrX252aWRpYV9oZGErMHgwLzB4
YzAgdG9vayAzIHVzZWNzClszMzEzMy4zOTkyMjBdIGRvbmUuClszMzEzMy41NDAyMDFdIG5vdXZl
YXUgMDAwMDowMTowMC4wOiBidXM6IE1NSU8gcmVhZCBvZiAwMDAwMDAwMCBGQVVMVCBhdCA2MTk0
NDQKWyBJQlVTIF0KWzMzMTMzLjU1NjA5NF0gUE06IHN1c3BlbmQgZXhpdAoKLS0gCllvdSBhcmUg
cmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25l
ZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
