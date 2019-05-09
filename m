Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD6185FD
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD9B89A98;
	Thu,  9 May 2019 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E96C89257
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 03:00:33 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id n19so503515pfa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2019 20:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R6mFOl4YJArdXkPl64BdobxdiCxDb1GQAsEcDCxAI1c=;
 b=fLK6lLMSWw6mnf39ehjtDOhx3fXH2g9y6o5YfjhV2ozyQGtqAHfXohJAcnSo6ZJWpj
 9ptUpcCUnUzex0McdxpdW2klBhOjssl81wcj2k+AoMNQwxWa+S2lrFzHhaSBzUmCrW8I
 FzHoSPO/tq5YEFYIK7hW5m2T+aswWW/QnLqwxAjxg/bI2K9STGCepmIfeaig5m5JwZxN
 XhY8szBC4TGOkYoRNMg2sz9IzDUBgG0spBW1hBbkSFxv47NfZMrKRTFoJvvx2W3hltHs
 HWEFj+9guJWeyWCu05ZUERyXeqJhr+hxpLEPx0lQTEm3yRuBUQnpdhiqBnOa+gHQpkp5
 prZA==
X-Gm-Message-State: APjAAAXImp8nH5RC6I01Nh8sfT54RHLEi9SnZyym2lAgoBBXA6jVfGt1
 svA9GyvPTVziU7nrTYeOxi25Dw==
X-Google-Smtp-Source: APXvYqxgN704DpczLbGfx053xEiv41Nt6oO0nbwl2oNJfPJaAeEeqFFzx6MkSY1scvkrrW5nHXsfWA==
X-Received: by 2002:a63:5659:: with SMTP id g25mr2416023pgm.59.1557370833308; 
 Wed, 08 May 2019 20:00:33 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id o5sm901426pfa.135.2019.05.08.20.00.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 20:00:31 -0700 (PDT)
Date: Wed, 8 May 2019 20:00:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
Message-ID: <20190509030047.GE2085@tuxbook-pro>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro>
 <20190509021616.GA26228@basecamp>
 <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R6mFOl4YJArdXkPl64BdobxdiCxDb1GQAsEcDCxAI1c=;
 b=AfK/Uume2oPASwykEbs/t9IMEMyllPOQopDa9fMIYaD+zAfbeCEUFdQuIappnyEn3z
 dXioYDA9KBXc/pOKOAihi0asuc6L5//SlvzGt4LgklZGtohHhIVNx3Fst2PBNV2u3PTj
 PiUEOpLgZNU8Jggtcbvz1aU0YT/6i8SvYYCA1qUjdlF3Ol/dGwMiw14DGpN5f5vw2ZkJ
 1x/5fvkiDw01ozcsLF/oUJy+2+wue9QV5IIjfdiorrI2SfwTjCWItRF/gla27XbLQFuS
 kMSmjYCnOW8T8itm7LgazU11YQiaDQY2lN50WFLZ8I6Mh/r01WIW/ChsfNTLzuX6T0Oh
 yeLw==
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkIDA4IE1heSAxOToyNSBQRFQgMjAxOSwgUm9iIENsYXJrIHdyb3RlOgoKPiBPbiBXZWQs
IE1heSA4LCAyMDE5IGF0IDc6MTYgUE0gQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5v
cmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDExOjM5OjAyUE0gLTA3
MDAsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToKPiA+ID4gT24gU3VuIDA1IE1heSAwNjowNCBQRFQg
MjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3
NC5kdHNpCj4gPiA+IFsuLl0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPCZtbWNjIE1EU1NfTURQX0NMSz4sCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmbW1jYyBNRFNTX0FIQl9DTEs+LAo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8Jm1tY2MgTURTU19BWElfQ0xLPiwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZtbWNjIE1EU1NfQllURTBfQ0xL
PiwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZtbWNjIE1E
U1NfUENMSzBfQ0xLPiwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPCZtbWNjIE1EU1NfRVNDMF9DTEs+LAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8Jm1tY2MgTU1TU19NSVNDX0FIQl9DTEs+Owo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJtZHBfY29yZSIsCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImlmYWNlIiwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYnVzIiwKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYnl0ZSIsCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInBpeGVsIiwKPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29yZSIsCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNvcmVfbW1zcyI7
Cj4gPiA+Cj4gPiA+IFVubGVzcyBJIGVuYWJsZSBNTVNTX01NU1NOT0NfQVhJX0NMSyBhbmQgTU1T
U19TMF9BWElfQ0xLIEkgZ2V0IHNvbWUKPiA+ID4gdW5kZXJydW4gZXJyb3IgZnJvbSBEU0kuIFlv
dSBkb24ndCBzZWUgYW55dGhpbmcgbGlrZSB0aGlzPwo+ID4gPgo+ID4gPiAoVGhlc2UgY2xvY2tz
IGFyZSBjb250cm9sbGVkIGJ5IG1zbV9idXMgZG93bnN0cmVhbSBhbmQgc2hvdWxkIGJlIGRyaXZl
bgo+ID4gPiBieSBpbnRlcmNvbm5lY3QgdXBzdHJlYW0pCj4gPiA+Cj4gPiA+Cj4gPiA+IEFwYXJ0
IGZyb20gdGhpcywgSSB0aGluayB0aGlzIGxvb2tzIG5pY2UuIEhhcHB5IHRvIHNlZSB0aGUgcHJv
Z3Jlc3MuCj4gPgo+ID4gTm8sIEknbSBub3Qgc2VlaW5nIGFuIHVuZGVycnVuIGVycm9ycyBmcm9t
IHRoZSBEU0kuIEkgdGhpbmsgdGhlIGNsb2Nrcwo+ID4gYXJlIGZpbmUgc2luY2UgSSdtIGFibGUg
dG8gZ2V0IHRoaXMgd29ya2luZyB3aXRoIDQuMTcgdXNpbmcgdGhlc2Ugc2FtZQo+ID4gY2xvY2tz
LiBJIGp1c3Qgc2VudCBvdXQgdjIgYW5kIHRoZSBjb3ZlciBsZXR0ZXIgaGFzIHNvbWUgZGV0YWls
cywgYWxvbmcKPiA+IHdpdGggdGhlIGZ1bGwgZG1lc2cuCj4gCj4gc2luY2Ugd2UgZG9uJ3QgaGF2
ZSBpbnRlcmNvbm5lY3QgZHJpdmVyIGZvciA4OTc0LCBJIGd1ZXNzIHRoZXJlIGlzCj4gc29tZSBj
aGFuY2UgdGhhdCB0aGluZ3Mgd29yayBvciBub3QgYmFzZWQgb24gaG93IGxrIGxlYXZlcyB0aGlu
Z3M/Cj4gCgpSaWdodCwgSSBndWVzcyB0aGUgYm9vdGxvYWRlciBvbiBteSBkZXZpY2UgZG9lcyBu
b3QgbGVhdmUgdGhlIGJ1c3Nlcwp0aWNraW5nIC0gcGVyaGFwcyB0aGVyZSdzIGEgYm9vdCBzcGxh
c2ggaW52b2x2ZWQgb24gQnJpYW4ncyBkZXZpY2U/CgpSZWdhcmRsZXNzLCB0aGlzIHdvcmtzIG9u
IE5leHVzIDUgYW5kIGFsbG93cyBCcmlhbiB0byBtYWtlIGZ1cnRoZXIKcHJvZ3Jlc3Mgc28gSSdt
IGFsbCBmb3IgbWVyZ2luZyBpdC4KClJlZ2FyZHMsCkJqb3JuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
