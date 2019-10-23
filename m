Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A32E1FE9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 17:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE926EB30;
	Wed, 23 Oct 2019 15:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (unknown [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A43666EB30
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:49:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCDF23E8;
 Wed, 23 Oct 2019 08:49:39 -0700 (PDT)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 107C23F718;
 Wed, 23 Oct 2019 08:49:38 -0700 (PDT)
Subject: Re: [PATCH v2] panfrost: Properly undo pm_runtime_enable when
 deferring a probe
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
References: <20191023120925.30668-1-tomeu.vizoso@collabora.com>
 <20191023122157.32067-1-tomeu.vizoso@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <d87ff25e-52af-a467-d128-85fe18028e4c@arm.com>
Date: Wed, 23 Oct 2019 16:49:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023122157.32067-1-tomeu.vizoso@collabora.com>
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMTAvMjAxOSAxMzoyMSwgVG9tZXUgVml6b3NvIHdyb3RlOgo+IFdoZW4gZGVmZXJyaW5n
IHRoZSBwcm9iZSBiZWNhdXNlIG9mIGEgbWlzc2luZyByZWd1bGF0b3IsIHdlIHdlcmUgY2FsbGlu
Zwo+IHBtX3J1bnRpbWVfZGlzYWJsZSBldmVuIGlmIHBtX3J1bnRpbWVfZW5hYmxlIHdhc24ndCBj
YWxsZWQuCj4gCj4gTW92ZSB0aGUgY2FsbCB0byBwbV9ydW50aW1lX2Rpc2FibGUgdG8gdGhlIHJp
Z2h0IHBsYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3Nv
QGNvbGxhYm9yYS5jb20+Cj4gUmVwb3J0ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9y
Zz4KPiBDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiBGaXhlczogZjRh
M2M2YTQ0YjM1ICgiZHJtL3BhbmZyb3N0OiBEaXNhYmxlIFBNIG9uIHByb2JlIGZhaWx1cmUiKQoK
QXMgUm9iaW4gcG9pbnRlZCBvdXQgdGhpcyBzaG91bGQgYmU6CgpGaXhlczogNjM1NDMwNzk3ZDNm
ICgiZHJtL3BhbmZyb3N0OiBSZXdvcmsgcnVudGltZSBQTSBpbml0aWFsaXphdGlvbiIpCgpCdXQg
b3RoZXIgdGhhbiB0aGF0LAoKUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiBpbmRleCBiYzJk
ZGViNTVmNWQuLmYyMWJjOGE3ZWUzYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZHJ2LmMKPiBAQCAtNTU2LDExICs1NTYsMTEgQEAgc3RhdGljIGludCBwYW5mcm9zdF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcmV0dXJuIDA7Cj4gIAo+ICBl
cnJfb3V0MjoKPiArCXBtX3J1bnRpbWVfZGlzYWJsZShwZmRldi0+ZGV2KTsKPiAgCXBhbmZyb3N0
X2RldmZyZXFfZmluaShwZmRldik7Cj4gIGVycl9vdXQxOgo+ICAJcGFuZnJvc3RfZGV2aWNlX2Zp
bmkocGZkZXYpOwo+ICBlcnJfb3V0MDoKPiAtCXBtX3J1bnRpbWVfZGlzYWJsZShwZmRldi0+ZGV2
KTsKPiAgCWRybV9kZXZfcHV0KGRkZXYpOwo+ICAJcmV0dXJuIGVycjsKPiAgfQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
