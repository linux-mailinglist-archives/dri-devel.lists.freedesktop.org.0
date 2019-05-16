Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D560920D51
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA918961D;
	Thu, 16 May 2019 16:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5348961D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:47:53 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id f23so4042954otl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 09:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ALW95PTABUepnoJQIcQfc2/dLEJdpCt57fvV2SdeBCM=;
 b=De2zpMp5St4Y9BxmenJLApvusu2k10wtvMcF6S9BT2dNK7fR0RWN9KcnrZJzWDgJP3
 8U4xEN11b5wrscgxwsMzVaGE42TzFUZfa9a3mjBkn7hK2eMbxkCRs6mdPbvTarcRVUI7
 CZ7P2HlcAm013nJKa+j1H09hj3fLqNfS7kAUuHDPewM/I+pCN/5GHJ+TW3+15qOT7Dxu
 TBoR6U17PTbmhAlh351aPCcjKwT/ykLuTSQcBnWMqnxv7W+A+YWrtVQ+e/8fkWaZdYvr
 pyfRmwZAzQy2I8YfZJqP2nD62KkbsgXdP19PC4d2uXsmSizoToaVWY0vY/FGNSqAGrwL
 WjPg==
X-Gm-Message-State: APjAAAVGX71TW9+1ZnmDDkm0USKM5spH4V8fbRi5H4sZwWXRScMWkYcd
 hyslKOUGT1OqvjsStxDCQ5NooeThUmmunLamPoDjeQ5O
X-Google-Smtp-Source: APXvYqxmrJPhtRqvbVoOHPolkvGyVs3rIrtuOF8rS3XUTINW5MmH84DqRN55r6IB4mYVRqafPWGEYGATj+tEYFtnrL4=
X-Received: by 2002:a9d:7395:: with SMTP id j21mr21747152otk.204.1558025272901; 
 Thu, 16 May 2019 09:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190516080714.14980-1-david1.zhou@amd.com>
 <20190516080714.14980-7-david1.zhou@amd.com>
 <e9b4e467-775f-e3e0-b842-07e4d12cf093@amd.com>
 <212b7506-58cc-fd48-a0cf-4e6098d0d4b1@gmail.com>
 <fef207ec-90e0-5fbe-5743-56c9d5a04e6d@daenzer.net>
 <CAKMK7uEjU2vCuV0WPFKNkQw_mzojWEEax-YSXU_04o3Uf3uvmg@mail.gmail.com>
 <62699155-3011-4112-c45d-71b100296717@daenzer.net>
In-Reply-To: <62699155-3011-4112-c45d-71b100296717@daenzer.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 16 May 2019 18:47:40 +0200
Message-ID: <CAKMK7uG3ksk5T_7E7HuLug9VOEGTB=NgatcycYD92rpJxpaP+g@mail.gmail.com>
Subject: Re: [PATCH libdrm 7/7] add syncobj timeline tests v3
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ALW95PTABUepnoJQIcQfc2/dLEJdpCt57fvV2SdeBCM=;
 b=cd1d14fnmLZkGUODIIuTuC2t9+dhjsP5O1jOrJ3TWw+K1XbTNTblgKgnAsp/0VgA5k
 BVWP7RknQ0I554BHd9l5Ooxzb8WxNnXWC73lbiCFqEbcYXEkVISJEJj7SeKx3/OWnoHT
 7L+mPX1gsMkoKTRlYrcdBzJOgrteoNsC8LyzI=
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
Cc: zhoucm1 <zhoucm1@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgNjozMyBQTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPiBPbiAyMDE5LTA1LTE2IDI6NDcgcC5tLiwgRGFuaWVsIFZldHRl
ciB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDI6NDYgUE0gTWljaGVsIETDpG56
ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4gd3JvdGU6Cj4gPj4gT24gMjAxOS0wNS0xNiAxMjowOSBw
Lm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4+PiBBbSAxNi4wNS4xOSB1bSAxMDoxNiBz
Y2hyaWViIHpob3VjbTE6Cj4gPj4+PiBJIHdhcyBhYmxlIHRvIHB1c2ggY2hhbmdlcyB0byBsaWJk
cm0sIGJ1dCBub3cgc2VlbXMgYWZ0ZXIgbGliZHJtIGlzCj4gPj4+PiBtaWdyYXRlZCB0byBnaXRs
YWIsIEkgY2Fubm90IHlldC4gV2hhdCBzdGVwIGRvIEkgbmVlZCB0byBnZXQgYmFjayBteQo+ID4+
Pj4gcGVybWlzc2lvbj8gSSBhbHJlYWR5IGNhbiBsb2dpbiBpbnRvIGdpdGxhYiB3aXRoIG9sZCBm
cmVlZGVza3RvcCBhY2NvdW50Lgo+ID4+Pj4KPiA+Pj4+IEBDaHJpc3RpYW4sIENhbiB5b3UgaGVs
cCBzdWJtaXQgdGhpcyBwYXRjaCBzZXQgdG8gbGliZHJtIGZpcnN0Pwo+ID4+Pgo+ID4+PiBEb25l
Lgo+ID4+Cj4gPj4gVGhpcyBicm9rZSBhbWRncHUtc3ltYm9sLWNoZWNrOgo+ID4+IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2RybS9waXBlbGluZXMvMzcxNzcKPiA+Pgo+ID4+
Cj4gPj4gSSBwdXNoZWQgdGhlIHRyaXZpYWwgZml4LiBQbGVhc2UgY29uc2lkZXIgdXNpbmcgR2l0
TGFiIE1Scywgc28gdGhhdCB0aGUKPiA+PiBDSSBwaXBlbGluZSBjYW4gY2F0Y2ggaXNzdWVzIGxp
a2UgdGhpcyBiZWZvcmUgdGhleSBjYW4gYnJlYWsgdGhlIG1hc3Rlcgo+ID4+IGJyYW5jaC4KPiA+
Cj4gPiBTaG91bGQgd2Ugc3dpdGNoIGRvY3MgdG8gcmVjb21tZW5kIE1SPyBNYWtlIGl0IHRoZSBk
ZWZhdWx0PyBJIGd1ZXNzCj4gPiBtZXNhIGhhc24ndCBtYWRlIHRoZW0gbWFuZGF0b3J5IHlldCwg
c28gZG9pbmcgdGhhdCBmb3IgbGliZHJtIGlzIGEgYml0Cj4gPiBqdW1waW5nIGFocmVhZCAuLi4K
Pgo+IFdoeSBjYW4ndCBsaWJkcm0gZ28gZmlyc3Q/Cj4KPiBXaXRoIE1lc2EsIGl0IHRvb2sgc29t
ZSBlZmZvcnQgdG8gZ2V0IHRoZSBDSSBwaXBlbGluZSB0byBmaW5pc2ggaW4gYW4KPiBhY2NlcHRh
YmxlIGFtb3VudCBvZiB0aW1lLCBidXQgdGhhdCBkb2Vzbid0IHNlZW0gdG8gYmUgYW4gaXNzdWUg
d2l0aAo+IGxpYmRybSAodGhvdWdoIGl0IGNvdWxkIHByb2JhYmx5IHN0aWxsIGJlIHNwZWQgdXAg
c29tZXdoYXQsIGUuZy4gYnkKPiB1c2luZyBwcmUtZ2VuZXJhdGVkIGRvY2tlciBpbWFnZXMgYXMg
aW4gb3RoZXIgcHJvamVjdHMsIG9yIGp1c3QgYnkKPiBwYXNzaW5nIC1qNCB0byBtYWtlKS4KCnRi
aCBJJ20gYWxsIGZvciBkb2luZyB0aGF0LCBqdXN0IGRpZG4ndCB3YW50IHRvIG1peCB0aGluZ3Mg
dXAgdG9vIG11Y2gKOi0pIEFuZCB5ZWFoIGxpYmRybSBpcyBzbWFsbCBlbm91Z2ggdGhhdCBhIHF1
aWNrIE1SLW9ubHkgZXhwZXJpbWVudAp3b250IHVwc2V0IGFueW9uZSBpZiBpdCBzb21laG93IGdv
ZXMgd3JvbmcuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
