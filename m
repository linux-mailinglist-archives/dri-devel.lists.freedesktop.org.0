Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7281FD2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA3989CB9;
	Mon,  5 Aug 2019 15:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06289CB9;
 Mon,  5 Aug 2019 15:10:30 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D88822173B;
 Mon,  5 Aug 2019 15:10:29 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d23so81296944qto.2;
 Mon, 05 Aug 2019 08:10:29 -0700 (PDT)
X-Gm-Message-State: APjAAAU4TTkGb0h81bIkEFGmwrn92Da/hIhrvCJZ5e+rS8sVw5+lAVxl
 miaXWyYmyQ58IbF7c2GsklSVQar3uBq7tLYKPw==
X-Google-Smtp-Source: APXvYqyWRFCd/Bz2QCeN3gI7nR18QpjL6fpHuRuvqsSwKaIPxyzaMMfZxm5GzNaAUuOC3+0j4jzM4tBAprGGhCbeeYw=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr110476642qve.148.1565017829011; 
 Mon, 05 Aug 2019 08:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190803142026.9647-1-masneyb@onstation.org>
 <20190803142026.9647-2-masneyb@onstation.org>
In-Reply-To: <20190803142026.9647-2-masneyb@onstation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Aug 2019 09:10:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK1Xerw+319yDE6=9jmrrqQ0+DAu_nj10EX_Lj=bTJ2hw@mail.gmail.com>
Message-ID: <CAL_JsqK1Xerw+319yDE6=9jmrrqQ0+DAu_nj10EX_Lj=bTJ2hw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM)
 bindings
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565017830;
 bh=1XLJDjtLhmH3Nu2ywqFu5TahZ/2ynvQCvn57FJ4sqyg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UMzQ642KAkc+xOAjK4i60aO6rfjBzXfP97qIIK292B7wUGrdd1LMUJTpGSHoynA3Z
 R6v7bE1MmoQC8rz/mRSx/dwro/IUeL/jeuBc6qrNsBfZX4uJSC34xuC70OoM700X9Q
 SGeKZVaC11tnLGIFeabDpZETP/VWtmgxY6jwXDKY=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBdWcgMywgMjAxOSBhdCA4OjIwIEFNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKPgo+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIE9u
IENoaXAgTWVtb3J5IChPQ01FTSkgdGhhdCBpcyBwcmVzZW50Cj4gb24gc29tZSBRdWFsY29tbSBT
bmFwZHJhZ29uIFNvQ3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJA
b25zdGF0aW9uLm9yZz4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYzCj4gLSBhZGQgcmFuZ2VzIHBy
b3BlcnR5Cj4gLSByZW1vdmUgdW5uZWNlc3NhcnkgbGl0ZXJhbCBibG9jayB8Cj4gLSBhZGQgI2Fk
ZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIHRvIGJpbmRpbmcKPiAtIHJlbmFtZSBwYXRoIGRl
dmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tLyB0byBkZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0v
IHNpbmNlCj4gICB0aGlzIGlzIHRoZSBvbmx5IHFjb20gYmluZGluZyBpbiB0aGUgc3JhbSBuYW1l
c3BhY2UuIFRoYXQgd2FzIGEgaG9sZG92ZXIgZnJvbQo+ICAgd2hlbiBJIG9yaWdpbmFsbHkgcHV0
IHRoaXMgaW4gdGhlIHNvYyBuYW1lc3BhY2UuCj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+IC0gQWRk
ICotc3JhbSBub2RlIGFuZCBnbXUtc3JhbSB0byBleGFtcGxlLgo+Cj4gQ2hhbmdlcyBzaW5jZSB2
MToKPiAtIFJlbmFtZSBxY29tLG9jbWVtLW1zbTg5NzQgdG8gcWNvbSxtc204OTc0LW9jbWVtCj4g
LSBSZW5hbWVkIHJlZy1uYW1lcyB0byBjdHJsIGFuZCBtZW0KPiAtIHVwZGF0ZSBoYXJkd2FyZSBk
ZXNjcmlwdGlvbgo+IC0gbW92ZWQgZnJvbSBzb2MgdG8gc3JhbSBuYW1lc3BhY2UgaW4gdGhlIGRl
dmljZSB0cmVlIGJpbmRpbmdzCj4KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29t
LG9jbWVtLnlhbWwgIHwgOTYgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
OTYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNvbSxvY21lbS55YW1sCj4KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNvbSxvY21lbS55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNvbSxvY21lbS55YW1sCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjFiYjM4NmZmZmEwMQo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3Jh
bS9xY29tLG9jbWVtLnlhbWwKPiBAQCAtMCwwICsxLDk2IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NyYW0vcWNvbS9xY29tLG9jbWVt
LnlhbWwjCgpOZWVkIHRvIHVwZGF0ZSB0aGUgcGF0aCBoZXJlIHRvby4KCldpdGggdGhhdCwKClJl
dmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
