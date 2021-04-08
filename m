Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CEE357D08
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 09:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDA46EA17;
	Thu,  8 Apr 2021 07:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBF76EA17
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 07:11:00 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGC5l6YQ7zpVJ1;
 Thu,  8 Apr 2021 15:08:11 +0800 (CST)
Received: from [10.67.110.73] (10.67.110.73) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 8 Apr 2021 15:10:49 +0800
Subject: Re: [PATCH -next] drm/bridge: lt8912b: DRM_LONTIUM_LT8912B select
 GPIOLIB
From: "zhangjianhua (E)" <zhangjianhua18@huawei.com>
To: Robert Foss <robert.foss@linaro.org>
References: <20210406090733.169989-1-zhangjianhua18@huawei.com>
 <CAG3jFyvC6ozPxQ=TPdPgLAugKky5AhOZGJSiw0Dc3Kn5Pba0cA@mail.gmail.com>
 <d9bd5abf-0293-6155-dee0-20199fed1fc0@huawei.com>
 <CAG3jFyu6YY5pr5bdvqAbzZu0GG0z=PWP+JHL59G26cg0P=563w@mail.gmail.com>
 <a40abdd7-af43-28a3-1b79-0de6ca0c0093@huawei.com>
Message-ID: <53492034-4cec-12ed-ae27-d693686084ee@huawei.com>
Date: Thu, 8 Apr 2021 15:10:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a40abdd7-af43-28a3-1b79-0de6ca0c0093@huawei.com>
X-Originating-IP: [10.67.110.73]
X-CFilter-Loop: Reflected
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, johnny.chenyi@huawei.com,
 heying24@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gUm9iZXJ0CgpJIGFtIHNvcnJ5IHRoYXQgSSBtYWtlIGEgbWlzdGFrZSBhYm91dCB0aGUg
Y29tcGlsaW5nIGVycm9yIG9mIGx0ODkxMmIsCgp0aGUgcmVhc29uIGlzIHRoYXQgbHQ4OTEyYiBt
aXNzIHRoZSBoZWFkZXIgZmlsZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPi4KCkFsdGhvdWdoIHRo
ZXJlIGFyZSBtYW55IGZpbGVzIHJlZmVyZW5jZSBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoKSBh
bmQKCmRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCksIHRoZXkgYWxsIGluY2x1ZGUgPGxpbnV4L2dw
aW8vY29uc3VtZXIuaD4KCmFuZCBub3Qgb2NjdXIgdGhlIGNvbXBpbGluZyBlcnJvciBsaWtlIGx0
ODkxMmIuIEkgaGF2ZSBzZW5kIHRoZSBzZWNvbmQKCnZlcnNpb24gcGF0Y2gsIHBsZWFzZSByZWFk
LgoKCkJlc3QgcmVnYXJkcywKClpoYW5nIEppYW5odWEKCuWcqCAyMDIxLzQvNyAxNzo1MCwgemhh
bmdqaWFuaHVhIChFKSDlhpnpgZM6Cj4gVGhhbmtzLCBJIHdpbGwgZG8gdGhhdC4KPgo+IOWcqCAy
MDIxLzQvNyAxNjowMywgUm9iZXJ0IEZvc3Mg5YaZ6YGTOgo+Pj4gWWVzLCB5b3UgYXJlIHJpZ2h0
LCB0aGVyZSBhcmUgbWFueSBmaWxlcyByZWZlcmVuY2UKPj4+IGdwaW9kX3NldF92YWx1ZV9jYW5z
bGVlcCgpIGFuZAo+Pj4KPj4+IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCkuIEhvdyBhYm91dCBh
ZGQgY29uZmlnIGRlcGVuZGVuY2llcyBmb3IgYWxsCj4+PiByZWxlYXRlZAo+PiBJIHRoaW5rIHRo
aXMgaXMgdGhlIHdheSB0byBnbyBhbmQgcm91Z2hseSBoYWxmIG9mIHRoZSBkcm0gYnJpZGdlCj4+
IGRyaXZlcnMgc2VlbSB0byBuZWVkIHRoaXMgY2hhbmdlLgo+Pgo+PiBEbyB5b3UgbWluZCBzdWJt
aXR0aW5nIGEgc2VyaWVzIG9mIHBhdGNoZXMgYWRkaW5nIHRoaXMgZml4IGZvciBhbGwgb2YKPj4g
dGhlIHJlbGV2YW50IGJyaWRnZSBkcml2ZXJzPwo+Pgo+Pj4gY29uZmlncyBvciBvbmx5IGFkZCBj
b25maWcgZGVwZW5kZW5jaWVzIGZvciB0aGUgdG9wIGxldmVsIGNvbmZpZz8KPj4+Cj4+IC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
