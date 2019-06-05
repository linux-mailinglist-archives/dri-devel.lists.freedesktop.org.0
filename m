Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D141A35D03
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 14:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA29B890F2;
	Wed,  5 Jun 2019 12:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA93B890F2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 12:40:12 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id B416228479
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 12:40:12 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id B2A8C2896F; Wed,  5 Jun 2019 12:40:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203817] New: Raven Ridge VEGA8 stuck on 400Mhz on battery
Date: Wed, 05 Jun 2019 12:40:12 +0000
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
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-203817-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDM4MTcKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjAzODE3CiAgICAgICAgICAgU3VtbWFyeTogUmF2ZW4gUmlkZ2UgVkVH
QTggc3R1Y2sgb24gNDAwTWh6IG9uIGJhdHRlcnkKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJz
CiAgICAgICAgICAgVmVyc2lvbjogMi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS4ycmMzCiAgICAg
ICAgICBIYXJkd2FyZTogQWxsCiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAg
ICBUcmVlOiBNYWlubGluZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJp
dHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlk
ZW8oRFJJIC0gbm9uIEludGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJp
QGtlcm5lbC1idWdzLm9zZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogaGF4azYxMkBnbWFpbC5j
b20KICAgICAgICBSZWdyZXNzaW9uOiBObwoKQ3JlYXRlZCBhdHRhY2htZW50IDI4MzExNQogIC0t
PiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvYXR0YWNobWVudC5jZ2k/aWQ9MjgzMTE1JmFj
dGlvbj1lZGl0CmRtZXNnCgpJIGtub3cgdGhpcyBoYXMgYmVlbiBhbiBpc3N1ZSBiZWZvcmUgNS4y
IEl0IHdhcyBpc3N1ZSBzaW5jZSBpIGdvdCB0aGUgbGFwdG9wLgpUaGUgY29vbGluZyBvbiB0aGlz
IGxhcHRvcCAoQWNlciBOaXRybyA1IEFONTE1LTQyKSBpcyBhbWF6aW5nIHNvIHRoaXMgaXMgbm90
CmZyb20gdGhlcm1hbCByZWFzb25zLgpUaGlzIGNhdXNlcyBHTk9NRSB0byBsYWcgc2xpZ2h0bHkg
b24gYmF0dGVyeSBhbmQgaXQgaXMgbm90IGZ1biB0byBjb2RlIG9uCnNsaWdodGx5IGxhZ2d5IHN5
c3RlbSBmb3IgZXhhbXBsZSB3aGVuIHlvdSByZXNpemUgd2luZG93LiBZZXMgdGhlcmUgaXMgYnVn
IGluCkdOT01FIHRoYXQgaXQgc2xvd3MgZG93biBhZnRlciAyMCBzZWNvbmRzIHdoaWNoIGkgcmVw
b3J0ZWQgYW5kIHRoZXkgYXJlIHdvcmtpbmcKb24gc29sdXRpb24gYnV0IGV2ZW4gd2l0aCB0aGUg
d29ya2Fyb3VuZCB0aGUgcGVyZm9ybWFuY2Ugc3RpbGwgaXNudCBhcyBnb29kIGFzCm9uIEFDIHBv
d2VyIGZvciB0aGUgZXh0cmVtZSBkb3duIGNsb2NrLgpHUFUgY2xvY2tzIGFyZSBhcyB0aGV5IHNo
b3VsZCBiZSBvbiBBQyBwb3dlci4KSSBrbm93IENQVSBpcyBzdHVjayBhdCAxLjZHaHogb24gYmF0
dGVyeSB3aGljaCBpc250IGFtYXppbmcgYnV0IGlzIGRvbmUgZm9yCkJhdHRlcnkgc28gdGhpcyBt
aWdodCBiZSBsaW1pdGVkIGZyb20gVmVuZG9yIHRvbyBidXQgaSBkaWRudCBmaW5kIGFueXRoaW5n
CmFib3V0IHRoaXMgb24gaW50ZXJuZXQuCkkgdHJpZWQgdG8gZm9yY2UgaGlnaCBwb3dlciBzdGF0
ZSB0byB0aGUgR1BVIHdoaWNoIHdvcmtlZCBhbmQgdGhlIEdQVSBnb2VzIHRvCml0cyBtYXggbm90
IHByb2JsZW0gYW5kIGRvZXNudCBlYXQgdGhhdCBtdWNoIG1vcmUgYmF0dGVyeS4KCi0tIApZb3Ug
YXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNz
aWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
