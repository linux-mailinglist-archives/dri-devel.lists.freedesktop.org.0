Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6C4998C8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 18:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1726B6E52E;
	Thu, 22 Aug 2019 16:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF6B6E52E;
 Thu, 22 Aug 2019 16:07:53 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B70E021743;
 Thu, 22 Aug 2019 16:07:52 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id b11so8303425qtp.10;
 Thu, 22 Aug 2019 09:07:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWjopahgVEn1zOuQizIcYcDxmPfrLi+g88IOKijiVoa5xHXog+c
 /6DLX4X56qpY0R2OlWiBVqxIRWHUpKEt5sjRVA==
X-Google-Smtp-Source: APXvYqwT5uHUpIO/FFW8324fUtKY3u7N/MLqH5qpfH1g+aJJ3tCwF2PURsFvaRVSyiDKPNxdOYjPgEZ062SLJ8UaQC8=
X-Received: by 2002:a0c:eb92:: with SMTP id x18mr96839qvo.39.1566490071850;
 Thu, 22 Aug 2019 09:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190822143703.13030-1-masneyb@onstation.org>
 <20190822143703.13030-3-masneyb@onstation.org>
In-Reply-To: <20190822143703.13030-3-masneyb@onstation.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 22 Aug 2019 11:07:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcrO9XH9_BgZYYfrFJUfXAnEK6ZkOUtAzv15Zug0QEpw@mail.gmail.com>
Message-ID: <CAL_JsqLcrO9XH9_BgZYYfrFJUfXAnEK6ZkOUtAzv15Zug0QEpw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: display: msm: gmu: add optional ocmem
 property
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566490072;
 bh=+vvqhUd+pkM/dp0wpCvzhG8McGJK25Nvoqw+tfejM2Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zlgxyKPaKWPVwW01lRBF/QXdvCXklT5TRkPjuY1wY61v1QkiYkNnFMBF1YoqmJtZv
 h2vlMyL1gjnWG5dhhw9XRmc3JVJ+xDtb6n8AX8c4uq1eFxEA7zVc8MmVOnEZbIUU3h
 NnYB1vNa8wqaUG7Q3OM39rwWdJQtNyUZOVjPQz6s=
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

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgOTozNyBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBTb21lIEEzeHggYW5kIEE0eHggQWRyZW5vIEdQVXMgZG8g
bm90IGhhdmUgR01FTSBpbnNpZGUgdGhlIEdQVSBjb3JlIGFuZAo+IG11c3QgdXNlIHRoZSBPbiBD
aGlwIE1FTW9yeSAoT0NNRU0pIGluIG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuIEFkZCB0aGUKPiBv
cHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQg
VW5pdCBiaW5kaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBv
bnN0YXRpb24ub3JnPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjU6Cj4gLSByZW5hbWUgb2NtZW0g
cHJvcGVydHkgdG8gc3JhbSB0byBtYXRjaCB3aGF0IFRJIGN1cnJlbnRseSBoYXMuCj4KPiBDaGFu
Z2VzIHNpbmNlIHY0Ogo+IC0gTm9uZQo+Cj4gQ2hhbmdlcyBzaW5jZSB2MzoKPiAtIGNvcnJlY3Qg
bGluayB0byBxY29tLG9jbWVtLnlhbWwKPgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBBZGQgYTN4
eCBleGFtcGxlIHdpdGggT0NNRU0KPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBOb25lCj4KPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dCAgIHwgNTAgKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9n
bXUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dt
dS50eHQKPiBpbmRleCA5MGFmNWIwYTU2YTkuLjIzMDVhMmFlZGU1YSAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUudHh0
Cj4gQEAgLTMxLDYgKzMxLDEwIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0gaW9tbXVzOiBw
aGFuZGxlIHRvIHRoZSBhZHJlbm8gaW9tbXUKPiAgLSBvcGVyYXRpbmctcG9pbnRzLXYyOiBwaGFu
ZGxlIHRvIHRoZSBPUFAgb3BlcmF0aW5nIHBvaW50cwo+Cj4gK09wdGlvbmFsIHByb3BlcnRpZXM6
Cj4gKy0gc3JhbTogcGhhbmRsZSB0byB0aGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0aGF0J3Mg
cHJlc2VudCBvbiBzb21lIFNuYXBkcmFnb24KPiArICAgICAgICBTb0NzLiBTZWUgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNvbSxvY21lbS55YW1sLgo+ICsKPiAgRXhh
bXBsZToKPgo+ICAvIHsKPiBAQCAtNjMsMyArNjcsNDkgQEAgRXhhbXBsZToKPiAgICAgICAgICAg
ICAgICAgb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmZ211X29wcF90YWJsZT47Cj4gICAgICAgICB9
Owo+ICB9Owo+ICsKPiArYTN4eCBleGFtcGxlIHdpdGggT0NNRU0gc3VwcG9ydDoKPiArCj4gKy8g
ewo+ICsgICAgICAgLi4uCj4gKwo+ICsgICAgICAgZ3B1OiBhZHJlbm9AZmRiMDAwMDAgewo+ICsg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInFjb20sYWRyZW5vLTMzMC4yIiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJxY29tLGFkcmVubyI7Cj4gKyAgICAgICAgICAgICAgIHJl
ZyA9IDwweGZkYjAwMDAwIDB4MTAwMDA+Owo+ICsgICAgICAgICAgICAgICByZWctbmFtZXMgPSAi
a2dzbF8zZDBfcmVnX21lbW9yeSI7Cj4gKyAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lD
X1NQSSAzMyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArICAgICAgICAgICAgICAgaW50ZXJydXB0
LW5hbWVzID0gImtnc2xfM2QwX2lycSI7Cj4gKyAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0g
ImNvcmUiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJpZmFjZSIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIm1lbV9pZmFjZSI7Cj4gKyAgICAgICAgICAgICAgIGNs
b2NrcyA9IDwmbW1jYyBPWElMSV9HRlgzRF9DTEs+LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICA8Jm1tY2MgT1hJTElDWF9BSEJfQ0xLPiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgPCZt
bWNjIE9YSUxJQ1hfQVhJX0NMSz47Cj4gKyAgICAgICAgICAgICAgIHNyYW0gPSA8Jm9jbWVtPjsK
ClNob3VsZG4ndCB0aGlzIHBvaW50IHRvIGdtdS1zcmFtQDA/IFlvdSBjYW4gYWx3YXlzIGdldCB0
aGUgcGFyZW50IGZyb20KdGhlIGNoaWxkIHdoaWNoIGlzIGEgYml0IGVhc2llciB0aGFuIHRoZSBv
dGhlciB3YXkgYXJvdW5kLgoKPiArICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmbW1j
YyBPWElMSUNYX0dEU0M+Owo+ICsgICAgICAgICAgICAgICBvcGVyYXRpbmctcG9pbnRzLXYyID0g
PCZncHVfb3BwX3RhYmxlPjsKPiArICAgICAgICAgICAgICAgaW9tbXVzID0gPCZncHVfaW9tbXUg
MD47Cj4gKyAgICAgICB9Owo+ICsKPiArICAgICAgIG9jbWVtOiBvY21lbUBmZGQwMDAwMCB7Cj4g
KyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicWNvbSxtc204OTc0LW9jbWVtIjsKPiArCj4g
KyAgICAgICAgICAgICAgIHJlZyA9IDwweGZkZDAwMDAwIDB4MjAwMD4sCj4gKyAgICAgICAgICAg
ICAgICAgICAgIDwweGZlYzAwMDAwIDB4MTgwMDAwPjsKPiArICAgICAgICAgICAgICAgcmVnLW5h
bWVzID0gImN0cmwiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm1lbSI7Cj4gKwo+
ICsgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnJwbWNjIFJQTV9TTURfT0NNRU1HWF9DTEs+LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICA8Jm1tY2MgT0NNRU1DWF9PQ01FTU5PQ19DTEs+Owo+
ICsgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJjb3JlIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiaWZhY2UiOwo+ICsKPiArICAgICAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ICsKPiArICAg
ICAgICAgICAgICAgZ211LXNyYW1AMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDB4MCAweDEwMDAwMD47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9Owo+ICt9Owo+
IC0tCj4gMi4yMS4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
