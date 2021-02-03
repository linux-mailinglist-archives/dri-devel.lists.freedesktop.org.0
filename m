Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211C30DF64
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 17:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741C96EB33;
	Wed,  3 Feb 2021 16:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FED36EB33
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 16:13:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 786F964FA2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 16:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612368832;
 bh=LC9OXHbkmbODTVan4GjYicX/tmgRGEDCOAypuGP002Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PQImXGeQ27g9pWi9pTRz79rlBC+Z/rOMfQfsE48RrMxum/fNN9EqDozK757TIiUOq
 fUCdSojcLSbLicSOmhLKsK06YUx/YXdglPNcFiLm6ba1mGWcWGtHfoqv+pFEuvQSTd
 daEcg2Qoj3pv9q6oee6Y6OtB85FRGo4hz07p+xgrd9LyiNW1lgFhlM7R78oFvUe8/B
 DNTlG+gNe9748OVkwA/Up8mrpmhKevTahGimfddMia6zqkISfLtkCtpgNPLXsBHDtT
 BXzAUds6JJ7KeEsCpVtZY1Dms1/COUxMgtEbmHz0kzPBo6u2xMZlNOi6WkE4mPwRjq
 akS91Qfn5h/mw==
Received: by mail-ej1-f49.google.com with SMTP id a9so18297225ejr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 08:13:52 -0800 (PST)
X-Gm-Message-State: AOAM530nwASpBcrHNv0oNF/uZxSxKRWdtUwyLosgYNgsK3qwkp2YFv4b
 u04fePfKGiCx3cqA58Gg3dLvIxCvT2mAqKye+Q==
X-Google-Smtp-Source: ABdhPJybqLj1SNuzvTeyri0ZANhZswWzGp11dtUOf1eekuNSDPoExd5Kl4ZRSB5xaVfeOFOu8R2haSrcO7uCyqI0vgA=
X-Received: by 2002:a17:906:bce2:: with SMTP id
 op2mr3960888ejb.127.1612368830940; 
 Wed, 03 Feb 2021 08:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20210202081237.774442-1-hsinyi@chromium.org>
 <20210202081237.774442-6-hsinyi@chromium.org>
In-Reply-To: <20210202081237.774442-6-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 4 Feb 2021 00:13:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9YhT5hM7QUQrkk=q-aiyCvBVr2B9ErvcL2Wj-UiEOfnA@mail.gmail.com>
Message-ID: <CAAOTY_9YhT5hM7QUQrkk=q-aiyCvBVr2B9ErvcL2Wj-UiEOfnA@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] drm/mediatek: Fix ccorr size config
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
5bm0MuaciDLml6Ug6YCx5LqMIOS4i+WNiDQ6MTPlr6vpgZPvvJoKPgo+IEZyb206IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+Cj4gRml4IHNldHRpbmcgdG8gZm9s
bG93IGhhcmR3YXJlIGRhdGFzaGVldC4gVGhlIG9yaWdpbmFsIGVycm9yIHNldHRpbmcKPiBhZmZl
Y3RzIG10ODE5MiBkaXNwbGF5Lgo+CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwg
dGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdh
cmRzLApDaHVuLUt1YW5nLgoKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55
aUBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jIHwgMiAr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jCj4gaW5kZXggNmVlMjQzMWU2
Yjg0My4uNmM4NjY3M2E4MzVjMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfY2NvcnIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9jY29yci5jCj4gQEAgLTY1LDcgKzY1LDcgQEAgdm9pZCBtdGtfY2NvcnJfY29uZmlnKHN0
cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHcsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBt
dGtfZGlzcF9jY29yciAqY2NvcnIgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+IC0gICAgICAg
bXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsICZjY29yci0+Y21kcV9yZWcsIGNj
b3JyLT5yZWdzLAo+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgdyA8PCAxNiB8IGgs
ICZjY29yci0+Y21kcV9yZWcsIGNjb3JyLT5yZWdzLAo+ICAgICAgICAgICAgICAgICAgICAgICBE
SVNQX0NDT1JSX1NJWkUpOwo+ICAgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgQ0NPUlJf
RU5HSU5FX0VOLCAmY2NvcnItPmNtZHFfcmVnLCBjY29yci0+cmVncywKPiAgICAgICAgICAgICAg
ICAgICAgICAgRElTUF9DQ09SUl9DRkcpOwo+IC0tCj4gMi4zMC4wLjM2NS5nMDJiYzY5Mzc4OS1n
b29nCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
