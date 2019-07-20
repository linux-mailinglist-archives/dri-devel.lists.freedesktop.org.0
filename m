Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D26EEE0
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 11:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1006E88B;
	Sat, 20 Jul 2019 09:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48D76E88B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 09:50:34 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 77CA42892B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 09:50:33 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 6BDE528969; Sat, 20 Jul 2019 09:50:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] New: amdgpu fails to resume from suspend
Date: Sat, 20 Jul 2019 09:50:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kitaev@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0MjQxCiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1IGZhaWxzIHRv
IHJlc3VtZSBmcm9tIHN1c3BlbmQKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAg
ICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4yLjEtYXJjaDEtMS1BUkNICiAg
ICAgICAgICBIYXJkd2FyZTogSW50ZWwKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAg
ICAgICAgIFRyZWU6IE1haW5saW5lCiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBT
ZXZlcml0eTogbm9ybWFsCiAgICAgICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50
OiBWaWRlbyhEUkkgLSBub24gSW50ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRl
by1kcmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBraXRhZXZAZ21h
aWwuY29tCiAgICAgICAgUmVncmVzc2lvbjogTm8KCkNyZWF0ZWQgYXR0YWNobWVudCAyODM4NjMK
ICAtLT4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL2F0dGFjaG1lbnQuY2dpP2lkPTI4Mzg2
MyZhY3Rpb249ZWRpdApkbWVzZwoKQ29tcHV0ZXIgZmFpbHMgdG8gcmVzdW1lIGZyb20gc3VzcGVu
ZC4KRnJvbSB0aGUgbG9ncyBpdCBsb29rcyBsaWtlIEFNREdQVSBmYWlscyB0byByZXN1bWUuCgot
LSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcg
dGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
