Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83142B639F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 14:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6736E218;
	Tue, 17 Nov 2020 13:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D696E218
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 13:41:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A77EAC1F;
 Tue, 17 Nov 2020 13:41:38 +0000 (UTC)
Subject: Re: [PATCH] drm/omap: dmm_tiler: fix return error code in
 omap_dmm_probe()
To: Yang Yingliang <yangyingliang@huawei.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tomi.valkeinen@ti.com
References: <20201117061045.3452287-1-yangyingliang@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <04c96207-3c67-0cab-d3e7-919b96fbb46b@suse.de>
Date: Tue, 17 Nov 2020 14:41:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117061045.3452287-1-yangyingliang@huawei.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDE3LjExLjIwIHVtIDA3OjEwIHNjaHJpZWIgWWFuZyBZaW5nbGlhbmc6Cj4gUmV0dXJu
IC1FTk9NRU0gd2hlbiBhbGxvY2F0aW5nIHJlZmlsbCBtZW1vcnkgZmFpbGVkLgo+IAo+IEZpeGVz
OiA3MWU4ODMxZjY0MDcgKCJkcm0vb21hcDogRE1NL1RJTEVSIHN1cHBvcnQgZm9yIE9NQVA0KyBw
bGF0Zm9ybSIpCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2RtbV90aWxlci5jCj4gaW5kZXggNDJlYzUxYmI3YjFiLi43ZjQzMTcyNDg4MTIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMKPiBAQCAtODg5
LDYgKzg4OSw3IEBAIHN0YXRpYyBpbnQgb21hcF9kbW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqZGV2KQo+ICAJCQkJCSAgICZvbWFwX2RtbS0+cmVmaWxsX3BhLCBHRlBfS0VSTkVMKTsK
PiAgCWlmICghb21hcF9kbW0tPnJlZmlsbF92YSkgewo+ICAJCWRldl9lcnIoJmRldi0+ZGV2LCAi
Y291bGQgbm90IGFsbG9jYXRlIHJlZmlsbCBtZW1vcnlcbiIpOwo+ICsJCXJldCA9IC1FTk9NRU07
CgpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CgpU
aGFua3MgZm9yIHRoZSBwYXRjaC4gSSdsbCBhZGQgaXQgdG8gZHJtLW1pc2MtbmV4dC4gVGhlcmUg
YXJlIG1vcmUgc3VjaAplcnJvcnMgaGVyZS4gSWYgdGhlIHZlcnkgZmlyc3QgYWxsb2NhdGlvbiBm
YWlscywgdGhlIGZ1bmN0aW9uIHJldHVybnMKLUVGQVVMVCwgd2hpY2ggbWFrZXMgbm8gc2Vuc2Uu
CgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+ICAJCWdvdG8gZmFpbDsKPiAgCX0KPiAgCj4gCgotLSAK
VGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4
IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
