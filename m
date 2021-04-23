Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FAC3691CF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 14:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998166EB87;
	Fri, 23 Apr 2021 12:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3116EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 12:12:58 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7776D332;
 Fri, 23 Apr 2021 14:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1619179977;
 bh=ub+iIB/ItT6V5W5KSuNTj3i33JnmRCY3IpGwmtb8Jpk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NVYFRLUUfn/JKO1qLioTR2gkcEn4tH2q/OwFCiiSJ+q9bsLzzS0mSR0hWX4PlRDes
 6qieu1VN3PTFuFi8+dUHCyr68dNwXJtUA1PusyW77k7CUfeKALRpi4aoSoehEPyWQp
 TJGD3NueV/IpH3ZxC6oerXY6Qe4ucjd8bnHAqKu8=
Subject: Re: [PATCH 19/40] drm/omapdrm/omap_gem: Properly document
 omap_gem_dumb_map_offset()
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-20-lee.jones@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <1597afec-291f-4b08-cfb5-f7b04f28f4bd@ideasonboard.com>
Date: Fri, 23 Apr 2021 15:12:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-20-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDQvMjAyMSAxNzozNywgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICAgZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9nZW0uYzo2MTk6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUgZm9yIG9t
YXBfZ2VtX2R1bWJfbWFwKCkuIFByb3RvdHlwZSB3YXMgZm9yIG9tYXBfZ2VtX2R1bWJfbWFwX29m
ZnNldCgpIGluc3RlYWQKPiAKPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWJhQGtlcm5lbC5vcmc+
Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5h
cm8ub3JnPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPiBDYzogUm9iIENsYXJrIDxyb2IuY2xhcmtAbGluYXJvLm9yZz4KPiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZ2VtLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKPiBpbmRl
eCAzOGFmNjE5NWQ5NTkzLi4yN2M3MWNkZWQ1ZDBhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9v
bWFwX2dlbS5jCj4gQEAgLTYwNSw3ICs2MDUsNyBAQCBpbnQgb21hcF9nZW1fZHVtYl9jcmVhdGUo
c3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAgfQo+ICAg
Cj4gICAvKioKPiAtICogb21hcF9nZW1fZHVtYl9tYXAJLQlidWZmZXIgbWFwcGluZyBmb3IgZHVt
YiBpbnRlcmZhY2UKPiArICogb21hcF9nZW1fZHVtYl9tYXBfb2Zmc2V0CS0JYnVmZmVyIG1hcHBp
bmcgZm9yIGR1bWIgaW50ZXJmYWNlCj4gICAgKiBAZmlsZTogb3VyIGRybSBjbGllbnQgZmlsZQo+
ICAgICogQGRldjogZHJtIGRldmljZQo+ICAgICogQGhhbmRsZTogR0VNIGhhbmRsZSB0byB0aGUg
b2JqZWN0IChmcm9tIGR1bWJfY3JlYXRlKQo+IAoKUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVu
IDx0b21pLnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tPgoKICBUb21pCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
