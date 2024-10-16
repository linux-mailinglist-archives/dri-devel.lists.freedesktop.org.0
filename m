Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA5299FE12
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 03:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0883410E010;
	Wed, 16 Oct 2024 01:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="YpS2mcL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id E083910E010
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 01:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=O2wrtQeBkCB38wP4gV4qBGfHrLsFLIPdqiJchweefcE=; b=Y
 pS2mcL6o9Hd2Knvld4yS1U7WKjQCgEgvuQFb5W1OhWPzXd1K8i5rYuUYLLPDP9jw
 T/3UNX+CBQ0T3h07Ycmt0lRCd7UqR8RxxuMqEf70T4QnWrAAwgsxY4rgg1zhbjgH
 bOLY8nYocJEPB+u4mz9wtSH+CR3F7AFtPI1QuIuM3s=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-105 (Coremail) ; Wed, 16 Oct 2024 09:10:30 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 16 Oct 2024 09:10:30 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Piotr Zalewski" <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, "Daniel Stone" <daniel@fooishbar.org>, 
 "Dragan Simic" <dsimic@manjaro.org>, 
 "Diederik de Haas" <didi.debian@cknow.org>
Subject: Re:Re:Re:[PATCH v5] rockchip/drm: vop2: add support for gamma LUT
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <1974DYrs9gLrQrZ5VwCglFgKDDK686iyqnS_g6uPB-s9wZ_4CqfZXPjmYWihLgrkRu7ptNjpkFeqB0uTt73RFId6cL8FowQ8LFltPmaKCoI=@proton.me>
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <7b45f190.452f.1928e41b746.Coremail.andyshrk@163.com>
 <o_Cyz_ARcHj4zNlovv75MBwslIRhn3YWlscoNrlpLVobh7eWIMEQR5bNv0yhHx2KEx_gbYi_gH-8Y-CdvRZs9lZscz3-lhAbM50GXUdtSKY=@proton.me>
 <30940542.b36d.19290215124.Coremail.andyshrk@163.com>
 <1974DYrs9gLrQrZ5VwCglFgKDDK686iyqnS_g6uPB-s9wZ_4CqfZXPjmYWihLgrkRu7ptNjpkFeqB0uTt73RFId6cL8FowQ8LFltPmaKCoI=@proton.me>
X-NTES-SC: AL_Qu2ZC/yfvkgo5ieeYukXn0kXhec2W8Czvvgg34JRP5k0tyTsxzgGbW9cHXjP+s6ULwOhoAi6XyNfxM5FYqxheYdcoK+gaNV3RtBFHaU1nGk4
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1ae9f15d.e52.19292e05e73.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aSgvCgDnTz6GEg9ncJgOAA--.31233W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQB6XmcPD5hNtgABsI
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

CkhpIFBpb3RyLAoKQXQgMjAyNC0xMC0xNiAwNDoxMzo0MCwgIlBpb3RyIFphbGV3c2tpIiA8cFow
MTAwMDEwMTExMTFAcHJvdG9uLm1lPiB3cm90ZToKPkhpIEFuZHkKPgo+T24gVHVlc2RheSwgT2N0
b2JlciAxNXRoLCAyMDI0IGF0IDI6MjIgUE0sIEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPiB3
cm90ZToKPgo+PiA+ID4gPiArIHN0cnVjdCB2b3AyX3ZpZGVvX3BvcnQgKnZwLAo+PiA+ID4gPiAr
IHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPj4gPiA+ID4gKyBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUg
KmNydGNfc3RhdGUpCj4+ID4gPiA+ICt7Cj4+ID4gPiA+ICsKPj4gPiA+ID4gKyBpZiAodm9wMi0+
bHV0X3JlZ3MgJiYgY3J0Y19zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkKSB7Cj4+ID4gPiA+ICsg
aWYgKCFjcnRjX3N0YXRlLT5nYW1tYV9sdXQpIHsKPj4gPiA+ID4gKyB2b3AyX3ZwX2RzcF9sdXRf
ZGlzYWJsZSh2cCk7Cj4+ID4gPiA+ICsgcmV0dXJuOwo+PiA+ID4gPiArIH0KPj4gPiA+ID4gKwo+
PiA+ID4gPiArIGlmICh2b3AyX3N1cHBvcnRzX3NlYW1sZXNzX2dhbW1hX2x1dF91cGRhdGUodm9w
MikpIHsKPj4gPiA+IAo+PiA+ID4gSSB0aGluayBpdCdzIGJldHRlcnkgdG8gY2hlY2sgZm9yIHJr
MzU2OC9yazM1NjYgaGVyZSwgdGhlIG5ld2VyIHNvYyB3aWxsIGFsbCBmb2xsb3cKPj4gPiA+IHJr
MzU4OCBzdXBwb3J0IHNlYW1sZXNzIGdhbW1hIGx1dCB1cGRhdGUuCj4+ID4gCj4+ID4gSSB3aWxs
IGNoYW5nZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+PiA+IAo+PiA+ID4gPiArIHZvcDJfd3JpdGVs
KHZvcDIsIFJLMzU2OF9MVVRfUE9SVF9TRUwsIEZJRUxEX1BSRVAoCj4+ID4gPiA+ICsgUkszNTg4
X0xVVF9QT1JUX1NFTF9fR0FNTUFfQUhCX1dSSVRFX1NFTCwKPj4gPiA+ID4gKyB2cC0+aWQpKTsK
Pj4gPiA+ID4gKyB2b3AyX2NydGNfd3JpdGVfZ2FtbWFfbHV0KHZvcDIsIGNydGMpOwo+PiA+ID4g
PiArIHZvcDJfdnBfZHNwX2x1dF9lbmFibGUodnApOwo+PiA+ID4gPiArIHZvcDJfdnBfZHNwX2x1
dF91cGRhdGVfZW5hYmxlKHZwKTsKPj4gPiA+ID4gKyB9IGVsc2Ugewo+PiA+ID4gCj4+ID4gPiBB
cyBmb3IgcmszNTY2LzY4LCB3ZSBzaG91bGQgZG8gZXhjbHVzaXZlIGNoZWNrIGhlcmUsIGJlY2F1
c2UgdGhlcmUgaXMgb25seQo+PiA+ID4gb25lIGdhbW1hICwgb25seSBvbmUgVlAgY2FuIHVzZSBp
dCBhdCBhIHRpbWUuIFNlZSBteSBjb21tZW50cyBpbiBWMzoKPj4gPiAKPj4gPiBXaGF0IGRvIHlv
dSBtZWFuIGV4YWN0bHkgYnkgZXhjbHVzaXZlIGNoZWNrIGluIHRoaXMgY2FzZS5JdCdzIHRydWUg
dGhhdAo+PiA+IGdhbW1hIExVVCBpcyBzaGFyZWQgYWNyb3NzIHZpZGVvIHBvcnRzIGluIHJrMzU2
eCBidXQsIGlmIEkgY29ycmVjdGx5Cj4+ID4gdW5kZXJzdGFuZCwgdGhpcyBkb2Vzbid0IGZvcmJp
ZCB0byByZXByb2dyYW0gTFVUIHBvcnQgc2VsIGFuZCBhbGxvdyBvdGhlcgo+PiA+IFZQIHRvIHVz
ZSBnYW1tYSBMVVQuCj4+IAo+PiAKPj4gWWVzLCB3ZSBjYW4gcmVwcm9ncmFtIExVVCBwb3J0IHNl
bCwgYnV0IHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoZSB0aGUgZHNwX2x1dF9lbiBiaXQgaW4gVlB4
IGlzIGNsZWFyZWQgaWYgd2UKPj4gd2FudCByZXByb2dyYW0gTFVUIHBvcnQgc2VsIGZvcm0gVlB4
IHRvIFZQeS4KPj4gCj4KPk9rIEkgZ2V0IGl0IG5vdy4gSXMgc3VjaCByZXdvcmsgY29ycmVjdD8g
LSB3aGVuIGdhbW1hIExVVCBmb3IgcmszNTZ4IGlzCj5iZWluZyBzZXQsIGluc3RlYWQgb2YgZGlz
YWJsaW5nIHRoZSBMVVQgYmVmb3JlIHRoZSBnYW1tYSBMVVQgd3JpdGUgZm9yIHRoZQo+Y3VycmVu
dCBDUlRDJ3MgdmlkZW8gcG9ydCwgYWN0aXZlIHZpZGVvIHBvcnQgaXMgc2VsZWN0ZWQuIFNlbGVj
dGlvbiBpcyAKPmJhc2VkIG9uIGlmIERTUCBMVVQgRU4gYml0IGlzIHNldCBmb3IgcGFydGljdWxh
ciB2aWRlbyBwb3J0LiBlZzoKCklmIHRoZSB1c2Vyc3BhY2Ugd2FudCB0byBzZXQgZ2FtbWEgZm9y
IENSVEN4LCAgdGhlbiB0aGF0IGlzIGluZGVlZCB3aGVyZSB0aGV5IHdhbnQgdG8gc2V0IHRoZQpn
YW1tYSBvbuOAglRoZSBkcml2ZXIgc2lsZW50bHkgc2V0cyB0aGUgZ2FtbWEgb24gYW5vdGhlciBD
UlRDLCB3aGljaCBpcyBub3Qgd2hhdCB0aGUgdXNlciB3YW50cy4KCkkgdGhpbmsgdGhlcmUgYXJl
IHR3byBvcHRpb25z77yaCu+8iDHvvIlyZXR1cm4gYSBlcnJvciBpZiBnYW1tYSBpcyBlbmFibGUg
b24gb3RoZXIgQ1JUQ++8jCB0aGlzIGlzIHdoYXQgd2UgZG9uZSBpbiBvdXIgQlNQIGNvZGVbMV0K
ICAoMikgIGRpc2FibGUgdGhlIGRzcF9sdXQgb24gcHJpdmlvdXMgQ1JUQywgdGhlbiBzd2l0Y2gg
dG8gdGhlIGN1cnJlbnQgQ1JUQyB3aGljaCB1c2Vyc3BhY2Ugd2FudHMuCgpbMV1odHRwczovL2dp
dGh1Yi5jb20vYXJtYmlhbi9saW51eC1yb2NrY2hpcC9ibG9iL3JrMzU3Ni02LjEtZGV2LTIwMjRf
MDRfMTkvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMjTDM2NjYK
Cgo+YGBgCj5zdGF0aWMgc3RydWN0IHZvcDJfdmlkZW9fcG9ydCAqdm9wMl92cF9kc3BfbHV0X2dl
dF9hY3RpdmVfdnAoc3RydWN0IHZvcDIgKnZvcDIpCj57Cj4Jc3RydWN0IHZvcDJfdmlkZW9fcG9y
dCAqdnA7Cj4JaW50IGk7Cj4JZm9yIChpID0gMDsgaSA8IHZvcDItPmRhdGEtPm5yX3ZwczsgaSsr
KSB7Cj4JCXZwID0gJnZvcDItPnZwc1tpXTsKPgo+CQlpZiAodnAtPmNydGMuZGV2ICE9IE5VTEwg
JiYgdm9wMl92cF9kc3BfbHV0X2lzX2VuYWJsZWQodnApKSB7Cj4JCQlyZXR1cm4gdnA7Cj4JCX0K
Pgl9Cj4JcmV0dXJuIE5VTEw7Cj59Cj4KPiguLi4pCj4KPnN0cnVjdCB2b3AyX3ZpZGVvX3BvcnQg
KmFjdGl2ZV92cCA9IHZvcDJfdnBfZHNwX2x1dF9nZXRfYWN0aXZlX3ZwKHZvcDIpOwo+Cj5pZiAo
YWN0aXZlX3ZwKSB7Cj4Jdm9wMl92cF9kc3BfbHV0X2Rpc2FibGUoYWN0aXZlX3ZwKTsKPgl2b3Ay
X2NmZ19kb25lKGFjdGl2ZV92cCk7Cj4JaWYgKCF2b3AyX3ZwX2RzcF9sdXRfcG9sbF9kaXNhYmxl
KGFjdGl2ZV92cCkpCj4JCXJldHVybjsKPn0KPgo+dm9wMl93cml0ZWwodm9wMiwgUkszNTY4X0xV
VF9QT1JUX1NFTCwgdnAtPmlkKTsKPnZvcDJfY3J0Y193cml0ZV9nYW1tYV9sdXQodm9wMiwgY3J0
Yyk7Cj52b3AyX3ZwX2RzcF9sdXRfZW5hYmxlKHZwKTsKPmBgYAo+Cj4KPj4gPiA+ID4gCj4+ID4g
PiA+IGRybV9jcnRjX2hlbHBlcl9hZGQoJnZwLT5jcnRjLCAmdm9wMl9jcnRjX2hlbHBlcl9mdW5j
cyk7Cj4+ID4gPiA+ICsgaWYgKHZvcDItPmx1dF9yZWdzICYmIHZwLT5jcnRjLmRldiAhPSBOVUxM
KSB7Cj4+ID4gPiA+ICsgY29uc3Qgc3RydWN0IHZvcDJfdmlkZW9fcG9ydF9kYXRhICp2cF9kYXRh
ID0gJnZvcDJfZGF0YS0+dnBbdnAtPmlkXTsKPj4gPiA+ID4gCj4+ID4gPiA+ICsgZHJtX21vZGVf
Y3J0Y19zZXRfZ2FtbWFfc2l6ZSgmdnAtPmNydGMsIHZwX2RhdGEtPmdhbW1hX2x1dF9sZW4pOwo+
PiA+ID4gPiArIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KCZ2cC0+Y3J0YywgMCwgZmFsc2Us
Cj4+ID4gPiA+ICsgdnBfZGF0YS0+Z2FtbWFfbHV0X2xlbik7Cj4+ID4gPiAKPj4gPiA+IEl0IHNl
ZW1zIHRoYXQgd2UgY2FuIGtlZXAgaXQgaW4gb25lIGxpbmUsIHRoZSBkZWZhdWx0IGxpbWl0IG9m
IGxpbnV4IGtlcm5lbCBjb2Rpbmcgc3R5bGUgaXMgMTAwIGNoYXJhY3RlcnMgbm93Lgo+PiA+IAo+
PiA+IFRoYW5rcy4gSSBkaWRuJ3Qga25vdywgSSB3aWxsIGFtZW5kIGl0Lgo+PiAKPj4gCj4+IFNl
ZSBiZGM0OGZhMTFlNDYoImNoZWNrcGF0Y2gvY29kaW5nLXN0eWxlOiBkZXByZWNhdGUgODAtY29s
dW1uIHdhcm5pbmciKQo+PiAKPgo+SW50ZXJlc3RpbmcuCj4KPkJlc3QgcmVnYXJkcywgUGlvdHIg
WmFsZXdza2kK
