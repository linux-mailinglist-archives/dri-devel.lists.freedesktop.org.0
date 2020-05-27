Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51B1E51CA
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 01:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEE38997A;
	Wed, 27 May 2020 23:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4558997A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 23:28:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A65D420C56
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 23:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590622087;
 bh=ON8PGesyAn+4FmexUP19mmvqNBZwY/TUXpZfPPF4QJ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IlYPSxGrV4e394QioY5cvU77tkEp9sNlCpQB46ZC5prK9IPRkZFWmN9EgsrZHuMMg
 n/whDi7f42KNc+W1pDMEDOWNci0giDpL0MXVECmMehQaUROW5dRGDY0JRtKigDuMDC
 Jp1ArD7A0ho0nnpSKX3rgrprAgLjc9/QjrmT8PsM=
Received: by mail-ej1-f48.google.com with SMTP id gl26so1703907ejb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 16:28:06 -0700 (PDT)
X-Gm-Message-State: AOAM532K0mw8MCjQ5brUE8dkM4eTS24IiB+/TDGrpCC9iK4kEb0kRaK9
 3hSKi3+Mj8h37mC7iv7sP2o12OLzUNozt7cOlg==
X-Google-Smtp-Source: ABdhPJzcHSIbC4Mtrhld0K/22ZiApP3zop/6GIPFmfLxlHDVkueEoHAc4k/CHn67ZoeNeAdbwomWMXLXwYcLw84+BHU=
X-Received: by 2002:a17:906:bcf8:: with SMTP id
 op24mr635286ejb.260.1590622084979; 
 Wed, 27 May 2020 16:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200522101225.62571-1-jitao.shi@mediatek.com>
In-Reply-To: <20200522101225.62571-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 28 May 2020 07:27:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8=HvU8p=6xG5_bNHtjXOsQwNAn1zqHF6AmwtOReZ_Xzw@mail.gmail.com>
Message-ID: <CAAOTY_8=HvU8p=6xG5_bNHtjXOsQwNAn1zqHF6AmwtOReZ_Xzw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: fix scrolling of panel with small hfp
 or hbp
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDXmnIgyMuaXpSDpgLHkupQg5LiL5Y2INjoxMuWvq+mBk++8mgo+Cj4gSWYgcGFuZWwgaGFzIHRv
byBzbWFsbCBoZnAgb3IgaGJwLCBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSBvcgo+IGhvcml6
b250YWxfYmFja3BvcmNoX2J5dGUgbWF5IGJlY29tZSB2ZXJ5IHNtYWxsIHZhbHVlIG9yIG5lZ2F0
aXZlCj4gdmFsdWUuIFRoaXMgcGF0Y2ggYWRqdXN0cyB0aGVpciB2YWx1ZXMgc28gdGhhdCB0aGV5
IGFyZSBncmVhdGVyCj4gdGhhbiBtaW5pbXVtIHZhbHVlIGFuZCBrZWVwIHRvdGFsIG9mIHRoZW0g
dW5jaGFuZ2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTgg
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCAwZWRlNjk4MzBhOWQuLmFlYmFh
ZmQ5MGNlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC0xNDgsNiAr
MTQ4LDkgQEAKPiAgICAgICAgICh0eXBlID09IE1JUElfRFNJX0dFTkVSSUNfUkVBRF9SRVFVRVNU
XzJfUEFSQU0pIHx8IFwKPiAgICAgICAgICh0eXBlID09IE1JUElfRFNJX0RDU19SRUFEKSkKPgo+
ICsjZGVmaW5lIE1JTl9IRlBfQllURSAgICAgICAgICAgMHgwMgo+ICsjZGVmaW5lIE1JTl9IQlBf
QllURSAgICAgICAgICAgMHgwMgo+ICsKPiAgc3RydWN0IG10a19waHlfdGltaW5nIHsKPiAgICAg
ICAgIHUzMiBscHg7Cj4gICAgICAgICB1MzIgZGFfaHNfcHJlcGFyZTsKPiBAQCAtNDUwLDYgKzQ1
Myw3IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoc3RydWN0IG10a19k
c2kgKmRzaSkKPiAgICAgICAgIHUzMiBob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGU7Cj4gICAg
ICAgICB1MzIgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZTsKPiAgICAgICAgIHUzMiBob3Jpem9u
dGFsX2Zyb250cG9yY2hfYnl0ZTsKPiArICAgICAgIHMzMiBzaWduZWRfaGZwX2J5dGUsIHNpZ25l
ZF9oYnBfYnl0ZTsKPiAgICAgICAgIHUzMiBkc2lfdG1wX2J1Zl9icHAsIGRhdGFfcGh5X2N5Y2xl
czsKPiAgICAgICAgIHN0cnVjdCBtdGtfcGh5X3RpbWluZyAqdGltaW5nID0gJmRzaS0+cGh5X3Rp
bWluZzsKPgo+IEBAIC01MTksNiArNTIzLDIwIEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmln
X3Zkb190aW1pbmcoc3RydWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgICAgICAgICAgfQo+ICAg
ICAgICAgfQo+Cj4gKyAgICAgICBzaWduZWRfaGZwX2J5dGUgPSAoczMyKWhvcml6b250YWxfZnJv
bnRwb3JjaF9ieXRlOwo+ICsgICAgICAgc2lnbmVkX2hicF9ieXRlID0gKHMzMilob3Jpem9udGFs
X2JhY2twb3JjaF9ieXRlOwo+ICsKPiArICAgICAgIGlmIChzaWduZWRfaGZwX2J5dGUgKyBzaWdu
ZWRfaGJwX2J5dGUgPCBNSU5fSEZQX0JZVEUgKyBNSU5fSEJQX0JZVEUpIHsKPiArICAgICAgICAg
ICAgICAgRFJNX1dBUk4oIkNhbGN1bGF0ZWQgaGZwX2J5dGUgYW5kIGhicF9ieXRlIGFyZSB0b28g
c21hbGwsICIKPiArICAgICAgICAgICAgICAgICAgICAgICAgInBhbmVsIG1heSBub3Qgd29yayBw
cm9wZXJseS5cbiIpOwo+ICsgICAgICAgfSBlbHNlIGlmIChzaWduZWRfaGZwX2J5dGUgPCBNSU5f
SEZQX0JZVEUpIHsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUg
PSBNSU5fSEZQX0JZVEU7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5
dGUgLT0gTUlOX0hGUF9CWVRFIC0gc2lnbmVkX2hmcF9ieXRlOwo+ICsgICAgICAgfSBlbHNlIGlm
IChzaWduZWRfaGJwX2J5dGUgPCBNSU5fSEJQX0JZVEUpIHsKPiArICAgICAgICAgICAgICAgaG9y
aXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgLT0gTUlOX0hCUF9CWVRFIC0gc2lnbmVkX2hicF9ieXRl
Owo+ICsgICAgICAgICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlID0gTUlOX0hCUF9C
WVRFOwo+ICsgICAgICAgfQo+ICsKCkkgdGhpbmsgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUg
d291bGQgbmV2ZXIgYmUgbmVndGl2ZSwgYW5kCmhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgd291
bGQgYmUgbmVndGl2ZSB3aGVuCgogaWYgKGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVf
VklERU9fU1lOQ19QVUxTRSkKaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9Cih2bS0+aGJhY2tf
cG9yY2ggKiBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7CmVsc2UKaG9yaXpvbnRhbF9iYWNrcG9yY2hf
Ynl0ZSA9ICgodm0tPmhiYWNrX3BvcmNoICsgdm0tPmhzeW5jX2xlbikgKgpkc2lfdG1wX2J1Zl9i
cHAgLSAxMCk7CgpJZiB0aGlzIHRpbWUgaXQncyBuZWd0aXZlLCB0aGUgY2FsY3VsYXRpb24gb2YK
aG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgaXMgc28gc3RyYW5nZS4KSSB0aGluayBwcm9jZXNz
aW5nIG5lZ3RpdmUgdmFsdWUgc2hvdWxkIGJlZm9yZSBoZXJlLgoKUmVnYXJkcywKQ2h1bi1LdWFu
Zy4KCj4gICAgICAgICB3cml0ZWwoaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlLCBkc2ktPnJl
Z3MgKyBEU0lfSFNBX1dDKTsKPiAgICAgICAgIHdyaXRlbChob3Jpem9udGFsX2JhY2twb3JjaF9i
eXRlLCBkc2ktPnJlZ3MgKyBEU0lfSEJQX1dDKTsKPiAgICAgICAgIHdyaXRlbChob3Jpem9udGFs
X2Zyb250cG9yY2hfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hGUF9XQyk7Cj4gLS0KPiAyLjI1LjEK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
