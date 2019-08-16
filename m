Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B384B90841
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 21:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ED16E99C;
	Fri, 16 Aug 2019 19:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A908E6E99C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:38:59 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 6771E2015F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:38:59 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 4E462204FE; Fri, 16 Aug 2019 19:38:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204599] New: amdgpu: RX 560 randomly hangs with kernel >= 5.1
Date: Fri, 16 Aug 2019 19:38:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tony.darko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204599-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ1OTkKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0NTk5CiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1OiBSWCA1NjAg
cmFuZG9tbHkgaGFuZ3Mgd2l0aCBrZXJuZWwgPj0gNS4xCiAgICAgICAgICAgUHJvZHVjdDogRHJp
dmVycwogICAgICAgICAgIFZlcnNpb246IDIuNQogICAgS2VybmVsIFZlcnNpb246IDUuMi44CiAg
ICAgICAgICBIYXJkd2FyZTogeDg2LTY0CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAg
ICAgICAgICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAg
U2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVu
dDogVmlkZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlk
ZW8tZHJpQGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogdG9ueS5kYXJr
b0BnbWFpbC5jb20KICAgICAgICBSZWdyZXNzaW9uOiBObwoKSSBoYXZlIGh5YnJpZCBncmFwaGlj
cyBvbiBMZW5vdm8gSWRlYXBhZCA3MjAgbGFwdG9wIChJbnRlbCBpNyA4NTUwVSBhbmQgQU1EIFJY
CjU2MCksIHVzZSBhbWRncHUgYW5kIGkgaGF2ZSByYW5kb21seSBoYW5ncyB3aXRoIGtlcm5lbHMg
PiA1LjAuMTMuCgpBTURHUFUgaGFuZ3Mgb24gbGFwdG9wIHJldHVybmVkIGZyb20gaGliZXJuYXRl
LCBidXQgb24gbGF0ZXN0IHRpbWUgaSBnbyB0bwo1LjIuOCBhbmQgbm93IEFNREdQVSBoYW5ncyBv
biBub3JtYWwgd29yayAob25seSBzdXNwZW5kIHRvIHJhbSwgd2l0aG91dApoaWJlbmF0ZXMpLgoK
IyBsc2NwaSAtdjoKMDE6MDAuMCBEaXNwbGF5IGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3JvIERl
dmljZXMsIEluYy4gW0FNRC9BVEldIEJhZmZpbgpbUmFkZW9uIFJYIDQ2MC81NjBEIC8gUHJvIDQ1
MC80NTUvNDYwLzU1NS81NTVYLzU2MC81NjBYXSAocmV2IGUwKQogICAgICAgIFN1YnN5c3RlbTog
TGVub3ZvIEJhZmZpbiBbUmFkZW9uIFJYIDQ2MC81NjBEIC8gUHJvCjQ1MC80NTUvNDYwLzU1NS81
NTVYLzU2MC81NjBYXQogICAgICAgIEZsYWdzOiBidXMgbWFzdGVyLCBmYXN0IGRldnNlbCwgbGF0
ZW5jeSAwLCBJUlEgMTI3CiAgICAgICAgTWVtb3J5IGF0IGEwMDAwMDAwICg2NC1iaXQsIHByZWZl
dGNoYWJsZSkgW3NpemU9MjU2TV0KICAgICAgICBNZW1vcnkgYXQgYjAwMDAwMDAgKDY0LWJpdCwg
cHJlZmV0Y2hhYmxlKSBbc2l6ZT0yTV0KICAgICAgICBJL08gcG9ydHMgYXQgZDAwMCBbc2l6ZT0y
NTZdCiAgICAgICAgTWVtb3J5IGF0IGQxMzAwMDAwICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFibGUp
IFtzaXplPTI1NktdCiAgICAgICAgRXhwYW5zaW9uIFJPTSBhdCBkMTM0MDAwMCBbZGlzYWJsZWRd
IFtzaXplPTEyOEtdCiAgICAgICAgQ2FwYWJpbGl0aWVzOiA8YWNjZXNzIGRlbmllZD4KICAgICAg
ICBLZXJuZWwgZHJpdmVyIGluIHVzZTogYW1kZ3B1CiAgICAgICAgS2VybmVsIG1vZHVsZXM6IGFt
ZGdwdQoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdh
dGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
