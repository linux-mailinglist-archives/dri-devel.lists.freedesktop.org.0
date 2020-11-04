Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB22A6458
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 13:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DBB6ECF6;
	Wed,  4 Nov 2020 12:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2246ECF6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 12:31:00 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b1so26836406lfp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 04:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cew1soZk1XASupH7dwq/caRetrJ0uHAR8HCptDadf8c=;
 b=LfXyVPEtfpXgR9J8wIk46ktN1WAZkahCjkFy/LG/o0YvZ/Fsx/J9vYbjn16MkHgySX
 3A5RRt4Ow8GFmpg8GWYEp6UrN/GejIBDSrk3zJp/pwM5JW+ArHCAHYNdPuR49PH1Titw
 ZHJNKQPVm7BzWibq/9gWRE1YVsRWQK6QQ6XGBS0w4Qtpjlb7dt87/mHP9+Y203TyOenL
 jy9iU/GWLzPSbilKNrn5jmHD8+ete6KepeV5w4WHiccvztwX56dMHlPLYxWTkeAyYy+5
 F5VFvXOWcDiP5reKtT7TGQNFqBnGeIVTPgVZa323x1swgU6t7xdKVrN/Hf9VXs8gmc7+
 3SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=cew1soZk1XASupH7dwq/caRetrJ0uHAR8HCptDadf8c=;
 b=fM4+3OLVIih/UPvyYKHYrMtQBBv2scvZstXZKxAE9SsKUrL173nERhsr3s53wsSmTS
 Vubc9AKBSlD+D6PgEBJqP1MfT6+AB7DFEb8nL8lJC9JxyBABZQPpX44/YQ+n2CI/CTHH
 rd/AmTehIgh03J5P9QWHLp7Uw9dPakQEyT97elKOV3ZVxb7CtBj8J8P79RHsA7yPaCXY
 DmuUi1OdhwUpQ+q1JJ1zop3dTtggET99/n0bVlcIy7D1bnIkhkY7Uu8T/AznJgu7n+Z4
 4tECATWQcfWnAWCVoFRS1nSKt6pVp88zksGgHZ+MUwhBhKRptsIQaTn5Q6AsEJu9JKhf
 ehQw==
X-Gm-Message-State: AOAM533suoDQlqJsV94ab1XjLNVuE3JAjop7BgqGmwF8w9m1O1Y0dCiP
 QM/ss3uop67lONrzPRT74Hbu6Ld+AkmjujHcK4Q=
X-Google-Smtp-Source: ABdhPJwbljLbmGINjYP5ZDhTsTHpKQFVgmLi8i6cP+h39Jj5QK/knuA2x4caVeXMBNMC4GrHkatQvIY7ixI5O221vWQ=
X-Received: by 2002:ac2:5614:: with SMTP id v20mr3175684lfd.542.1604493059295; 
 Wed, 04 Nov 2020 04:30:59 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5@eucas1p1.samsung.com>
 <20201104103657.18007-1-s.nawrocki@samsung.com>
 <20201104103657.18007-4-s.nawrocki@samsung.com>
In-Reply-To: <20201104103657.18007-4-s.nawrocki@samsung.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Wed, 4 Nov 2020 21:30:22 +0900
Message-ID: <CAGTfZH1DpHZpXYZfLcXgQ4Kig2t_0ftqWSLfoCZHGJzQm40gdg@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] MAINTAINERS: Add entry for Samsung interconnect
 drivers
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
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
Reply-To: cwchoi00@gmail.com
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3lsd2VzdGVyLAoKT24gV2VkLCBOb3YgNCwgMjAyMCBhdCA3OjM3IFBNIFN5bHdlc3RlciBO
YXdyb2NraQo8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBBZGQgbWFpbnRhaW5l
cnMgZW50cnkgZm9yIHRoZSBTYW1zdW5nIGludGVyY29ubmVjdCBkcml2ZXJzLCB0aGlzIGN1cnJl
bnRseQo+IGluY2x1ZGVzIEV4eW5vcyBTb0MgZ2VuZXJpYyBpbnRlcmNvbm5lY3QgZHJpdmVyLgo+
Cj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcu
Y29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2Ugdjc6Cj4gIC0gbmV3IHBhdGNoLgo+IC0tLQo+ICBN
QUlOVEFJTkVSUyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IGU3MzYz
NmIuLjRiYmFmZWYgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVS
Uwo+IEBAIC05MTU2LDYgKzkxNTYsMTMgQEAgRjogICAgICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9p
bnRlcmNvbm5lY3QvCj4gIEY6ICAgICBpbmNsdWRlL2xpbnV4L2ludGVyY29ubmVjdC1wcm92aWRl
ci5oCj4gIEY6ICAgICBpbmNsdWRlL2xpbnV4L2ludGVyY29ubmVjdC5oCj4KPiArU0FNU1VORyBJ
TlRFUkNPTk5FQ1QgRFJJVkVSUwo+ICtNOiAgICAgU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3Jv
Y2tpQHNhbXN1bmcuY29tPgo+ICtNOiAgICAgQXJ0dXIgU3dpZ2/FhCA8YS5zd2lnb25Ac2Ftc3Vu
Zy5jb20+Cj4gK0w6ICAgICBsaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmcKPiArUzogICAgIFN1cHBv
cnRlZAo+ICtGOiAgICAgZHJpdmVycy9pbnRlcmNvbm5lY3Qvc2Ftc3VuZwo+ICsKPiAgSU5WRU5T
RU5TRSBJQ00tNDI2eHggSU1VIERSSVZFUgo+ICBNOiAgICAgSmVhbi1CYXB0aXN0ZSBNYW5leXJv
bCA8am1hbmV5cm9sQGludmVuc2Vuc2UuY29tPgo+ICBMOiAgICAgbGludXgtaWlvQHZnZXIua2Vy
bmVsLm9yZwo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAoKUmV2aWV3ZWQtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9p
QHNhbXN1bmcuY29tPgoKLS0gCkJlc3QgUmVnYXJkcywKQ2hhbndvbyBDaG9pCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
