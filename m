Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28670770
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33C189CD4;
	Mon, 22 Jul 2019 17:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A7189304;
 Mon, 22 Jul 2019 17:35:18 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f4so75759381ioh.6;
 Mon, 22 Jul 2019 10:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JDuSuormHl6OlHvlYCfUiBnX10uM4EHPmxZlZ0DJuLM=;
 b=Ho4DKML/BqBhwOHs1Pq4SAjUFSJkQJ1OSIrqty/F+8Hn8n1t/ao6j5O4YlpxBDpl3R
 akMJmJp31trTdu4W3igrb/LAcFoI4beVu8UBf0EJFluQwdA5eAV/i9ysj0GM/LOuTK3V
 PrjwDCPAECNsTED5WawWzkw9lQwrE4mgUZweW5xiW3wYNGzHxCJqzTxs+TobUm+X2Qnu
 9ZFf5IqRywfgKCD8uB4GMFO5o1NpQIDLCuHwV7F8y1jTSrlYSG1Ekx21ECNSciG9Isac
 n9EuQK+0eFGuE9NyISPdcOV4WdKpCD001Jy4IbPKVkTgnbfchiL/BVKdGIzOICuJGdsu
 Mt9A==
X-Gm-Message-State: APjAAAXJCtySgBiVQDXEa/pqHm/f4cC1WEdkPYwNYICy9fSLk1h3kFEH
 lxprOpEzb39TEwGv4Ztxwg==
X-Google-Smtp-Source: APXvYqyWMPwtJ+fjv9YN4BZ+3w441rytWHI9dIcL/oM+b4pL1at9VQEAaRQ/tD4QGzJqUPpWA3ZK5w==
X-Received: by 2002:a6b:f910:: with SMTP id j16mr38510368iog.256.1563816915872; 
 Mon, 22 Jul 2019 10:35:15 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id z19sm52070846ioh.12.2019.07.22.10.35.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:35:15 -0700 (PDT)
Date: Mon, 22 Jul 2019 11:35:14 -0600
From: Rob Herring <robh@kernel.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: soc: qcom: add On Chip MEMory
 (OCMEM) bindings
Message-ID: <20190722173514.GA11931@bogus>
References: <20190626022148.23712-1-masneyb@onstation.org>
 <20190626022148.23712-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626022148.23712-2-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6MjE6NDNQTSAtMDQwMCwgQnJpYW4gTWFzbmV5IHdy
b3RlOgo+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIE9uIENoaXAgTWVtb3J5IChP
Q01FTSkgdGhhdCBpcyBwcmVzZW50Cj4gb24gc29tZSBRdWFsY29tbSBTbmFwZHJhZ29uIFNvQ3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+
Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAtIEFkZCAqLXNyYW0gbm9kZSBhbmQgZ211LXNy
YW0gdG8gZXhhbXBsZS4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gUmVuYW1lIHFjb20sb2Nt
ZW0tbXNtODk3NCB0byBxY29tLG1zbTg5NzQtb2NtZW0KPiAtIFJlbmFtZWQgcmVnLW5hbWVzIHRv
IGN0cmwgYW5kIG1lbQo+IC0gdXBkYXRlIGhhcmR3YXJlIGRlc2NyaXB0aW9uCj4gLSBtb3ZlZCBm
cm9tIHNvYyB0byBzcmFtIG5hbWVzcGFjZSBpbiB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MKPiAK
PiAgLi4uL2JpbmRpbmdzL3NyYW0vcWNvbS9xY29tLG9jbWVtLnlhbWwgICAgICAgIHwgODQgKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0v
cWNvbS9xY29tLG9jbWVtLnlhbWwKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNvbS9xY29tLG9jbWVtLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tL3Fjb20sb2NtZW0ueWFtbAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hMGJmMGFmNDg2MGEKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNv
bS9xY29tLG9jbWVtLnlhbWwKPiBAQCAtMCwwICsxLDg0IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NyYW0vcWNvbS9xY29tLG9jbWVt
LnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIwo+ICsKPiArdGl0bGU6IE9uIENoaXAgTWVtb3J5IChPQ01FTSkgdGhhdCBpcyBwcmVz
ZW50IG9uIHNvbWUgUXVhbGNvbW0gU25hcGRyYWdvbiBTb0NzLgo+ICsKPiArbWFpbnRhaW5lcnM6
Cj4gKyAgLSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiArCj4gK2Rlc2Ny
aXB0aW9uOiB8Cj4gKyAgVGhlIE9uIENoaXAgTWVtb3J5IChPQ01FTSkgaXMgdHlwaWNhbGx5IHVz
ZWQgYnkgdGhlIEdQVSwgY2FtZXJhL3ZpZGVvLCBhbmQKPiArICBhdWRpbyBjb21wb25lbnRzIG9u
IHNvbWUgU25hcGRyYWdvbiBTb0NzLgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxl
Ogo+ICsgICAgY29uc3Q6IHFjb20sbXNtODk3NC1vY21lbQo+ICsKPiArICByZWc6Cj4gKyAgICBp
dGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogQ29udHJvbCByZWdpc3RlcnMKPiArICAgICAg
LSBkZXNjcmlwdGlvbjogT0NNRU0gYWRkcmVzcyByYW5nZQo+ICsKPiArICByZWctbmFtZXM6Cj4g
KyAgICBpdGVtczoKPiArICAgICAgLSBjb25zdDogY3RybAo+ICsgICAgICAtIGNvbnN0OiBtZW0K
PiArCj4gKyAgY2xvY2tzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IENv
cmUgY2xvY2sKPiArICAgICAgLSBkZXNjcmlwdGlvbjogSW50ZXJmYWNlIGNsb2NrCj4gKwo+ICsg
IGNsb2NrLW5hbWVzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6IGNvcmUKPiArICAg
ICAgLSBjb25zdDogaWZhY2UKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsg
IC0gcmVnCj4gKyAgLSByZWctbmFtZXMKPiArICAtIGNsb2Nrcwo+ICsgIC0gY2xvY2stbmFtZXMK
PiArCj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ICsgICJeListc3JhbSQiOgo+ICsgICAgdHlwZTog
b2JqZWN0Cj4gKyAgICBkZXNjcmlwdGlvbjogfAoKWW91IGRvbid0IG5lZWQgdGhpcyB0byBiZSBh
IGxpdGVyYWwgYmxvY2sgKGkuZS4gZHJvcCB0aGUgJ3wnKS4KCj4gKyAgICAgIEEgcmVnaW9uIG9m
IHJlc2VydmVkIG1lbW9yeS4KPiArCj4gKyAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICByZWc6Cj4g
KyAgICAgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgICByZXF1aXJlZDoKPiArICAgICAgLSByZWcK
PiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svcWNvbSxycG1jYy5oPgo+ICsgICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
cWNvbSxtbWNjLW1zbTg5NzQuaD4KPiArCj4gKyAgICAgIG9jbWVtOiBvY21lbUBmZGQwMDAwMCB7
Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJxY29tLG1zbTg5NzQtb2NtZW0iOwo+ICsKPiArICAg
ICAgICByZWcgPSA8MHhmZGQwMDAwMCAweDIwMDA+LAo+ICsgICAgICAgICAgICAgIDwweGZlYzAw
MDAwIDB4MTgwMDAwPjsKPiArICAgICAgICByZWctbmFtZXMgPSAiY3RybCIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgIm1lbSI7Cj4gKwo+ICsgICAgICAgIGNsb2NrcyA9IDwmcnBtY2MgUlBNX1NN
RF9PQ01FTUdYX0NMSz4sCj4gKyAgICAgICAgICAgICAgICAgPCZtbWNjIE9DTUVNQ1hfT0NNRU1O
T0NfQ0xLPjsKPiArICAgICAgICBjbG9jay1uYW1lcyA9ICJjb3JlIiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICJpZmFjZSI7Cj4gKwo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+
ICsgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ICsKPiArICAgICAgICBnbXUtc3JhbUAwIHsK
PiArICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgxMDAwMDA+OwoKVGhpcyBpcyBhdCAweGZl
YzAwMDAwPyBJZiBzbyB5b3Ugc2hvdWxkIGhhdmUgYSAncmFuZ2VzJyB0byB0cmFuc2xhdGUgMCAK
dG8gdGhhdC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
