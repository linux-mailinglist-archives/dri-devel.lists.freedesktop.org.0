Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581914208B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 11:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA09C893A4;
	Wed, 12 Jun 2019 09:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8B0893A4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:19:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5C9JerU022247;
 Wed, 12 Jun 2019 04:19:40 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5C9JeH0008886
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Jun 2019 04:19:40 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 04:19:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 04:19:40 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5C9JdeL036673;
 Wed, 12 Jun 2019 04:19:39 -0500
Subject: Re: [PATCH 1/2] drm/omapdrm: drop fb_debug_enter/leave
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20190612091253.26413-1-daniel.vetter@ffwll.ch>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f9e5925d-37d1-df04-db19-a963beeccde5@ti.com>
Date: Wed, 12 Jun 2019 12:19:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612091253.26413-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1560331180;
 bh=mA/EtPCjEsoONLd4LIUByZJunaTq4IXgQ9Xr7VA3ZY4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=iLeqUrB5KvEZpwi2M93oA9qHZkXQM0ddDFZb/HrEUUZzQRleGpbhWrIPRAQtKCe/v
 bzgoR4ErtU2PIeEd60gDTMQBqFFg67cuZxif1WFrUwGNXTCoIV98wAcTNZQD3KUslm
 tpypjoirLqs1NuXI29r1lI8BPZIuwcTDNnK2vq04=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMDYvMjAxOSAxMjoxMiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBUaGlzIGlzIGEgbm8t
b3Agb24gYXRvbWljIGRyaXZlcnMgYmVjYXVzZSB3aXRoIGF0b21pYyBpdCdzIHNpbXBseSB0b28K
PiBjb21wbGljYXRlZCB0byBnZXQgYWxsIHRoZSBsb2NraW5nIGFuZCB3b3JrZXJzIGFuZCBub25i
bG9ja2luZwo+IHN5bmNocm9uaXphdGlvbiBjb3JyZWN0LCBmcm9tIGVzc2VudGlhbGx5IGFuIE5N
SSBjb250ZXh0LiBXZWxsLCB0b28KPiBjb21wbGljYXRlZCA9IGltcG9zc2libGUuIEFsc28sIG9t
YXBkcm0gbmV2ZXIgaW1wbGVtZW50ZWQgdGhlCj4gbW9kZV9zZXRfYmFzZV9hdG9taWMgaG9vaywg
c28gSSBraW5kYSB3b25kZXIgd2h5IHRoaXMgd2FzIGV2ZXIgYWRkZWQuCj4gCj4gRHJvcCB0aGUg
aG9va3MuCgpmOWIzNGEwZmE0ZTI1ZDljMGI3MmYxMjQ2ODBjMzdjMGMzOGY5OTM0CgpJdCB3YXMg
anVzdCBvcGVuIGNvZGluZyBEUk1fRkJfSEVMUEVSX0RFRkFVTFRfT1BTLCB0byBnZXQgcmlkIG9m
IAoiSW5pdGlhbGl6ZXIgZW50cnkgZGVmaW5lZCB0d2ljZSIgd2FybmluZy4KCkFja2VkLWJ5OiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgoKT3IgSSBjYW4gcGljayBpdCB1
cCB0byBteSBicmFuY2ggaWYgdGhpcyBpcyBub3QgcGFydCBvZiBhIGJpZ2dlciBzZXJpZXMuCgog
IFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
