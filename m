Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C96F36E4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 19:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C896F77B;
	Thu,  7 Nov 2019 18:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEC76F77B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 18:18:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205393] [amdgpu powerplay] vega10: custom pp_table, AVFS
 accidentally reenabled after display powersave
Date: Thu, 07 Nov 2019 18:18:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haro41@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205393-2300-uWiVGTbNW5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205393-2300@https.bugzilla.kernel.org/>
References: <bug-205393-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUzOTMKCi0tLSBD
b21tZW50ICM0IGZyb20gaGFybzQxQGdteC5kZSAtLS0KWWVzLCB5b3VyIHBhdGNoIHdvcmtzIGFu
ZCBoYXMgdGhlIHNhbWUgZWZmZWN0LCBhcHBhcmVudGx5LgoKV2hhdCBjb25mdXNlZCBtZSBhbmQg
dGhlIHJlYXNvbiB3aHkgaSBwcmVmZXJlZCB0byBsZWF2ZSB0aGUKdmVnYTEwX3VwZGF0ZV9hdmZz
KCkgY2FsbCBiZWZvcmUgdGhlIGZsYWcgbW9kaWZpY2F0aW9uLCB3YXMgdGhlIGNvZGUgaW5zaWRl
CnZlZ2ExMF91cGRhdGVfYXZmcygpOgoKc3RhdGljIGludCB2ZWdhMTBfdXBkYXRlX2F2ZnMoc3Ry
dWN0IHBwX2h3bWdyICpod21ncikKewogICAgICAgIHN0cnVjdCB2ZWdhMTBfaHdtZ3IgKmRhdGEg
PSBod21nci0+YmFja2VuZDsKCiAgICAgICAgaWYgKGRhdGEtPm5lZWRfdXBkYXRlX2RwbV90YWJs
ZSAmIERQTVRBQkxFX09EX1VQREFURV9WRERDKSB7CiAgICAgICAgICAgICAgICB2ZWdhMTBfYXZm
c19lbmFibGUoaHdtZ3IsIGZhbHNlKTsKICAgICAgICB9IGVsc2UgaWYgKGRhdGEtPm5lZWRfdXBk
YXRlX2RwbV90YWJsZSkgewogICAgICAgICAgICAgICAgdmVnYTEwX2F2ZnNfZW5hYmxlKGh3bWdy
LCBmYWxzZSk7CiAgICAgICAgICAgICAgICB2ZWdhMTBfYXZmc19lbmFibGUoaHdtZ3IsIHRydWUp
OwogICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAgICB2ZWdhMTBfYXZmc19lbmFibGUoaHdt
Z3IsIHRydWUpOwogICAgICAgIH0KCiAgICAgICAgcmV0dXJuIDA7Cn0KCkhlcmUgaXMgYSBkaXNh
YmxlL2VuYWJsZSBzZXF1ZW5jZSBpbnNlcnRlZCwgcGVyaGFwcyBmb3IgYSByZWFzb24/CgotLSAK
WW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhl
IGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
