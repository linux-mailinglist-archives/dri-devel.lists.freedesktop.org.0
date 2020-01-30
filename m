Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7E14D820
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 10:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8389A6F91E;
	Thu, 30 Jan 2020 09:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7166F91E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 09:08:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 4C07A294E99
Subject: Re: [PATCHv5 00/34] Add AFBC support for Rockchip
To: dri-devel@lists.freedesktop.org
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <abace7b9-388b-e161-3371-c3b2e5406ff5@collabora.com>
Date: Thu, 30 Jan 2020 10:08:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, James Wang <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsLAoKQSBnZW50bGUgcmVtaW5kZXIuCgpQbGVhc2UgYWxzbyBzZWUgaW5saW5lOgoKVyBk
bml1IDE3LjEyLjIwMTkgb8KgMTU6NDksIEFuZHJ6ZWogUGlldHJhc2lld2ljeiBwaXN6ZToKPiBU
aGlzIHNlcmllcyBhZGRzIEFGQkMgc3VwcG9ydCBmb3IgUm9ja2NoaXAuIEl0IGlzIGluc3BpcmVk
IGJ5Ogo+IAo+IGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9jaHJvbWl1bW9zL3Ro
aXJkX3BhcnR5L2tlcm5lbC8rL3JlZnMvaGVhZHMvZmFjdG9yeS1ncnUtOTAxNy5CLWNocm9tZW9z
LTQuNC9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCj4gCj4gVGhp
cyBpcyB0aGUgZmlmdGggaXRlcmF0aW9uIG9mIHRoZSBhZmJjIHNlcmllcy4gQmV0d2VlbiB2MyBh
bmQgdjQgYSBsb3Qgb2YKPiByZXdvcmsgaGFzIGJlZW4gZG9uZSwgdGhlIG1haW4gZ29hbCBvZiB3
aGljaCB3YXMgdG8gbW92ZSBhbGwgYWZiYy1yZWxhdGVkCj4gY2hlY2tzIHRvIGhlbHBlcnMsIHNv
IHRoYXQgY29yZSBkb2VzIG5vdCBkZWFsIHdpdGggaXQuCj4gCj4gQSBuZXcgc3RydWN0IGRybV9h
ZmJjX2ZyYW1lYnVmZmVyIGlzIGFkZGVkLCB3aGljaCBzdG9yZXMgYWZiYy1yZWxhdGVkCj4gZHJp
dmVyLXNwZWNpZmljIGRhdGEuIEJlY2F1c2Ugb2YgdGhhdCwgaW4gZHJpdmVycyB0aGF0IHdpc2gg
dG8KPiB1c2UgdGhpcyBmZWF0dXJlLCB0aGUgc3RydWN0IG11c3QgYmUgYWxsb2NhdGVkIGRpcmVj
dGx5IGluIHRoZSBkcml2ZXIKPiBjb2RlIHJhdGhlciB0aGFuIGluc2lkZSBoZWxwZXJzLCBzbyB0
aGUgZmlyc3QgcG9ydGlvbiBvZiB0aGUgcGF0Y2hzZXQKPiBkb2VzIHRoZSBuZWNlc3NhcnkgcmVm
YWN0b3JpbmcuCj4gCj4gVGhlbiwgdGhlcmUgYXJlIDMgdXNlcnMgb2YgYWZiYzoga29tZWRhLCBt
YWxpZHAgYW5kLCBmaW5hbGx5LCByb2NrY2hpcCwKPiB0aGUgbGF0dGVyIGJlaW5nIHRoZSB1bHRp
bWF0ZSBwdXJwb3NlIG9mIHRoaXMgd29yayBhbmQgdGhlIDMgc3Vic2VxdWVudAo+IHBvcnRpb25z
IG9mIHRoZSBwYXRjaHNldCBtb3ZlIGtvbWVkYSBhbmQgbWFsaWRwIHRvIGdlbmVyaWMgaGVscGVy
cyBhbmQgYWRkCj4gYWZiYyBzdXBwb3J0IHRvIHJvY2tjaGlwLgoKSWYgY2hhbmdlcyBpbiBrb21l
ZGEgYW5kIG1hbGlkcCBpcyB0b28gbXVjaCB0byBkaWdlc3QgYXQgYSB0aW1lIEkgY2FuCmZvY3Vz
IG9uIHJvY2tjaGlwIG9ubHkuIFRoaXMgd291bGQgYW1vdW50IHRvIHBhdGNoZXMgMS00IGFuZCAz
My0zNC4KQWZ0ZXIgYWxsIHRoZSB1bHRpbWF0ZSBwdXJwb3NlIG9mIHRoaXMgd29yayBhbmQgdGlt
ZSBzcGVudCBvbiBpdAppcyBsYW5kaW5nIGFmYmMgc3VwcG9ydCBmb3Igcm9ja2NoaXAuCgpSZWdh
cmRzLAoKQW5kcnplagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
