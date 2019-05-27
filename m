Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D932B706
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4F56E21E;
	Mon, 27 May 2019 13:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6776E21E;
 Mon, 27 May 2019 13:53:29 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id l20so10586630vsp.3;
 Mon, 27 May 2019 06:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=aBUF2jTGXX1gnMihfxUKNzjQvhlxG6y9MopFLagktho=;
 b=faidSJLKiuZ8DEh+V04kPRX5h96GDu47OTuzgjIXdCgsi5fGFhCoJJP8JmIzIkBE5Q
 Rt/HVdg0r/WqXckYzeNWW0tun/+kdiBGVG/8VmNqJkxJyl336xNVMIEldVJzLUtMIWBW
 +sc3+MPW6IDDqbMKpN1YUXjxhXHv+1ukMrij6hnbMVsWahavURK3Mcm6Myzo1MNAfIr5
 HdNLcE1VZiLk0tCYtgHJVn8rJSe6v29LWDpmGWqgvIyKS+u0v8HO8/5LwIsoPN5wc3a+
 c8ImLE+4udkJU5MAg9uetJkXs1eQiwYJxnNtg0YNMUoNJOhjI9mwJTC4B58+mfQGMuuZ
 zMsg==
X-Gm-Message-State: APjAAAXDPzLgsm0Ejm1l19uxRAV4ZYrPUT8/rxjR/EHkv2nAnB1fL+u5
 ytTLCeeF/jlTCjeAKGDRPK6CHqRa40Lav7Fb1R7ZFKHy
X-Google-Smtp-Source: APXvYqzKCH2BMzVsEZZhNqOBJgOanu+r3TugU5Ilc88kQA8/DTelBeCfYFYd+RdbXged6tP6YUrj5IOIM7J5RNjYDeo=
X-Received: by 2002:a67:ec42:: with SMTP id z2mr31441716vso.30.1558965208629; 
 Mon, 27 May 2019 06:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLgUBDJ3qhD5mzQ6kYbpO7RHa7EhkfR668wtL6rkhY_s2g@mail.gmail.com>
 <CAOuPNLjeCkb+685oSOR2FoJMw9-L=Lky0PhVpkgMiV+n+ztdsA@mail.gmail.com>
In-Reply-To: <CAOuPNLjeCkb+685oSOR2FoJMw9-L=Lky0PhVpkgMiV+n+ztdsA@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 27 May 2019 19:23:17 +0530
Message-ID: <CAOuPNLiBddMKfjK1bLbymnBb6NfTW3jh7kBQtZLt06gBk_CTJw@mail.gmail.com>
Subject: Re: dpms mode change with wayland on iMX.6
To: dri-devel@lists.freedesktop.org, paulo.r.zanoni@intel.com, 
 etnaviv@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=aBUF2jTGXX1gnMihfxUKNzjQvhlxG6y9MopFLagktho=;
 b=sl5nv4DJ/D/sXL5rXiZ5Zii35fdB3gDLvzm0t8BMlhV3/Du1W+lIi/SRBZPpMPVmeC
 2gym+kGMRiSDIA9wB8Fm09T+meMPczvgOaigcDjEdIuCi0jbyjzRAhd11VdySjIqkiMm
 txxFwsALvlpwY8lQssbwUMxWO1oOc3haidT/I658FBcl0rFuJWPyybcEVTR3KsO5Z/vG
 q/Bk9Jvy18Iee4fWVAo0aW7oVtsvZd/2/RgbKbKX/NkwDTbFhQ1CdpFPKaX8hpaz011d
 Hed8ltfr52a91IRr+PW/UaA0RKs2/FruDbkpDIohU0b96PFk404dk1+8NiOXGEW0sgcO
 3XJQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMzo0MiBQTSBQaW50dSBBZ2Fyd2FsIDxwaW50dS5waW5n
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAyNywgMjAxOSBhdCAxMjo0MSBQTSBQ
aW50dSBBZ2Fyd2FsIDxwaW50dS5waW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRGVhciBB
bGwsCj4gPgo+ID4gSSBoYXZlIGEgaU1YLjYgKGFybSAzMikgYm9hcmQgd2l0aCBMaW51eCBLZXJu
ZWwgMy4xMCBhbmQgZGViaWFuCj4gPiBwbGF0Zm9ybSBydW5uaW5nLgo+ID4gVGhlIGJvYXJkIGlz
IGNvbm5lY3RlZCB0byBvbmUgTENEIHNjcmVlbiBhbmQgb25lIEhETUkgbW9uaXRvci4KPiA+IEl0
IGhhdmUgRFJNICsgV2F5bGFuZCBzZXR1cCBmb3IgZGlzcGxheS4KPiA+IEFsc28sIEkgbm90aWNl
ZCB0aGF0IGl0IGhhdmUgdHdvIGRyaSBpbnRlcmZhY2U6Cj4gPiAvZGV2L2RyaS9jYXJkMAo+ID4g
L2Rldi9kcmkvY2FyZDEKPiA+Cj4gPiBJIGFtIG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGggTGludXgg
R3JhcGhpY3MvRGlzcGxheSBzdWJzeXN0ZW0sIHNvIEkgYW0KPiA+IGxvb2tpbmcgZm9yIHNvbWUg
aGVscCBoZXJlLgo+ID4KPiA+IE15IHJlcXVpcmVtZW50IGlzIHRoYXQgSSBoYXZlIHR1cm4gb2Zm
IEhETUkgZGlzcGxheSBzY3JlZW4gdXNpbmcgYQo+ID4gY29tbWFuZCBsaW5lIHV0aWxpdHkgb3Ig
dGVzdCBwcm9ncmFtLgo+ID4gSSBsZWFybiB0aGF0IGZvciBYLXNlcnZlciB3ZSBjYW4gdXNlIHhz
ZXQgOiB4c2V0IGRwbXMgZm9yY2Ugb2ZmIChhbmQKPiA+IGl0IHdvcmtzIG9uIG15IHVidW50dSBk
ZXNrdG9wIHdpdGggMTYuMDQpLgo+ID4KPiA+IEhvd2V2ZXIgdGhpcyBjb21tYW5kIGRvZXMgbm90
IGV4aXN0cyBvbiBteSBib2FyZC4KPiA+IFNvLCBteSBxdWVzdGlvbiBpczoKPiA+IElzIHRoZXJl
IGFueSBlcXVpdmFsZW50IERQTVMgY29tbWFuZHMgZm9yIFdheWxhbmQvV2V0c29uPwo+ID4KPiA+
IC0tLS0tLS0tLQo+ID4gRnVydGhlciwgaW4gb3JkZXIgdG8gZXhwbG9yZSBtb3JlLCBJIGNsb25l
ZCBsaWJkcm0gY29kZSBmcm9tIGhlcmU6Cj4gPiB1cmwgPSBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvbWVzYS9kcm0KPiA+Cj4gPiBUaGVuIEkgZm91bmQgc29tZSB0ZXN0IHV0aWxpdHkg
dW5kZXI6IGRybS90ZXN0cyBmb2xkZXIuCj4gPiBBZnRlciBleHBsb3JpbmcgbW9yZSwgYW5kIGZl
dyBtb2RpZmljYXRpb24sIHNvbWVob3cgSSBjb3VsZCBhYmxlIHRvCj4gPiBjcm9zcy1jb21waWxl
ICJwcm9wdGVzdCIgZm9yIG15IGJvYXJkIHVzaW5nIGJlbG93Ogo+ID4gYXJtLWxpbnV4LWdudWVh
YmktZ2NjIC1vIHByb3B0ZXN0Lm91dCBwcm9wdGVzdC5jCj4gPiAtSS4vdGFyZ2V0L2xpYmRybV9p
bmNsdWRlLyAtTC4vdGFyZ2V0L2xpYmRybV9saWIvIC1sZHJtCj4gPgo+ID4gSSBmb3VuZCB0aGF0
ICIvZGV2L2RyaS9jYXJkMCIgaXMgbm90IHdvcmtpbmcgd2l0aCB0aGlzIHRlc3QuCj4gPiBTbywg
SSBjaGFuZ2VkIHRoZSB0ZXN0IHV0aWxpdHkgbGlrZSB0aGlzOgo+ID4gZmQgPSBkcm1PcGVuKCJp
bXgtZHJtIiwgTlVMTCk7Cj4gPiBPUgo+ID4gZmQgPSBvcGVuKCIvZGV2L2RyaS9jYXJkMSIsIE9f
UkRXUik7Cj4gPgo+ID4gV2hlbiBJIGRlZmF1bHQgcnVuIGl0IG9uIG15IGJvYXJkLCBJIHNlZSB0
aGF0ICJDb25uZWN0b3JfaWQ6IDI5IiBpcwo+ID4gc2hvd2luZyBmb3IgdGhlIEhETUkgZGlzcGxh
eSBhbmQgaXQgY2FuIHN1cHBvcnQgRFBNUyBwcm9wZXJ0eS4KPiA+IHt7ewo+ID4gQ29ubmVjdG9y
IDI5ICgxMS0xKQo+ID4gICAgICAgICAxIEVESUQ6Cj4gPiAgICAgICAgICAgICAgICAgZmxhZ3M6
IGltbXV0YWJsZSBibG9iCj4gPiAgICAgICAgICAgICAgICAgYmxvYnM6Cj4gPgo+ID4gICAgICAg
ICAgICAgICAgIHZhbHVlOgo+ID4gICAgICAgICAgICAgICAgICAgICAgWFhYWFhYWAo+ID4gICAg
ICAgICAyIERQTVM6Cj4gPiAgICAgICAgICAgICAgICAgZmxhZ3M6IGVudW0KPiA+ICAgICAgICAg
ICAgICAgICBlbnVtczogT249MCBTdGFuZGJ5PTEgU3VzcGVuZD0yIE9mZj0zCj4gPiAgICAgICAg
ICAgICAgICAgdmFsdWU6IDAKPiA+IENSVEMgMjQKPiA+IENSVEMgMjcKPiA+IH19fQo+ID4KPiA+
IFRoZW4sIHdoZW4gSSB0cnkgdG8gcnVuIGl0IHVzaW5nIGJlbG93IGNvbW1hbmQ6Cj4gPiAjIC4v
cHJvcHRlc3Qub3V0IDI5IGNvbm5lY3RvciAyIDMKPiA+Cj4gPiBUaGUgcHJvZ3JhbSBqdXN0IHJl
dHVybnMgc3VjY2Vzc2Z1bGx5IHdpdGhvdXQgYW55IGVycm9ycywgYnV0IG5vdGhpbmcKPiA+IGhh
cHBlbnMuIFRoZSBkaXNwbGF5IGRvZXMgbm90IHR1cm5zIG9mZi4KPiA+IEkgc2F3IHRoYXQgaW4g
bXkga2VybmVsIDMuMTAgdGhlIGlvY3RsKERSTV9JT0NUTF9NT0RFX1NFVFBST1BFUlRZKSBpcwo+
ID4gYWxyZWFkeSBzdXBwb3J0ZWQgdW5kZXIgRFJNLgo+ID4KPiA+IFNvLCBJIGFtIHdvbmRlcmlu
ZyB3aGF0IGlzIHRoZSByaWdodCB3YXkgdG8gdmVyaWZ5IERQTVMgbW9kZSBwcm9wZXJ0eQo+ID4g
b24gd2F5bGFuZCA/Cj4gPgo+ID4gSWYgYW55Ym9keSBoYXZlIGFueSBzdWdnZXN0aW9ucywgcGxl
YXNlIGhlbHAgbWUuCj4gPgo+ID4KPiA+IFRoYW5rcywKPiA+IFBpbnR1Cj4KPiArIGV0bmF2aXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCgoKT25lIG1vcmUgcG9pbnQ6CkFsdGhvdWdoIGl0IGlzIGhh
dmluZyBLZXJuZWwgMy4xMCwgYnV0IHRoZSBEUk0gbW9kdWxlcyB3ZXJlIHVwZ3JhZGVkCnRvIEtl
cm5lbCA0LjkueHggZnJvbSBtYWlubGluZS4KU28sIGxhdGVzdCBEUk0gY2hhbmdlcyBhcmUgYWxy
ZWFkeSBhcHBsaWVkLgoKVGhhbmtzLApQaW50dQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
