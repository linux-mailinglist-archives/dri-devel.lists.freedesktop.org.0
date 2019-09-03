Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C91DAA6E33
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FDB896F7;
	Tue,  3 Sep 2019 16:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED510896EC;
 Tue,  3 Sep 2019 16:25:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11F432343A;
 Tue,  3 Sep 2019 16:25:20 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 001/167] drm/i915: Re-apply "Perform link quality
 check, unconditionally during long pulse"
Date: Tue,  3 Sep 2019 12:22:33 -0400
Message-Id: <20190903162519.7136-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527921;
 bh=y6jv+OHUHxEmn5hA5V/b/pfb8RWdE4SDWdiWC+3AyFY=;
 h=From:To:Cc:Subject:Date:From;
 b=fktxo9kwQhwWMFXoU7eQDyn04xa/nB5bfIOAislXbhxWTJ4g9LGpF9cmGc6rq2ps0
 VRB42Q6W2KyfuaY0P5a7TblDJND6KmCI2kShRIn+DhNumBMSbcO1I8AwQm2Rz6g+5W
 LJqybxcRH3j1hlbMqPd97dqhlnP+Lg263ri59lSU=
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
Cc: Sasha Levin <sashal@kernel.org>, Jan-Marek Glogowski <glogow@fbihome.de>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFuLU1hcmVrIEdsb2dvd3NraSA8Z2xvZ293QGZiaWhvbWUuZGU+CgpbIFVwc3RyZWFt
IGNvbW1pdCAzY2Y3MWJjOTkwNGQ3ZWU0YTI1YTgyMmM1ZGNiNTRjNzgwNGVhMzg4IF0KClRoaXMg
cmUtYXBwbGllcyB0aGUgd29ya2Fyb3VuZCBmb3IgInNvbWUgRFAgc2lua3MsIFt3aGljaF0gYXJl
IGEKbGl0dGxlIG51dHMiIGZyb20gY29tbWl0IDFhMzYxNDdiYjkzOSAoImRybS9pOTE1OiBQZXJm
b3JtIGxpbmsKcXVhbGl0eSBjaGVjayB1bmNvbmRpdGlvbmFsbHkgZHVyaW5nIGxvbmcgcHVsc2Ui
KS4KSXQgbWFrZXMgdGhlIHNlY29uZGFyeSBBT0MgRTI0NjBQIG1vbml0b3IgY29ubmVjdGVkIHZp
YSBEUCB0byBhbgphY2VyIFZlcml0b24gTjQ2NDBHIHVzYWJsZSBhZ2Fpbi4KClRoaXMgaHVuayB3
YXMgZHJvcHBlZCBpbiBjb21taXQgYzg1ZDIwMGU4MzIxICgiZHJtL2k5MTU6IE1vdmUgU1NUCkRQ
IGxpbmsgcmV0cmFpbmluZyBpbnRvIHRoZSAtPnBvc3RfaG90cGx1ZygpIGhvb2siKQoKRml4ZXM6
IGM4NWQyMDBlODMyMSAoImRybS9pOTE1OiBNb3ZlIFNTVCBEUCBsaW5rIHJldHJhaW5pbmcgaW50
byB0aGUgLT5wb3N0X2hvdHBsdWcoKSBob29rIikKW0NsZWFuZWQgdXAgY29tbWl0IG1lc3NhZ2Us
IGFkZGVkIHN0YWJsZSBjY10KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuLU1hcmVrIEdsb2dvd3NraSA8Z2xvZ293QGZiaWhvbWUu
ZGU+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCkxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE4MDgyNTE5MTAzNS4zOTQ1LTEtbHl1ZGVAcmVk
aGF0LmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZHAuYyB8IDE2ICsrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RwLmMK
aW5kZXggZjkyMDc5ZTE5ZGU4ZC4uMjBjZDRjOGFjZWNjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9k
cC5jCkBAIC00NzM5LDYgKzQ3MzksMjIgQEAgaW50ZWxfZHBfbG9uZ19wdWxzZShzdHJ1Y3QgaW50
ZWxfY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCSAqLwogCQlzdGF0dXMgPSBjb25uZWN0b3Jfc3Rh
dHVzX2Rpc2Nvbm5lY3RlZDsKIAkJZ290byBvdXQ7CisJfSBlbHNlIHsKKwkJLyoKKwkJICogSWYg
ZGlzcGxheSBpcyBub3cgY29ubmVjdGVkIGNoZWNrIGxpbmtzIHN0YXR1cywKKwkJICogdGhlcmUg
aGFzIGJlZW4ga25vd24gaXNzdWVzIG9mIGxpbmsgbG9zcyB0cmlnZ2VyaW5nCisJCSAqIGxvbmcg
cHVsc2UuCisJCSAqCisJCSAqIFNvbWUgc2lua3MgKGVnLiBBU1VTIFBCMjg3USkgc2VlbSB0byBw
ZXJmb3JtIHNvbWUKKwkJICogd2VpcmQgSFBEIHBpbmcgcG9uZyBkdXJpbmcgbW9kZXNldHMuIFNv
IHdlIGNhbiBhcHBhcmVudGx5CisJCSAqIGVuZCB1cCB3aXRoIEhQRCBnb2luZyBsb3cgZHVyaW5n
IGEgbW9kZXNldCwgYW5kIHRoZW4KKwkJICogZ29pbmcgYmFjayB1cCBzb29uIGFmdGVyLiBBbmQg
b25jZSB0aGF0IGhhcHBlbnMgd2UgbXVzdAorCQkgKiByZXRyYWluIHRoZSBsaW5rIHRvIGdldCBh
IHBpY3R1cmUuIFRoYXQncyBpbiBjYXNlIG5vCisJCSAqIHVzZXJzcGFjZSBjb21wb25lbnQgcmVh
Y3RlZCB0byBpbnRlcm1pdHRlbnQgSFBEIGRpcC4KKwkJICovCisJCXN0cnVjdCBpbnRlbF9lbmNv
ZGVyICplbmNvZGVyID0gJmRwX3RvX2RpZ19wb3J0KGludGVsX2RwKS0+YmFzZTsKKworCQlpbnRl
bF9kcF9yZXRyYWluX2xpbmsoZW5jb2RlciwgY3R4KTsKIAl9CiAKIAkvKgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
