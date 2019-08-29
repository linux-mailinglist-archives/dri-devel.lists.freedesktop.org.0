Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EDCA3273
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6876E2AF;
	Fri, 30 Aug 2019 08:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A6BC6E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 14:51:45 +0000 (UTC)
X-UUID: d82e0857806041a09bc42d05df8a9dac-20190829
X-UUID: d82e0857806041a09bc42d05df8a9dac-20190829
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1593532237; Thu, 29 Aug 2019 22:51:43 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 29 Aug 2019 22:51:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 22:51:46 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5, 30/32] drm/mediatek: add connection from DITHER0 to DSI0
Date: Thu, 29 Aug 2019 22:50:52 +0800
Message-ID: <1567090254-15566-31-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 07DD8AE2514D3D31AD74B3F4672ABE9F70E8D0B41FDA91903211C6785465914E2000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+CgpUaGlzIHBh
dGNoIGFkZCBjb25uZWN0aW9uIGZyb20gRElUSEVSMCB0byBEU0kwCgpTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4
IDIzNzgyNGYuLmZkMzg2NTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5j
CkBAIC0zNSwxMCArMzUsMTIgQEAKIAogI2RlZmluZSBNVDgxODNfRElTUF9PVkwwXzJMX01PVVRf
RU4JCTB4ZjA0CiAjZGVmaW5lIE1UODE4M19ESVNQX09WTDFfMkxfTU9VVF9FTgkJMHhmMDgKKyNk
ZWZpbmUgTVQ4MTgzX0RJU1BfRElUSEVSMF9NT1VUX0VOCQkweGYwYwogI2RlZmluZSBNVDgxODNf
RElTUF9QQVRIMF9TRUxfSU4JCTB4ZjI0CiAKICNkZWZpbmUgT1ZMMF8yTF9NT1VUX0VOX0RJU1Bf
UEFUSDAJCQlCSVQoMCkKICNkZWZpbmUgT1ZMMV8yTF9NT1VUX0VOX1JETUExCQkJCUJJVCg0KQor
I2RlZmluZSBESVRIRVIwX01PVVRfSU5fRFNJMAkJCQlCSVQoMCkKICNkZWZpbmUgRElTUF9QQVRI
MF9TRUxfSU5fT1ZMMF8yTAkJCTB4MQogCiAjZGVmaW5lIE1UMjcwMV9ESVNQX01VVEVYMF9NT0Qw
CQkJMHgyYwpAQCAtMzIzLDYgKzMyNSw5IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9t
b3V0X2VuKGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfcmVnX2RhdGEgKmRhdGEsCiAJCSAgIG5leHQg
PT0gRERQX0NPTVBPTkVOVF9SRE1BMSkgewogCQkqYWRkciA9IE1UODE4M19ESVNQX09WTDFfMkxf
TU9VVF9FTjsKIAkJdmFsdWUgPSBPVkwxXzJMX01PVVRfRU5fUkRNQTE7CisJfSBlbHNlIGlmIChj
dXIgPT0gRERQX0NPTVBPTkVOVF9ESVRIRVIgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RTSTAp
IHsKKwkJKmFkZHIgPSBNVDgxODNfRElTUF9ESVRIRVIwX01PVVRfRU47CisJCXZhbHVlID0gRElU
SEVSMF9NT1VUX0lOX0RTSTA7CiAJfSBlbHNlIHsKIAkJdmFsdWUgPSAwOwogCX0KLS0gCjEuOC4x
LjEuZGlydHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
