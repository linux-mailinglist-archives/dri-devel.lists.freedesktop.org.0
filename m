Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348AA2B438
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54E689C69;
	Mon, 27 May 2019 12:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1588 seconds by postgrey-1.36 at gabe;
 Sun, 26 May 2019 20:17:23 UTC
Received: from smtp-rs2-vallila1.fe.helsinki.fi
 (smtp-rs2-vallila1.fe.helsinki.fi [128.214.173.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF474895CA
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 20:17:23 +0000 (UTC)
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 by smtp-rs2.it.helsinki.fi (8.14.7/8.14.7) with ESMTP id
 x4QJopP9010199; Sun, 26 May 2019 22:50:51 +0300
Received: by whs-18.cs.helsinki.fi (Postfix, from userid 1070048)
 id 1D5EC3600C6; Sun, 26 May 2019 22:50:51 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by whs-18.cs.helsinki.fi (Postfix) with ESMTP id 1BEE536007C;
 Sun, 26 May 2019 22:50:51 +0300 (EEST)
Date: Sun, 26 May 2019 22:50:51 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Subject: DRM/AST regression (likely 4.14 -> 4.19+), providing EDID manually
 fails
Message-ID: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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

SGkgYWxsLAoKSSd2ZSBhIHdvcmtzdGF0aW9uIHdoaWNoIGhhcyBpbnRlcm5hbCBWR0EgdGhhdCBp
cyBkZXRlY3RlZCBhcyBBU1QgMjQwMCBhbmQgCndpdGggaXQgRURJRCBoYXMgYmVlbiBhbHdheXMg
cXVpdGUgZmxha3kgKGV4Y2VwdCBmb3Igc29tZSB0aW1lIGl0IHdvcmtlZCAKd2l0aCA0LjE0IGxv
bmcgZW5vdWdoIHRoYXQgSSB0aG91Z2h0IHRoZSBwcm9ibGVtcyB3b3VsZCBiZSBwYXN0IHVudGls
IHRoZSAKcHJvYmxlbXMgcmVhcHBlYXJlZCBhbHNvIHdpdGggNC4xNCkuIFRodXMsIEkndmUgcHJv
dmlkZWQgbWFudWFsbHkgdGhlIEVESUQgCnRoYXQgSSBleHRyYWN0ZWQgZnJvbSB0aGUgbW9uaXRv
ciB1c2luZyBvdGhlciBjb21wdXRlciAodGhlIG1vbml0b3IgaXRzZWxmIAp3b3JrZWQganVzdCBm
aW5lIG9uIHRoZSBlYXJsaWVyIGNvbXB1dGVyIHNvIGl0IGlzIGxpa2VseSBmaW5lKS4KCkkgc2V0
dXAgdGhlIG1hbnVhbCBFRElEIHVzaW5nIGRybV9rbXNfaGVscGVyLmVkaWRfZmlybXdhcmUsIGhv
d2V2ZXIsCmFmdGVyIHVwZ3JhZGluZyB0byA0LjE5LjQ1IGl0IHN0b3BwZWQgd29ya2luZyAobm8g
IkdvdCBleHRlcm5hbCBFRElEIGJhc2UgCmJsb2NrIiBhcHBlYXJzIGluIGRtZXNnLCB0aGUgdGV4
dCBtb2RlIGlzIGtlcHQgaW4gdGhlIGxvd2VyIHJlcyBtb2RlLCBhbmQgClhvcmcgbG9ncyBubyBs
b25nZXIgZHVtcHMgdGhlIEVESUQgaW5mbyBsaWtlIGl0IGRpZCB3aXRoIDQuMTQpLiBTbyBJIGd1
ZXNzIAp0aGUgRURJRCBJIHByb3ZpZGVkIG1hbnVhbGx5IG9uIHRoZSBjb21tYW5kIGxpbmUgaXMg
bm90IGNvcnJlY3RseSBwdXQgaW50byAKdXNlIHdpdGggNC4xOSsga2VybmVscy4KClRoZSA0LjE5
IGRtZXNnIGluZGljYXRlZCB0aGF0IGRybV9rbXNfaGVscGVyLmVkaWRfZmlybXdhcmUgaXMgZGVw
cmVjYXRlZCAKc28gSSBhbHNvIHRlc3RlZCB3aXRoIGRybS5lZGlkX2Zpcm13YXJlIGl0IHN1Z2dl
c3RlZCBhcyB0aGUgcmVwbGFjZW1lbnQgCmJ1dCB3aXRoIG5vIGx1Y2sgKGJ1dCBJIGJlbGlldmUg
YWxzbyB0aGUgZHJtX2ttc19oZWxwZXIgb25lIHNob3VsZCBoYXZlIAp3b3JrZWQgYXMgaXQgd2Fz
IG9ubHkgImRlcHJlY2F0ZWQiKS4KCkkgYWxzbyB0cmllZCA1LjEuMiBidXQgaXQgZGlkIG5vdCB3
b3JrIGFueSBiZXR0ZXIgKGFuZCB3aXRoIGl0IGFsc28gdHJpZWQgCnJlbW92aW5nIGFsbCB0aGUg
bWFudWFsICouZWRpZF9maXJtd2FyZSBmcm9tIHRoZSBjb21tYW5kIGxpbmUgc28gSSBzdGlsbCAK
bmVlZCB0byBwcm92aWRlIG9uZSBtYW51YWxseSB0byBoYXZlIGl0IHJlbGlhYmxlIHdvcmtpbmcg
aXQgc2VlbXMpLgoKCi0tIAogaS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
