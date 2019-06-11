Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1B41CF3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9AF8907B;
	Wed, 12 Jun 2019 06:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07168916D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:21 +0000 (UTC)
Received: from [167.98.27.226] (helo=happy.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hahOR-0003vU-26; Tue, 11 Jun 2019 15:04:55 +0100
From: Michael Drake <michael.drake@codethink.co.uk>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 01/11] dt-bindings: display/bridge: Add bindings for ti948
Date: Tue, 11 Jun 2019 15:04:02 +0100
Message-Id: <20190611140412.32151-2-michael.drake@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611140412.32151-1-michael.drake@codethink.co.uk>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk,
 David Airlie <airlied@linux.ie>, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkcyBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3I6CgogIFRJIERTOTBVQjk0OC1RMSAySyBGUEQt
TGluayBJSUkgdG8gT3BlbkxESSBEZXNlcmlhbGl6ZXIKClRoZSBkZXZpY2UgaGFzIHRoZSBjb21w
YXRpYmxlIHN0cmluZyAidGksZHM5MHViOTQ4IiwgYW5kCmFuZCBhbGxvd3MgYW4gYXJycmF5IG9m
IHN0cmluZ3MgdG8gYmUgcHJvdmlkZWQgYXMgcmVndWxhdG9yCm5hbWVzIHRvIGVuYWJsZSBmb3Ig
b3BlcmF0aW9uIG9mIHRoZSBkZXZpY2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIERyYWtlIDxt
aWNoYWVsLmRyYWtlQGNvZGV0aGluay5jby51az4KQ2M6IFBhdHJpY2sgR2xhc2VyIDxwZ2xhc2Vy
QHRlc2xhLmNvbT4KQ2M6IE5hdGUgQ2FzZSA8bmNhc2VAdGVzbGEuY29tPgotLS0KIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS90aSxkczkwdWI5NDgudHh0ICB8IDI0ICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRz
OTB1Yjk0OC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MHViOTQ4LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSxkczkwdWI5NDgudHh0Cm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZjllODZjYjIyOTAwCi0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3Rp
LGRzOTB1Yjk0OC50eHQKQEAgLTAsMCArMSwyNCBAQAorVEkgRFM5MFVCOTQ4LVExIDJLIEZQRC1M
aW5rIElJSSB0byBPcGVuTERJIERlc2VyaWFsaXplcgorPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCitUaGlzIGlzIHRoZSBiaW5kaW5nIGZv
ciBUZXhhcyBJbnN0cnVtZW50cyBEUzkwVUI5NDgtUTEgYnJpZGdlIGRlc2VyaWFsaXplci4KKwor
VGhpcyBkZXZpY2Ugc3VwcG9ydHMgSTJDIG9ubHkuCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisK
Ky0gY29tcGF0aWJsZTogInRpLGRzOTB1Yjk0OCIKKworT3B0aW9uYWwgcHJvcGVydGllczoKKwor
LSByZWd1bGF0b3JzOiBMaXN0IG9mIHJlZ3VsYXRvciBuYW1lIHN0cmluZ3MgdG8gZW5hYmxlIGZv
ciBvcGVyYXRpb24gb2YgZGV2aWNlLgorCitFeGFtcGxlCistLS0tLS0tCisKK3RpOTQ4OiBkczkw
dWI5NDhAMCB7CisJY29tcGF0aWJsZSA9ICJ0aSxkczkwdWI5NDgiOworCisJcmVndWxhdG9yczog
InZjYyIsCisJICAgICAgICAgICAgInZjY19kaXNwIjsKK307Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
