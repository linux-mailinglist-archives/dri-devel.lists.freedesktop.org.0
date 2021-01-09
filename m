Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF292F0432
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 23:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BB089EEB;
	Sat,  9 Jan 2021 22:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E397B89EEB
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 22:59:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 592A5238A1
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 22:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610233184;
 bh=fnoMgybr+1G8nuwpGXS+MC2Rlg+Qkb5sQs6b/Ft7L/8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cbsV4BqtD6w0gO5iPcgjgMz7uF/CVhwf5IientYpv2WVOdJPOSS8Rd7saou2Rp06H
 20373RonIDE7vNkJkPkN3vCC0jkUbwgPFQvJ1mS5Z2YP8m6qEWo1ut8qXSZE4JgGOs
 wwHboK8O7R3MkRA3wkP82cp8B7QZH0iX6JOZ20YTHcNZ9WnD++0wu9YieoIyr0/buY
 PXaasg9VanpmG0PwZXufzxTcQgQPpdPTKlwnng934zLLvBPFyjruCbBGGUqDrZW80r
 RWuiXe+LZ5ztLsPpkvzY7fA+jwtRgqkPMhQYFlC5S33B2ZoRVkA3wzHoi8zm3aZdFT
 CIhyzkDt2MBsA==
Received: by mail-ed1-f52.google.com with SMTP id cm17so14979180edb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jan 2021 14:59:44 -0800 (PST)
X-Gm-Message-State: AOAM530v4h/sV6eUFSt1Jic6/pVkebgrFpOO78+X0hxn30f0TwpB+1Au
 htc+Tc9+mzPLhfmuAAv9kIcYE0f4OoSRItXSxg==
X-Google-Smtp-Source: ABdhPJzg/pGerCaQWoQQQmH4uyvNLs23kMnBDhHhKxh3kBiwEEtWRcupfoLlQtwoM6WHVeOmHlY13STveFAlYY4+9P0=
X-Received: by 2002:a05:6402:3048:: with SMTP id
 bu8mr9553978edb.49.1610233182880; 
 Sat, 09 Jan 2021 14:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20201202235856.7652-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201202235856.7652-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 10 Jan 2021 06:59:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__p4C0ctXuOFu42-9HaTrGnOef-Sg47pyC0Uk7yN5406w@mail.gmail.com>
Message-ID: <CAAOTY__p4C0ctXuOFu42-9HaTrGnOef-Sg47pyC0Uk7yN5406w@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: Remove cmdq_pkt_flush()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE1hdHRoaWFzOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIw5bm0MTLmnIgz5pelIOmAseWbmyDkuIrljYg3OjU55a+r6YGT77yaCj4KPiByeF9jYWxs
YmFjayBpcyBhIHN0YW5kYXJkIG1haWxib3ggY2FsbGJhY2sgbWVjaGFuaXNtIGFuZCBjb3VsZAo+
IGNvdmVyIHRoZSBmdW5jdGlvbiBvZiBwcm9wcmlldGFyeSBjbWRxX3Rhc2tfY2IsIHNvIGl0IGlz
IGJldHRlcgo+IHRvIHVzZSB0aGUgc3RhbmRhcmQgb25lIGluc3RlYWQgb2YgdGhlIHByb3ByaWV0
YXJ5IG9uZS4gQnV0Cj4gcmVnaXN0ZXIgcnhfY2FsbGJhY2sgc2hvdWxkIGJlZm9yZSBtYm94X3Jl
cXVlc3RfY2hhbm5lbCgpLAo+IHNvIHJlbW92ZSBjbWRxX3BrdF9mbHVzaCgpIGFuZCBsZXQgY2xp
ZW50IGRyaXZlciBpbXBsZW1lbnQKPiBpdHMgb3duIHN5bmNocm9ub3VzIGZsdXNoLgoKSG93IGRv
IHlvdSB0aGluayBhYm91dCB0aGlzIHBhdGNoPyBUaGlzIHBhdGNoIGlzIGRlcml2ZWQgZnJvbSBb
MV0KYWNjb3JkaW5nIHRvIEphc3NpJ3Mgc3VnZ2VzdGlvbiBbMl0uCgpbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjAwOTI3MjMw
NDIyLjExNjEwLTMtY2h1bmt1YW5nLmh1QGtlcm5lbC5vcmcvClsyXSBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvY292ZXIvMjAyMDA5MjcyMzA0MjIu
MTE2MTAtMS1jaHVua3VhbmcuaHVAa2VybmVsLm9yZy8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgMzIgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LWNtZHEuaCAgfCAxMiAtLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDQgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVy
LmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYwo+IGluZGV4IDUwNTY1
MWIwZDcxNS4uZmQzYmMzOTUzOGExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVr
L210ay1jbWRxLWhlbHBlci5jCj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEt
aGVscGVyLmMKPiBAQCAtNTAyLDM2ICs1MDIsNCBAQCBpbnQgY21kcV9wa3RfZmx1c2hfYXN5bmMo
c3RydWN0IGNtZHFfcGt0ICpwa3QsIGNtZHFfYXN5bmNfZmx1c2hfY2IgY2IsCj4gIH0KPiAgRVhQ
T1JUX1NZTUJPTChjbWRxX3BrdF9mbHVzaF9hc3luYyk7Cj4KPiAtc3RydWN0IGNtZHFfZmx1c2hf
Y29tcGxldGlvbiB7Cj4gLSAgICAgICBzdHJ1Y3QgY29tcGxldGlvbiBjbXBsdDsKPiAtICAgICAg
IGJvb2wgZXJyOwo+IC19Owo+IC0KPiAtc3RhdGljIHZvaWQgY21kcV9wa3RfZmx1c2hfY2Ioc3Ry
dWN0IGNtZHFfY2JfZGF0YSBkYXRhKQo+IC17Cj4gLSAgICAgICBzdHJ1Y3QgY21kcV9mbHVzaF9j
b21wbGV0aW9uICpjbXBsdDsKPiAtCj4gLSAgICAgICBjbXBsdCA9IChzdHJ1Y3QgY21kcV9mbHVz
aF9jb21wbGV0aW9uICopZGF0YS5kYXRhOwo+IC0gICAgICAgaWYgKGRhdGEuc3RhICE9IENNRFFf
Q0JfTk9STUFMKQo+IC0gICAgICAgICAgICAgICBjbXBsdC0+ZXJyID0gdHJ1ZTsKPiAtICAgICAg
IGVsc2UKPiAtICAgICAgICAgICAgICAgY21wbHQtPmVyciA9IGZhbHNlOwo+IC0gICAgICAgY29t
cGxldGUoJmNtcGx0LT5jbXBsdCk7Cj4gLX0KPiAtCj4gLWludCBjbWRxX3BrdF9mbHVzaChzdHJ1
Y3QgY21kcV9wa3QgKnBrdCkKPiAtewo+IC0gICAgICAgc3RydWN0IGNtZHFfZmx1c2hfY29tcGxl
dGlvbiBjbXBsdDsKPiAtICAgICAgIGludCBlcnI7Cj4gLQo+IC0gICAgICAgaW5pdF9jb21wbGV0
aW9uKCZjbXBsdC5jbXBsdCk7Cj4gLSAgICAgICBlcnIgPSBjbWRxX3BrdF9mbHVzaF9hc3luYyhw
a3QsIGNtZHFfcGt0X2ZsdXNoX2NiLCAmY21wbHQpOwo+IC0gICAgICAgaWYgKGVyciA8IDApCj4g
LSAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gLSAgICAgICB3YWl0X2Zvcl9jb21wbGV0aW9u
KCZjbXBsdC5jbXBsdCk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIGNtcGx0LmVyciA/IC1FRkFVTFQg
OiAwOwo+IC19Cj4gLUVYUE9SVF9TWU1CT0woY21kcV9wa3RfZmx1c2gpOwo+IC0KPiAgTU9EVUxF
X0xJQ0VOU0UoIkdQTCB2MiIpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstY21kcS5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaAo+
IGluZGV4IDk2MDcwNGQ3NTk5NC4uMmM2YWE4NGMwZTgwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstY21kcS5oCj4gQEAgLTI4OCwxNiArMjg4LDQgQEAgaW50IGNtZHFfcGt0X2Zp
bmFsaXplKHN0cnVjdCBjbWRxX3BrdCAqcGt0KTsKPiAgaW50IGNtZHFfcGt0X2ZsdXNoX2FzeW5j
KHN0cnVjdCBjbWRxX3BrdCAqcGt0LCBjbWRxX2FzeW5jX2ZsdXNoX2NiIGNiLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKTsKPgo+IC0vKioKPiAtICogY21kcV9wa3RfZmx1
c2goKSAtIHRyaWdnZXIgQ01EUSB0byBleGVjdXRlIHRoZSBDTURRIHBhY2tldAo+IC0gKiBAcGt0
OiAgICAgICB0aGUgQ01EUSBwYWNrZXQKPiAtICoKPiAtICogUmV0dXJuOiAwIGZvciBzdWNjZXNz
OyBlbHNlIHRoZSBlcnJvciBjb2RlIGlzIHJldHVybmVkCj4gLSAqCj4gLSAqIFRyaWdnZXIgQ01E
USB0byBleGVjdXRlIHRoZSBDTURRIHBhY2tldC4gTm90ZSB0aGF0IHRoaXMgaXMgYQo+IC0gKiBz
eW5jaHJvbm91cyBmbHVzaCBmdW5jdGlvbi4gV2hlbiB0aGUgZnVuY3Rpb24gcmV0dXJuZWQsIHRo
ZSByZWNvcmRlZAo+IC0gKiBjb21tYW5kcyBoYXZlIGJlZW4gZG9uZS4KPiAtICovCj4gLWludCBj
bWRxX3BrdF9mbHVzaChzdHJ1Y3QgY21kcV9wa3QgKnBrdCk7Cj4gLQo+ICAjZW5kaWYgLyogX19N
VEtfQ01EUV9IX18gKi8KPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
