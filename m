Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931A309DD2
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 17:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01B16E2D7;
	Sun, 31 Jan 2021 16:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A286E2D7
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 16:20:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7D1C64E2D
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612110055;
 bh=MrU6Vi8JuCoqO9YRVNPeZ2JGh39IKGnuyIBNPLOLlpQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bSKphpc5f1RE3nsNGu0Th4sqTbFqe7+G1XywfNams9eLs2ihyc1CLp+6osp7ID3E+
 Uaf/UpsZgHlqyVc/ksMcX5GPl1YCsRYgiRRduO3PraeII4UYto3+ToFIsE+q1k/WM8
 xrMnB0NYimu8EcfgttCYwS5Y7hOz03MJytvukx5kjDripldXUynCGFQ8iyR8XWmMFy
 j/GWUwUNZBacjNxqT9UykShIrTh+lMIcxDetoXfLya04XB1AvsDnzZuqrh8A5dUQMJ
 gCOBEkrOzZL6NA2+3EAkjaNIwlJErbD8frRHw9TBV3BeYuUpt8ndI9hWDOMBTsgEVm
 1imX1z9cThxpw==
Received: by mail-wm1-f44.google.com with SMTP id u14so11128797wmq.4
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 08:20:55 -0800 (PST)
X-Gm-Message-State: AOAM532BJSHSpSqENJIm9kThJICHRcOKFR83BjRdIHoYENsZ2pTaSeyn
 jpZYhkaz3RIJHNQC+xXV/1sElhcGnx9MA/dHNw==
X-Google-Smtp-Source: ABdhPJwPCZFhPN5mUkyw6DKGu/bvbsLgmzrLkGSWwsvNAV5pWUO24vfzQYurKKwgol5AD4UqDe1BKiP6V7gKBbY/K0E=
X-Received: by 2002:a1c:7f94:: with SMTP id
 a142mr11433187wmd.145.1612110054247; 
 Sun, 31 Jan 2021 08:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20210131051058.3407985-1-hsinyi@chromium.org>
In-Reply-To: <20210131051058.3407985-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 1 Feb 2021 00:20:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9kOnYDs=_22qBV7kOM74zcfKaobN0wBZaXzx31KsrG5Q@mail.gmail.com>
Message-ID: <CAAOTY_9kOnYDs=_22qBV7kOM74zcfKaobN0wBZaXzx31KsrG5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: enable dither function
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
5bm0MeaciDMx5pelIOmAseaXpSDkuIvljYgxOjEx5a+r6YGT77yaCj4KPiBGcm9tOiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPgo+IEVuYWJsZSBkaXRoZXIgZnVu
Y3Rpb24gdG8gaW1wcm92ZSB0aGUgZGlzcGxheSBxdWFsaXR5LgoKUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlv
bmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KPiAtLS0KPiBQcmV2aW91cyB2ZXJz
aW9uOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9wYXRjaC8yMDIxMDEyOTA5MjIwOS4yNTg0NzE4LTctaHNpbnlpQGNocm9taXVtLm9yZy8KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDkgKysr
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2Nv
bXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBpbmRl
eCBjNzMwMDI5YWM4ZmM3Li4wNDQ0YjQyOWRhZjAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTUzLDYgKzUzLDcgQEAKPiAgI2RlZmlu
ZSBESVRIRVJfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkKPiAgI2RlZmlu
ZSBESVNQX0RJVEhFUl9DRkcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAyMAo+
ICAjZGVmaW5lIERJVEhFUl9SRUxBWV9NT0RFICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+
ICsjZGVmaW5lIERJVEhFUl9FTkdJTkVfRU4gICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQo+
ICAjZGVmaW5lIERJU1BfRElUSEVSX1NJWkUgICAgICAgICAgICAgICAgICAgICAgIDB4MDAzMAo+
Cj4gICNkZWZpbmUgTFVUXzEwQklUX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgMHgwM2Zm
Cj4gQEAgLTMxNSw4ICszMTYsMTIgQEAgc3RhdGljIHZvaWQgbXRrX2RpdGhlcl9jb25maWcoc3Ry
dWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgdywKPiAgewo+ICAgICAgICAgc3RydWN0IG10
a19kZHBfY29tcF9kZXYgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+IC0gICAgICAg
bXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsICZwcml2LT5jbWRxX3JlZywgcHJp
di0+cmVncywgRElTUF9ESVRIRVJfU0laRSk7Cj4gLSAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFf
cGt0LCBESVRIRVJfUkVMQVlfTU9ERSwgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLCBESVNQ
X0RJVEhFUl9DRkcpOwo+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8
IHcsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywKPiArICAgICAgICAgICAgICAgICAgICAg
RElTUF9ESVRIRVJfU0laRSk7Cj4gKyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBESVRI
RVJfUkVMQVlfTU9ERSwgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLAo+ICsgICAgICAgICAg
ICAgICAgICAgICBESVNQX0RJVEhFUl9DRkcpOwo+ICsgICAgICAgbXRrX2RpdGhlcl9zZXRfY29t
bW9uKHByaXYtPnJlZ3MsICZwcml2LT5jbWRxX3JlZywgYnBjLCBESVNQX0RJVEhFUl9DRkcsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRElUSEVSX0VOR0lORV9FTiwgY21kcV9wa3Qp
Owo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgbXRrX2RpdGhlcl9zdGFydChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gLS0KPiAyLjMwLjAuMzY1LmcwMmJjNjkzNzg5LWdvb2cKPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
