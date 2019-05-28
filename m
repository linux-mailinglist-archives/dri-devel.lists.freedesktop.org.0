Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F22C86D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 16:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DC489E2C;
	Tue, 28 May 2019 14:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA7889E19
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 14:13:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi
 [85.76.65.42])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6D241024;
 Tue, 28 May 2019 16:13:08 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/10] dt-bindings: display: bridge: thc63lvd1024: Document
 dual-link operation
Date: Tue, 28 May 2019 17:12:26 +0300
Message-Id: <20190528141234.15425-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559052790;
 bh=uxSKNF3gEBehUg5UIQtYDqVcSvaWhkUaJDkom4F628U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QE8l6dgEZX8QMJY65XRbsHA1hCn82GUAFlnlyz9gIdRv1cdVNmDqt39R47JqZMO2i
 mlgfUsjmqZh1oo98L6K7ORbHOEDZkDp/DYYj88ZWdjlRFWMEMuJUhs53FXCcla8t87
 zXWPjGZFBFIp7NSaPkIfQArgR2XggoRA3pyXFqnM=
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFRIQzYzTFZEMTAyNCBMVkRTIGRlY29kZXIgY2FuIG9wZXJhdGUgaW4gdHdvIG1vZGVzLCBz
aW5nbGUtbGluayBvcgpkdWFsLWxpbmsuIEluIGR1YWwtbGluayBtb2RlIGJvdGggaW5wdXQgcG9y
dHMgYXJlIHVzZWQgdG8gY2FycnkgZXZlbi0KYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgc2VwYXJh
dGVseS4gRG9jdW1lbnQgdGhpcyBpbiB0aGUgRFQgYmluZGluZ3MsCmFsb25nIHdpdGggdGhlIHJl
bGF0ZWQgcnVsZXMgZ292ZXJuaW5nIHBvcnQgYW5kIHVzYWdlLgoKU2lnbmVkLW9mZi1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+
ClJldmlld2VkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+ClJl
dmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpUZXN0ZWQtYnk6IEphY29w
byBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KLS0tCiAuLi4vYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGhpbmUsdGhjNjNsdmQxMDI0LnR4dCAgICAgICAgICB8IDYgKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZkMTAyNC50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhp
bmUsdGhjNjNsdmQxMDI0LnR4dAppbmRleCAzN2YwYzA0ZDVhMjguLmQxN2QxZTU4MjBkNyAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3RoaW5lLHRoYzYzbHZkMTAyNC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZkMTAyNC50eHQKQEAgLTI4LDYgKzI4
LDEyIEBAIE9wdGlvbmFsIHZpZGVvIHBvcnQgbm9kZXM6CiAtIHBvcnRAMTogU2Vjb25kIExWRFMg
aW5wdXQgcG9ydAogLSBwb3J0QDM6IFNlY29uZCBkaWdpdGFsIENNT1MvVFRMIHBhcmFsbGVsIG91
dHB1dAogCitUaGUgZGV2aWNlIGNhbiBvcGVyYXRlIGluIHNpbmdsZS1saW5rIG1vZGUgb3IgZHVh
bC1saW5rIG1vZGUuIEluIHNpbmdsZS1saW5rCittb2RlLCBhbGwgcGl4ZWxzIGFyZSByZWNlaXZl
ZCBvbiBwb3J0QDAsIGFuZCBwb3J0QDEgc2hhbGwgbm90IGNvbnRhaW4gYW55CitlbmRwb2ludC4g
SW4gZHVhbC1saW5rIG1vZGUsIGV2ZW4tbnVtYmVyZWQgcGl4ZWxzIGFyZSByZWNlaXZlZCBvbiBw
b3J0QDAgYW5kCitvZGQtbnVtYmVyZWQgcGl4ZWxzIG9uIHBvcnRAMSwgYW5kIGJvdGggcG9ydEAw
IGFuZCBwb3J0QDEgc2hhbGwgY29udGFpbgorZW5kcG9pbnRzLgorCiBFeGFtcGxlOgogLS0tLS0t
LS0KIAotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
