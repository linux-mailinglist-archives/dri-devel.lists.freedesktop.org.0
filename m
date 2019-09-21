Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A54BA261
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B571B6E0E3;
	Sun, 22 Sep 2019 12:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917806E093
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 21:10:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204947] New: Scatter Gather not working properly on Raven ?
Date: Sat, 21 Sep 2019 21:10:14 +0000
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
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204947-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ5NDcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA0OTQ3CiAgICAgICAgICAgU3VtbWFyeTogU2NhdHRlciBHYXRoZXIg
bm90IHdvcmtpbmcgcHJvcGVybHkgb24gUmF2ZW4gPwogICAgICAgICAgIFByb2R1Y3Q6IERyaXZl
cnMKICAgICAgICAgICBWZXJzaW9uOiAyLjUKICAgIEtlcm5lbCBWZXJzaW9uOiBtYXN0ZXIKICAg
ICAgICAgIEhhcmR3YXJlOiBBbGwKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAg
ICAgIFRyZWU6IE1haW5saW5lCiAgICAgICAgICAgIFN0YXR1czogTkVXCiAgICAgICAgICBTZXZl
cml0eTogbm9ybWFsCiAgICAgICAgICBQcmlvcml0eTogUDEKICAgICAgICAgQ29tcG9uZW50OiBW
aWRlbyhEUkkgLSBub24gSW50ZWwpCiAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1k
cmlAa2VybmVsLWJ1Z3Mub3NkbC5vcmcKICAgICAgICAgIFJlcG9ydGVyOiBoYXhrNjEyQGdtYWls
LmNvbQogICAgICAgIFJlZ3Jlc3Npb246IE5vCgpJIGhhdmUgQWNlciBOaXRybyA1IHdpdGggUnl6
ZW4gNSAyNTAwVSBhbmQgUlg1NjBYLgpUaGUgZEdQVSBpcyB3aXJlZCBpbnRvIGlHUFUgKFZFR0E4
KSBzbyB3ZSBoYXZlIHRvIHVzZSBQUklNRS4KSSByZXBvcnRlZCBhIGJ1ZyBlYXJsaWVyIGFib3V0
IHRlYXJpbmcgaW4gZ2FtZXMuCkkgaGF2ZSBiZWVuIHRvbGQgaSBoYXZlIHRvIHdhaXQgZm9yIHNj
YXR0ZXIgZ2F0aGVyIHN1cHBvcnQuCk5vdyB0aGF0IGl0cyBpbiBwbGFjZSBpIHRyaWVkIGl0IHRv
IG15IHN1cHJpc2UgdGVhcmluZyB3YXMgc3RpbGwgdGhlcmUuCk9ubHkgd2F5IHRvIGdldCByaWQg
b2YgaXQgaXMgdG8gdXNlIFRlYXJGcmVlIHdoaWNoIGludHJkdWNlcyBzdHV0dGVyaW5nIGF0IGV2
ZW4KNjBmcHMuCgpJZiB5b3UgbmVlZCBhbnl0aGluZyBqdXN0IHRlbGwgbWUgaSB3aWxsIGJlIGhh
cHB5IHRvIHByb3ZpZGUgYW55IGxvZ3Mgb3IgdGhhdApzb3J0IG9mIHN0dWZmLgoKLS0gCllvdSBh
cmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3Np
Z25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
