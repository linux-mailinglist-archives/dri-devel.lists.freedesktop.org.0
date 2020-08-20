Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B519024C8C6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B166EA7B;
	Thu, 20 Aug 2020 23:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958616EA7B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:48:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3849122B43
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597967322;
 bh=0+j/6QA0LygchhDILln1yfm2HCDRr0a88PJAPwRl+xo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N+Qu4TRQ6I7L3UpaNQexsvv1BxlVF9FL/w9CTaKc1TkL+sYA14R3lE5YU2/F2TOXW
 o63nm/yHlj80bBCLzUTPL3kFiAYQzbIWHBu9QKWQHoHazVpN1wNYJuhu+V3kE5qI4i
 0mkvVoGLDRYSC88tpmH6zvH7FChQIVsjQ5lG8WIE=
Received: by mail-ej1-f51.google.com with SMTP id o23so273430ejr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:48:42 -0700 (PDT)
X-Gm-Message-State: AOAM5305ezcYtqDRi43zUyclPiOv7fv0Tosur/pNsWj4P3yX9UV+Wvz4
 VMJD4/erY4NNKNy4OW9y1r6gAvNOdojp8No1Uw==
X-Google-Smtp-Source: ABdhPJxWafAaj3k7lPbaruLTEUXILZXHlJiOWiA943fk40qr+NDtlxb9h2KyFzZEAanAf5GUY6rk5v906+J7wgBQIpo=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr193241ejl.375.1597967320752; 
 Thu, 20 Aug 2020 16:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-15-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-15-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:48:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9xdn3VnU3nSBc4dvxcVOG34VSaDwxHga8=29GPW3zFsw@mail.gmail.com>
Message-ID: <CAAOTY_9xdn3VnU3nSBc4dvxcVOG34VSaDwxHga8=29GPW3zFsw@mail.gmail.com>
Subject: Re: [PATCH v1 14/21] drm/mediatek: add bypass shadow register
 function call for ddp component
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjoxOOWvq+mBk++8mgo+Cj4gdGhl
IHNoYWRvdyByZWdpc3RlciBmb3IgbXQ4MTkyIGRkcCBjb21wb25lbnQgaXMgZW5hYmxlLAo+IHdl
IG5lZWQgZGlzYWJsZSBpdCBiZWZvcmUgZW5hYmxlIGRkcCBjb21wb25lbnQKCk1UMjcwMSBoYXMg
c2hhZG93IHJlZ2lzdGVyIGFuZCB1c2UgaXQuIFdoeSBNVDgxOTIgaGF2ZSBzaGFkb3cgcmVnaXN0
ZXIKYnV0IGRpc2FibGUgaXQ/IEkgd291bGQgbGlrZSB0byB1c2Ugc2hhZG93IHJlZ2lzdGVyIGxp
a2UgTVQyNzAxLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25n
cWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICB8IDMgKysrCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggfCA3ICsrKysrKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fY3J0Yy5jCj4gaW5kZXggZmU0NmM0Yi4uMTZlOWI4OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAtMjk5LDYgKzI5OSw5IEBAIHN0YXRpYyBpbnQg
bXRrX2NydGNfZGRwX2h3X2luaXQoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAg
ICAgICAgICAgICAgIGdvdG8gZXJyX211dGV4X3VucHJlcGFyZTsKPiAgICAgICAgIH0KPgo+ICsg
ICAgICAgZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9ucjsgaSsrKQo+ICsgICAg
ICAgICAgICAgICBtdGtfZGRwX2NvbXBfYnlwYXNzX3NoYWRvdyhtdGtfY3J0Yy0+ZGRwX2NvbXBb
aV0pOwo+ICsKPiAgICAgICAgIERSTV9ERUJVR19EUklWRVIoIm1lZGlhdGVrX2RkcF9kZHBfcGF0
aF9zZXR1cFxuIik7Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbXRrX2NydGMtPmRkcF9jb21w
X25yIC0gMTsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIG10a19tbXN5c19kZHBfY29ubmVjdCht
dGtfY3J0Yy0+bW1zeXNfZGV2LAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuaAo+IGluZGV4IGFlMTFiNDYuLjFmMjU3MDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiBAQCAtNDUsNiArNDUsNyBAQCBzdHJ1
Y3QgbXRrX2RkcF9jb21wX2Z1bmNzIHsKPiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBicGMsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpOwo+ICAgICAgICAgdm9pZCAoKnN0
YXJ0KShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKTsKPiAgICAgICAgIHZvaWQgKCpzdG9wKShz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKTsKPiArICAgICAgIHZvaWQgKCpieXBhc3Nfc2hhZG93
KShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKTsKPiAgICAgICAgIHZvaWQgKCplbmFibGVfdmJs
YW5rKShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOwo+
ICAgICAgICAgdm9pZCAoKmRpc2FibGVfdmJsYW5rKShzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21w
KTsKPiAgICAgICAgIHVuc2lnbmVkIGludCAoKnN1cHBvcnRlZF9yb3RhdGlvbnMpKHN0cnVjdCBt
dGtfZGRwX2NvbXAgKmNvbXApOwo+IEBAIC0xNjksNiArMTcwLDEyIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBtdGtfZGRwX2N0bV9zZXQoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwKPiAgICAgICAg
ICAgICAgICAgY29tcC0+ZnVuY3MtPmN0bV9zZXQoY29tcCwgc3RhdGUpOwo+ICB9Cj4KPiArc3Rh
dGljIGlubGluZSB2b2lkIG10a19kZHBfY29tcF9ieXBhc3Nfc2hhZG93KHN0cnVjdCBtdGtfZGRw
X2NvbXAgKmNvbXApCj4gK3sKPiArICAgICAgIGlmIChjb21wLT5mdW5jcyAmJiBjb21wLT5mdW5j
cy0+YnlwYXNzX3NoYWRvdykKPiArICAgICAgICAgICAgICAgY29tcC0+ZnVuY3MtPmJ5cGFzc19z
aGFkb3coY29tcCk7Cj4gK30KPiArCj4gIGludCBtdGtfZGRwX2NvbXBfZ2V0X2lkKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBf
Y29tcF90eXBlIGNvbXBfdHlwZSk7Cj4gIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY29tcF9ub2RlLAo+IC0tCj4gMS44LjEuMS5k
aXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
