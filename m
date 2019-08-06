Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4498845AB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11C76E62C;
	Wed,  7 Aug 2019 07:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD506E3FC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 16:05:36 +0000 (UTC)
From: megous@megous.com
To: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v8 2/4] dt-bindings: display: hdmi-connector: Support DDC bus
 enable
Date: Tue,  6 Aug 2019 17:57:41 +0200
Message-Id: <20190806155744.10263-3-megous@megous.com>
In-Reply-To: <20190806155744.10263-1-megous@megous.com>
References: <20190806155744.10263-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1565107071; bh=1WLK5mVFKFuv1g4gs40+VCmjvdPbojsyFq5tU/7xRNw=;
 h=From:To:Cc:Subject:Date:References:From;
 b=En0Lsg9MSZMhN5LVrV5ajakQGazmxXH2790lmj21RVWwqGRKVUaYb2Ok/E+4f2sds
 +YclFbmClg3rpIYnCPF1DLeG8WuXXBlfhpYaloESxdumT7segy9d43Qilgvm/+pazg
 ceL5eHOb1ddah4PrChZZUG/4QKxZ+j1mzZBCrasg=
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
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+CgpTb21lIEFsbHdpbm5lciBT
b0MgdXNpbmcgYm9hcmRzIChPcmFuZ2UgUGkgMyBmb3IgZXhhbXBsZSkgbmVlZCB0byBlbmFibGUK
b24tYm9hcmQgdm9sdGFnZSBzaGlmdGluZyBsb2dpYyBmb3IgdGhlIEREQyBidXMgdXNpbmcgYSBn
cGlvIHRvIGJlIGFibGUKdG8gYWNjZXNzIEREQyBidXMuIFVzZSBkZGMtZW4tZ3Bpb3MgcHJvcGVy
dHkgb24gdGhlIGhkbWktY29ubmVjdG9yIHRvCm1vZGVsIHRoaXMuCgpBZGQgYmluZGluZyBkb2N1
bWVudGF0aW9uIGZvciBvcHRpb25hbCBkZGMtZW4tZ3Bpb3MgcHJvcGVydHkuCgpTaWduZWQtb2Zm
LWJ5OiBPbmRyZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KUmV2aWV3ZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9jb25uZWN0b3IvaGRtaS1jb25uZWN0b3IudHh0ICAgICB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvY29ubmVjdG9yL2hkbWktY29ubmVjdG9yLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci9oZG1pLWNvbm5lY3Rv
ci50eHQKaW5kZXggNTA4YWVlNDYxZTBkLi5hZWIwN2M0YmQ3MDMgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Nvbm5lY3Rvci9oZG1pLWNvbm5l
Y3Rvci50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
Y29ubmVjdG9yL2hkbWktY29ubmVjdG9yLnR4dApAQCAtOSw2ICs5LDcgQEAgT3B0aW9uYWwgcHJv
cGVydGllczoKIC0gbGFiZWw6IGEgc3ltYm9saWMgbmFtZSBmb3IgdGhlIGNvbm5lY3RvcgogLSBo
cGQtZ3Bpb3M6IEhQRCBHUElPIG51bWJlcgogLSBkZGMtaTJjLWJ1czogcGhhbmRsZSBsaW5rIHRv
IHRoZSBJMkMgY29udHJvbGxlciB1c2VkIGZvciBEREMgRURJRCBwcm9iaW5nCistIGRkYy1lbi1n
cGlvczogc2lnbmFsIHRvIGVuYWJsZSBEREMgYnVzCiAKIFJlcXVpcmVkIG5vZGVzOgogLSBWaWRl
byBwb3J0IGZvciBIRE1JIGlucHV0Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
