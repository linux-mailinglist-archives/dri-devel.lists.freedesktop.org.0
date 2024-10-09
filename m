Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D7F995D16
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968F010E622;
	Wed,  9 Oct 2024 01:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="TkLgMGw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3C8710E622
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=lF8Iy099lGRSzwTXHinD90uu+GLPeOTezMM8Ky3/UKI=; b=T
 kLgMGw9cC19LfbwcND7zM4wBlEsjsaEZlIwhauQiIbaC1+JFORHRFZMwi1TRJp/V
 RvSHtjmRKWMyP8VX3l8hShh5nFeIi0A31BVmAJsn4QUVDKhLdNI0lKfYrFIUSBKq
 1gn3UM6lXfOu8Sw9UuwLEeqKLUySkLlBcerbq2ISjY=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-134 (Coremail) ; Wed, 9 Oct 2024 09:37:35 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 9 Oct 2024 09:37:35 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: shiyongbang <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc drivers
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240930100610.782363-2-shiyongbang@huawei.com>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-2-shiyongbang@huawei.com>
X-NTES-SC: AL_Qu2ZCviYuEAu4yKfY+lSwTJP35VmMKvwz6RzoMQNfeEqqTHuxyUMQ35aO0vI1+J7N8pmqsISi/Miw50tXeO/
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <9c25d1f.1954.1926eeca432.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: higvCgDnA19f3gVn1ZkIAA--.50767W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hVzXmcF1lHnmgAEs2
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIEJhaWhhbu+8jAoKQXQgMjAyNC0xMC0wMSAxNToyNjoyMywgInNoaXlvbmdiYW5nIiA8c2hp
eW9uZ2JhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj5Gcm9tOiBiYWloYW4gbGkgPGxpYmFpaGFuQGh1
YXdlaS5jb20+Cj4KPkFkZCBkcCBhdXggcmVhZC93cml0ZSBmdW5jdGlvbnMuIFRoZXkgYXJlIGJh
c2ljIGZ1bmN0aW9ucwo+IGFuZCB3aWxsIGJlIHVzZWQgbGF0ZXIuCj4KPlNpZ25lZC1vZmYtYnk6
IGJhaWhhbiBsaSA8bGliYWloYW5AaHVhd2VpLmNvbT4KPi0tLQo+IGRyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24vaGlibWMvTWFrZWZpbGUgICAgIHwgICAzICstCj4gZHJpdmVycy9ncHUvZHJtL2hp
c2lsaWNvbi9oaWJtYy9kcC9kcF9hdXguYyAgfCAyMjcgKysrKysrKysrKysrKysrKysrKwo+IGRy
aXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvZHAvZHBfYXV4LmggIHwgIDgwICsrKysrKysK
PiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2RwL2RwX2NvbW0uaCB8ICA4OCArKysr
KysrCj4gZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9kcC9kcF9yZWcuaCAgfCAgNzYg
KysrKysrKwo+IDUgZmlsZXMgY2hhbmdlZCwgNDczIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9k
cC9kcF9hdXguYwo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2RwL2RwX2F1eC5oCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24vaGlibWMvZHAvZHBfY29tbS5oCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9oaXNpbGljb24vaGlibWMvZHAvZHBfcmVnLmgKPgo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2hpYm1jL01ha2VmaWxlCj5pbmRleCBkMjVjNzVlNjBkM2QuLjg3NzBlYzZkZmZmZCAx
MDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvTWFrZWZpbGUKPisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvTWFrZWZpbGUKPkBAIC0xLDQgKzEs
NSBAQAo+ICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+LWhpYm1jLWRy
bS15IDo9IGhpYm1jX2RybV9kcnYubyBoaWJtY19kcm1fZGUubyBoaWJtY19kcm1fdmRhYy5vIGhp
Ym1jX2RybV9pMmMubwo+K2hpYm1jLWRybS15IDo9IGhpYm1jX2RybV9kcnYubyBoaWJtY19kcm1f
ZGUubyBoaWJtY19kcm1fdmRhYy5vIGhpYm1jX2RybV9pMmMubyBcCj4rCSAgICAgICBkcC9kcF9h
dXgubwoKPisKPisjZGVmaW5lIERQQ0RfTElOS19CV19TRVQJCTB4MDEwMAo+KyNkZWZpbmUgRFBD
RF9MQU5FX0NPVU5UX1NFVAkJMHgwMTAxCj4rI2RlZmluZSBEUENEX1RSQUlOSU5HX1BBVFRFUk5f
U0VUCTB4MDEwMgo+KyNkZWZpbmUgRFBDRF9UUkFJTklOR19MQU5FMF9TRVQJCTB4MDEwMwo+KyNk
ZWZpbmUgRFBDRF9ET1dOU1BSRUFEX0NUUkwJCTB4MDEwNwo+KyNkZWZpbmUgRFBDRF9MQU5FMF8x
X1NUQVRVUwkJMHgwMjAyCj4rI2RlZmluZSBEUENEX0FESlVTVF9SRVFVRVNUX0xBTkUwXzEJMHgw
MjA2CgpJdCBzZWVtcyB0aGF0IGFsbCBvZiB0aGVzZSBoYXZlIGJlZW4gZGVmaW5lZCBpbiB0aGlz
IGhlYWRlciBmaWxlLgogaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaO+8mgpEUF9MSU5LX0JX
X1NFVApEUF9MQU5FX0NPVU5UX1NFVAoKCgoKPisKPisjZGVmaW5lIERQQ0RfVk9MVEFHRV9TV0lO
R19MQU5FXzAJKEJJVCgwKSB8IEJJVCgxKSkKPisjZGVmaW5lIERQQ0RfUFJFX0VNUEhBU0lTX0xB
TkVfMAkoQklUKDIpIHwgQklUKDMpKQo+KyNkZWZpbmUgRFBDRF9WT0xUQUdFX1NXSU5HX1NFVF9T
CTAKPisjZGVmaW5lIERQQ0RfUFJFX0VNUEhBU0lTX1NFVF9TCQkzCj4rI2RlZmluZSBEUENEX1ND
UkFNQkxJTkdfRElTQUJMRQkJQklUKDUpCj4rI2RlZmluZSBEUENEX0NSX0RPTkVfQklUUwkJQklU
KDApCj4rI2RlZmluZSBEUENEX0VRX0RPTkVfQklUUwkJKEJJVCgwKSB8IEJJVCgxKSB8IEJJVCgy
KSkKPisjZGVmaW5lIERQQ0RfRU5IQU5DRURfRlJBTUVfRU4JCTB4ODAKPisKPisjZGVmaW5lIERQ
Q0RfVFJBSU5JTkdfUEFUVEVSTl9ESVNBQkxFCTB4MAo+KyNkZWZpbmUgRFBDRF9UUkFJTklOR19Q
QVRURVJOXzEJCTB4MQo+KyNkZWZpbmUgRFBDRF9UUkFJTklOR19QQVRURVJOXzIJCTB4Mgo+KyNk
ZWZpbmUgRFBDRF9UUkFJTklOR19QQVRURVJOXzMJCTB4Mwo+KyNkZWZpbmUgRFBDRF9UUkFJTklO
R19QQVRURVJOXzQJCTB4Nwo+KyNkZWZpbmUgRFBDRF9WT0xUQUdFX1NXSU5HX0xFVkVMXzAJRklF
TERfUFJFUChHRU5NQVNLKDEsIDApLCAwKQo+KyNkZWZpbmUgRFBDRF9WT0xUQUdFX1NXSU5HX0xF
VkVMXzEJRklFTERfUFJFUChHRU5NQVNLKDEsIDApLCAxKQo+KyNkZWZpbmUgRFBDRF9WT0xUQUdF
X1NXSU5HX0xFVkVMXzIJRklFTERfUFJFUChHRU5NQVNLKDEsIDApLCAyKQo+KyNkZWZpbmUgRFBD
RF9WT0xUQUdFX1NXSU5HX0xFVkVMXzMJRklFTERfUFJFUChHRU5NQVNLKDEsIDApLCAzKQo+KyNk
ZWZpbmUgRFBDRF9QUkVfRU1QSEFTSVNfTEVWRUxfMAlGSUVMRF9QUkVQKEdFTk1BU0soNCwgMyks
IDApCj4rI2RlZmluZSBEUENEX1BSRV9FTVBIQVNJU19MRVZFTF8xCUZJRUxEX1BSRVAoR0VOTUFT
Syg0LCAzKSwgMSkKPisjZGVmaW5lIERQQ0RfUFJFX0VNUEhBU0lTX0xFVkVMXzIJRklFTERfUFJF
UChHRU5NQVNLKDQsIDMpLCAyKQo+KyNkZWZpbmUgRFBDRF9QUkVfRU1QSEFTSVNfTEVWRUxfMwlG
SUVMRF9QUkVQKEdFTk1BU0soNCwgMyksIDMpCj4rCj4rI2RlZmluZSBEUF9MSU5LX1JBVEVfTlVN
CQk0Cj4rI2RlZmluZSBEUF9MSU5LX1JBVEVfMAkJCTB4Ngo+KyNkZWZpbmUgRFBfTElOS19SQVRF
XzEJCQkweEEKPisjZGVmaW5lIERQX0xJTktfUkFURV8yCQkJMHgxNAo+KyNkZWZpbmUgRFBfTElO
S19SQVRFXzMJCQkweDFFCj4rI2RlZmluZSBEUF9BVVhfTkFUSVZFX1JFUExZX01BU0sJKDB4MyA8
PCA0KQo+KyNkZWZpbmUgRFBfQVVYX0FDSwkJCSgwIDw8IDQpCj4rI2RlZmluZSBEUF9BVVhfTkFD
SwkJCSgweDEgPDwgNCkKPisjZGVmaW5lIERQX0FVWF9ERUZFUgkJCSgweDIgPDwgNCkKPisjZGVm
aW5lIERQX0NGR19BVVhfUwkJCTE3Cj4rI2RlZmluZSBEUF9DRkdfQVVYX1NUQVRVU19TCQk0Cj4r
Cj4rI2RlZmluZSBBVVhfNF9CWVRFCQkJNAo+KyNkZWZpbmUgQVVYXzRfQklUCQkJNAo+KyNkZWZp
bmUgQVVYXzhfQklUCQkJOAo+KyNkZWZpbmUgQVVYX1JFU0VUX0lOVEVSVkFMCQkxNQo+KyNkZWZp
bmUgQVVYX1JFVFJZX0lOVEVSVkFMCQk1MDAKPisjZGVmaW5lIEFVWF9SRUFEWV9EQVRBX0JZVEVf
UwkJMTIKPisKPisvKiBhdXhfY21kX2FkZHIgcmVnaXN0ZXIgc2hpZnQgKi8KPisjZGVmaW5lIEFV
WF9DTURfUkVRX1RZUEVfUwkJMAo+KyNkZWZpbmUgQVVYX0NNRF9SRVFfTEVOX1MJCTQKPisjZGVm
aW5lIEFVWF9DTURfQUREUl9TCQkJOAo+KyNkZWZpbmUgQVVYX0NNRF9JMkNfQUREUl9PTkxZX1MJ
CTI4Cj4=
