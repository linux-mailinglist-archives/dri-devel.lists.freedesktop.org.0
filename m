Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DD4D41FB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 16:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAEF6E0B9;
	Fri, 11 Oct 2019 14:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D146E0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 14:00:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BE0dVT047423;
 Fri, 11 Oct 2019 09:00:39 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BE0dXM043333
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Oct 2019 09:00:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 09:00:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 09:00:34 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BE0bgJ085049;
 Fri, 11 Oct 2019 09:00:37 -0500
Subject: Re: [PATCH v5 0/8] drm/omap: OMAP_BO flags
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
References: <20191010120000.1421-1-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3ab2ea11-5ce3-d018-2054-b2b5f79d79c2@ti.com>
Date: Fri, 11 Oct 2019 17:00:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010120000.1421-1-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570802439;
 bh=GsAaLuVLTVW3YhGlRjDS05TPMUdl2L0G272KKrnYIY8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=E6dqgj66q0d2pzYNysQAghRpOu+s1FAP/R3X+vpHViZcEPFnlGnvBENd8tV1myeUH
 Rc69w+QE8/un5ghds31Ta6ui5p9+qqTaZ/0eIDrej70HE3QQUMAF+4R++QHThVSoKS
 EMyjC2HTb2pHzU3y5ugsMOkd4Zumfho7WA6ZP960=
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
Cc: jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTAvMjAxOSAxNDo1OSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPiBBIGZpcnN0
IHZlcnNpb24gb2YgdGhpcyB3b3JrIGhhZCBiZWVuIHNlbnQgYnkgVG9taSBWYWxrZWluZW4gaW4g
bWF5IDIwMTcKPiAoaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzE0
MDY2My5odG1sKS4KPiAKPiBUaGlzIHNlcmllcyBhZGRzIGEgZmV3IG5ldyBPTUFQX0JPIGZsYWdz
IHRvIGhlbHAgdGhlIHVzZXJzcGFjZSBtYW5hZ2UKPiBzaXR1YXRpb25zIHdoZXJlIGl0IG5lZWRz
IHRvIHVzZSBsb3RzIG9mIGJ1ZmZlcnMsIGFuZCB3b3VsZCBjdXJyZW50bHkgcnVuCj4gb3V0IG9m
IFRJTEVSIHNwYWNlLiBUaGUgVElMRVIgc3BhY2UgaXMgbGltaXRlZCB0byBtYXBwaW5nIDEyOE1C
IGF0IGFueSBnaXZlbgo+IHRpbWUgYW5kIHNvbWUgYXBwbGljYXRpb25zIG1pZ2h0IG5lZWQgbW9y
ZS4KPiAKPiBUaGlzIHNlcmVzIGlzIGFsc28gdGhlIG9wcG9ydHVuaXR5IHRvIGRvIHNvbWUgY2xl
YW51cCBpbiB0aGUgZmxhZ3MgYW5kCj4gaW1wcm92ZSB0aGUgY29tbWVudHMgZGVzY3JpYmluZyB0
aGVtLgo+IAo+IFRoZSB1c2VyLXNwYWNlIHBhdGNoZXMgZm9yIGxpYmRybSwgYWx0aG91Z2ggcmVh
ZHksIGhhdmVuJ3QgYmVlbiBwb3N0ZWQgeWV0Lgo+IEl0IHdpbGwgYmUgYmUgZG9uZSB3aGVuIHRo
aXMgc2VyaWVzIGhhdmUgYmVlbiBkaXNjdXNzZWQgYW5kIGhvcGVmdWxseSBpbgo+IHRoZSBwcm9j
ZXNzIG9mIGdldHRpbmcgbWVyZ2VkLgoKVGhhbmtzISBJJ2xsIHF1ZXVlIHRoZXNlIHVwLgoKICBU
b21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwg
MDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlr
a2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
