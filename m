Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0956B560F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 21:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7ED36ECFE;
	Tue, 17 Sep 2019 19:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B6C6ECFE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 19:21:27 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y22so2729687pfr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 12:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=gsX7Gct8xN0tKdmpqaZx5h4cf+DzwKB08UnKxaHcPdI=;
 b=gAH5DX75roAzz2H1+3HU3W7E9N95fJXKFVhPnQN3GlC6Q2fvdUAcNqYdp9eCsuHZUU
 Lin/ITW1s22ihwcG/ddqcwke0vv96vyJB7RRhfeSMPJD2yAH3u4ul6XgS7dB5uOpgmGX
 Bljgk2tuQL2hhPeaHB0ZYCzZOMPw4ix0nYIVhUcaFbUzUkYTrgLVFiH1S1ZXlOB4yCAu
 qY+psFMhvn4QZcaHrbIh08wFIy//P3Y4P4m9d1k74ADFg98PYh5jscmFhuADKVyBcn09
 Dl28MH3pb9+VLc3I8WDQsM1p+7Y7E9/d3BPTNRUHwNrF62E0SdLqWnHa+9L9sXHuSbOv
 6SfA==
X-Gm-Message-State: APjAAAXeknj8iEgt4v/1TjOJdZ0mNe2mqzQgfMYuOacoJTtFrgk3d9Uz
 aWJzZj063podWGKvHCCSFIY=
X-Google-Smtp-Source: APXvYqxMMLQwQT0BYDY7rcEIcI5guQR05eHdYMZ/tg2lzurIMejP+3FuOzL42MAQB+WMo7ONg1rbeQ==
X-Received: by 2002:a17:90a:3acf:: with SMTP id
 b73mr6585095pjc.88.1568748087166; 
 Tue, 17 Sep 2019 12:21:27 -0700 (PDT)
Received: from SL2P216MB0105.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:22::5])
 by smtp.gmail.com with ESMTPSA id
 a17sm3644212pfc.26.2019.09.17.12.21.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 12:21:26 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: YueHaibing <yuehaibing@huawei.com>, "b.zolnierkie@samsung.com"
 <b.zolnierkie@samsung.com>
Subject: Re: [PATCH -next] fbdev: s3c-fb: use devm_platform_ioremap_resource()
 to simplify code
Thread-Topic: [PATCH -next] fbdev: s3c-fb: use
 devm_platform_ioremap_resource() to simplify code
Thread-Index: AWdoLS4xn2UhU3LGYne7F+3+UfM8ENwKv88M
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Tue, 17 Sep 2019 19:21:21 +0000
Message-ID: <SL2P216MB0105ADD044BE3CA7B33CB6ECAA8F0@SL2P216MB0105.KORP216.PROD.OUTLOOK.COM>
References: <20190904115523.25068-1-yuehaibing@huawei.com>
In-Reply-To: <20190904115523.25068-1-yuehaibing@huawei.com>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=gsX7Gct8xN0tKdmpqaZx5h4cf+DzwKB08UnKxaHcPdI=;
 b=VYLdnDQg+6MsvypYlg+F+1jO8p2b2kIVgaQWtBrN4YGTj5L2scy+fUDovmk6bdAdcW
 vYWAqPh/EGgzeNkx5UksLSGgMAKcnH35JRQzGJYaA63uu0YFibR2pFCp7alZwKzOVYkU
 Y7F3QEUdQ4fYmtcmrI8lGNWPdOIzaP+6DxtgWXw1HJmWBwm92ZF4w8M1o7P9KAZfhdu9
 +JEMnKBXgvTqmkckBcrg5E6bhz0O+pnta/xkqRF/k1d+6HEvBDa1siQ6Nr/gbbqtt9Aa
 X3pmHlxdwyTr08dpHhe26CGFSFXGol2HS5Of/q9JEyV4KLr+olh9No+voA669r4nnTMS
 DpGA==
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCu+7v09uIDkvNC8xOSwgNzo1NyBBTSwgWXVlSGFpYmluZyB3cm90ZToNCg0KPiBVc2UgZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgdG8gc2ltcGxpZnkgdGhlIGNvZGUgYSBiaXQu
DQo+IFRoaXMgaXMgZGV0ZWN0ZWQgYnkgY29jY2luZWxsZS4NCj4NCj4gUmVwb3J0ZWQtYnk6IEh1
bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5n
IDx5dWVoYWliaW5nQGh1YXdlaS5jb20+DQo+DQpBY2tlZC1ieTogSmluZ29vIEhhbiA8amluZ29v
aGFuMUBnbWFpbC5jb20+DQo+DQo+IC0tLQ0KPiAgZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIu
YyB8IDMgKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9zM2MtZmIuYw0KPiBpbmRleCBiYTA0ZDdhLi40M2FjOGQ3IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5jDQo+ICsrKyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvczNjLWZiLmMNCj4gQEAgLTE0MTEsOCArMTQxMSw3IEBAIHN0YXRpYyBpbnQg
czNjX2ZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICANCj4gIAlwbV9y
dW50aW1lX2VuYWJsZShzZmItPmRldik7DQo+ICANCj4gLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVz
b3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiAtCXNmYi0+cmVncyA9IGRldm1faW9y
ZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+ICsJc2ZiLT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiAgCWlmIChJU19FUlIoc2ZiLT5yZWdzKSkgew0K
PiAgCQlyZXQgPSBQVFJfRVJSKHNmYi0+cmVncyk7DQo+ICAJCWdvdG8gZXJyX2xjZF9jbGs7DQo+
IC0tIA0KPiAyLjcuNA0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
