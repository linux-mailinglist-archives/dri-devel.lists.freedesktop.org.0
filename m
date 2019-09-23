Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A316FBAE16
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70626E108;
	Mon, 23 Sep 2019 06:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 946 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2019 01:42:47 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEDF6E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 01:42:47 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 97764126F67C08ABC820;
 Mon, 23 Sep 2019 09:26:59 +0800 (CST)
Received: from [127.0.0.1] (10.177.29.68) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Sep 2019
 09:26:53 +0800
Message-ID: <5D881F5C.2070305@huawei.com>
Date: Mon, 23 Sep 2019 09:26:52 +0800
From: zhong jiang <zhongjiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
 rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: zhong jiang <zhongjiang@huawei.com>
Subject: Re: [PATCH] drm/vkms: Fix an undefined reference error in
 vkms_composer_worker
References: <1569201671-18489-1-git-send-email-zhongjiang@huawei.com>
In-Reply-To: <1569201671-18489-1-git-send-email-zhongjiang@huawei.com>
X-Originating-IP: [10.177.29.68]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGxlYXNlIGlnbm9yZSB0aGUgcGF0Y2gsICBhdXRob3IgaXMgaW5jb3JyZWN0LCB3aWxsIHJlcG9z
dC4gIFRoYW5rcwoKU2luY2VyZWx5LAp6aG9uZyBqaWFuZwpPbiAyMDE5LzkvMjMgOToyMSwgemhv
bmcgamlhbmcgd3JvdGU6Cj4gRnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
Pgo+Cj4gSSBoaXQgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGNvbXBpbGUgdGhlIGtlcm5lbC4K
Pgo+IGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIubzogSW4gZnVuY3Rpb24gYHZr
bXNfY29tcG9zZXJfd29ya2VyJzoKPiB2a21zX2NvbXBvc2VyLmM6KC50ZXh0KzB4NWU0KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgY3JjMzJfbGUnCj4gbWFrZTogKioqIFt2bWxpbnV4XSBFcnJv
ciAxCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogemhvbmcgamlhbmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL0tjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9k
cml2ZXJzL2dwdS9kcm0vS2NvbmZpZwo+IGluZGV4IGU2N2MxOTQuLjI4NWQ2NDkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vS2Nv
bmZpZwo+IEBAIC0yNTcsNiArMjU3LDcgQEAgY29uZmlnIERSTV9WS01TCj4gIAl0cmlzdGF0ZSAi
VmlydHVhbCBLTVMgKEVYUEVSSU1FTlRBTCkiCj4gIAlkZXBlbmRzIG9uIERSTQo+ICAJc2VsZWN0
IERSTV9LTVNfSEVMUEVSCj4gKwlzZWxlY3QgQ1JDMzIKPiAgCWRlZmF1bHQgbgo+ICAJaGVscAo+
ICAJICBWaXJ0dWFsIEtlcm5lbCBNb2RlLVNldHRpbmcgKFZLTVMpIGlzIHVzZWQgZm9yIHRlc3Rp
bmcgb3IgZm9yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
