Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D603341DD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 10:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22ED89819;
	Tue,  4 Jun 2019 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B94C89819;
 Tue,  4 Jun 2019 08:32:18 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8C467260E1F;
 Tue,  4 Jun 2019 09:32:15 +0100 (BST)
Date: Tue, 4 Jun 2019 10:32:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v4 0/5] drm: Fix fb changes for async updates
Message-ID: <20190604103211.7a42be9b@collabora.com>
In-Reply-To: <20190603165610.24614-1-helen.koike@collabora.com>
References: <20190603165610.24614-1-helen.koike@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Sean Paul <seanpaul@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Mamta Shukla <mamtashukla555@gmail.com>,
 kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Leo Li <sunpeng.li@amd.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@google.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAgMyBKdW4gMjAxOSAxMzo1NjowNSAtMDMwMApIZWxlbiBLb2lrZSA8aGVsZW4ua29p
a2VAY29sbGFib3JhLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+IAo+IEknbSByZS1zZW5kaW5nIHRo
aXMgc2VyaWVzIHdpdGggdGhlIGFja2VkIGJ5IGluIHRoZSBtc20gcGF0Y2ggYW5kCj4gdXBkYXRp
bmcgdGhlIGRvY3MgaW4gdGhlIGxhc3QgcGF0Y2gsIHRoZSByZXN0IGlzIHRoZSBzYW1lLgo+IAo+
IHYzIGxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kcmktZGV2ZWwv
bGlzdC8/c2VyaWVzPTkxMzUzCgpTZXJpZXMgcXVldWVkIHRvIGRybS1taXNjLWZpeGVzLgoKPiAK
PiBUaGFua3MhCj4gSGVsZW4KPiAKPiBDaGFuZ2VzIGluIHY0Ogo+IC0gYWRkIGFja2VkIGJ5IHRh
Zwo+IC0gdXBkYXRlIGRvY3MgaW4gYXRvbWljX2FzeW5jX3VwZGF0ZSBjYWxsYmFjawo+IAo+IENo
YW5nZXMgaW4gdjM6Cj4gLSB1c2Ugc3dhcCgpIHRvIHN3YXAgb2xkIGFuZCBuZXcgZnJhbWVidWZm
ZXJzIGluIGFzeW5jX3VwZGF0ZQo+IC0gZ2V0IHRoZSByZWZlcmVuY2UgdG8gb2xkX2ZiIGFuZCBz
ZXQgdGhlIHdvcmtlciBhZnRlciB2b3BfcGxhbmVfYXRvbWljX3VwZGF0ZSgpCj4gLSBhZGQgYSBG
SVhNRSB0YWcgZm9yIHdoZW4gd2UgaGF2ZSBtdWx0aXBsZSBmYnMgdG8gYmUgcmVsZWFzZWQgd2hl
bgo+IHZibGFuayBoYXBwZW5zLgo+IC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdlCj4gLSBBZGQgUmV2
aWV3ZWQtYnkgdGFncwo+IC0gQWRkIFRPRE8gaW4gZHJtX2F0b21pY19oZWxwZXJfYXN5bmNfY29t
bWl0KCkKPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gYWRkZWQgcmV2aWV3ZWQtYnkgdGFnCj4gLSB1
cGRhdGUgQ0Mgc3RhYmxlIGFuZCBGaXhlcyB0YWcKPiAtIEFkZGVkIHJldmlld2VkLWJ5IHRhZwo+
IC0gdXBkYXRlZCBDQyBzdGFibGUgYW5kIEZpeGVzIHRhZwo+IC0gQ2hhbmdlIHRoZSBvcmRlciBv
ZiB0aGUgcGF0Y2ggaW4gdGhlIHNlcmllcywgYWRkIHRoaXMgYXMgdGhlIGxhc3Qgb25lLgo+IC0g
QWRkIGRvY3VtZW50YXRpb24KPiAtIHMvYmFsbGFuY2VkL2JhbGFuY2VkCj4gCj4gSGVsZW4gS29p
a2UgKDUpOgo+ICAgZHJtL3JvY2tjaGlwOiBmaXggZmIgcmVmZXJlbmNlcyBpbiBhc3luYyB1cGRh
dGUKPiAgIGRybS9hbWQ6IGZpeCBmYiByZWZlcmVuY2VzIGluIGFzeW5jIHVwZGF0ZQo+ICAgZHJt
L21zbTogZml4IGZiIHJlZmVyZW5jZXMgaW4gYXN5bmMgdXBkYXRlCj4gICBkcm0vdmM0OiBmaXgg
ZmIgcmVmZXJlbmNlcyBpbiBhc3luYyB1cGRhdGUKPiAgIGRybTogZG9uJ3QgYmxvY2sgZmIgY2hh
bmdlcyBmb3IgYXN5bmMgcGxhbmUgdXBkYXRlcwo+IAo+ICAuLi4vZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0
b21pY19oZWxwZXIuYyAgICAgICAgICAgfCAyMiArKysrLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvbWRwNS9tZHA1X3BsYW5lLmMgICAgfCAgNCArKwo+ICBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jICAgfCA1MSArKysrKysrKysrLS0tLS0tLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMgICAgICAgICAgICAgICB8ICAyICstCj4g
IGluY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmggICAgICB8ICA4ICsrKwo+
ICA2IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
