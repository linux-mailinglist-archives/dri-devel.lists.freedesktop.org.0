Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8268A90D10
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 07:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A381F6E420;
	Sat, 17 Aug 2019 05:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62AB6E420
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 05:13:30 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 4EF2C28AA5
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 05:13:29 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 3B8B828AB6; Sat, 17 Aug 2019 05:13:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Sat, 17 Aug 2019 05:13:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: virtuousfox@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-99sG67pV5u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCi0tLSBD
b21tZW50ICMzMiBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KSnVzdCBnb3QgZXhhY3RseSB0aGUgc2FtZSAwMDEwOmFtZGdwdV92bV91cGRhdGVfZGlyZWN0
b3JpZXMrMHhlNy8weDI2MApkZXJlZmVyZW5jZSBpbW1lZGlhdGVseSBvbiBsb2dpbiBldmVuIHdp
dGggUGFnZUZsaXAgJiBUZWFyRnJlZSBkaXNhYmxlZCBhbmQKU2hhZG93UHJpbWFyeSBOT1QgZW5h
YmxlZC4gRXZlbiB3aXRoIGFsbCB0aGUgc2FtZSBhZGRyZXNzZXMgYXMgYmVmb3JlLiBTbywgbm93
CkknbSBub3Qgc3VyZSBhYm91dCB3aGF0IGFjdHVhbGx5IHRyaWdnZXJzIGl0LiBIb3dldmVyLCBt
eSBzZXR1cCBpcyBhcwpub24tZGVmYXVsdCBhcyBpdCBnZXRzOgphbWRncHUgaGFzIHRoZXNlIHBh
cmFtZXRlcnM6IGNpa19zdXBwb3J0PTEgc2lfc3VwcG9ydD0xIG1zaT0xIHNjaGVkX3BvbGljeT0x
CmNvbXB1dGVfbXVsdGlwaXBlPTEgZ2FydHNpemU9MTAyNCB2bV9mcmFnbWVudF9zaXplPTkKbWF4
X251bV9vZl9xdWV1ZXNfcGVyX2RldmljZT02NTUzNiBzY2hlZF9od19zdWJtaXNzaW9uPTMyIHNj
aGVkX2pvYnM9MTAyNApqb2JfaGFuZ19saW1pdD04MDAwIGhhbHRfaWZfaHdzX2hhbmc9MSB2bV9m
YXVsdF9zdG9wPTAgdm1fdXBkYXRlX21vZGU9Mwp2bV9zaXplPTIwIGRpc3BfcHJpb3JpdHk9MiBk
ZWVwX2NvbG9yPTEgZ3B1X3JlY292ZXJ5PTEKaXJxYmFsYW5jZSBpcyBlbmFibGVkIHdpdGggaW50
ZXJ2YWw9MSBhbmQgcnRpcnEgaGFzIHRoaXM6ClJUSVJRX05BTUVfTElTVD0idGltZXIgcnRjIHNu
ZCBkcm0gYW1kZ3B1IHJhZGVvbiBpOTE1IG52aWRpYSB1c2IgaTgwNDIgYWhjaSIKUlRJUlFfSElH
SF9MSVNUPSJ3YXRjaGRvZ2Qgb29tX3JlYXBlciByY3VfcHJlZW1wdCByY3Vfc2NoZWQgcmN1X2Jo
IHJjdWIgcmN1YwpnZnggc2RtYSBrc29mdGlycWQga2h1Z2VwYWdlZCIKUlRJUlFfUFJJT19ISUdI
PTgwClJUSVJRX1BSSU9fREVDUj0yClJUSVJRX1BSSU9fTE9XPTUwClJUSVJRX1JFU0VUX0FMTD0w
CnRvIGJvb3N0IGFtZGdwdSdzIHByb2Nlc3NlcyB0byBoaWdoZXN0IFJUL0ZJRk8gcHJpb3JpdGll
cyBpbiBob3BlIHRvIGF2b2lkCnZpZGVvIHN0dXR0ZXJpbmcgYW5kIGF1ZGlvIHgtcnVucyB1bmRl
ciBmdWxsIGxvYWQuIFRyYW5zcGFyZW50IGh1Z2VwYWdlcyBhcmUKZW5hYmxlZCBpbiBhdHRlbXB0
IHRvIHNwYXJlIGNyYXBweSBBTUQgRlgncyBUTEIgY2FjaGUgYW5kIE1NVSAoaGVuY2UgdGhlCnZt
X2ZyYWdtZW50X3NpemU9OSkuCgpNYXliZSBpdCdzIG5vbi1kZWZhdWx0IHZtX3VwZGF0ZV9tb2Rl
IHRoYXQgZG9lcyBpdC4gQW5kIGZldyBrZXJuZWwgdmVyc2lvbnMKYmFjayBkZWZhdWx0IGdhcnQg
b2YgMjU2TUIgd2FzIHRyaWdnZXJpbmcgc29tZSBraW5kIG9mIGZhdWx0LCBwcm9iYWJseSBzdGFs
bAphbmQgcmVzZXQsIG1heWJlIGl0IGV2ZW4gc3RpbGwgZG9lcyBidXQgSSdtIG5vdCBnb2luZyB0
byBjaGVjay4gT3IgbWF5YmUgaXQncwphbGwgaXJyZWxldmFudC4KCi0tIApZb3UgYXJlIHJlY2Vp
dmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2Yg
dGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
