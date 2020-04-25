Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324281B873A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 16:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584406E28A;
	Sat, 25 Apr 2020 14:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A17E6E28A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 14:58:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 17FA420083;
 Sat, 25 Apr 2020 16:57:58 +0200 (CEST)
Date: Sat, 25 Apr 2020 16:57:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drm/panel: remove set but not used variable 'config'
Message-ID: <20200425145756.GG32235@ravnborg.org>
References: <20200417101401.19388-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417101401.19388-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=IkcTkHD0fZMA:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=34DvTQX8muPqOaDScfQA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWXVlSGFpYmluZwoKT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDY6MTQ6MDFQTSArMDgwMCwg
WXVlSGFpYmluZyB3cm90ZToKPiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHktbnQz
NTU5Ny5jOjQ5MzozMTogd2FybmluZzogdmFyaWFibGUg4oCYY29uZmln4oCZIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gICBjb25zdCBzdHJ1Y3QgbnQzNTU5
N19jb25maWcgKmNvbmZpZzsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
Cj4gCj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoK
VGhhbmtzLiBBcHBsaWVkIHRvIGRybS1taXNjLW5leHQsIHNvIGl0IHdpbGwgYXBwZWFyIGluIG1h
aW5saW5lIGtlcm5lbAppbiB0aGUgbmV4dCBtZXJnZSB3aW5kb3cuCgoJU2FtCgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5jIHwgMiAtLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXRydWx5LW50MzU1OTcuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC10cnVseS1udDM1NTk3LmMKPiBpbmRleCAwMTJjYTYyYmYzMGUuLmYwYWQ2MDgxNTcwZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHJ1bHktbnQzNTU5Ny5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXRydWx5LW50MzU1OTcuYwo+IEBA
IC00OTAsOSArNDkwLDcgQEAgc3RhdGljIGludCB0cnVseV9udDM1NTk3X3BhbmVsX2FkZChzdHJ1
Y3QgdHJ1bHlfbnQzNTU5NyAqY3R4KQo+ICB7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBjdHgt
PmRldjsKPiAgCWludCByZXQsIGk7Cj4gLQljb25zdCBzdHJ1Y3QgbnQzNTU5N19jb25maWcgKmNv
bmZpZzsKPiAgCj4gLQljb25maWcgPSBjdHgtPmNvbmZpZzsKPiAgCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGN0eC0+c3VwcGxpZXMpOyBpKyspCj4gIAkJY3R4LT5zdXBwbGllc1tpXS5zdXBw
bHkgPSByZWd1bGF0b3JfbmFtZXNbaV07Cj4gIAo+IC0tIAo+IDIuMTcuMQo+IAo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
