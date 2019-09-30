Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A9C2390
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B168B6E462;
	Mon, 30 Sep 2019 14:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361246E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 12:48:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UClwFS118509;
 Mon, 30 Sep 2019 07:47:58 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UClwFc108236
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 07:47:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 07:47:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 07:47:58 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UClrff044162;
 Mon, 30 Sep 2019 07:47:55 -0500
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to
 dts
To: Adam Ford <aford173@gmail.com>
References: <20190510194229.20628-1-aford173@gmail.com>
 <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
 <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
 <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com>
 <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com>
 <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com>
 <CAHCN7xLKL42ib4t0Lte3sJPoJrKX0TPJR9VWi+uW=fZjUg1ssg@mail.gmail.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <c816d70d-fa5b-a43f-ae7a-6df4589fe484@ti.com>
Date: Mon, 30 Sep 2019 15:47:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLKL42ib4t0Lte3sJPoJrKX0TPJR9VWi+uW=fZjUg1ssg@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 30 Sep 2019 14:43:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569847678;
 bh=MU2IxupzjQxFjETdLI0C8t3D/A7a75NCIfAIo/YLC3A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=d6t4GmHOHUZhaLi1mgBh5+2uyMRrj9wMIVt4h4QtMin8NiBOL5wVoM600314q9VIk
 R0Yb2k6rIK8uzNNMQa++8MnWRq0UEWEY6qciw6IYlkB5iR4KQFYolhpNZrHk4RvTRi
 rXiO03k0BfW1/NQ2PqOs6TstF3fnHNFChDNQNVh4=
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
Cc: devicetree <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Adam Ford <adam.ford@logicpd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDkvMjAxOSAxNTo0MSwgQWRhbSBGb3JkIHdyb3RlOgo+IE9uIE1vbiwgU2VwIDMwLCAy
MDE5IGF0IDM6NTMgQU0gVGVybyBLcmlzdG8gPHQta3Jpc3RvQHRpLmNvbT4gd3JvdGU6Cj4+Cj4+
IE9uIDMwLzA5LzIwMTkgMDk6NDUsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+Pj4gSGksCj4+Pgo+
Pj4gT24gMjcvMDkvMjAxOSAxODo0NywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+Pj4gT24gMjcv
MDkvMjAxOSAxODozNywgVGVybyBLcmlzdG8gd3JvdGU6Cj4+Pj4KPj4+Pj4gSWYgeW91IGNhbiBw
cm92aWRlIGRldGFpbHMgYWJvdXQgd2hhdCBjbG9jayBmcmFtZXdvcmsgLyBkcml2ZXIgZG9lcwo+
Pj4+PiB3cm9uZyAoc2FtcGxlIGNsa19zZXRfeHl6IGNhbGwgc2VxdWVuY2UsIGV4cGVjdGVkIHJl
c3VsdHMgdmlhCj4+Pj4+IGNsa19nZXRfeHl6LCBhbmQgd2hhdCBmYWlscyksIEkgY2FuIHRha2Ug
YSBsb29rIGF0IGl0LiBKdXN0IHJlcG9ydGluZwo+Pj4+PiBhcmJpdHJhcnkgZGlzcGxheSBkcml2
ZXIgaXNzdWVzIEkgd29uJ3QgYmUgYWJsZSB0byBkZWJ1ZyBhdCBhbGwgKEkKPj4+Pj4gZG9uJ3Qg
aGF2ZSBhY2Nlc3MgdG8gYW55IG9mIHRoZSBkaXNwbGF5cywgbm9yIGRvIEkgd2FudCB0byB3YXN0
ZSB0aW1lCj4+Pj4+IGRlYnVnZ2luZyB0aGVtIHdpdGhvdXQgYWJzb2x1dGVseSBubyBrbm93bGVk
Z2Ugd2hhdHNvZXZlci4pCj4+Pj4KPj4+PiBJIHVzZWQgeW91ciBoYWNrIHBhdGNoZXMgdG8gYWxs
b3cgY2hhbmdpbmcgcmF0ZXMgdmlhIGRlYnVnZnMuIEFuZCBzZXQKPj4+PiBkc3MxX2Fsd29uX2Zj
a18zNDMwZXMyIHRvIDI3MDAwMDAwIG9yIDI3ODcwOTY3LiBUaGUgZW5kIHJlc3VsdCB3YXMKPj4+
PiB0aGF0IERTUyBnZXRzIHNvbWUgdmVyeSBoaWdoIGNsb2NrIGZyb20gZHNzMV9hbHdvbl9mY2tf
MzQzMGVzMiwgYXMgdGhlCj4+Pj4gZnJhbWUgcmF0ZSBqdW1wcyB0byBtYW55IGh1bmRyZWRzIGZw
cy4KPj4+Pgo+Pj4+IFNvLCB0aGVzZSBudW1iZXJzIGFyZSBub3QgcmVhbCwgYnV0IHRvIGdpdmUg
dGhlIGlkZWEgd2hhdCBJIHNhdy4KPj4+PiBSdW5uaW5nIGZpcnN0IHdpdGggNTAgTUh6LCBJIGNh
biBzZWUsIHNheSwgNDAgZnBzLiBUaGVuIEkgc2V0IHRoZQo+Pj4+IGNsb2NrIHRvIDMwIE1Ieiwg
YW5kIGZwcyBkcm9wcGVkIHRvLCBzYXksIDMwZnBzLCBhcyBleHBlY3RlZCB3aXRoCj4+Pj4gbG93
ZXIgY2xvY2suIFRoZW4gSSBzZXQgdGhlIGNsb2NrIHRvIDI3TUh6IChvciB0aGUgb3RoZXIgb25l
KSwKPj4+PiBleHBlY3RpbmcgYSBiaXQgbG93ZXIgZnBzLCBidXQgaW5zdGVhZCBJIHNhdyBodW5k
cmVkcyBvZiBmcHMuCj4+Pj4KPj4+PiBJIGRvbid0IGtub3cgaWYgdGhlcmUncyBhbnkgb3RoZXIg
d2F5IHRvIG9ic2VydmUgdGhlIHdyb25nIGNsb2NrIHJhdGUKPj4+PiBidXQgaGF2ZSB0aGUgZHNz
IGVuYWJsZWQgYW5kIHJ1bm5pbmcga21zdGVzdCBvciBzaW1pbGFyLiBJIGNhbiBoZWxwCj4+Pj4g
eW91IHNldCB0aGF0IHVwIG5leHQgd2Vlaywgc2hvdWxkIGJlIHRyaXZpYWwuIFlvdSBkb24ndCBu
ZWVkIGEgZGlzcGxheQo+Pj4+IGZvciB0aGF0Lgo+Pj4KPj4+IEhlcmUncyBob3cgdG8gcmVwcm9k
dWNlLiBJIGhhdmUgdGhlIGF0dGFjaGVkIHBhdGNoZXMuIFRocmVlIG9mIHRoZW0gYXJlCj4+PiB0
aGUgY2xrLWRlYnVnIG9uZXMsIGFuZCBvbmUgb2YgbWluZSB0byBtYWtlIGl0IGVhc3kgdG8gdGVz
dCB3aXRob3V0IGEKPj4+IGRpc3BsYXksIGFuZCB3aXRob3V0IHVuZGVyZmxvdyBmbG9vZCBoYWx0
aW5nIHRoZSBkZXZpY2UuIFRoZXJlIGFyZSBvbgo+Pj4gdG9wIG9mIHY1LjMuIEtlcm5lbCBjb25m
aWcgYWxzbyBhdHRhY2hlZC4KPj4+Cj4+PiBrbXN0ZXN0IGlzIGZyb20ga21zKysgcHJvamVjdCAo
aHR0cHM6Ly9naXRodWIuY29tL3RvbWJhL2ttc3h4KS4gSXQKPj4+IHNob3VsZCBiZSBzdHJhaWdo
dGZvcndhcmQgdG8gY29tcGlsZSwgYnV0IGttc3Rlc3QgYmluYXJ5IGlzIGFsc28KPj4+IGluY2x1
ZGVkIGluIFRJJ3Mgcm9vdGZzLgo+Pgo+PiBPaywgSSBpZ25vcmVkIGFsbCB5b3VyIHRlc3QgY29k
ZSBhbmQganVzdCBmaWRkbGVkIHdpdGggbXkgdHJ1c3R5IGNsawo+PiBkZWJ1Z2ZzIHBhdGNoZXMu
IEkgZG9uJ3QgbGlrZSBkZWJ1Z2dpbmcgd2l0aCB0ZXN0IGNvZGUgSSBoYXZlIG5vCj4+IGV4cGVy
aWVuY2Ugd2l0aC4gOikKPj4KPj4gQW55d2F5cywgaXQgc2VlbXMgdGhlIGRwbGw0X200X2NrIG1h
eCBkaXZpZGVyIHZhbHVlIGlzIHdyb25nLCBpdCBvbmx5Cj4+IGFjY2VwdHMgdmFsdWVzIHVwdG8g
MTYgYXQgbGVhc3Qgb24gbXkgYm9hcmQuIFRoZSBzZXR0aW5nIGZvciB0aGlzIGluIERUCj4+IGlz
IDMyLCBhbmQgaXQgaXMgbW9zdCBsaWtlbHkgU29DIHNwZWNpZmljIHdoYXQgaGFwcGVucyBpZiB5
b3Ugd3JpdGUgYW4KPj4gaW52YWxpZCB2YWx1ZSB0byB0aGUgZGl2aWRlci4KPj4KPj4gVGhlIGJl
c3QgYWN0aW9uIGhlcmUgaXMgcHJvYmFibHkgdG8gZHJvcCB0aGUgbWF4LWRpdiB2YWx1ZSBmb3Ig
dGhpcwo+PiBjbG9jayB0byAxNi4gQ2FuIHNvbWVvbmUgY2hlY2sgdGhpcyB3aXRoIHRoZWlyIGRp
c3BsYXkgc2V0dXAgYW5kIHNlZQo+PiB3aGF0IGhhcHBlbnM/IEF0dGFjaGVkIHBhdGNoIHNob3Vs
ZCBkbyB0aGUgdHJpY2suCj4gCj4gSSB0cmllZCB5b3VyIGF0dGFjaGVkIHBhdGNoIG9uIG15IGRt
MzczMCBhbmQgdGhhdCBzZWVtcyB0byBtYWtlIGl0Cj4gc29tZXdoYXQgYmV0dGVyIGluIHRoYXQg
aXQgZG9lc24ndCBoYW5nIGFueW1vcmUsIHNvIHRoYXQgbGVhZHMgbWUgdG8KPiBiZWxpZXZlIHRo
YXQgeW91ciBjb21tZW50IGFib3V0IHRoZSBkaXZpZGVyIGJlaW5nIG9ubHkgdmFsaWQgb24gdGhl
Cj4gb21hcDM2IG1heSBub3QgYmUgdHJ1ZS4gSSBkbyB0aGluayBpdCBzb2x2ZXMgdGhlIGhhbmdp
bmcgaXNzdWUgdGhhdCBpCj4gd2FzIHNlZWluZywgYnV0IEkgbm93IHNlZSBhIG5ldyBvbmUgbm93
IHdoaWNoIGlzIGR1bXBpbmcgYSBiYWNrdHJhY2UuCj4gCj4gSXQgbG9va3MgbGlrZSBpdCdzIHVu
aGFwcHkgdGhhdCBpdHMgdHJ5aW5nIHRvIGdldCBvbmUgZnJlcXVlbmN5IGFuZAo+IGdldHRpbmcg
c29tZXRoaW5nIGRpZmZlcmVudCBpbnN0ZWFkLgo+IAo+IFsgICAxMC4wMTQwOTldIFdBUk5JTkc6
IENQVTogMCBQSUQ6IDExMSBhdAo+IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc3MuYzo2
NTUgZHNzX3NldF9mY2tfcmF0ZSsweDcwLzB4OTAKPiBbb21hcGRzc10KPiBbICAgMTAuMDE0MTI5
XSBjbGsgcmF0ZSBtaXNtYXRjaDogMjc4NzA5NjggIT0gMjcwMDAwMDAKCkkgYmVsaWV2ZSB0aGlz
IG9uZSBpcyBmb3IgVG9taSB0byBjb21tZW50LCBoaXMgZHJpdmVyIGRvZXMgc29tZSBtYWdpYyAK
Y29tcGFyZXMgZm9yIHRoZSByZXF1ZXN0ZWQgdnMuIGFjdHVhbCByZWNlaXZlZCBjbG9jayByYXRl
cy4gSWYgSSBhbSBub3QgCm1pc3Rha2VuLCB3ZSBhcmUgb25seSBtb2RpZnlpbmcgYW4gaW50ZWdl
ciBkaXZpZGVyIGhlcmUsIGFuZCB0aHVzIGl0IGlzIApwaHlzaWNhbGx5IGltcG9zc2libGUgdG8g
Z2V0IGFjY3VyYXRlIDI3TUh6IHJhdGUgdG8gZGlzcGxheS4KCi1UZXJvCgo+IAo+IFNlZSBhdHRh
Y2hlZCBsb2cgZm9yIHRoZSBmdWxsIGR1bXAuCj4gCj4gRWl0aGVyIHdheSwgSSB0aGluayB5b3Un
dmUgaWRlbnRpZmllZCB0aGUgbWFpbiBpc3N1ZS4gIEkganVzdCB0aGluayB3ZQo+IG1heSBoYXZl
IHVuY292ZXJlZCBhbm90aGVyIG9uZSBpbiB0aGUgcHJvY2Vzcy4KPiAKPiBGb3Igd2hhdCBpdCdz
IHdvcnRoLCB0aGUgdmlkZW8gbG9va3MgZ29vZC4gIDotKQo+IAo+IGFkYW0KPj4KPj4gLVRlcm8K
Pj4KPj4gLS0KCi0tClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUg
MjIsIDAwMTgwIEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3Rp
cGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
