Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF872937D1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 11:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333386EC07;
	Tue, 20 Oct 2020 09:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9643D6EC32
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UeSrQSzqsKGwC4Ys1C+0uDaXnPppjUwPgV6U9zK9CfY=; b=QO8yJKbjEZPWacomno2QXgyULv
 Dk97h2bdjbyYJLw+cUN2WvVwsh0IKGHYoLqqpSwuqyererQLIT2Jo0SMLS0hrJUX8H0HdRf3FDGTW
 jWGcD/o0ufxufkH5udOogfgXaqmduZZQxYiwnOeyykzLZXc0TXlAbM39XF5K7Skbwr278t1wmURd6
 34hgL2b6jkpaJ6jKiZmPb6W+Dnufj5ULshDVf7+PnT+2YNr3DKSp7TyLP5wVBs3pC2e4KmrWPA5Mv
 gWKkEOUGNBj7PATbHOTucER6W1092o6UgWDZoQBjtW0ivcouIp0bfr3NkqTt+sTauJ84hff2XVKR+
 kUoIxmQA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kUnmn-00056W-QX; Tue, 20 Oct 2020 12:18:29 +0300
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
Date: Tue, 20 Oct 2020 12:18:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMTkvMjAgODoyNyBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE5LjEwLjIwMjAg
MTE6MTMsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+PiBPbiAxMC8xOS8yMCA1OjIxIEFN
LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+PiAwNy4xMC4yMDIwIDIwOjEyLCBNaWtrbyBQZXJ0
dHVuZW4g0L/QuNGI0LXRgjoKPj4+PiAraW50IHRlZ3JhX2RybV9pb2N0bF9jaGFubmVsX21hcChz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpkYXRhLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9maWxlICpmaWxlKQo+Pj4+ICt7Cj4+Pgo+Pj4gSGVs
bG8sIE1pa2tvIQo+Pj4KPj4+IENvdWxkIHlvdSBwbGVhc2UgdGVsbCB3aGF0IGFyZSB0aGUgaG9z
dDF4IGNsaWVudHMgdGhhdCBhcmUgZ29pbmcgdG8gYmUKPj4+IHVwc3RyZWFtZWQgYW5kIHdpbGwg
bmVlZCB0aGlzIElPQ1RMPwo+Pj4KPj4KPj4gSGkgRG1pdHJ5IQo+Pgo+PiBJdCBpcyBuZWVkZWQg
Zm9yIGFueSBlbmdpbmUvam9iIHRoYXQgd2FudHMgdG8gYWNjZXNzIG1lbW9yeSwgYXMgdGhpcwo+
PiBJT0NUTCBtdXN0IGJlIHVzZWQgdG8gbWFwIG1lbW9yeSBmb3IgdGhlIGVuZ2luZS4gU28gYWxs
IG9mIHRoZW0uCj4+Cj4+IERvd25zdHJlYW0gZG9lc24ndCBoYXZlIGFuIGVxdWl2YWxlbnQgSU9D
VEwgYmVjYXVzZSBpdCAoY3VycmVudGx5KSBkb2VzCj4+IG1hcHBpbmcgYXQgc3VibWl0IHRpbWUs
IGJ1dCB0aGF0IGlzIHN1Ym9wdGltYWwgYmVjYXVzZQo+Pgo+PiAtIGl0IHJlcXVpcmVzIGRvaW5n
IHJlbG9jYXRpb25zIGluIHRoZSBrZXJuZWwgd2hpY2ggaXNuJ3QgcmVxdWlyZWQgZm9yCj4+IFQx
ODYrCj4+IC0gaXQncyBhIGJpZyBwZXJmb3JtYW5jZSBwZW5hbHR5LCBkdWUgdG8gd2hpY2ggdGhl
IGRvd25zdHJlYW0ga2VybmVsIGhhcwo+PiB0aGUgImRlZmVycmVkIGRtYS1idWYgdW5tYXBwaW5n
IiBmZWF0dXJlLCB3aGVyZSB1bm1hcHBpbmcgYSBkbWFfYnVmIG1heQo+PiBub3QgaW1tZWRpYXRl
bHkgdW5tYXAgaXQgaW4gY2FzZSBpdCdzIHVzZWQgbGF0ZXIsIHNvIHRoYXQgdGhlICJtYXBwaW5n
Igo+PiBsYXRlciBpcyBmYXN0ZXIuIEEgZmVhdHVyZSB3aGljaCB3ZSdkIHByZWZlcmFibHkgZ2V0
IHJpZCBvZi4KPj4gLSBiZWNhdXNlIG9mIHRoZSBhYm92ZSBmZWF0dXJlIG5vdCBiZWluZyBjb250
cm9sbGVkIGJ5IHRoZSB1c2VyLCBpdCBjYW4KPj4gY2F1c2UgdmFyaWFuY2UgaW4gc3VibWl0IHRp
bWVzLgo+Pgo+PiBPbiB0aGUgb3RoZXIgaGFuZCwgd2UgY2Fubm90IChhdCBsZWFzdCBhbHdheXMp
IGRvIHRoZSBtYXBwaW5nIGF0Cj4+IGFsbG9jYXRpb24vaW1wb3J0IHRpbWUsIGJlY2F1c2UKPj4K
Pj4gLSBBIHNpbmdsZSBGRCBtYXkgaGF2ZSBtdWx0aXBsZSBjaGFubmVsX2N0eCdzLCBhbmQgYW4g
YWxsb2NhdGlvbi9pbXBvcnQKPj4gbWF5IG5lZWQgdG8gYmUgdXNlZCBpbiBhbnkgc3Vic2V0IG9m
IHRoZW0KPj4gLSBUaGUgaW1wb3J0IElPQ1RMIGlzIGZpeGVkIGFuZCBkb2Vzbid0IGhhdmUgdGhl
IHBhcmFtZXRlcnMgd2UnZCBuZWVkIHRvCj4+IGRvIHRoaXMgYXQgaW1wb3J0IHRpbWUKPj4gLSBP
dmVyYWxsIGl0J3MgbW9yZSBvcnRob2dvbmFsIHRvIGhhdmUgR0VNIG9iamVjdCBhY3F1aXJlbWVu
dCBpbiBvbmUKPj4gc3RlcCBhbmQgbWFwcGluZyBpbiBhbm90aGVyLgo+Pgo+PiBNYXliZSB0aGF0
J3Mgbm90IHF1aXRlIHdoYXQgeW91IGFza2VkLCBidXQgaXQncyBzb21lIGJhY2tncm91bmQgYW55
d2F5IDopCj4gCj4gSSdtIGFza2luZyB0aGlzIHF1ZXN0aW9uIGJlY2F1c2UgcmlnaHQgbm93IHRo
ZXJlIGlzIG9ubHkgb25lIHBvdGVudGlhbAo+IGNsaWVudCBmb3IgdGhpcyBJT0NUTCwgdGhlIFZJ
Qy4gSWYgb3RoZXIgY2xpZW50cyBhcmVuJ3Qgc3VwcG9zZWQgdG8gYmUgYQo+IHBhcnQgb2YgdGhl
IERSTSBkcml2ZXIsIGxpa2UgZm9yIGV4YW1wbGUgTlZERUMgd2hpY2ggcHJvYmFibHkgc2hvdWxk
IGJlCj4gYSBWNEwgZHJpdmVyLCB0aGVuIERSTSBkcml2ZXIgd2lsbCBoYXZlIG9ubHkgYSBzaW5n
bGUgVklDIGFuZCBpbiB0aGlzCj4gY2FzZSB3ZSBzaG91bGRuJ3QgbmVlZCB0aGlzIElPQ1RMIGJl
Y2F1c2UgRFJNIGFuZCBWNEwgc2hvdWxkIHVzZSBnZW5lcmljCj4gZG1hYnVmIEFQSSBmb3IgaW1w
b3J0aW5nIGFuZCBleHBvcnRpbmcgYnVmZmVycy4KClRoaXMgSU9DVEwgaXMgcmVxdWlyZWQgZm9y
IEdSMkQvR1IzRCB0b28sIGFzIHRoZXkgbmVlZCB0byBhY2Nlc3MgbWVtb3J5IAphcyB3ZWxsLiBU
aGlzIGlzIGEgZGlmZmVyZW50IHN0ZXAgZnJvbSBpbXBvcnQvZXhwb3J0IC0tIGZpcnN0IHlvdSBp
bXBvcnQgCm9yIGFsbG9jYXRlIHlvdXIgbWVtb3J5IHNvIHlvdSBoYXZlIGEgR0VNIGhhbmRsZSwg
dGhlbiB5b3UgbWFwIGl0IHRvIHRoZSAKY2hhbm5lbCwgd2hpY2ggZG9lcyB0aGUgSU9NTVUgbWFw
cGluZyAoaWYgdGhlcmUgaXMgYW4gSU9NTVUpLgoKPiAKPiBJJ20gYWxzbyBub3QgcXVpdGUgc3Vy
ZSBhYm91dCB3aGV0aGVyIHRoZSBjdXJyZW50IG1vZGVsIG9mIHRoZSB1bmlmaWVkCj4gVGVncmEg
RFJNIGRyaXZlciBpcyBzdWl0YWJsZSBmb3IgaGF2aW5nIHRoZSBzZXBhcmF0ZWQgZW5naW5lcy4g
UGVyaGFwcwo+IGVhY2ggc2VwYXJhdGVkIGVuZ2luZSBzaG91bGQganVzdCBoYXZlIGl0cyBvd24g
cmVuZGVyaW5nIG5vZGU/Cj4gCgpZZWFoLCBoYXZpbmcgc2VwYXJhdGUgbm9kZXMgcGVyIGVuZ2lu
ZSBtaWdodCBiZSBiZXR0ZXIsIGUuZy4gc28gaXQncyAKZWFzaWVyIHRvIGRvIGFjY2VzcyBjb250
cm9sLiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB0aGF0IHRob3VnaC4KCk1pa2tv
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
