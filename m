Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF305D428C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 16:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17786EC48;
	Fri, 11 Oct 2019 14:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0F96EC48
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 14:16:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BEGb4v096339;
 Fri, 11 Oct 2019 09:16:37 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BEGbYF067763;
 Fri, 11 Oct 2019 09:16:37 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 09:16:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 09:16:32 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BEGYOl102494;
 Fri, 11 Oct 2019 09:16:35 -0500
Subject: Re: [PATCH 0/4] drm/omap: Remove some set but not used variables
To: zhengbin <zhengbin13@huawei.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
References: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <12fb6a63-9a70-b545-6fb7-81c3ebbcc860@ti.com>
Date: Fri, 11 Oct 2019 17:16:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570803397;
 bh=pCj23juI1nOa4uMbFL5yEXhsNpfl8+2UTYwBN3JahDc=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=j0YuXyDK+3j95Ap6oWVqvtZOvzW1H3OkYp6DRUWyx6qmWmaYvhOAiWnHOUtQn5Naw
 OUKajTzMIV8GuK6GH+G3boLNgEUrLrkOz0GkUO1J7H59gbZiwADAcfjseiWAms9GP2
 Fu7HiBwudwoHw6WjgncUDaFlHSv02N8nCbWh7p6E=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwOC8xMC8yMDE5IDEwOjE1LCB6aGVuZ2JpbiB3cm90ZToKPiB6aGVuZ2JpbiAoNCk6
Cj4gICAgZHJtL29tYXA6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdwbGFuZScK
PiAgICBkcm0vb21hcDogUmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ3RjbGtfdHJh
aWwnCj4gICAgZHJtL29tYXA6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdlcnIn
IGluIGhkbWk1X2F1ZGlvX2NvbmZpZwo+ICAgIGRybS9vbWFwOiBSZW1vdmUgc2V0IGJ1dCBub3Qg
dXNlZCB2YXJpYWJsZSAnZXJyJyBpbiBoZG1pNF9hdWRpb19jb25maWcKPiAKPiAgIGRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9kc2kuYyAgICAgICAgfCAzICstLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYyB8IDQgKystLQo+ICAgZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZHNzL2hkbWk1X2NvcmUuYyB8IDQgKystLQo+ICAgZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9mYi5jICAgICAgICB8IDMgLS0tCj4gICA0IGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKClRoYW5rcyEgSSdsbCBwaWNrIHRoZXNlIHVwLgoK
ICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAy
MiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlw
YWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
