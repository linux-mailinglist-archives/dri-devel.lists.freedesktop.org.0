Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A902DA43C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 00:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C7A6E0C6;
	Mon, 14 Dec 2020 23:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF956E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 23:40:32 +0000 (UTC)
X-Gm-Message-State: AOAM531Z5jru5S2ixwgbMvLipuZiG1JY1IJ9IVuraj4wLm8pQkdMKsM7
 UbxTcvzCBxWJyI750HTzCcTfRxjymMGpNldN8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607989232;
 bh=lSvX6jnFQqoxIpPBccW/7g9EJN/cgkuyf1nA2W1wiv8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XSQOCR9KRlZI2AHdmt/ukZlEy89IoEm17SJs3lOD0fZiwwAd43Q1ReNJNrxkWj9gr
 8wXhz/am3uKMBcRbdr1lrKQ/1Zf+pLtwkh8TwbLCW8U6op3W87xpjiNg1yyvDCUit2
 TkxSp0wuaQE8Vq8OXCpT/74qRGMrMr8MsDwD3I5px5wT5ncNdVZQDmMHzzIuGPBB/p
 Gsw50I6FiXK/PC9gLUdx0JugG/usVDEiEnYyZQyK3OVJyaYjgq1rP0cmthpnJb+zLf
 tkzZIrMU6U9JLjKuKBK/ptdlAuYRnqx6XwrPMJJDlXbS8WInT9vAYTOCXh8FSM7X5q
 rfNwqP9PsJxFg==
X-Google-Smtp-Source: ABdhPJyMR1hWv0NrAVLxlYf3urPvZsTPggqomRIMAVMLDR99rCR51PGzTsrrsSQzNCxZ8SbUppoaI6FehtXfPLhv9Uw=
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr44289edz.38.1607989230343; 
 Mon, 14 Dec 2020 15:40:30 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-13-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-13-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Dec 2020 07:40:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
Message-ID: <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
Subject: Re: [PATCH v2, 12/17] drm/mediatek: fix gamma size config
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
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEz5a+r6YGT77yaCj4KPiBm
aXggZ2FtbWEgc2l6ZSBjb25maWcKCkkgd291bGQgbGlrZSB5b3UgdG8gcHJvdmlkZSBtb3JlIGlu
Zm9ybWF0aW9uLiBUaGUgb3JpZ2luYWwgY29kZSB3b3JrcwppbiBtdDgxNzMsIHdoeSBkbyB5b3Ug
bW9kaWZ5IHRoaXM/IFRoZSBkZXNjcmlwdGlvbiBtYXkgYmUgc29tZXRoaW5nCmxpa2UgdGhpczoK
CkFjY29yZGluZyB0byBkYXRhIHNoZWV0LCB0aGUgd2lkdGggaXMgaW4gYml0cyBbMzEsIDE2XSBh
bmQgaGVpZ2h0IGlzCmluIGJpdHMgWzE1LCAwXS4gRXZlbiB0aG91Z2ggd3Jvbmcgc2V0dGluZyBt
YXkgd29ya3MgaW4gc29tZSBTb0Mgc3VjaAphcyBtdDgxNzMsIGJ1dCBpdCBkb2VzIG5vdCB3b3Jr
IGluIG10ODE5Mi4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gRml4ZXM6IGUwYTVkMzM3MDI0
NSAoZHJtL21lZGlhdGVrOiBBZGQgR0FNTUEgZW5naW5lIGJhc2ljIGZ1bmN0aW9uKQo+IFNpZ25l
ZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IGluZGV4IDAwZDU2ODcu
LjUyYjZmYzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMKPiBAQCAtMjk3LDcgKzI5Nyw3IEBAIHN0YXRpYyB2b2lkIG10a19nYW1tYV9jb25maWco
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IHcsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJwYywgc3RydWN0IGNt
ZHFfcGt0ICpjbWRxX3BrdCkKPiAgewo+IC0gICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwg
aCA8PCAxNiB8IHcsIGNvbXAsIERJU1BfR0FNTUFfU0laRSk7Cj4gKyAgICAgICBtdGtfZGRwX3dy
aXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwgaCwgY29tcCwgRElTUF9HQU1NQV9TSVpFKTsKPiAgICAg
ICAgIG10a19kaXRoZXJfc2V0KGNvbXAsIGJwYywgRElTUF9HQU1NQV9DRkcsIGNtZHFfcGt0KTsK
PiAgfQo+Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
