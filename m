Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D8E3DBC4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 22:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1805D89209;
	Tue, 11 Jun 2019 20:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5504689209
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 20:22:21 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id 33so8007328qtr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dUVLOdLhlGqU6dKfQP814FV/vWuC6TLuO9QF4QZuNUc=;
 b=TyS2PzFqS3PfMMg2Kd+Gvczt9km52F1rEAMWm5RQ6Wfo17AoDdcLfQmmmDc+q+Sqly
 HyApGTeHksAREN2QaSeXzSCVSwy8ft+JQbcU93pq8RPJFz7rt11BNxAgRhMAO2c2UVFr
 Rawjl80wXERNMJ1FbpSuoB0TzJf+Y9j4no3u6j4eUpzHoOs7WlCowZGasB7SFEIUrd43
 n2/eSkVw4JpUj4dvxkEU8fzEhArshYHkB45CqdP4dF2c591cl9dnZzC5vWEuvf2IU7AD
 6h4qo/EsrdQv8XEk8KvPbTrlY5JA5sU98rO1Oxf3x4ZLA2zrSCUVSReiyrt9OVpNbgG6
 Glqw==
X-Gm-Message-State: APjAAAVFWW7kE274Bn+iTtmbzVhAT0y1i3SFntH45GPrxMugCe0Yk6Xa
 6jsO/YFHin+g5/hSsT6LHX6sgg==
X-Google-Smtp-Source: APXvYqyIYXqidO08NLHglH77ilX3EcvWnCTt9ShIWotBRPc45uQhrya/U15eKC+a5aGAVuy129VABg==
X-Received: by 2002:aed:3804:: with SMTP id j4mr65542607qte.361.1560284540546; 
 Tue, 11 Jun 2019 13:22:20 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i123sm7525676qkd.32.2019.06.11.13.22.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 13:22:19 -0700 (PDT)
Date: Tue, 11 Jun 2019 16:22:19 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 01/11] drm: Add atomic variants of enable/disable to
 encoder helper funcs
Message-ID: <20190611202219.GD179831@art_vandelay>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-2-sean@poorly.run>
 <20190611185352.GA16305@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611185352.GA16305@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dUVLOdLhlGqU6dKfQP814FV/vWuC6TLuO9QF4QZuNUc=;
 b=K/GdgNFCUcEdpYFShyIw2H0yaPFnL4yKuJvDREDUon7asCuptY4XkTZFSq9R5YHJp2
 BLFQ0YvBQuDHk1OgDH4SNuE64V+OOKd3QFp2u4NFHAYdKeny1ATKGzi2mKS3nXRTapU9
 MVDwmtvoRrgVZ1NfLHMXrcH4zuDTvasYGev8E5oXRarLtkpG4iNwGYCrE6ezxl5f4DBH
 iEQe+VaJwnouoP3vy645u3a+b71UqymTbfV3HSQbWuOkgbdSXdfZAXcy6K2/H0ZydEJI
 cojeVaCrnYPaIWJ0/XVi26daHXC95k0y/g2Oa7l9Mixaq3+XPo0YNDd3vHhwhZ1PsPQ9
 pw/g==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDg6NTM6NTJQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEhpIFNlYW4uCj4gCj4gTml0cyBiZWxvdy4KPiAKPiA+ICAKPiA+ICsJLyoqCj4gPiAr
CSAqIEBhdG9taWNfZGlzYWJsZToKPiA+ICsJICoKPiAuLi4KPiA+ICsJICoKPiA+ICsJICogVGhp
cyBjYWxsYmFjayBpcyBhIHZhcmlhbnQgb2YgQGRpc2FibGUgdGhhdCBwcm92aWRlcyB0aGUgYXRv
bWljIHN0YXRlCj4gPiArCSAqIHRvIHRoZSBkcml2ZXIuIEl0IHRha2VzIHByaW9yaXR5IG92ZXIg
QGRpc2FibGUgZHVyaW5nIGF0b21pYyBjb21taXRzLgo+ID4gKwkgKgo+ID4gKwkgKiBUaGlzIGhv
b2sgaXMgdXNlZCBvbmx5IGJ5IGF0b21pYyBoZWxwZXJzLiBBdG9taWMgZHJpdmVycyBkb24ndCBu
ZWVkCj4gPiArCSAqIHRvIGltcGxlbWVudCBpdCBpZiB0aGVyZSdzIG5vIG5lZWQgdG8gZGlzYWJs
ZSBhbnl0aGluZyBhdCB0aGUgZW5jb2Rlcgo+ID4gKwkgKiBsZXZlbC4gVG8gZW5zdXJlIHRoYXQg
cnVudGltZSBQTSBoYW5kbGluZyAodXNpbmcgZWl0aGVyIERQTVMgb3IgdGhlCj4gPiArCSAqIG5l
dyAiQUNUSVZFIiBwcm9wZXJ0eSkgd29ya3MgQGF0b21pY19kaXNhYmxlIG11c3QgYmUgdGhlIGlu
dmVyc2Ugb2YKPiA+ICsJICogQGF0b21pY19lbmFibGUuCj4gPiArCSAqLwo+ID4gKwl2b2lkICgq
YXRvbWljX2Rpc2FibGUpKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiA+ICsJCQkgICAg
ICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKTsKPiAKPiAKPiAKPiA+ICsKPiA+ICsJ
LyoqCj4gPiArCSAqIEBhdG9taWNfZW5hYmxlOgo+ID4gKwkgKgo+IC4uLgo+ID4gKwkgKgo+ID4g
KwkgKiBUaGlzIGNhbGxiYWNrIGlzIGEgdmFyaWFudCBvZiBAZW5hYmxlIHRoYXQgcHJvdmlkZXMg
dGhlIGF0b21pYyBzdGF0ZQo+ID4gKwkgKiB0byB0aGUgZHJpdmVyLiBJdCBpcyBjYWxsZWQgaW4g
cGxhY2Ugb2YgQGVuYWJsZSBkdXJpbmcgYXRvbWljCj4gPiArCSAqIGNvbW1pdHMuCj4gCj4gVGhl
IHdvcmRpbmcgaW4gdGhpcyBwYXJhZ3JhcCBpcyBub3QgdGhlIHNhbWUgYXMgdGhlIHNpbWlsYXIg
cGFyYWdyYXBoCj4gYWJvdmUuCj4gCj4gT25lIHNheXMgIml0IHRha2VzIHByaW9yaXR5IG92ZXIi
Cj4gQW5vdGhlciBzYXlzICJjYWxsZWQgaW4gcGxhY2Ugb2YiCj4gCj4gTWF5YmUgYmUgYSBiaXQg
bW9yZSBleHBsaWNpdCBhbmQgc2F5IHRoYXQgImlmIGF0b21pY197ZGlzLGVufWFibGUgaXMKPiBk
ZWZpbmUgdGhlbiB7ZGlzLGVufWFibGUgaXMgbm90IGNhbGxlZD8KClN1cmUsIGNhbiBtYWtlIHRo
YXQgY2hhbmdlCgo+IAo+IAo+ID4gKwkgKgo+ID4gKwkgKiBUaGlzIGhvb2sgaXMgdXNlZCBvbmx5
IGJ5IGF0b21pYyBoZWxwZXJzLCBmb3Igc3ltbWV0cnkgd2l0aCBAZGlzYWJsZS4KPiBJIGRvIG5v
dCBnZXQgdGhlICJmb3Igc3ltbWV0cnkgd2l0aCBAZGlzYWJsZS4iPwoKQ29weXBhc3RhIGZyb20g
QGVuYWJsZSBrZXJuZWxkb2MuIEknbGwgY2hhbmdlIHRoaXMgdXAgYW5kIHN1Ym1pdCBhIG5ldyBw
YXRjaCB0bwpmaXggdXAgQGVuYWJsZSB0byBtYXRjaC4KCj4gCj4gPiArCSAqIEF0b21pYyBkcml2
ZXJzIGRvbid0IG5lZWQgdG8gaW1wbGVtZW50IGl0IGlmIHRoZXJlJ3Mgbm8gbmVlZCB0bwo+ID4g
KwkgKiBlbmFibGUgYW55dGhpbmcgYXQgdGhlIGVuY29kZXIgbGV2ZWwuIFRvIGVuc3VyZSB0aGF0
IHJ1bnRpbWUgUE0KPiA+ICsJICogaGFuZGxpbmcgKHVzaW5nIGVpdGhlciBEUE1TIG9yIHRoZSBu
ZXcgIkFDVElWRSIgcHJvcGVydHkpIHdvcmtzCj4gPiArCSAqIEBlbmFibGUgbXVzdCBiZSB0aGUg
aW52ZXJzZSBvZiBAZGlzYWJsZSBmb3IgYXRvbWljIGRyaXZlcnMuCj4gRGlkIHlvdSB3YW50IHRv
IHNheSAiQGF0b21pY19lbmFibGUgbXVzdCBiZSB0aGUgaW52ZXJzZSBvZiBAYXRvbWljX2Rpc2Fi
bGUgZm9yIGF0b21pYyBkcml2ZXJzLiI/CgpZZXMgSSBkaWQuIEknbGwgYWxzbyBjbGVhbiB1cCBz
b21lIG9mIHRoZSBzdXJyb3VuZGluZyB0ZXh0IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+IAo+ID4g
KwkgKi8KPiA+ICsJdm9pZCAoKmF0b21pY19lbmFibGUpKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5j
b2RlciwKPiA+ICsJCQkgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpOwo+ID4g
Kwo+ID4gIAkvKioKPiA+ICAJICogQGRpc2FibGU6Cj4gPiAgCSAqCj4gPiBAQCAtNjk1LDYgKzc0
MCw5IEBAIHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3Mgewo+ID4gIAkgKiBoYW5kbGlu
ZyAodXNpbmcgZWl0aGVyIERQTVMgb3IgdGhlIG5ldyAiQUNUSVZFIiBwcm9wZXJ0eSkgd29ya3MK
PiA+ICAJICogQGRpc2FibGUgbXVzdCBiZSB0aGUgaW52ZXJzZSBvZiBAZW5hYmxlIGZvciBhdG9t
aWMgZHJpdmVycy4KPiA+ICAJICoKPiA+ICsJICogRm9yIGF0b21pYyBkcml2ZXJzIGFsc28gY29u
c2lkZXIgQGF0b21pY19kaXNhYmxlIGFuZCBzYXZlIHlvdXJzZWxmCj4gPiArCSAqIGZyb20gaGF2
aW5nIHRvIHJlYWQgdGhlIE5PVEUgYmVsb3chCj4gTWF5YmUsIGlmIHRoaXMgaXMgc28sIHNheSB0
aGF0IGF0b21pYyBkcml2ZXJzIHNoYWxsIGFsd3lhcyB1c2UgdGhlCj4gYXRvbWljXyogdmFyaWFu
dHM/Cj4gQW5kIHRoZW4gYWRkIGEgVE9ETyBlbnRyeSB0byBtYWtlIGl0IHNvIGZvciB0aGUgb3Ro
ZXIgYXRvbWljIGRyaXZlcnM/CgpJIGRvbid0IHRoaW5rIHRoYXQncyBxdWl0ZSB3aGF0IHdlIHdh
bnQuIEZvciBhdG9taWMgZHJpdmVycyBpdCBtaWdodCBiZQpwcmVmZXJhYmxlIHRvIHVzZSBlbmFi
bGUgYW5kIGRpc2FibGUgaWYgdGhleSBkb24ndCBuZWVkIHRvIGluc3BlY3Qgc3RhdGUuIAoKVGhl
IE5PVEUgb25seSBhcHBsaWVzIHRvIGRyaXZlcnMgdXNpbmcgdGhlIGxlZ2FjeSBoZWxwZXJzLCB3
aGljaCBpc24ndCByZWFsbHkKYXBwbGljYWJsZSBmb3IgYW55b25lIG1ha2luZyB0aGUgZGVjaXNp
b24gYmV0d2VlbiBkaXNhYmxlIGFuZCBhdG9taWNfZGlzYWJsZS4KClNlYW4KCj4gPiArCSAqCj4g
PiAgCSAqIE5PVEU6Cj4gPiAgCSAqCj4gPiAgCSAqIFdpdGggbGVnYWN5IENSVEMgaGVscGVycyB0
aGVyZSdzIGEgYmlnIHNlbWFudGljIGRpZmZlcmVuY2UgYmV0d2Vlbgo+IAo+IAo+IAlTYW0KCi0t
IApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
