Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674A02BBA7
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 23:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01CE89AAD;
	Mon, 27 May 2019 21:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D091089AAD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 21:16:13 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 7769228702
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 21:16:13 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 6B8B32870D; Mon, 27 May 2019 21:16:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203731] New: amdgpu wrong refresh rate for hdmi output with
 deepcolor turned on
Date: Mon, 27 May 2019 21:16:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sss123next@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-203731-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM3MzEKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjAzNzMxCiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1IHdyb25nIHJl
ZnJlc2ggcmF0ZSBmb3IgaGRtaSBvdXRwdXQgd2l0aAogICAgICAgICAgICAgICAgICAgIGRlZXBj
b2xvciB0dXJuZWQgb24KICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAgVmVy
c2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNC4xOS40NQogICAgICAgICAgSGFyZHdhcmU6
IEFsbAogICAgICAgICAgICAgICAgT1M6IExpbnV4CiAgICAgICAgICAgICAgVHJlZTogTWFpbmxp
bmUKICAgICAgICAgICAgU3RhdHVzOiBORVcKICAgICAgICAgIFNldmVyaXR5OiBoaWdoCiAgICAg
ICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBWaWRlbyhEUkkgLSBub24gSW50
ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3Nk
bC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBzc3MxMjNuZXh0QGxpc3QucnUKICAgICAgICBSZWdy
ZXNzaW9uOiBObwoKQ3JlYXRlZCBhdHRhY2htZW50IDI4Mjk3MQogIC0tPiBodHRwczovL2J1Z3pp
bGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9MjgyOTcxJmFjdGlvbj1lZGl0Cnhvcmcg
c2VydmVyIGxvZwoKaSBoYXZlIDMgZGlzcGxheSBzZXR1cCAoZHZpLCBkcCwgaGRtaSksIGRpc3Bs
YXlzIG9uIGRwIGFuZCBoZG1pIGFyZSAxMGJpdApkaXNwbGF5cywgaWYgaSB0dXJuIG9uIGRlZXBj
b2xvciBvcHRpb24gb24gYW1kZ3B1IGRyaXZlciwgaGRtaSBkaXNwbGF5IGdvdAp3cm9uZyByZWZy
ZXNoIHJhdGUgKGxvb2tzIHRvbyBsb3cpLCBkaXNwbGF5IHN1cHBvcnRlZCAxOTIweDEyMDBANjAg
bW9kZSwgaW4KeG9yZy5sb2cgd2UgY2FuIHNlZSB3aGF0IGl0IGRldGVjdGVkIHByb3Blcmx5LCBi
dXQgaW5zdGVhZCBvZiB0aGlzIGRpc3BsYXkgZ290Cmxpa2UgNDBoeiwgYW5kIHR1cm4gYmxhY2sg
d2l0aCBvdXQgb2YgcmFuZ2UgZXJyb3IsIGkgaGF2ZSBwbGF5ZWQgYSBiaXQgd2l0aAptb2Rlcywg
YW5kIGZvdW5kIHdoYXQgIG1vZGUgInhyYW5kciAtLW5ld21vZGUgIjE5MjB4MTIwMF83My40OCIg
IDI0MC4wMCAgMTkyMAoyMDY0IDIyNjQgMjYwOCAgMTIwMCAxMjAzIDEyMDkgMTI1NCAtaHN5bmMg
K3ZzeW5jIiB3b3JrcywgZGlzcGxheSBhbHNvIHdhcm5zCmFib3V0IG91dCBvZiByYW5nZSBtb2Rl
ICg1OC43aHopLCBidXQgYWN0dWFsbHkgd29ya3MsIE5PVEU6IHRoaXMgYWxsIGhhcHBlbnMKb25s
eSBpZiBkZWVwY29sb3IgZHJpdmVyIG9wdGlvbiBpcyB0dXJuZWQgb24uCgotLSAKWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVl
IG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
