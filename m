Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CE0272CF6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0E889FE6;
	Mon, 21 Sep 2020 16:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A778789FE6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:37:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g4so13484815wrs.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UZX0lVSW/BkEY5EryFzi+/GuKlznQU9YGzQJgrOT6C4=;
 b=iBQJfW+PbQ6dwx/Cp+3UtA7/VPz72PX7opUnQ6BephjRS45wwN6DC4an23bNi+ZkLp
 KY8NYSomNL0yvk5PYd+YcVM7qPjf1OQ6F4sN8xMMopxX7WzgQaWRIPA7U6CnnxWuinYF
 PuXLhzUkRHSAXdoCZMswlHSFHTS9CnTNYFcOtfvDCGLnGoVL99ZstlVaAX9TJwGjwuPb
 LC4hyQf2iuSV7MpYla1zP2MM9RTgkJbmD+maHoMBcj9Gvv6XUxiz+5T0eBT0ShHHO7Oq
 Kvlo1RBZFyMNune7QwzqMAZ5n1E8n3ghIY3wcBR1on7ovqDkZ14X8JMBwh0TfejPapaJ
 pBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UZX0lVSW/BkEY5EryFzi+/GuKlznQU9YGzQJgrOT6C4=;
 b=m34RcKtJ4ZNUXTWt3pcj/GEURkQ0lqZbmgDblvxC1Fj6Wo/El+p7i16mtbCwpLeQck
 jQft9AybK/s62ndlh2KSpHH+ArWZI4WCPwvCRbLkwBf6LkQ7xNnZDxUZgU1B129TSMv8
 juSFevOHbwBiNIwSQwt3J0RCnfixXYN9L+KJqYqS1w3+UwVTQW9riBpxx3Ll8TgdUJZB
 1vQ6OusnCjG4F4GdimMgsrEwv5dtnq9K8HEfEdr5eu83m0jN5vgYjd8PcgyOFQ3z5U1H
 /vDQYX+C+yRHdywBs/+g68qlFBj9HQW8oEkGJvFHxyvXtHFqbVDo6kpogBXrCeAQ1NNR
 NtCg==
X-Gm-Message-State: AOAM530xpP+FZtrv8jOramTevOf8FrjuCo1xLYiW8zM8Ew7UV/m7P8MP
 Bxzs8D200wdi4qngzHbgvY4=
X-Google-Smtp-Source: ABdhPJyp/emP4vnjJL52ic60TOBn1bsoBW6KlikgArO8roRt4MwSrsouq5KTXeDvMPwYcqBCSFtfQw==
X-Received: by 2002:adf:84c3:: with SMTP id 61mr606109wrg.131.1600706239370;
 Mon, 21 Sep 2020 09:37:19 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id c16sm22948533wrx.31.2020.09.21.09.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:37:18 -0700 (PDT)
Subject: Re: [PATCH v3 9/9] drm/mediatek: reduce clear event
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
 <CAAOTY_-BKW9jbGD5-Un=xagRWizOXaBrvvfdQV7TyzhYWuS8Ag@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a2636ee7-f326-e709-2a50-03253bc0b6c2@gmail.com>
Date: Mon, 21 Sep 2020 18:37:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-BKW9jbGD5-Un=xagRWizOXaBrvvfdQV7TyzhYWuS8Ag@mail.gmail.com>
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAwOC8wNy8yMDIwIDAxOjAxLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBEZW5uaXM6
Cj4gCj4gRGVubmlzIFlDIEhzaWVoIDxkZW5uaXMteWMuaHNpZWhAbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMOW5tDfmnIg35pelIOmAseS6jCDkuIvljYgxMTo0N+Wvq+mBk++8mgo+Pgo+PiBObyBuZWVk
IHRvIGNsZWFyIGV2ZW50IGFnYWluIHNpbmNlIGV2ZW50IGFsd2F5cyBjbGVhciBiZWZvcmUgd2Fp
dC4KPj4gVGhpcyBmaXggZGVwZW5kIG9uIHBhdGNoOgo+PiAgICAic29jOiBtZWRpYXRlazogY21k
cTogYWRkIGNsZWFyIG9wdGlvbiBpbiBjbWRxX3BrdF93ZmUgYXBpIgo+IAo+IEFja2VkLWJ5OiBD
aHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiAKClB1c2hlZCBub3cgdG8g
djUuOS1uZXh0L3NvYwoKVGhhbmtzIQoKPj4KPj4gRml4ZXM6IDJmOTY1YmU3ZjkwMDggKCJkcm0v
bWVkaWF0ZWs6IGFwcGx5IENNRFEgY29udHJvbCBmbG93IikKPj4gU2lnbmVkLW9mZi1ieTogRGVu
bmlzIFlDIEhzaWVoIDxkZW5uaXMteWMuaHNpZWhAbWVkaWF0ZWsuY29tPgo+PiAtLS0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAgICAyICstCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPj4gaW5kZXggYzg0ZTdhMTRkNGE4Li5iYTZj
Zjk1NmIyMzkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMK
Pj4gQEAgLTQ5MCw3ICs0OTAsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfaHdfY29uZmln
KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+PiAgICAgICAgICAgICAgICAgIG1ib3hf
Zmx1c2gobXRrX2NydGMtPmNtZHFfY2xpZW50LT5jaGFuLCAyMDAwKTsKPj4gICAgICAgICAgICAg
ICAgICBjbWRxX2hhbmRsZSA9IGNtZHFfcGt0X2NyZWF0ZShtdGtfY3J0Yy0+Y21kcV9jbGllbnQs
IFBBR0VfU0laRSk7Cj4+ICAgICAgICAgICAgICAgICAgY21kcV9wa3RfY2xlYXJfZXZlbnQoY21k
cV9oYW5kbGUsIG10a19jcnRjLT5jbWRxX2V2ZW50KTsKPj4gLSAgICAgICAgICAgICAgIGNtZHFf
cGt0X3dmZShjbWRxX2hhbmRsZSwgbXRrX2NydGMtPmNtZHFfZXZlbnQsIHRydWUpOwo+PiArICAg
ICAgICAgICAgICAgY21kcV9wa3Rfd2ZlKGNtZHFfaGFuZGxlLCBtdGtfY3J0Yy0+Y21kcV9ldmVu
dCwgZmFsc2UpOwo+PiAgICAgICAgICAgICAgICAgIG10a19jcnRjX2RkcF9jb25maWcoY3J0Yywg
Y21kcV9oYW5kbGUpOwo+PiAgICAgICAgICAgICAgICAgIGNtZHFfcGt0X2ZpbmFsaXplKGNtZHFf
aGFuZGxlKTsKPj4gICAgICAgICAgICAgICAgICBjbWRxX3BrdF9mbHVzaF9hc3luYyhjbWRxX2hh
bmRsZSwgZGRwX2NtZHFfY2IsIGNtZHFfaGFuZGxlKTsKPj4gLS0KPj4gMS43LjkuNQo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKPj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
