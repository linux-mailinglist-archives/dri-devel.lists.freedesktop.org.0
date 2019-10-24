Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A32E3252
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB346E392;
	Thu, 24 Oct 2019 12:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579B06E392
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:27:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205277] [amd powerplay] vega10: soc voltage for power state 7
 is not changed by overdrive.
Date: Thu, 24 Oct 2019 12:27:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefanspr94@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205277-2300-CPxwkGCLMA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205277-2300@https.bugzilla.kernel.org/>
References: <bug-205277-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUyNzcKCnN0ZWZh
bnNwcjk0QGdtYWlsLmNvbSBjaGFuZ2VkOgoKICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVkICAg
ICAgICAgICAgICAgICAgICAgfEFkZGVkCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAgICAg
ICAgICBDQ3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgfHN0ZWZhbnNwcjk0QGdtYWlsLmNv
bQoKLS0tIENvbW1lbnQgIzQgZnJvbSBzdGVmYW5zcHI5NEBnbWFpbC5jb20gLS0tCihJbiByZXBs
eSB0byBoYXJvNDEgZnJvbSBjb21tZW50ICMzKQo+IERpZCB5b3UgZGVidWcgdGhpcyBpc3N1ZT8g
SSB0aGluayB0aGUgcHJvYmxlbSBjb3VsZCBiZSBvdXRzaWRlIHRoaXMgY29kZS4gCj4gCj4gSSB3
b3VsZCBvdXRjb21tZW50IHRoZSBpZi1zdGF0ZW1lbnQgZm9sbG93aW5nIGZvci1sb29wIGluIHlv
dXIgcHJvcG9zZWQKPiBwYXRjaCwgYmVjYXVzZSBvdGhlcndpc2UgJ2knIHBvaW50cyBvdXRzaWRl
IHRoZSBhcnJheSBib3VuZGFyeXMgaGVyZS4KCkkgdGhpbmsgdGhlIGlmIHN0YXRlbWVudCBpcyBm
aW5lIGFzIGJvdGggb2RfdmRkY19sb29rdXBfdGFibGUtPmVudHJpZXNbXSBhbmQKcG9kbl92ZGRf
ZGVwLT5lbnRyaWVzW10gYm90aCBob2xkIE1BWF9SRUdVTEFSX0RQTV9OVU1CRVIgbWVtYmVycywg
d2hpY2ggaXMgOCwKc28gYWNjZXNzaW5nIGVudHJpZXNbN10gaXMgbm90IG91dCBvZiBib3VuZHMu
CgpCdHcsIHRoZSBwYXRjaCB3b3JrcyBmb3IgbWUgYXN3ZWxsLiBDYXJkIGJlaGF2ZXMgYXMgaXQg
c2hvdWxkIGFmdGVyIGxvYWRpbmcgbXkKcHBfdGFibGUsIHdoaWNoIHdhcyBub3QgdGhlIGNhc2Ug
YmVmb3JlLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJl
IHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
