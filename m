Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883494A44E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DA76E1FB;
	Tue, 18 Jun 2019 14:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01086E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:46:10 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55B5D21530
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:46:10 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id p17so13443890ljg.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:46:10 -0700 (PDT)
X-Gm-Message-State: APjAAAXnguPfXGKqUbFHjTSuf4P4b+tByjG+2OCXshrKt+Uow+ohjoYN
 0zT1hlRcy22RJhTx56MdYrIfIWzg75GADgmXRJQ=
X-Google-Smtp-Source: APXvYqwV+4ngmR3BJWVxI1TlpBTw+CX8G2+LZ8Mr68e3mJyBfeQMh82MbjRoGpXZOfBMf/HkS2+FTEi0li/hsI6ERgI=
X-Received: by 2002:a2e:8155:: with SMTP id t21mr11407580ljg.80.1560869168635; 
 Tue, 18 Jun 2019 07:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
 <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
 <CAL_Jsq+8s3iNUy5ZCtWW5k-0sa51CR0xdv3Gh_sR=jsVtLmTdQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+8s3iNUy5ZCtWW5k-0sa51CR0xdv3Gh_sR=jsVtLmTdQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 18 Jun 2019 16:45:57 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd0E1Zg_TOOM3s4haQJnq6hrHaLOPjDkeVz0Gjzp-qROw@mail.gmail.com>
Message-ID: <CAJKOXPd0E1Zg_TOOM3s4haQJnq6hrHaLOPjDkeVz0Gjzp-qROw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560869170;
 bh=0FrwUmL29yHpDepBX+TXabzN3Z0vrRVEY5D8hJER/K0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vL1AF7HnzvWFqCUhenVSNzJEIyNvodIH9eNYtwiPdriqmsnJpyccjU1yw3vcymokz
 PdGon90W3WeIFPOTq4L+VZo/ONCCRPoGmYwWmko0iCWDOyi7M4JhEWsn6lizdfnAio
 oRS1McYyMo4PDZQ/zGAbSpSsJH/qQmaCYTUEOIJo=
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOCBKdW4gMjAxOSBhdCAxNjoxOCwgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAzOjI3IEFNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gU2F0LCAxNSBK
dW4gMjAxOSBhdCAwMTo1NywgSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPiB3
cm90ZToKPiA+ID4KPiA+ID4gQWRkIGRldmljZSB0cmVlIG5vZGUgZm9yIG1hbGkgZ3B1IG9uIE9k
cm9pZCBYVTMgU29Dcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxq
b3NlcGgua29ndXRAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gQ2hhbmdlcyB2MSAt
PiB2MjoKPiA+ID4gLSBVc2UgaW50ZXJydXB0IG5hbWUgb3JkZXJpbmcgZnJvbSBiaW5kaW5nIGRv
Ywo+ID4gPiAtIFNwZWNpZnkgYSBzaW5nbGUgY2xvY2sgZm9yIEdQVSBub2RlCj4gPiA+IC0gQWRk
IGdwdSBvcHAgdGFibGUKPiA+ID4gLSBGaXggd2FybmluZ3MgZnJvbSBJUlFfVFlQRV9OT05FCj4g
PiA+Cj4gPiA+ICAuLi4vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kg
fCAyNiArKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NDIy
LW9kcm9pZHh1My1jb21tb24uZHRzaQo+ID4gPiBpbmRleCA5M2E0OGYyZGRhNDkuLmI4YTQyNDZl
M2IzNyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJv
aWR4dTMtY29tbW9uLmR0c2kKPiA+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQy
Mi1vZHJvaWR4dTMtY29tbW9uLmR0c2kKPiA+ID4gQEAgLTQ4LDYgKzQ4LDMyIEBACj4gPiA+ICAg
ICAgICAgICAgICAgICBjb29saW5nLWxldmVscyA9IDwwIDEzMCAxNzAgMjMwPjsKPiA+ID4gICAg
ICAgICB9Owo+ID4gPgo+ID4gPiArICAgICAgIGdwdTogZ3B1QDExODAwMDAwIHsKPiA+ID4gKyAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3MtbWFsaSIsICJhcm0sbWFs
aS10NjI4IjsKPiA+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDExODAwMDAwIDB4NTAwMD47
Cj4gPiA+ICsgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjE5IElSUV9UWVBF
X0xFVkVMX0hJR0g+LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJ
IDc0ICBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8R0lDX1NQSSAxMTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPiA+ICsgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiam9iIiwgIm1tdSIsICJncHUiOwo+ID4gPiArICAgICAg
ICAgICAgICAgY2xvY2tzID0gPCZjbG9jayBDTEtfRzNEPjsKPiA+ID4gKyAgICAgICAgICAgICAg
IG1hbGktc3VwcGx5ID0gPCZidWNrNF9yZWc+Owo+ID4gPiArICAgICAgICAgICAgICAgb3BlcmF0
aW5nLXBvaW50cy12MiA9IDwmZ3B1X29wcF90YWJsZT47Cj4gPiA+ICsgICAgICAgfTsKPiA+ID4g
Kwo+ID4gPiArICAgICAgIGdwdV9vcHBfdGFibGU6IGdwdS1vcHAtdGFibGUgewo+ID4KPiA+IE9u
ZSBtb3JlIHRoaW5nIC0gdXNlICJvcHBfdGFibGUiIGFzIG5vZGUgbmFtZSAoZ2VuZXJpYyBjbGFz
cyBvZiBub2RlLAo+ID4gbWF0Y2hlcyBzdHlsZSB3aXRoIG90aGVyIHRhYmxlcykuCj4KPiAnb3Bw
LXRhYmxlJyBhcyBjb252ZW50aW9uIGlzIHVzaW5nICctJyByYXRoZXIgdGhhbiAnXycuCgpPSywg
c28gcmF0aGVyIGNvbnNpc3RlbmN5IGJlY2F1c2UgbW9zdCBvZiBvcHAtdGFibGVzIGhhdmUgJ18n
LAppbmNsdWRpbmcgZXhpc3RpbmcgRFRTZXMgYW5kIGV4YW1wbGVzIGluCkRvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQgYW5kCkRvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9vcHAvb3BwLnR4dC4KCkJlc3QgcmVnYXJkcywKS3J6
eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
