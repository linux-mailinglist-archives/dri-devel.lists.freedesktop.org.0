Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4692E6885
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 17:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C72789701;
	Mon, 28 Dec 2020 16:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1332589701
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 16:38:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8602C223E8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609173498;
 bh=YV/sRyX1UmvG3GgdJ2m2ftk6FRFQv84QER2+PC7WNP0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UK5kKQ8TFRZmctDcMCpNwJwPKX+GfRJDqejqbHjLqlfEGLwBX3n8bZVw06xsMmJwR
 JjKvIRcN6I2rcNK9gh7+SV29hg+EgYWBPEJavUuG0h6Ra0F37O29wffn2NdMjKzj/s
 rh1frW8ZlXyOSbvX9wbPxFjkpT/f6IlwfQrNVs/KNGhUPwS99KMnLHk+0AWVBPx43i
 pt0Y7fdU1Q25Fn4Un7lOvEIwUHgNTQkdFEjgigz5z9SQ2xtTP3Xlss94yRHSBm4VEm
 7tAvCyq6ElkWLMiXTcmGas+bUNAxqzmhn6OPA0tKNyqGvqDeg8ZanAQsu+WtK+gAyv
 i7agiC8kfw8cw==
Received: by mail-wr1-f50.google.com with SMTP id d26so11749873wrb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 08:38:18 -0800 (PST)
X-Gm-Message-State: AOAM530+XEAZeMJx6iApSMWPCg3oVWjPzKJ1i+AqqiefxhlsEHR1QYAL
 vU0Wgs5ABfcYLhsPuIra+LtGgWVHl8W59aJVRw==
X-Google-Smtp-Source: ABdhPJyH9luqvq7mDBrXfC//wmYqhVyPNCFSGbrh2c9nlDMvIXGLGHRAotR70G+rGeb+bseslPiYL4Rabit/Z+t8IxA=
X-Received: by 2002:adf:e84c:: with SMTP id d12mr53775611wrn.382.1609173497206; 
 Mon, 28 Dec 2020 08:38:17 -0800 (PST)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609144630-14721-8-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 00:38:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
Message-ID: <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
Subject: Re: [PATCH v3, 7/8] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMjjml6Ug6YCx5LiAIOS4i+WNiDQ6Mzjlr6vpgZPvvJoKPgo+IFVz
ZSBmdW5jdGlvbiBjYWxsIGZvciBzZXR0aW5nIG1tc3lzIG92bCBtb3V0IHJlZ2lzdGVyCj4KPiBT
aWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXRrLW1tc3lzLmMgfCAyMCArKysr
KysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
aCB8ICAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9tdGstbW1zeXMuYyBiL2RyaXZlcnMv
c29jL21lZGlhdGVrL21tc3lzL210ay1tbXN5cy5jCj4gaW5kZXggZGFlNjY1Yi4uZWEzNmExMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9tdGstbW1zeXMuYwo+ICsr
KyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL21tc3lzL210ay1tbXN5cy5jCj4gQEAgLTc0LDYgKzc0
LDE3IEBAIHZvaWQgbXRrX21tc3lzX2RkcF9jb25uZWN0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAg
ICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpIHwg
dmFsdWU7Cj4gICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgbW1zeXMtPnJlZ3Mg
KyBhZGRyKTsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoIWZ1bmNzLT5vdmxfbW91dF9l
bikKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIGlmIChmdW5jcy0+b3Zs
X21vdXRfZW4pIHsKPiArICAgICAgICAgICAgICAgdmFsdWUgPSBmdW5jcy0+b3ZsX21vdXRfZW4o
Y3VyLCBuZXh0LCAmYWRkcik7Cj4gKyAgICAgICAgICAgICAgIGlmICh2YWx1ZSkgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyBhZGRy
KSB8IHZhbHVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywg
bW1zeXMtPnJlZ3MgKyBhZGRyKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQoKbXRr
X21tc3lzX2RkcF9tb3V0X2VuKCkgY291bGQgd3JpdGUgcmVnaXN0ZXIgaW5zaWRlIGl0IHJhdGhl
ciB0aGFuCnJldHVybiB2YWx1ZSBhbmQgd3JpdGUgcmVnaXN0ZXIgaW4gbXRrX21tc3lzX2RkcF9j
b25uZWN0KCkuIFNvIHlvdQpjb3VsZCBkbyBvdmxfbW91dF9lbigpIGluIG10a19tbXN5c19kZHBf
bW91dF9lbigpLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9H
UEwobXRrX21tc3lzX2RkcF9jb25uZWN0KTsKPgo+IEBAIC05OSw2ICsxMTAsMTUgQEAgdm9pZCBt
dGtfbW1zeXNfZGRwX2Rpc2Nvbm5lY3Qoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgICAgICAgICAg
ICAgICByZWcgPSByZWFkbF9yZWxheGVkKG1tc3lzLT5yZWdzICsgYWRkcikgJiB+dmFsdWU7Cj4g
ICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgbW1zeXMtPnJlZ3MgKyBhZGRyKTsK
PiAgICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoIWZ1bmNzLT5vdmxfbW91dF9lbikKPiArICAg
ICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIHZhbHVlID0gZnVuY3MtPm92bF9tb3V0
X2VuKGN1ciwgbmV4dCwgJmFkZHIpOwo+ICsgICAgICAgaWYgKHZhbHVlKSB7Cj4gKyAgICAgICAg
ICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyBhZGRyKSAmIH52YWx1ZTsK
PiArICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyArIGFkZHIp
Owo+ICsgICAgICAgfQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKG10a19tbXN5c19kZHBfZGlz
Y29ubmVjdCk7Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmggYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IGluZGV4
IGFhNGY2MGUuLjIyMDIwM2QgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0
ZWsvbXRrLW1tc3lzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuaAo+IEBAIC00OSw2ICs0OSw5IEBAIHN0cnVjdCBtdGtfbW1zeXNfY29ubl9mdW5jcyB7Cj4g
ICAgICAgICB1MzIgKCptb3V0X2VuKShlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCj4gICAgICAg
ICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0LAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50ICphZGRyKTsKPiArICAgICAgIHUzMiAoKm92bF9tb3V0
X2VuKShlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgbmV4dCwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgKmFkZHIpOwo+ICAgICAgICAgdTMyICgqc2VsX2luKShlbnVtIG10a19k
ZHBfY29tcF9pZCBjdXIsCj4gICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21w
X2lkIG5leHQsCj4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqYWRkcik7Cj4g
LS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
