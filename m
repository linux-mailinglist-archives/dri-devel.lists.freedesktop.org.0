Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBF02CAB5
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 17:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3DC89612;
	Tue, 28 May 2019 15:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CD789612
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 15:53:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SFrG9C033264;
 Tue, 28 May 2019 10:53:16 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SFrGK2128483
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 10:53:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 10:53:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 10:53:14 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SFrBCb060219;
 Tue, 28 May 2019 10:53:12 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
Date: Tue, 28 May 2019 18:53:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559058796;
 bh=dbyhM/5u8MgwcqC/5H5+1C0pbVLxubC8LxcCgplQU3s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BkLP17KBtfHl8j4s3xLOfNc7vfI0pyEY0m3ajgyj69SgO5Um3JejD0pWLW+66wr4T
 /u0Soykj5nSiQ1xxpCJsdQ93psmexkmIndoATW1CDbHV5O/d38F8L1w4C/hcn/eam3
 w7uzCOUGgpMC9L0e3fVLsXE6sQFDYHt3lwv4MASA=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAyOC8wNS8yMDE5IDE4OjA5LCBBZGFtIEZvcmQgd3JvdGU6Cj4gT24gVHVlLCBNYXkg
MjgsIDIwMTkgYXQgNDoxMSBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29t
PiB3cm90ZToKPj4KPj4gSGksCj4+Cj4+IE9uIDEwLzA1LzIwMTkgMjI6NDIsIEFkYW0gRm9yZCB3
cm90ZToKPj4+IEN1cnJlbnRseSB0aGUgc291cmNlIGNvZGUgaXMgY29tcGlsZWQgdXNpbmcgaGFy
ZC1jb2RlZCB2YWx1ZXMKPj4+IGZyb20gQ09ORklHX09NQVAyX0RTU19NSU5fRkNLX1BFUl9QQ0su
ICBUaGlzIHBhdGNoIGFsbG93cyB0aGlzCj4+PiBjbG9jayBkaXZpZGVyIHZhbHVlIHRvIGJlIG1v
dmVkIHRvIHRoZSBkZXZpY2UgdHJlZSBhbmQgYmUgY2hhbmdlZAo+Pj4gd2l0aG91dCBoYXZpbmcg
dG8gcmVjb21waWxlIHRoZSBrZXJuZWwuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3Jk
IDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4+Cj4+IEkgdW5kZXJzdGFuZCB3aHkgeW91IHdhbnQgdG8g
ZG8gdGhpcywgYnV0IEknbSBub3Qgc3VyZSBpdCdzIGEgZ29vZCBpZGVhLgo+PiBJdCdzIHJlYWxs
eSBzb21ldGhpbmcgdGhlIGRyaXZlciBzaG91bGQgZmlndXJlIG91dCwgYW5kIGlmIHdlIGFkZCBp
dCB0bwo+PiB0aGUgRFQsIGl0IGVmZmVjdGl2ZWx5IGJlY29tZXMgYW4gQUJJLgo+Pgo+PiBUaGF0
IHNhaWQuLi4gSSdtIG5vdCBzdXJlIGhvdyBnb29kIG9mIGEgam9iIHRoZSBkcml2ZXIgY291bGQg
ZXZlciBkbywgYXMKPj4gaXQgY2FuJ3Qga25vdyB0aGUgZnV0dXJlIHNjYWxpbmcgbmVlZHMgb2Yg
dGhlIHVzZXJzcGFjZSBhdCB0aGUgdGltZSBpdAo+PiBpcyBjb25maWd1cmluZyB0aGUgY2xvY2su
IEFuZCBzbywgSSdtIG5vdCBuYWNraW5nIHRoaXMgcGF0Y2gsIGJ1dCBJCj4+IGRvbid0IGZlZWwg
dmVyeSBnb29kIGFib3V0IHRoaXMgcGF0Y2guLi4KPj4KPj4gVGhlIHNldHRpbmcgYWxzbyBhZmZl
Y3RzIGFsbCBvdXRwdXRzIChleGx1ZGluZyB2ZW5jKSwgd2hpY2ggbWF5IG5vdCBiZQo+PiB3aGF0
IHRoZSB1c2VyIHdhbnRzLiBUaGVuIGFnYWluLCBJIHRoaW5rIHRoaXMgc2V0dGluZyBpcyByZWFs
bHkgb25seQo+PiBuZWVkZWQgb24gT01BUDIgJiAzLCB3aGljaCBoYXZlIG9ubHkgYSBzaW5nbGUg
b3V0cHV0LiBCdXQgdGhhdCdzIHRoZQo+PiBzYW1lIHdpdGggdGhlIGN1cnJlbnQga2NvbmZpZyBv
cHRpb24sIG9mIGNvdXJzZS4KPj4KPj4gU28sIHRoZSBjdXJyZW50IENPTkZJR19PTUFQMl9EU1Nf
TUlOX0ZDS19QRVJfUENLIGlzIGFuIHVnbHkgaGFjaywgaW4gbXkKPj4gb3BpbmlvbiwgYW5kIG1v
dmluZyBpdCB0byBEVCBtYWtlcyBpdCBhIHdvcnNlIGhhY2sgPSkuIEJ1dCBJIGRvbid0IGhhdmUK
Pj4gYW55IGdvb2Qgc3VnZ2VzdGlvbnMgZWl0aGVyLgo+IAo+IEFzIGl0IHN0YW5kcyB0aGUgTG9n
aWMgUEQgT01BUDM1IGFuZCBBTTM3L0RNMzcgYm9hcmRzIChTT00tTFYgYW5kCj4gVG9ycGVkbykg
cmVxdWlyZSB0aGlzIHRvIGJlIGhhcmQgY29kZWQgdG8gNCBvciBpdCBoYW5ncyBkdXJpbmcgc3Rh
cnQuCj4gVGhpcyBpcyB0aGUgY2FzZSBmb3IgYWxsIHZlcnNpb25zIDQuMisuICBJIGhhdmVuJ3Qg
dGVzdGVkIGl0IHdpdGgKPiBvbGRlciBzdHVmZi4gIFRvbnkgaGFzIGEgRE0zNzMwIFRvcnBlZG8g
a2l0IGFuZCByZXBvcnRlZCB0aGUgaGFuZ2luZwo+IGlzc3VlIHRvIG1lLiBJIHRvbGQgaGltIHRv
IHNldCB0aGF0IHZhbHVlIHRvIDQgdG8gbWFrZSBpdCBub3QgaGFuZy4KPiBIZSBhc2tlZCB0aGF0
IEkgbW92ZSBpdCB0byB0aGUgRFQgdG8gYXZvaWQgY3VzdG9tIGtlcm5lbHMuICBJIGFncmVlCj4g
aXQncyBhIGhhY2ssIGJ1dCBpZiBpdCdzIGNyZWF0ZSBhIGN1c3RvbWl6ZWQgZGVmY29uZmlnIGZp
bGUgZm9yIDQKPiBib2FyZHMgb3IgbW9kaWZ5IHRoZSBkZXZpY2UgdHJlZSwgaXQgc2VlbXMgbGlr
ZSB0aGUgZGV2aWNlIHRyZWUKPiBhcHByb2FjaCBpcyBsZXNzIGludHJ1c2l2ZS4KCk9rLCB3ZWxs
LCBJIHRoaW5rIHRoYXQncyBhIHNlcGFyYXRlIHRoaW5nIGZyb20gaXRzIGludGVuZGVkIHVzZS4g
VGhlIApwb2ludCBvZiB0aGUga2NvbmZpZyBvcHRpb24gaXMgdG8gZW5zdXJlIHRoYXQgdGhlIGZj
bGsvcGNsayByYXRpbyBzdGF5cyAKdW5kZXIgYSBjZXJ0YWluIG51bWJlciB0byBhbGxvdyBlbm91
Z2ggc2NhbGluZyByYW5nZS4gSXQgc2hvdWxkIG5ldmVyIAphZmZlY3QgYSBiYXNpYyBub24tc2Nh
bGluZyB1c2UgY2FzZSwgdW5sZXNzIHlvdSBzZXQgaXQgdG8gYSB0b28gaGlnaCAKdmFsdWUsIHdo
aWNoIHByZXZlbnRzIGZpbmRpbmcgYW55IHBjbGsuCgpIYXMgYW55b25lIGRlYnVnZ2VkIHdoeSB0
aGUgaGFuZyBpcyBoYXBwZW5pbmc/CgpJZiB3ZSBjYW4ndCBmaXggdGhlIGJ1ZyBpdHNlbGYsIHJh
dGhlciB0aGFuIGFkZGluZyBhIERUIG9wdGlvbiwgd2UgY291bGQgCmNoYW5nZSBhZGQgYSBtaW5f
ZmNrX3Blcl9wY2sgZmllbGQgKGFzIHlvdSBkbyksIGtlZXAgdGhlIGtjb25maWcgb3B0aW9uLCAK
YW5kIHNldCB0aGUgbWluX2Zja19wZXJfcGNrIGJhc2VkIG9uIHRoZSBrY29uZmlnIG9wdGlvbiwg
X29yXyBpbiBjYXNlIG9mIAp0aG9zZSBhZmZlY3RlZCBTb0NzLCBzZXQgdGhlIG1pbl9mY2tfcGVy
X3BjayBldmVuIHdpdGhvdXQgdGhlIGtjb25maWcgCm9wdGlvbi4KCiAgVG9taQoKLS0gClRleGFz
IEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtp
LgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBI
ZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
