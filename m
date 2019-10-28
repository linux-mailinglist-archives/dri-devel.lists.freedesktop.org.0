Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29845E7B26
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 22:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9DB6EA87;
	Mon, 28 Oct 2019 21:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1278C6E8C3;
 Mon, 28 Oct 2019 14:29:51 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 046DD41B2FBE9E855C1C;
 Mon, 28 Oct 2019 22:29:49 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 28 Oct 2019 22:29:47 +0800
Subject: Re: [PATCH 3/3] drm/amd/powerplay: Make two functions static
To: Alex Deucher <alexdeucher@gmail.com>
References: <20191028133621.21400-1-yuehaibing@huawei.com>
 <CADnq5_Ow+W_Syo6G3ZUXJeiLbc4YU=DL1FtznaTKm=RGj4tq1g@mail.gmail.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <afe3b6b3-ef75-50be-f133-f7febdc9e01a@huawei.com>
Date: Mon, 28 Oct 2019 22:29:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_Ow+W_Syo6G3ZUXJeiLbc4YU=DL1FtznaTKm=RGj4tq1g@mail.gmail.com>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Oct 2019 21:09:49 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LzEwLzI4IDIyOjA2LCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gT24gTW9uLCBPY3Qg
MjgsIDIwMTkgYXQgOTozNyBBTSBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+IHdy
b3RlOgo+Pgo+PiBGaXggc3BhcnNlIHdhcm5pbmdzOgo+Pgo+PiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmM6MjA1MDo1Ogo+PiAgd2FybmluZzog
c3ltYm9sICdhcmN0dXJ1c19pMmNfZWVwcm9tX2NvbnRyb2xfaW5pdCcgd2FzIG5vdCBkZWNsYXJl
ZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
cG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jOjIwNjg6NjoKPj4gIHdhcm5pbmc6IHN5bWJvbCAnYXJj
dHVydXNfaTJjX2VlcHJvbV9jb250cm9sX2ZpbmknIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBp
dCBiZSBzdGF0aWM/Cj4+Cj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2Vp
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
Pgo+IAo+IEFwcGxpZWQuICBUaGFua3MuICBJcyB0aGVyZSBtb3JlIHRvIHRoaXMgc2VyaWVzPyAg
SSBkb24ndCBzZWUgcGF0Y2hlcyAxIG9yIDIuCgpObywgb25seSB0aGlzIG9uZS4gSSBmb3JnZXQg
dG8gY2hhbmdlIHRoZSBwYXRjaCB0aXRsZS4gU29ycnkgZm9yIGNvbmZ1c2lvbi4KPiAKPiBBbGV4
Cj4gCj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0
LmMgfCA0ICsrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
cmN0dXJ1c19wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3Bw
dC5jCj4+IGluZGV4IGQ0OGE0OWQuLjMwOTlhYzIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCj4+IEBAIC0yMDQ3LDcgKzIwNDcsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGkyY19hbGdvcml0aG0gYXJjdHVydXNfaTJjX2VlcHJvbV9pMmNf
YWxnbyA9IHsKPj4gICAgICAgICAuZnVuY3Rpb25hbGl0eSA9IGFyY3R1cnVzX2kyY19lZXByb21f
aTJjX2Z1bmMsCj4+ICB9Owo+Pgo+PiAtaW50IGFyY3R1cnVzX2kyY19lZXByb21fY29udHJvbF9p
bml0KHN0cnVjdCBpMmNfYWRhcHRlciAqY29udHJvbCkKPj4gK3N0YXRpYyBpbnQgYXJjdHVydXNf
aTJjX2VlcHJvbV9jb250cm9sX2luaXQoc3RydWN0IGkyY19hZGFwdGVyICpjb250cm9sKQo+PiAg
ewo+PiAgICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gdG9fYW1kZ3B1X2Rldmlj
ZShjb250cm9sKTsKPj4gICAgICAgICBpbnQgcmVzOwo+PiBAQCAtMjA2NSw3ICsyMDY1LDcgQEAg
aW50IGFyY3R1cnVzX2kyY19lZXByb21fY29udHJvbF9pbml0KHN0cnVjdCBpMmNfYWRhcHRlciAq
Y29udHJvbCkKPj4gICAgICAgICByZXR1cm4gcmVzOwo+PiAgfQo+Pgo+PiAtdm9pZCBhcmN0dXJ1
c19pMmNfZWVwcm9tX2NvbnRyb2xfZmluaShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmNvbnRyb2wpCj4+
ICtzdGF0aWMgdm9pZCBhcmN0dXJ1c19pMmNfZWVwcm9tX2NvbnRyb2xfZmluaShzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmNvbnRyb2wpCj4+ICB7Cj4+ICAgICAgICAgaTJjX2RlbF9hZGFwdGVyKGNvbnRy
b2wpOwo+PiAgfQo+PiAtLQo+PiAyLjcuNAo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+PiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiAKPiAuCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
