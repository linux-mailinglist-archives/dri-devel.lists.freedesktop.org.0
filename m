Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EC26BD84
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 08:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A649B6E2CA;
	Wed, 16 Sep 2020 06:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Wed, 16 Sep 2020 06:50:13 UTC
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A960C6E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 06:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 8DC4D40F08;
 Wed, 16 Sep 2020 08:44:46 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=DYWMfVOz; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4F2n5yOMRzZJ; Wed, 16 Sep 2020 08:44:45 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 155283F3B8;
 Wed, 16 Sep 2020 08:44:43 +0200 (CEST)
Received: from 9-2DT-694.SSPE.ch.intel.com (unknown [134.134.139.76])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BD097361CDB;
 Wed, 16 Sep 2020 08:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1600238683; bh=QrnN23wuk7OG/EwmraZeZQshzIxm08o/q4TYiG23rPQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DYWMfVOz+Uo6L+PeumPAmhn+gLo6EO1jWkfhIMkdzlfgwU9EZarAy6M2GC4Mp8trA
 nrLBuf34vKle3IVm2yGqALCXWFCpFMdP1VGDHoB6jPNPjWmZtBRpP2SH+QQ279rvIA
 +3ZAzxDMImVqzsyt4y5PGYPiS4cM1JalHRxp9z84=
Subject: Re: some half-baked ttm ideas
To: Dave Airlie <airlied@gmail.com>,
 "Koenig, Christian" <christian.koenig@amd.com>
References: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
 <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
 <CAPM=9tzXsGqnbkUH30vUHd7zyenCNj=ikVjx6P1qWq9dx0jiEg@mail.gmail.com>
 <CAPM=9tySxEnV+1q=hyu4c5tSX35ZJr6TBKwfnUkQZbuw=XkrLA@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <85097575-b713-095d-7c09-9e4d02f5fbda@shipmail.org>
Date: Wed, 16 Sep 2020 08:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tySxEnV+1q=hyu4c5tSX35ZJr6TBKwfnUkQZbuw=XkrLA@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMTYvMjAgNjoyOCBBTSwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gT24gV2VkLCAxNiBTZXAg
MjAyMCBhdCAxNDoxOSwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToKPj4g
T24gV2VkLCAxNiBTZXAgMjAyMCBhdCAwMDoxMiwgQ2hyaXN0aWFuIEvDtm5pZwo+PiA8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gSGkgRGF2ZSwKPj4+Cj4+PiBJ
IHRoaW5rIHdlIHNob3VsZCBqdXN0IGNvbXBsZXRlbHkgbnVrZSB0dG1fdHRfYmluZCgpIGFuZCB0
dG1fdHRfdW5iaW5kKCkKPj4+IGFuZCBhbGwgb2YgdGhhdC4KPj4+Cj4+PiBEcml2ZXJzIGNhbiB0
byB0aGlzIGZyb20gdGhlaXIgbW92ZV9ub3RpZnkoKSBjYWxsYmFjayBub3cgaW5zdGVhZC4KPj4g
R29vZCBwbGFuLCBJJ3ZlIHB1dCBhIGJ1bmNoIG9mIHJld29yayBpbnRvIHRoZSBzYW1lIGJyYW5j
aCwKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL2FpcmxpZWQvbGludXgvY29tbWl0cy90dG0taGFs
Zi1iYWtlZC1pZGVhcwo+Pgo+PiBidXQgSSd2ZSBmcmllZCBteSBicmFpbiBhIGJpdCwgSSdtIGhh
dmluZyB0cm91YmxlIHJlY29uY2lsaW5nIG1vdmUKPj4gbm90aWZ5IGFuZCB1bmJpbmRpbmcgaW4g
dGhlIHJpZ2h0IHBsYWNlcywgSSBmZWVsIGxpa2UgSSdtIGNpcmNsaW5nCj4+IGFyb3VuZCB0aGUg
YW5zd2VyIGJ1dCBoYXZlbid0IGhpdCBpdCB5ZXQuCj4gZHJtL3R0bTogYWRkIHVuYmluZCB0byBt
b3ZlIG5vdGlmeSBwYXRocy4KPgo+IEluIHRoYXQgdHJlZSBpcyBpbmNvcnJlY3QgYW5kIEkgdGhp
bmsgd2hlcmUgdGhpbmdzIGZhbGwgYXBhcnQsIHNpbmNlCj4gaWYgd2UgYXJlIG1vdmluZyBUVE0g
dG8gVlJBTSB0aGF0IHdpbGwgdW5iaW5kIHRoZSBUVE0gb2JqZWN0IGZyb20gdGhlCj4gR1RUIGF0
IG1vdmUgbm90aWZ5IHRpbWUgYmVmb3JlIHRoZSBtb3ZlIGhhcyBleGVjdXRlZC4KPgo+IEknbSBm
ZWVsaW5nIGEgbW92ZV9jb21wbGV0ZV9ub3RpZnkgbWlnaHQgYmUgYW4gaWRlYSwgYnV0IEknbSB3
b25kZXJpbmcKPiBpZiBpdCdzIGEgYmFkIGlkZWEuCj4KPiBEYXZlLgoKSSBkb24ndCBrbm93IGlm
IHRoaXMgY29tcGxpY2F0ZXMgdGhpbmdzIG1vcmUsIGJ1dCBtb3ZlX25vdGlmeSB3YXMgCm9yaWdp
bmFsbHkgb25seSB0aG91Z2h0IHRvIGJlIGFuIGludmFsaWRhdGlvbiBjYWxsYmFjaywgYW5kIHdh
cyBuZXZlciAKaW50ZW5kZWQgdG8gZHJpdmUgYW55IG90aGVyIGFjdGlvbnMgaW4gdGhlIGRyaXZl
ciB0aGFuIHRvIGludmFsaWRhdGUgCnZhcmlvdXMgR1BVIGJpbmRpbmdzLgoKVGhlIGlkZWEgd2Fz
IHRoYXQgVFRNIHNob3VsZCByZWFsbHkgbmV2ZXIgc2V0IHVwIGFueSBHUFUgYmluZGluZ3MsIGJ1
dCAKanVzdCBwcm92aWRlIG1lbW9yeSB3aGVyZSBpdCB3YXMgZ3B1LWJpbmRhYmxlIGFuZCBtYWtl
IHN1cmUgaXQgd2FzIApDUFUtbWFwcGFibGUgd2hlcmUgbmVlZGVkLiBUaGUgImV4Y2VwdGlvbiIg
d2FzIG1hcHBhYmxlIEFHUC10eXBlIApncHUtYmluZGluZ3MsIGZvciB0aGUgc2ltcGxlIHJlYXNv
biB0aGF0IHRoZXkgd2VyZSBuZWVkZWQgdG8gcHJvdmlkZSAKQ1BVLW1hcHBpbmdzIG9uIHN5c3Rl
bXMgd2hlcmUgeW91IGNvdWxkbid0IG1hcCB0aGUgcGFnZXMgZGlyZWN0bHkuIEJ1dCAKc2luY2Ug
d2Ugc2V0IHVwIGEgR1BVIG1hcCBvbiB0aGVzZSBzeXN0ZW1zIGFueXdheSwgbWFueSAobW9zdCkg
ZHJpdmVycyAKanVzdCBtYWRlIHVzZSBvZiB0aGF0LCBidXQgb3RoZXJzIHRvb2sgdGhlIHN0ZXAg
ZnVydGhlciBpbnNpc3Rpbmcgb24gCnVzaW5nIG1vdmVfbm90aWZ5KCkgdG8gc2V0IHVwIEdQVSBi
aW5kaW5ncywgd2hpY2ggd2FzIG5ldmVyIGludGVuZGVkIGFuZCAKYWRkcyBlcnJvciBwYXRocyBp
biB0aGUgVFRNIG1vdmUgY29kZSB0aGF0IGFyZSBwcmV0dHkgaGFyZCB0byBmb2xsb3cuCgpTbyBp
ZiB3ZSdyZSBjaGFuZ2luZyB0aGluZ3MgaGVyZSzCoCBJJ2Qgdm90ZSBmb3IgdGhlIGZvbGxvd2lu
ZzoKCiogRHJpdmVyIGNhbGxzIHR0bV9ib192YWxpZGF0ZSB0byBwdXQgbWVtb3J5IHdoZXJlIGl0
IGlzIGNwdS1tYXBwYWJsZSAKYW5kIGdwdS1iaW5kYWJsZQoqIE9uIHN1Y2Nlc3NmdWwgdmFsaWRh
dGUsIGRyaXZlciBzZXRzIHVwIEdQVSBiaW5kaW5ncyBpdHNlbGYuCgoqIG1vdmVfbm90aWZ5IG9u
bHkgaW52YWxpZGF0ZXMgR1BVIGJpbmRpbmdzIGFuZCBzaG91bGQgcmVhbGx5IHJldHVybiBhIHZv
aWQuCgpTbyB0aGF0IGJpbmQoKSBhbmQgdW5iaW5kKCkgc3R1ZmYgaXMgcmVhbGx5IG9ubHkgbmVl
ZGVkIGZvciBjcHUtbWFwIAp0aHJvdWdoIGFwZXJ0dXJlLiBJZiB3ZSBkaXRjaCB0aGF0LCB0aGVu
IHdlIG5lZWQgdG8gcmUtZGVmaW5lIHRoZSB0YXNrIApvZiBUVE0gdG8gcHJvdmlkZSBtZW1vcnkg
aW4gYSBjcHUtbWFwcGFibGUgbG9jYXRpb24gYW5kIGZpZ3VyZSBob3cgCmRyaXZlcnMgdGhhdCBy
ZXF1aXJlIGNwdS1tYXAtdGhyb3VnaC1hcGVydHVyZSBzaG91bGQgaGFuZGxlIHRoaXMsIHNpbmNl
IAp0aGV5IGNhbid0IHVzZSB0aGUgVFRNIGZhdWx0IGhhbmRsZXIgZm9yIHRoYXQgbWVtb3J5IGFu
eW1vcmUuIFRoZSBzYW1lIApob2xkcyBmb3IgZHJpdmVycyB0aGF0IHdhbnQgdG8gbWFuYWdlIHRo
ZWlyIHRyYW5zbGF0aW9uIHRhYmxlIAp0aGVtc2VsdmVzLCBhbmQgbmVlZHMgc29tZSBjcHUtbWFw
cGluZyBvcGVyYXRpb25zIHRvIGdvIHRocm91Z2ggdGhlIAphcGVydHVyZSByYXRoZXIgdGhhbiB0
byB0aGUgcGFnZXMgZGlyZWN0bHkuCgpJZiB0aGUgZHJpdmVyIGhhcyBubyBzcGVjaWFsIGNwdS1t
YXBwaW5nIHJlcXVpcmVtZW50cywgaXQgc2hvdWxkIGJlIApwZXJmZWN0bHkgbGVnYWwgZm9yIGl0
IHRvIG5vdCBwcm92aWRlIGFueSBiaW5kKCkgb3IgdW5iaW5kKCkgZnVuY3Rpb25hbGl0eS4KCi9U
aG9tYXMKCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
