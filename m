Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6A59A20
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4916E8F9;
	Fri, 28 Jun 2019 12:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350B96E8F9;
 Fri, 28 Jun 2019 12:12:40 +0000 (UTC)
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgpk3-0005Bb-B8; Fri, 28 Jun 2019 12:12:35 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgpk0-0004zb-AD; Fri, 28 Jun 2019 09:12:32 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 5/9] docs: fix some broken references due to txt->rst renames
Date: Fri, 28 Jun 2019 09:12:27 -0300
Message-Id: <5ebb42791ebe353c346b44d6bd8f2c03d61d1115.1561723736.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561723736.git.mchehab+samsung@kernel.org>
References: <cover.1561723736.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DA5BRTxHzFjkBauyNUPvpbdDgMAgRoAJatIYSdac51Y=; b=GzGXMBGMhZgxGjDLabVorg221y
 bS7w5BY+Q1miuA/PUaqiffFgVEdiXTBIA7gka+FIRi+WCuK1EGAVR7tjNUGkYGHjFnMhzxX/MF7Et
 06RmQJzWB8ZmPHRtwyu/zlSNFLiGPse2XIfiDUqVENYO4A4p9ubbL7dkubhn23WsiXnv7xAuc/wkF
 CrHTBlb8RV3D9GZeYL8M3wjFiLPA6zDZVVbAy1/B3M4EvHjsTEl4+uP3K6ltoNY9VLt+YC1hFEDU4
 7LJjK9Sicr7VNXHsYd938oyo7GQu0JQ1XGeTU2+ztXDgnr2Vmzyhngv63eGAA79lkILCddXwr15PV
 +g8LFQrw==;
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ajay Gupta <ajayg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Wolfram Sang <wsa@the-dreams.de>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIHRocmVlIGxlZnQtb3ZlcnMgZnJvbSB0aGUgcmVjZW50IGZpbGUgcmVuYW1lcywK
cHJvYmFibHkgZHVlIHRvIHNvbWUgb3RoZXIgY29uZmxpY3RpbmcgcGF0Y2guCgpGaXggdGhlbS4K
ClNpZ25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtl
cm5lbC5vcmc+CkFja2VkLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYUB0aGUtZHJlYW1zLmRlPgpBY2tl
ZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2lkbGUtc3RhdGVzLnR4dCB8IDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uaCAgICAgICAgICAgICAgIHwgMiAr
LQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1udmlkaWEtZ3B1LmMgICAgICAgICAgICAgICAgICAg
fCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2lkbGUt
c3RhdGVzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vaWRsZS1z
dGF0ZXMudHh0CmluZGV4IDNiZGJlNjc1YjllNi4uZDhkOWFhNzE2N2U4IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2lkbGUtc3RhdGVzLnR4dAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2lkbGUtc3RhdGVzLnR4dApA
QCAtNzAzLDQgKzcwMyw0IEBAIGNwdXMgewogICAgIGh0dHBzOi8vd3d3LmRldmljZXRyZWUub3Jn
L3NwZWNpZmljYXRpb25zLwogCiBbNl0gQVJNIExpbnV4IEtlcm5lbCBkb2N1bWVudGF0aW9uIC0g
Qm9vdGluZyBBQXJjaDY0IExpbnV4Ci0gICAgRG9jdW1lbnRhdGlvbi9hcm02NC9ib290aW5nLnR4
dAorICAgIERvY3VtZW50YXRpb24vYXJtNjQvYm9vdGluZy5yc3QKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX3J1bnRpbWVfcG0uaAppbmRleCA0NzNjNDg1MGMwMWQuLjJlZThmOTUyMmUwNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRpbWVfcG0uaApAQCAtNDUsNyArNDUsNyBAQCBl
bnVtIGk5MTVfZHJtX3N1c3BlbmRfbW9kZSB7CiAgKiB0byBiZSBkaXNhYmxlZC4gVGhpcyBzaG91
bGRuJ3QgaGFwcGVuIGFuZCB3ZSdsbCBwcmludCBzb21lIGVycm9yIG1lc3NhZ2VzIGluCiAgKiBj
YXNlIGl0IGhhcHBlbnMuCiAgKgotICogRm9yIG1vcmUsIHJlYWQgdGhlIERvY3VtZW50YXRpb24v
cG93ZXIvcnVudGltZV9wbS50eHQuCisgKiBGb3IgbW9yZSwgcmVhZCB0aGUgRG9jdW1lbnRhdGlv
bi9wb3dlci9ydW50aW1lX3BtLnJzdC4KICAqLwogc3RydWN0IGludGVsX3J1bnRpbWVfcG0gewog
CWF0b21pY190IHdha2VyZWZfY291bnQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLW52aWRpYS1ncHUuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbnZpZGlhLWdwdS5jCmlu
ZGV4IGNmYzc2YjVkZTcyNi4uNWExMjM1ZmQ4NmJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW52aWRpYS1ncHUuYworKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW52aWRp
YS1ncHUuYwpAQCAtMzY0LDcgKzM2NCw3IEBAIHN0YXRpYyB2b2lkIGdwdV9pMmNfcmVtb3ZlKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQogLyoKICAqIFdlIG5lZWQgZ3B1X2kyY19zdXNwZW5kKCkgZXZl
biBpZiBpdCBpcyBzdHViLCBmb3IgcnVudGltZSBwbSB0byB3b3JrCiAgKiBjb3JyZWN0bHkuIFdp
dGhvdXQgaXQsIGxzcGNpIHNob3dzIHJ1bnRpbWUgcG0gc3RhdHVzIGFzICJEMCIgZm9yIHRoZSBj
YXJkLgotICogRG9jdW1lbnRhdGlvbi9wb3dlci9wY2kudHh0IGFsc28gaW5zaXN0cyBmb3IgZHJp
dmVyIHRvIHByb3ZpZGUgdGhpcy4KKyAqIERvY3VtZW50YXRpb24vcG93ZXIvcGNpLnJzdCBhbHNv
IGluc2lzdHMgZm9yIGRyaXZlciB0byBwcm92aWRlIHRoaXMuCiAgKi8KIHN0YXRpYyBfX21heWJl
X3VudXNlZCBpbnQgZ3B1X2kyY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
