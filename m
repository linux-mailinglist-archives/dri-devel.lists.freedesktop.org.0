Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0D12AD5CC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 13:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756D789A56;
	Tue, 10 Nov 2020 12:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4DB89A56
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 12:01:51 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAC1maK031739;
 Tue, 10 Nov 2020 06:01:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605009708;
 bh=wCRTJJjnhbgI5KP8iM2EISON2IZQ8Ci3jNba4ttYH7U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hI/7kiTJ27/GEsOKXfXA/48MDnO53qTcyDIkn5FAIPk5uXXoTQ4yWj7BCFcMx1rqI
 fqBt7uA/mE/zZ9JSWU+27UMuIx2fr7XUUNEpZb0oY5uwcP2xM3LGdz4cVPgNt0qM83
 Vgu07tuymKFdexNxmyKU/p7dEGqZEnpWzOPfrwyo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAC1m08086548
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 06:01:48 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 06:01:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 06:01:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAC1jul051383;
 Tue, 10 Nov 2020 06:01:45 -0600
Subject: Re: [PATCH 08/19] drm/omapdrm/omap_gem: Fix misnamed and missing
 parameter descriptions
To: Lee Jones <lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-9-lee.jones@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3d5dc164-d26a-5999-1e7f-9cabfdd84c36@ti.com>
Date: Tue, 10 Nov 2020 14:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106214949.2042120-9-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMTEvMjAyMCAyMzo0OSwgTGVlIEpvbmVzIHdyb3RlOgo+IEZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2dlbS5jOjU5Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnZmlsZScgbm90IGRlc2NyaWJlZCBpbiAnb21hcF9nZW1fZHVtYl9jcmVhdGUnCj4gIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmM6NTkzOiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rp
b24gcGFyYW1ldGVyICdkcm1fZmlsZScgZGVzY3JpcHRpb24gaW4gJ29tYXBfZ2VtX2R1bWJfY3Jl
YXRlJwo+ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jOjYxOTogd2FybmluZzog
RnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnb2Zmc2V0JyBub3QgZGVzY3JpYmVkIGluICdv
bWFwX2dlbV9kdW1iX21hcF9vZmZzZXQnCj4gCj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZh
bGtlaW5lbkB0aS5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1
bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogUm9iIENsYXJrIDxyb2IuY2xhcmtAbGluYXJvLm9yZz4K
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKClRoYW5rcyEgSSdsbCBwaWNrIHRoaXMg
b25lIGFuZCB0aGUgbmV4dCB0byBkcm0tbWlzYy1uZXh0LgoKIFRvbWkKCi0tIApUZXhhcyBJbnN0
cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10
dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lu
a2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
