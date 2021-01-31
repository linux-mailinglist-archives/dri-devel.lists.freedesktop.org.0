Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3BA309A28
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 05:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFD46E17B;
	Sun, 31 Jan 2021 04:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0A6E17B
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 04:08:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BCCF64E1F
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 04:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612066080;
 bh=lKzleoYse1WWmJcEChAlbjscN0Xf+sfihtZYkKKf85s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RWQf8SYdSv6eW75bS6nIagPxR+FCSnmORl3bIgEGJ3vBtaqpCzaTrbdxvbVY+6Qo5
 2oyQr9/j5bAionYHmI5M/+bQpNcEntjzcy0pD9ipwyG2r4H/DEsHmhnXc0YC62+DP4
 aCUnNSHp+VTDWNdgzcvZROMdEFz/h6DkuNd+cRBRJ4Bc8pImCQropngMe6XXKPeCO5
 C2sK9omvgOlQwrrmDwPf1gZyxwGi4ozlCCzEQSOuQimsyfaR+4I+sH3XC0l4pkxfCR
 KuHs/1Dh0HXNOnTBZY1ixUy6WM0RBD0CICaqm6MsJ3ueg63cygUFBRocCI/ER9ElRk
 rZY4Bkzp+70SQ==
Received: by mail-ej1-f51.google.com with SMTP id bl23so18988208ejb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 20:08:00 -0800 (PST)
X-Gm-Message-State: AOAM531U1r/dS+4clpAF5RtrmAmiE81p4z2cVqMkClOVq+nefef30tv8
 726G2n3AKUDCBFar5O8SOvbLbn2cVYkPcCHQTg==
X-Google-Smtp-Source: ABdhPJxQHiYJAWIUOtxU2P4rTwKUPjdQjw180RpM2UyZdDEwwxkcERAsh+oIHZQM95GqTQnSkSevj61XorkLzNvhgoY=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr11678160ejy.63.1612066079184; 
 Sat, 30 Jan 2021 20:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-6-hsinyi@chromium.org>
In-Reply-To: <20210129073436.2429834-6-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 31 Jan 2021 12:07:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-e4CGXVfUdYBBx6ewEopZrfmuf2d6y77i=-hZ4P13N1g@mail.gmail.com>
Message-ID: <CAAOTY_-e4CGXVfUdYBBx6ewEopZrfmuf2d6y77i=-hZ4P13N1g@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] drm/mediatek: separate ccorr module
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MeaciDI55pelIOmAseS6lCDkuIvljYgzOjM15a+r6YGT77yaCj4KPiBGcm9tOiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPgo+IGNjb3JyIGN0bSBtYXRyaXgg
Yml0cyB3aWxsIGJlIGRpZmZlcmVudCBpbiBtdDgxOTIKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdx
aWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhz
aW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICB8ICAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYyAgIHwgMjIyICsrKysrKysrKysrKysrKysrKysrCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCAgICAgfCAgIDkgKwo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgIDk1ICstLS0tLS0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgIHwgICA4ICst
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgfCAgIDEgKwo+
ICA2IGZpbGVzIGNoYW5nZWQsIDI0MiBpbnNlcnRpb25zKCspLCA5NiBkZWxldGlvbnMoLSkKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29y
ci5jCj4KCltzbmlwXQoKPiArCj4gK3ZvaWQgbXRrX2Njb3JyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHVuc2lnbmVkIGludCB3LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGgsIHVuc2lnbmVkIGludCB2cmVmcmVzaCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBicGMsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpCj4g
K3sKPiArICAgICAgIHN0cnVjdCBtdGtfZGlzcF9jY29yciAqY2NvcnIgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsKPiArCj4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwg
aCwgJmNjb3JyLT5jbWRxX3JlZywgY2NvcnItPnJlZ3MsCj4gKyAgICAgICAgICAgICAgICAgICAg
IERJU1BfQ0NPUlJfU0laRSk7CgpZb3UgY2hhbmdlIHcsIGggcG9zaXRpb24gaGVyZS4gU2VwYXJh
dGUgdGhpcyBtb2RpZmljYXRpb24gdG8gYW5vdGhlciBwYXRjaC4KCj4gKyAgICAgICBtdGtfZGRw
X3dyaXRlKGNtZHFfcGt0LCBDQ09SUl9FTkdJTkVfRU4sICZjY29yci0+Y21kcV9yZWcsIGNjb3Jy
LT5yZWdzLAo+ICsgICAgICAgICAgICAgICAgICAgICBESVNQX0NDT1JSX0NGRyk7Cj4gK30KPiAr
Cgpbc25pcF0KCj4gLXN0YXRpYyB2b2lkIG10a19jY29ycl9jb25maWcoc3RydWN0IGRldmljZSAq
ZGV2LCB1bnNpZ25lZCBpbnQgdywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBoLCB1bnNpZ25lZCBpbnQgdnJlZnJlc2gsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQo+IC17
Cj4gLSAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wX2RldiAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+IC0KPiAtICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwgMTYgfCB3
LCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3MsIERJU1BfQ0NPUlJfU0laRSk7Cj4gLSAgICAg
ICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBDQ09SUl9FTkdJTkVfRU4sICZwcml2LT5jbWRxX3Jl
ZywgcHJpdi0+cmVncywgRElTUF9DQ09SUl9DRkcpOwo+IC19Cj4gLQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
