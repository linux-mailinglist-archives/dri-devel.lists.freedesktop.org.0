Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE432A8409
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8876C6EDD3;
	Thu,  5 Nov 2020 16:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9C6EDD3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 16:53:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5GrKSd051762;
 Thu, 5 Nov 2020 10:53:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604595200;
 bh=bJHxWXo+htEqIJck0oZ4xC9NV1O36+j9LjNAzdp58ms=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=EGd6RItcFRPVPWaPhXlQOd5+xwYqgh7nzhmM97enuIGayTDI5zeAb/ODpjJuJtHGw
 vy91Z52rqq0U9GKxhM4zQ2SqUPMU0RIj6e1OH5/GEYQMTWFTYp8m0IVFv8yFl5I+Ld
 VnLyhf4c6qoEWv9O2Pzi5JcuR53QGMi24WE/a3dc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5GrKY6045430
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 10:53:20 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 10:53:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 10:53:20 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5GrId2050489;
 Thu, 5 Nov 2020 10:53:18 -0600
Subject: Re: [PATCH 08/19] gpu: drm: omapdrm: dss: dsi: Rework and remove a
 few unused variables
To: Lee Jones <lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-9-lee.jones@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <74399fab-6af5-77d3-e0eb-749774eb2837@ti.com>
Date: Thu, 5 Nov 2020 18:53:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105144517.1826692-9-lee.jones@linaro.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMTEvMjAyMCAxNjo0NSwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvZHNpLmM6IEluIGZ1bmN0aW9uIOKAmF9kc2lfcHJpbnRfcmVzZXRfc3RhdHVz4oCZ
Ogo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmM6MTEzMTo2OiB3YXJuaW5nOiB2
YXJpYWJsZSDigJhs4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGVdCj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzogSW4gZnVuY3Rpb24g4oCY
ZHNpX3VwZGF0ZeKAmToKPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jOjM5NDM6
MTA6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGRo4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYzoz
OTQzOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmGR34oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMgfCA5ICsr
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKSSdkIHVzZSAiZHJtL29tYXA6IGRzaTogIiBzdWJqZWN0IHByZWZpeCwgdGhlIGN1cnJlbnQg
b25lIGlzIGZpbmUgdG9vOgoKUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+CgpTaG91bGQgSSBwaWNrIHRoaXMgdXAgb3IgZG8geW91IHdhbnQgdG8ga2Vl
cCB0aGUgc2VyaWVzIGludGFjdD8KCiBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
