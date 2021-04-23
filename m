Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1B36972F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B6D6E11A;
	Fri, 23 Apr 2021 16:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA83C6E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:37:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C95BA6147F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619195828;
 bh=9IS9zneuy8LMByWB8zTbcL7UU0JhQG+Ou0Dnf6+9DWI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mVgcggccvzb5Q58UbDiH1LkySMqv79Q0ezFdDHa9YV7pgIsYnxGZqfsUJcRJc6QZV
 ZYSvR6/2IFozhh+DXQhOUmILYWpfvzt4R8iyF0yZhyhulaNj6dFjiKsV8Ndd/qXLmj
 GW/zvOnb7aOdEj2ES9uE7ITO4X3CmF8RvhaVMgBShq8F4kFHln8tWv861rOgmlvt4Z
 D2Oi1UzAr1GrTcH3dR3MSQg43Qcm6PFPXoFkffi3cT9tsvVu3W36tckpvHlMHjL4se
 QV5iCqII5/U1Z/OH7pqiU7b4YNdhJm5Grt1Znz4Y1xKyi4U3GYj+xibZ95aulFox9+
 oJ9bLrvt7by5g==
Received: by mail-ej1-f45.google.com with SMTP id u21so74796810ejo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:37:08 -0700 (PDT)
X-Gm-Message-State: AOAM530nHBI4tU6E4hTNdLaBCefhIahaynwDEWaEI+6TjQz1jm+rK96S
 cIY/HxcOwXi0EKTAAoe8mVjp6RnuZiiplMp9AQ==
X-Google-Smtp-Source: ABdhPJyNr2Rj271SQjBJ1jzoPOY6Dqp88cO1kkQkphXe731CRxVMAIBAK4M/UFgprXi5ElqtV9WjSX3y7vxRK5ErxHg=
X-Received: by 2002:a17:906:2c4a:: with SMTP id
 f10mr5235234ejh.63.1619195826695; 
 Fri, 23 Apr 2021 09:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
 <20210420132614.150242-3-jitao.shi@mediatek.com>
In-Reply-To: <20210420132614.150242-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 00:36:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-SKcX+4U5hKOgRaip-vk+ofEWe_g4VNUxFjN7LCprq1w@mail.gmail.com>
Message-ID: <CAAOTY_-SKcX+4U5hKOgRaip-vk+ofEWe_g4VNUxFjN7LCprq1w@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/mediatek: fine tune the dsi panel's power sequence
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Cawa Cheng <cawa.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDTmnIgyMOaXpSDpgLHkuowg5LiL5Y2IOToyNuWvq+mBk++8mgo+Cj4gQWRkIHRoZSBkcm1fcGFu
ZWxfcHJlcGFyZV9wb3dlciBhbmQgZHJtX3BhbmVsX3VucHJlcGFyZV9wb3dlciBjb250cm9sLgo+
IFR1cm4gb24gcGFuZWwgcG93ZXIoZHJtX3BhbmVsX3ByZXBhcmVfcG93ZXIpIGFuZCBjb250cm9s
IGJlZm9yZSBkc2kKPiBlbmFibGUuIEFuZCB0aGVuIGRzaSBlbmFibGUsIHNlbmQgZGNzIGNtZCBp
biBkcm1fcGFuZWxfcHJlcGFyZSwgbGFzdAo+IHR1cm4gb24gYmFja2xpZ2h0LgoKUGxlYXNlIGRl
c2NyaWJlIFdIWSBkbyB5b3UgbmVlZCB0aGlzIHBhdGNoPyBGaXggYW55IGJ1Zz8KCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxMiArKysrKysrKysrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCBhMWZmMTUyZWY0NjguLjQ1NWZlNTgyYzZiNSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC02MTUsMTAgKzYxNSwxMyBA
QCBzdGF0aWMgaW50IG10a19kc2lfcG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAg
ICAgZHNpLT5kYXRhX3JhdGUgPSBESVZfUk9VTkRfVVBfVUxMKGRzaS0+dm0ucGl4ZWxjbG9jayAq
IGJpdF9wZXJfcGl4ZWwsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHNpLT5sYW5lcyk7Cj4KPiArICAgICAgIGlmIChwYW5lbF9icmlkZ2VfcHJlcGFyZV9wb3dl
cihkc2ktPm5leHRfYnJpZGdlKSkKCnJldCA9IHBhbmVsX2JyaWRnZV9wcmVwYXJlX3Bvd2VyKGRz
aS0+bmV4dF9icmlkZ2UpOwppZiAocmV0KQoKPiArICAgICAgICAgICAgICAgRFJNX0lORk8oImNh
bid0IHByZXBhcmUgcG93ZXIgdGhlIHBhbmVsXG4iKTsKCkkgdGhpbmsgeW91IHNob3VsZCBnb3Rv
IGVycl9yZWZjb3VudDsKCj4gKwo+ICAgICAgICAgcmV0ID0gY2xrX3NldF9yYXRlKGRzaS0+aHNf
Y2xrLCBkc2ktPmRhdGFfcmF0ZSk7Cj4gICAgICAgICBpZiAocmV0IDwgMCkgewo+ICAgICAgICAg
ICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBzZXQgZGF0YSByYXRlOiAlZFxuIiwgcmV0
KTsKPiAtICAgICAgICAgICAgICAgZ290byBlcnJfcmVmY291bnQ7Cj4gKyAgICAgICAgICAgICAg
IGdvdG8gZXJyX3ByZXBhcmVfcG93ZXI7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIHBoeV9wb3dl
cl9vbihkc2ktPnBoeSk7Cj4gQEAgLTY2MSw3ICs2NjQsOSBAQCBzdGF0aWMgaW50IG10a19kc2lf
cG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGRzaS0+ZW5naW5lX2Nsayk7Cj4gIGVycl9waHlfcG93ZXJfb2ZmOgo+ICAgICAgICAgcGh5
X3Bvd2VyX29mZihkc2ktPnBoeSk7Cj4gLWVycl9yZWZjb3VudDoKPiArZXJyX3ByZXBhcmVfcG93
ZXI6Cj4gKyAgICAgICBpZiAocGFuZWxfYnJpZGdlX3VucHJlcGFyZV9wb3dlcihkc2ktPm5leHRf
YnJpZGdlKSkKCnJldCA9IHBhbmVsX2JyaWRnZV91bnByZXBhcmVfcG93ZXIoZHNpLT5uZXh0X2Jy
aWRnZSk7Cgo+ICsgICAgICAgICAgICAgICBEUk1fSU5GTygiQ2FuJ3QgdW5wcmVwYXJlIHBvd2Vy
IHRoZSBwYW5lbFxuIik7Cj4gICAgICAgICBkc2ktPnJlZmNvdW50LS07Cj4gICAgICAgICByZXR1
cm4gcmV0Owo+ICB9Cj4gQEAgLTY5NCw2ICs2OTksOSBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX3Bv
d2Vyb2ZmKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBh
cmUoZHNpLT5kaWdpdGFsX2Nsayk7Cj4KPiAgICAgICAgIHBoeV9wb3dlcl9vZmYoZHNpLT5waHkp
Owo+ICsKPiArICAgICAgIGlmIChwYW5lbF9icmlkZ2VfdW5wcmVwYXJlX3Bvd2VyKGRzaS0+bmV4
dF9icmlkZ2UpKQoKcmV0ID0gcGFuZWxfYnJpZGdlX3VucHJlcGFyZV9wb3dlcihkc2ktPm5leHRf
YnJpZGdlKTsKCj4gKyAgICAgICAgICAgICAgIERSTV9JTkZPKCJDYW4ndCB1bnByZXBhcmUgcG93
ZXIgdGhlIHBhbmVsXG4iKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19vdXRwdXRfZHNpX2Vu
YWJsZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+IC0tCj4gMi4yNS4xCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
