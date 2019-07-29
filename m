Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB97861B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A0A89CBA;
	Mon, 29 Jul 2019 07:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A2A89BF6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 06:49:51 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BEA15D77010AD440D088;
 Mon, 29 Jul 2019 14:49:46 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 29 Jul 2019 14:49:45 +0800
Subject: Re: [PATCH] drm/bridge: lvds-encoder: Fix build error
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <eric@anholt.net>
References: <20190729063539.19328-1-yuehaibing@huawei.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <69256ea7-b831-00eb-7d48-82302689574e@huawei.com>
Date: Mon, 29 Jul 2019 14:49:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190729063539.19328-1-yuehaibing@huawei.com>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxzIGRyb3AgdGhpcyBvbmUsIHdpbGwgcmVzZW5kIG5ldy4KCk9uIDIwMTkvNy8yOSAxNDozNSwg
WXVlSGFpYmluZyB3cm90ZToKPiBJZiBDT05GSUdfRFJNX0xWRFNfRU5DT0RFUj15IGJ1dCBDT05G
SUdfRFJNX0tNU19IRUxQRVI9bSwKPiBidWlsZCBmYWlsczoKPiAKPiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2x2ZHMtZW5jb2Rlci5vOiBJbiBmdW5jdGlvbiBgbHZkc19lbmNvZGVyX3Byb2JlJzoK
PiBsdmRzLWVuY29kZXIuYzooLnRleHQrMHgxNTUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBk
ZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkJwo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4KPiBGaXhlczogZGJiNThiZmQ5YWU2IGRybS9icmlkZ2U6ICgiRml4
IGx2ZHMtZW5jb2RlciBzaW5jZSB0aGUgcGFuZWxfYnJpZGdlIHJld29yay4iKQo+IFNpZ25lZC1v
ZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gaW5kZXgg
YTZlZWM5MC4uMjkyNjc1MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tj
b25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPiBAQCAtOCw3ICs4
LDcgQEAgY29uZmlnIERSTV9CUklER0UKPiAgY29uZmlnIERSTV9QQU5FTF9CUklER0UKPiAgCWRl
Zl9ib29sIHkKPiAgCWRlcGVuZHMgb24gRFJNX0JSSURHRQo+IC0JZGVwZW5kcyBvbiBEUk1fS01T
X0hFTFBFUgo+ICsJc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gIAlzZWxlY3QgRFJNX1BBTkVMCj4g
IAloZWxwCj4gIAkgIERSTSBicmlkZ2Ugd3JhcHBlciBvZiBEUk0gcGFuZWxzCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
