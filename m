Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3819022A911
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 08:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452B46E348;
	Thu, 23 Jul 2020 06:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA976E348
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 06:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 0814C3F5FC;
 Thu, 23 Jul 2020 08:41:37 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Yx6OW7KZ; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2hraWCsboHS; Thu, 23 Jul 2020 08:41:36 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 226E03F4D0;
 Thu, 23 Jul 2020 08:41:33 +0200 (CEST)
Received: from [192.168.0.100] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 29C65362641;
 Thu, 23 Jul 2020 08:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1595486493; bh=2diqXPmDzRhkYJdpAdH783HDEf7zpkoCgbYlnenCgRU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Yx6OW7KZTqr0Ixj6XPgJsUpGXXBm0ptWXAMkN6MzXPxeP7Bj6GzwYw2sIMvmEiI3F
 GWAsW5d95aavLRu2ZZ4quUjW5cpIosYmo3uj3XCIQznn2Szk26HsqQDfrhA537/caq
 BMp03WXUB1+dhbGbFxx5cfdHIn7vp5sa+ku+AgJc=
Subject: Re: pages pinned for BO lifetime and security
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
References: <CAPaKu7S2BjymZN1pPnYz-YAXpHsD8Q_EPxttifhoTBc-Qe52dg@mail.gmail.com>
 <CAAfnVB=9o=xy13Z1ErgXVhcBf24TLQMGJHnfDKoSMSw2MZdg2A@mail.gmail.com>
 <ed03508d-c87d-681e-4c24-c5c8e26ed72a@amd.com>
 <CAKMK7uHWM59iMx=MA+4sTxw-8-3qwc_ajw297vPKH+NL7yUBrg@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <60f2b8a5-7f57-766a-cdf3-31068d7ae52d@shipmail.org>
Date: Thu, 23 Jul 2020 08:41:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHWM59iMx=MA+4sTxw-8-3qwc_ajw297vPKH+NL7yUBrg@mail.gmail.com>
Content-Language: en-US
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
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMjAtMDctMjIgMDk6NDYsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MjIsIDIwMjAgYXQgOToxOSBBTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4gd3JvdGU6Cj4+IEFtIDIyLjA3LjIwIHVtIDAyOjIyIHNjaHJpZWIgR3VyY2hldGFu
IFNpbmdoOgo+Pj4gT2YgdGhlIGRlc2t0b3AgR1BVIGRyaXZlcnMsIGk5MTUncyBzaHJpbmtlciBj
ZXJ0YWlubHkgc3VwcG9ydHMgcHVyZ2luZwo+Pj4gdG8gc3dhcC4gIFRUTSBpcyBhIGJpdCBoYXJk
IHRvIGZvbGxvdy4gIEkgY2FuJ3QgcmVhbGx5IHRlbGwgaWYgYW1kZ3B1Cj4+PiBvciBub3V2ZWF1
IHN1cHBvcnRzIHRoYXQuICB2aXJ0aW8tZ3B1IGlzIG1vcmUgY29tbW9ubHkgZm91bmQgb24KPj4+
IHN5c3RlbXMgd2l0aCBzd2FwcyBzbyBJIHRoaW5rIGl0IHNob3VsZCBmb2xsb3cgdGhlIGRlc2t0
b3AgcHJhY3RpY2VzPwo+Pgo+PiBXaGF0IHdlIGRvIGF0IGxlYXN0IGluIHRoZSBhbWRncHUsIHJh
ZGVvbiwgaTkxNSBhbmQgbm91dmVhdSBpcyB0byBvbmx5IGFsbG93IGl0IGZvciBzY2Fub3V0IGFu
ZCB0aGF0IGluIHR1cm4gaXMgbGltaXRlZCBieSB0aGUgcGh5c2ljYWwgbnVtYmVyIG9mIENSVENz
IG9uIHRoZSBib2FyZC4KPiBTb21ld2hhdCBhc2lkZSwgYnV0IEknbSBub3Qgc3VyZSB0aGUgdHRt
IHNocmlua2VyIHJlYWxseSB3b3JrcyBsaWtlCj4gdGhhdC4gSSB0aGluayB0aGVyZSdzIHR3byBw
YXJ0czoKPiAxLiBrZXJuZWwgdGhyZWFkIHdoaWNoIHRha2VzIGJ1ZmZlcnMgYW5kIHVuYmluZHMg
dGhlbSB3aGVuIHdlJ3JlIG92ZXIKPiB0aGUgdHRtIGdsb2JhbCBsaW1pdC4gVGhpcyBpcyB0aGUg
dHRtX3Nocmlua193b3JrIHN0dWZmLCBhbmQgaXQgb25seQo+IHNocmlua3MgaWYgdGhlIHpvbmUg
aXMgb3ZlciBhIGhhcmQgbGltaXQuIEJlbG93IHRoYXQgaXQganVzdCBsZWF2ZXMKPiBidWZmZXJz
IHBpbm5lZC4KPgo+IDIuIEFjdHVhbCBjb3JlIG1tIHNocmlua2VyLCB3aGljaCByZWxlYXNlcyBi
dWZmZXJzIGhlbGQgaW4gY2FjaGUgYnkKPiB0dG1fcGFnZV9hbGxvY19kbWEuYy4gQnV0IHRoYXQg
b25seSBoYXBwZW5zIHdoZW4gYnVmZmVycyBoYXZlIGJlZW4KPiB1bmJvdW5kIGJ5IHRoZSBmaXJz
dCB0aHJlYWQsIHNvIGFueXRoaW5nIGJlbG93IHRob3NlIGhhcmQgbGltaXRzIGlzCj4gbm90IHNo
cmlua2FibGUuIEFuZCBpaXJjIHRob3NlIGhhcmQgbGltaXRzIGFyZSBsaWtlIGhhbGYgb2Ygc3lz
dGVtCj4gbWVtb3J5IG9yIHNvIChsYXN0IHRpbWUgSSBsb29rZWQgdGhyb3VnaCB0aGlzIHN0dWZm
IGF0IGxlYXN0KS4KPgo+IE5vIGlkZWEgd2h5IGV4YWN0bHkgdGhpbmdzIGFyZSBsaWtlIHRoZXkg
YXJlLCBzaW5jZSB0aGUgZmlyc3QgdGhyZWFkCj4gYWxyZWFkeSBkb2VzIGEgZG1hX3Jlc3ZfdHJ5
bG9jaywgYW5kIHRoYXQncyBlbm91Z2ggdG8gYXZvaWQgbG9ja2luZwo+IGludmVyc2lvbnMgd2hl
biBiZWluZyBjYWxsZWQgZnJvbSAyLiBPciB3ZWxsLCBzaG91bGQgYmUgYXQgbGVhc3QsIGZvcgo+
IHJlYXNvbmFibGUgZHJpdmVyIGRlc2lnbi4KPgo+IFRoZSBvbmx5IG90aGVyIHRoaW5nIEknbSBz
ZWVpbmcgaXMgdGhlIGdsb2JhbCBscnUsIGJ1dCB0aGF0IGNvdWxkIGJlCj4gZml4ZWQgYnkgaGF2
aW5nIGEgcGVyLWRldmljZSBjb3JlIG1tIHNocmlua2VyIGluc3RhbmNlIHdoaWNoIGRpcmVjdGx5
Cj4gc2hyaW5rcyB0aGUgcGVyLWRldmljZSBscnUuIEFuZCB0aGVuIHdlIGp1c3QgZ2xvYmFsbHkg
YmFsYW5jZSBsaWtlCj4gd2l0aCBhbGwgc2hyaW5rZXJzIHRocm91Z2ggdGhlIGNvcmUgbW0gInNo
cmluayBldmVyeW9uZSBlcXVhbGx5Igo+IGFwcHJvYWNoLiBZb3UgY2FuIGV2ZW4ga2VlcCB0aGUg
c2VwYXJhdGUgcGFnZSBhbGxvYyBzaHJpbmtlciwgc2luY2UKPiBjb3JlIG1tIGFsd2F5cyBsb29w
cyBvdmVyIGFsbCBzaHJpbmtlcnMgLSB3ZSdyZSBub3QgdGhlIG9ubHkgb25lcwo+IHdoZXJlIHNo
cmlua2luZyBvbmUgY2FjaGUgbWFrZXMgbW9yZSBtZW1vcnkgYXZhaWxhYmxlIGZvciBhbm90aGVy
Cj4gY2FjaGUgdG8gc2hyaW5rLCBlLmcuIHlvdSBjYW4ndCB0aHJvdyBvdXQgYW4gaW5vZGUgd2l0
aG91dCBmaXJzdAo+IHRocm93aW5nIG91dCBhbGwgdGhlIGRlbnRyeSBwb2ludGluZyBhdCB0aGVt
Lgo+Cj4gQW5vdGhlciBwcm9ibGVtIHdvdWxkIGJlIGFsbG9jYXRpbmcgbWVtb3J5IHdoaWxlIGhv
bGRpbmcgcGVyLWRldmljZQo+IGxydSBsb2NrcyAoc2luY2UgdHJ5bG9jayBvbiBzdWNoIGEgZ2xv
YmFsIGxvY2sgaW4gc2hyaW5rZXJzIGlzIGEKPiByZWFsbHkgYmFkIGlkZWEsIHdlIGtub3cgdGhh
dCBmcm9tIGFsbCB0aGUgZGV2LT5zdHJ1Y3RfbXV0ZXggbG9seiBpbgo+IGk5MTUpLiBCdXQgZm9y
IHR0bSB0aGF0J3Mgbm90IGEgcHJvYmxlbSBzaW5jZSBhbGwgbHJ1IGFyZSBzcGlubG9jaywgc28K
PiBvbmx5IEdGUF9BVE9NSUMgYWxsb3dlZCBhbnl3YXksIGhlbmNlIG5vIHByb2JsZW0uCj4KPiBB
ZGRpbmcgVGhvbWFzIGZvciB0aGlzIHR0bSB0YW5nZW50Lgo+IC1EYW5pZWwKCkhtbSwgc28geWVz
IHRoZSBUVE0gYXZvaWRhbmNlIG9mICdET1MgYnkgcGlubmluZycgbWVjaGFuaXNtIGlzIG5vdCAK
cmVhbGx5IG9wdGltYWwgYnV0IG5vYm9keSBoYXMgcmVhbGx5IGNhcmVkIHRvIGltcHJvdmUgaXQg
eWV0LgoKVFRNIGFsbG93cyBhIGNlcnRhaW4gYW1vdW50IG9mIG1lbW9yeSB0byBiZSBwaW5uZWQg
YWNyb3NzIGFsbCBUVE0gCmRyaXZlcnMgaW4gYSBzeXN0ZW0uIFRoYXQgc2hvdWxkIGluY2x1ZGUg
a21hbGxvY2VkIG1lbW9yeSBmb3IgZ3JhcGhpY3MgCm9iamVjdHMsIGludGVuZGVkIGF0IHRoYXQg
dGltZSB0byBzdG9wIGF0dGFja3MgbGlrZSBndWVzc2luZyBhIGdlbSBuYW1lIAphbmQgY2FsbGlu
ZyBnZW0gb3BlbiByZXBlYXRlZGx5IHRvIHBpbiBhbGwgYXZhaWxhYmxlIGttYWxsb2MgbWVtb3J5
LiAKQnVmZmVyIG9iamVjdCBwYWdlcyBhcmUgYWxzbyB0eXBpY2FsbHkgY29uc2lkZXJlZCAicGlu
bmVkLCBidXQgCnVucGlubmFibGUiIGJ5IHRoaXMgYWNjb3VudGluZy4gV2hlbiB0aGUgaGFyZCBs
aW1pdCBpcyByZWFjaGVkLCB0aGVyZSBpcyAKYSBkaXJlY3QgcmVjbGFpbSBieSB1bmJpbmRpbmcg
dW5waW5uYWJsZSBwYWdlcyBmcm9tIGdyYXBoaWNzLCBhbmQgCmNvcHlpbmcgdGhlIGNvbnRlbnRz
IHRvIHNobWVtLCBvbiB3aGljaCB0aGUgc2hyaW5rZXJzIHRoZW4gbWF5IG9wZXJhdGUuIApUaGVy
ZSBpcyBhbHNvIGEgbG93ZXIgc29mdCBsaW1pdCBhYm92ZSB3aGljaCBhIHNlcGFyYXRlIGtlcm5l
bCB0aHJlYWQgCmNvcGllcyBtZW1vcnkgdG8gc2htZW0uIFRoZXNlIGxpbWl0cyBhcmUgcnVuLXRp
bWUgY29uZmlndXJhYmxlLgoKVGhlcmUgYXJlIGFsc28gYSBjb3VwbGUgb2YgcGFnZSBwb29scyB0
aGF0IHdlcmUgYWRkZWQgdG8gVFRNIHRvIGNhY2hlIAp1bnVzZWQgZGV2aWNlLWNvaGVyZW50IHBh
Z2VzIGFuZCB1bmNhY2hlZCAvIHdyaXRlLWNvbWJpbmVkIHBhZ2VzLiBTaW5jZSAKYWxsb2NhdGlu
ZyBzdWNoIG1lbW9yeSBtYXkgYmUgcGFpbmZ1bGx5IHNsb3cuIFRoZXNlIHBhZ2UgcG9vbHMgaGF2
ZSAKdGhlaXIgb3duIHNocmlua2Vycy4KCi9UaG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
