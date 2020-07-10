Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACF21B046
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C725D6EB70;
	Fri, 10 Jul 2020 07:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5610F6EB70
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 07:36:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Fri, 10 Jul 2020 07:36:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-q85oMx2HFb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDczODMKCi0tLSBD
b21tZW50ICM1NCBmcm9tIFBhdWwgTWVuemVsIChwbWVuemVsK2J1Z3ppbGxhLmtlcm5lbC5vcmdA
bW9sZ2VuLm1wZy5kZSkgLS0tCihJbiByZXBseSB0byBTdHJhdG9zIFpvbG90YXMgZnJvbSBjb21t
ZW50ICM1MykKCj4gRG9uJ3Qga25vdyBpZiBpdCBoZWxwcy4gSSdtIGdldHRpbmcgYSBzaW1pbGFy
IGlzc3VlIG9uIE9wZW5zdXNlIFR1bWJsZXdlZWQKPiB3aXRoIGtlcm5lbCA1LjcuNy4gUmV2ZXJ0
aW5nIHRvIGtlcm5lbCA1LjcuNSBtYWtlcyB0aGluZ3Mgc3RhYmxlIGZvciBtZS4gTXkKPiBHUFUg
aXMgUlg1ODAuCgpb4oCmXQoKVGhhbmsgeW91IGZvciB5b3VyIHJlcG9ydC4gSG93IHF1aWNrbHkg
Y2FuIHlvdSByZXByb2R1Y2UgaXQ/IElmIHlvdSBjb3VsZApiaXNlY3QgdGhlIGlzc3VlIHRvIHBp
bnBvaW50IHRoZSBjdWxwcml0IGNvbW1pdCBiZXR3ZWVuIDUuNy41IGFuZCA1LjcuNywgdGhhdOKA
mWQKYmUgZ3JlYXQuIE1heWJlIG9wZW4gZXZlbiBhIHNlcGFyYXRlIGJ1ZyByZXBvcnQsIGluIGNh
c2UgdGhleSBhcmUgdW5yZWxhdGVkLgpUaGV5IGNhbiBhbHdheXMgYmUgbWFya2VkIGFzIGR1cGxp
Y2F0ZXMgbGF0ZXIuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6Cllv
dSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
