Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBE9198C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 22:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A7589DB4;
	Sun, 18 Aug 2019 20:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D82989DB4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 20:32:54 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id C08C42854F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 20:32:54 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id B4B4D285C3; Sun, 18 Aug 2019 20:32:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204611] New: amdgpu error scheduling IBs when waking from sleep
Date: Sun, 18 Aug 2019 20:32:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tones111@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-204611-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ2MTEKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0NjExCiAgICAgICAgICAgU3VtbWFyeTogYW1kZ3B1IGVycm9yIHNj
aGVkdWxpbmcgSUJzIHdoZW4gd2FraW5nIGZyb20gc2xlZXAKICAgICAgICAgICBQcm9kdWN0OiBE
cml2ZXJzCiAgICAgICAgICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4yLjkK
ICAgICAgICAgIEhhcmR3YXJlOiB4ODYtNjQKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAg
ICAgICAgICAgIFRyZWU6IE1haW5saW5lCiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAg
ICBTZXZlcml0eTogbm9ybWFsCiAgICAgICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9u
ZW50OiBWaWRlbyhEUkkgLSBub24gSW50ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192
aWRlby1kcmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiB0b25lczEx
MUBob3RtYWlsLmNvbQogICAgICAgIFJlZ3Jlc3Npb246IE5vCgpDcmVhdGVkIGF0dGFjaG1lbnQg
Mjg0NDg1CiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9p
ZD0yODQ0ODUmYWN0aW9uPWVkaXQKam91cm5hbGN0bDogYW1kZ3B1IGxvY2t1cCBvbiByZXN1bWUg
ZnJvbSBzbGVlcC4KCk15IHN5c3RlbSBsb2NrcyB1cCB3aGVuIHRyeWluZyB0byB3YWtlIGZyb20g
c2xlZXAgKG9wZW4gbGlkKS4gIFRoZSBzY3JlZW4KcmVtYWlucyBibGFjayBhbmQgaXMgdW5yZXNw
b25zaXZlIHRvIGtleWJvYXJkL21vdXNlIGlucHV0LiAgSSdtIGFibGUgdG8gc3NoCmZyb20gYW5v
dGhlciBtYWNoaW5lIGFuZCBoYXZlIGF0dGFjaGVkIHRoZSBvdXRwdXQgZnJvbSBqb3VybmFsY3Rs
IC1iLiAgVGhlIGxvZwpzaG93cyBzY3JvbGxpbmcgZXJyb3JzLi4uCgprZXJuZWw6IFtkcm06YW1k
Z3B1X2pvYl9ydW4gW2FtZGdwdV1dICpFUlJPUiogRXJyb3Igc2NoZWR1bGluZyBJQnMgKC0yMikK
a2VybmVsOiBhbWRncHUgMDAwMDowNTowMC4wOiBjb3VsZG4ndCBzY2hlZHVsZSBpYiBvbiByaW5n
IDxnZng+CgpUaGlzIGlzIGEgTGVub3ZvIEU1ODUgbGFwdG9wIHdpdGggYW4gQU1EIFI1IDI1MDBV
IEFQVS4KCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3
YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
