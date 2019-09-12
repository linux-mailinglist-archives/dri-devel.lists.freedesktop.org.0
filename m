Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB50B1CC4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 14:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4192C6EF42;
	Fri, 13 Sep 2019 12:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247D76EF42
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 12:01:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 03BAD28BB6B
Subject: Re: [PATCH 0/2] drm/panfrost: Tidy up the devfreq implementation
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>
References: <20190912112804.10104-1-steven.price@arm.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <8be4769c-3162-efbb-ea66-05b8404188fc@collabora.com>
Date: Thu, 12 Sep 2019 15:51:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190912112804.10104-1-steven.price@arm.com>
Content-Language: en-US
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
Cc: Mark Brown <broonie@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMi8xOSAxMjoyOCBQTSwgU3RldmVuIFByaWNlIHdyb3RlOgo+IFRoZSBkZXZmcmVxIGlt
cGxlbWVudGF0aW9uIGluIHBhbmZyb3N0IGlzIHVubmVjZXNzYXJpbHkgb3BlbiBjb2RlZC4gSXQK
PiBhbHNvIHRyYWNrcyB1dGlsaXNhdGlvbiBtZXRyaWNzIHBlciBzbG90IHdoaWNoIGlzbid0IHZl
cnkgdXNlZnVsLiBMZXQncwo+IHRpZHkgaXQgdXAhCj4gCj4gVGhpcyBzaG91bGQgYmUgcGlja2Vk
IHVwIGFsb25nIHdpdGggTWFyaydzIGNoYW5nZVsxXSB0byBmaXgKPiByZWd1bGF0b3JfZ2V0X29w
dGlvbmFsKCkgbWlzdXNlLiBUaGlzIGFsc28gZGVsZXRlcyB0aGUgY29kZSBjaGFuZ2VzIGZyb20K
PiA1MjI4MjE2M2RmYTYgYW5kIGUyMWRkMjkwODgxYiB3aGljaCB3b3VsZCBvdGhlcndpc2UgbmVl
ZCByZXZlcnRpbmcsIHNlZQo+IHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uWzJdLgoKQm90aCBwYXRj
aGVzIGxvb2sgZ3JlYXQuCgpSZXZpZXdlZC1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29A
Y29sbGFib3JhLmNvbT4KClRoYW5rcyEKClRvbWV1Cgo+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMTkwOTA0MTIzMDMyLjIzMjYzLTEtYnJvb25pZUBrZXJuZWwub3JnLwo+IFsy
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2NjZDgxNTMwLTJkYmQtM2MwMi1jYTBhLTEw
ODViMDA2NjNiNUBhcm0uY29tLwo+IAo+IFN0ZXZlbiBQcmljZSAoMik6Cj4gICAgZHJtL3BhbmZy
b3N0OiBVc2UgZ2VuZXJpYyBjb2RlIGZvciBkZXZmcmVxCj4gICAgZHJtL3BhbmZyb3N0OiBTaW1w
bGlmeSBkZXZmcmVxIHV0aWxpc2F0aW9uIHRyYWNraW5nCj4gCj4gICBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMTI2ICsrKysrKy0tLS0tLS0tLS0tLS0tCj4g
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oIHwgICAzICstCj4g
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmggIHwgIDE0ICstLQo+
ICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jICAgICB8ICAxNCArLS0K
PiAgIDQgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMTA5IGRlbGV0aW9ucygtKQo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
