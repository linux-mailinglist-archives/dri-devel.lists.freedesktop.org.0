Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D8D2695
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5389DFF;
	Thu, 10 Oct 2019 09:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CF189DFF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:45:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A9jtxO010250;
 Thu, 10 Oct 2019 04:45:55 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A9jtiF004499
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 04:45:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 04:45:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 04:45:51 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A9jrRu018187;
 Thu, 10 Oct 2019 04:45:53 -0500
Subject: Re: [PATCH v4 0/8] drm/omap: OMAP_BO flags
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
References: <20191010093445.11069-1-jjhiblot@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <fc2c9bec-c3b8-bac2-1ec5-92a2f3b31694@ti.com>
Date: Thu, 10 Oct 2019 12:45:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010093445.11069-1-jjhiblot@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570700755;
 bh=wPpqhY4q5vD7+PvTK0r7rYIM3ysMcby1udsrSkV24Dk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=WqrmQT821Z3FAT9PvG0K+HwxiAKXOHtHqnSPQn+UtLAnrhtRxYlizaZflDYVBw0NS
 +MfcbgvONrrfKopg9MT+D9NAnJioaEUHU9N7f4YsZWtfvk6gsJcwxiGBdfQZnTMOgC
 dr7AAqSbiRRKCixONw4gXqa8WO2Tey06qqOuxGWw=
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

SGkgSkosCgpPbiAxMC8xMC8yMDE5IDEyOjM0LCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+
IEEgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIHdvcmsgaGFkIGJlZW4gc2VudCBieSBUb21pIFZhbGtl
aW5lbiBpbiBtYXkgMjAxNwo+IChodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2
ZWwvbXNnMTQwNjYzLmh0bWwpLgo+IAo+IFRoaXMgc2VyaWVzIGFkZHMgYSBmZXcgbmV3IE9NQVBf
Qk8gZmxhZ3MgdG8gaGVscCB0aGUgdXNlcnNwYWNlIG1hbmFnZQo+IHNpdHVhdGlvbnMgd2hlcmUg
aXQgbmVlZHMgdG8gdXNlIGxvdHMgb2YgYnVmZmVycywgYW5kIHdvdWxkIGN1cnJlbnRseSBydW4K
PiBvdXQgb2YgVElMRVIgc3BhY2UuIFRoZSBUSUxFUiBzcGFjZSBpcyBsaW1pdGVkIHRvIG1hcHBp
bmcgMTI4TUIgYXQgYW55IGdpdmVuCj4gdGltZSBhbmQgc29tZSBhcHBsaWNhdGlvbnMgbWlnaHQg
bmVlZCBtb3JlLgo+IAo+IFRoaXMgc2VyZXMgaXMgYWxzbyB0aGUgb3Bwb3J0dW5pdHkgdG8gZG8g
c29tZSBjbGVhbnVwIGluIHRoZSBmbGFncyBhbmQKPiBpbXByb3ZlIHRoZSBjb21tZW50cyBkZXNj
cmliaW5nIHRoZW0uCj4gCj4gVGhlIHVzZXItc3BhY2UgcGF0Y2hlcyBmb3IgbGliZHJtLCBhbHRo
b3VnaCByZWFkeSwgaGF2ZW4ndCBiZWVuIHBvc3RlZCB5ZXQuCj4gSXQgd2lsbCBiZSBiZSBkb25l
IHdoZW4gdGhpcyBzZXJpZXMgaGF2ZSBiZWVuIGRpc2N1c3NlZCBhbmQgaG9wZWZ1bGx5IGluCj4g
dGhlIHByb2Nlc3Mgb2YgZ2V0dGluZyBtZXJnZWQuCj4gCj4gSkoKPiAKPiBjaGFuZ2VzIGluIHY0
Ogo+IC0gZml4ZWQgaW5jcmVtZW50YWwgYnVpbGQgaXNzdWUgaW50cm9kdWNlZCBieSBwYXRjaCAj
MSBhbmQgbGF0ZXIgZml4ZWQgYnkKPiAgICBwYXRjaCAjMi4KPiAtIEFkZGVkIG15IHJldmlld2Vk
LWJ5IHRvIFRvbWlzJ3MgcGF0Y2gKClRoaXMgZG9lc24ndCBjb21waWxlIG9uIHRvcCBvZiA1LjQg
YXMgdGhlIGxhc3QgcGF0Y2ggaXMgdXNpbmcgCmRtYV9mcmVlX3dyaXRlY29tYmluZSBpbnN0ZWFk
IG9mIGRtYV9mcmVlX3djLiBJbiB2MywgaXQgd2FzIGNvcnJlY3QsIGJ1dCAKdGhlIGNoYW5nZW5v
dGVzIGRvbid0IG1lbnRpb24gdGhlIGNoYW5nZS4KCldhcyB0aGVyZSBzb21lIG1peCB1cD8gV2hh
dCBrZXJuZWwgYXJlIHlvdXIgcGF0Y2hlcyBiYXNlZCBvbj8KCiAgVG9taQoKLS0gClRleGFzIElu
c3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZ
LXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxz
aW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
