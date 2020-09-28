Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C6F27BDC5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9566E459;
	Tue, 29 Sep 2020 07:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7643589D87
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 11:29:14 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x69so846362lff.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lOJ0AWm3YJOVnOmUCV+bNOZz7ZfBv/S9uQ0d2HcfN7k=;
 b=uIWDKilIs6PYPY2J7+vnF0Kh07TAdJ9J+4Uq8F1Di5H8w0t26HAJXR0BH/qCC4BA8k
 ahx0eckrqQhHF1k3OxRInJBd7au+RCs1o9ITRI+9wBd9K451aaZ1WtHVMOHy89l1+JGR
 fZmH3GD1ez1FDDvEFHuuriK6GIGTkOjUPmEcZVcVuOzVMejwdsT+MtU1ahCYmgyptS+O
 peksGrTLCZtT7+5K+UecXnZRHOe1qZ36+VYTEIFU1pmMEC4YJbcCmmHKZyKOUDrp5gAH
 MzRYeLMSDtX0CGPn7aEY+BAYQKNr4P4dVSy/3J7+cAy7JjJo/4Jv9t2LaMPwLygDTWRq
 bSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lOJ0AWm3YJOVnOmUCV+bNOZz7ZfBv/S9uQ0d2HcfN7k=;
 b=S8GdnpODj/o4gkh0A1YchB4JJfXAKUX/WLkECwyK1wKfKUPzF322+QRxoLtobA9X6h
 QVfVMlXo3iqfXV8+us9fDnxqo5vVYfSc0lJzehjG1snVLeJP/Nr59czc2C5nqqKZVkUq
 PRD5VIq+Sy+yFjJKeEQQC/oPA00P/w53rlJm+U6v/r8n9mDN27gKMZok6zH42yDq18bw
 6JvfpDU2J486B/PoA5950a9EDrC/+Y3mZn8bzDoKex5VVmmW/37FkUT/GY6wbXwC32LG
 tlfumkR5ERgfwttVALmM5e7qn+QFIqLae/o0dzLTr0adTXjkXLCL2gDdBkIxnJyEAXpU
 unkw==
X-Gm-Message-State: AOAM533wn3KwLyTPGIGrd9UU+6ZX4kClKmbD7U8TGaAtX0Gm07TEqcmZ
 4fnOf3PhFtWZEKKL6tbDrAJxUvZaYLmF93+vtDw=
X-Google-Smtp-Source: ABdhPJzHNFbDFW7PcGhWflV7iM01F6meqG6uj4mVQAKODdf3pJwG+HaH10gvHjhKgC+fjL8jYQlDmngHW8ZzFglxtZY=
X-Received: by 2002:a19:8386:: with SMTP id f128mr298937lfd.78.1601292552928; 
 Mon, 28 Sep 2020 04:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
 <1601274460-7866-6-git-send-email-kevin3.tang@gmail.com>
 <20200928082029.cohvqu5zf3uiqz4a@gilmour.lan>
In-Reply-To: <20200928082029.cohvqu5zf3uiqz4a@gilmour.lan>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Mon, 28 Sep 2020 19:29:01 +0800
Message-ID: <CAFPSGXaCE_QN3N6fRoEPv=DDrmF10g2Vd76fD=xVgV0cbdDa8Q@mail.gmail.com>
Subject: Re: [PATCH RFC v7 5/6] dt-bindings: display: add Unisoc's mipi
 dsi&dphy bindings
To: Maxime Ripard <maxime@cerno.tech>
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgbWF4aW1lLApTb3JyeSwgSSBmb3Jnb3QgdG8gZGVzY3JpYmUgcG9ydHMgc3Vibm9kZSB3aXRo
IG15IHR3byBwb3J0QFgsIGkgd2lsbCBiZSBmaXggaXQuCgpUaGFua3MgZm9yIHJlbWluZGluZwoK
TWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IOS6jjIwMjDlubQ55pyIMjjml6Xlkajk
uIAg5LiL5Y2INDoyMOWGmemBk++8mgo+Cj4gSGkhCj4KPiBPbiBNb24sIFNlcCAyOCwgMjAyMCBh
dCAwMjoyNzozOVBNICswODAwLCBLZXZpbiBUYW5nIHdyb3RlOgo+ID4gRnJvbTogS2V2aW4gVGFu
ZyA8a2V2aW4udGFuZ0B1bmlzb2MuY29tPgo+ID4KPiA+IEFkZHMgTUlQSSBEU0kgTWFzdGVyIGFu
ZCBNSVBJIERTSS1QSFkgKEQtUEhZKQo+ID4gc3VwcG9ydCBmb3IgVW5pc29jJ3MgZGlzcGxheSBz
dWJzeXN0ZW0uCj4gPgo+ID4gUkZDIHY3Ogo+ID4gICAtIEZpeCBEVEMgdW5pdCBuYW1lIHdhcm5p
bmdzCj4gPiAgIC0gRml4IHRoZSBwcm9ibGVtIG9mIG1haW50YWluZXJzCj4gPgo+ID4gQ2M6IE9y
c29uIFpoYWkgPG9yc29uemhhaUBnbWFpbC5jb20+Cj4gPiBDYzogQ2h1bnlhbiBaaGFuZyA8emhh
bmcubHlyYUBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBUYW5nIDxrZXZpbi50
YW5nQHVuaXNvYy5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZGlzcGxheS9zcHJkL3NwcmQsc2hhcmts
My1kc2ktaG9zdC55YW1sICAgICAgICB8IDk4ICsrKysrKysrKysrKysrKysrKysrKysKPiA+ICAu
Li4vZGlzcGxheS9zcHJkL3NwcmQsc2hhcmtsMy1kc2ktcGh5LnlhbWwgICAgICAgICB8IDc1ICsr
KysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNzMgaW5zZXJ0aW9ucygrKQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9zcHJkL3NwcmQsc2hhcmtsMy1kc2ktaG9zdC55YW1sCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NwcmQvc3By
ZCxzaGFya2wzLWRzaS1waHkueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zcHJkL3NwcmQsc2hhcmtsMy1kc2ktaG9zdC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3ByZC9zcHJk
LHNoYXJrbDMtZHNpLWhvc3QueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAuLmI2YmJmNjcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NwcmQvc3ByZCxzaGFya2wzLWRzaS1ob3N0
LnlhbWwKPiA+IEBAIC0wLDAgKzEsOTggQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0K
PiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvc3ByZC9zcHJk
LHNoYXJrbDMtZHNpLWhvc3QueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogVW5pc29jIE1JUEkg
RFNJIENvbnRyb2xsZXIKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gS2V2aW4gVGFu
ZyA8a2V2aW4udGFuZ0B1bmlzb2MuY29tPgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBj
b21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogc3ByZCxzaGFya2wzLWRzaS1ob3N0Cj4gPiArCj4g
PiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4g
KyAgICAgIFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlcnMg
c2V0IGZvciB0aGUgZGV2aWNlLgo+ID4gKwo+ID4gKyAgaW50ZXJydXB0czoKPiA+ICsgICAgbWF4
SXRlbXM6IDIKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgU2hvdWxkIGNvbnRhaW4g
RFNJIGludGVycnVwdC4KPiA+ICsKPiA+ICsgIGNsb2NrczoKPiA+ICsgICAgbWluSXRlbXM6IDEK
PiA+ICsKPiA+ICsgIGNsb2NrLW5hbWVzOgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGNv
bnN0OiBjbGtfc3JjXzk2bQo+ID4gKwo+ID4gKyAgcG93ZXItZG9tYWluczoKPiA+ICsgICAgbWF4
SXRlbXM6IDEKPiA+ICsgICAgZGVzY3JpcHRpb246IEEgcGhhbmRsZSB0byBEU0lNIHBvd2VyIGRv
bWFpbiBub2RlCj4gPiArCj4gPiArICAiI2FkZHJlc3MtY2VsbHMiOgo+ID4gKyAgICBjb25zdDog
MQo+ID4gKwo+ID4gKyAgIiNzaXplLWNlbGxzIjoKPiA+ICsgICAgY29uc3Q6IDAKPiA+ICsKPiA+
ICsgIHBvcnRAMDoKPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+
ID4gKyAgICAgIEEgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVmaW5pdGlvbnMgYXMgZGVmaW5l
ZCBpbgo+ID4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92
aWRlby1pbnRlcmZhY2VzLnR4dC4KPiA+ICsgICAgICBUaGF0IHBvcnQgc2hvdWxkIGJlIHRoZSBp
bnB1dCBlbmRwb2ludCwgdXN1YWxseSBjb21pbmcgZnJvbQo+ID4gKyAgICAgIHRoZSBhc3NvY2lh
dGVkIERQVS4KPiA+ICsgIHBvcnRAMToKPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiArICAgIGRl
c2NyaXB0aW9uOgo+ID4gKyAgICAgIEEgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVmaW5pdGlv
bnMgYXMgZGVmaW5lZCBpbgo+ID4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dC4KPiA+ICsgICAgICBUaGF0IHBvcnQgc2hv
dWxkIGJlIHRoZSBvdXRwdXQgZW5kcG9pbnQsIHVzdWFsbHkgb3V0cHV0IHRvCj4gPiArICAgICAg
dGhlIGFzc29jaWF0ZWQgRFBIWS4KPgo+IElzIHRoZXJlIGEgc3BlY2lmaWMgcmVhc29uIHlvdSBk
b24ndCBmb2xsb3cgdGhlIE9GLWdyYXBoIGFuZCBoYXZlIGEKPiBwb3J0cyBzdWJub2RlIHdpdGgg
eW91ciB0d28gcG9ydEBYIGluIHRoZXJlPwo+Cj4gTWF4aW1lCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
