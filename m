Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691F473BD
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 10:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AE289147;
	Sun, 16 Jun 2019 08:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839F589147
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 08:16:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so6651036wrs.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 01:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=01Gsa3Id8CMAcrAm2eou8d6m+tKtF0p1DTjOg5KEKlc=;
 b=VdAbs2E45wfcR2GKGkulJA1SVtaifGrTtqZEhfLdvmAaXh3xt+HU37CiSAPkhE3V/b
 9MAv2lVTMN7Bages6sRI5chDelZBZTwa4ZQ7zY9MYhVWI2XH6qPb2ne6fa/UVKPqqIm4
 uU/m8I3T1d+Vue1VwN6WksmjLSnoYAEcJYXvmwb72wMIih5aZuKA18UvM7+SXrOXnqfw
 xgoKY+BC5h6m8Ja0QRxr2OknoY8qQLikN99zVI9so68KixQkQ/bB0v+Faw3Uz7k7riZB
 Yw46vmELQt/5AIS/y+hM0xvlL0g654up7NWSRzOpB81LQrQ3EOUwyJdvIL6FMhiJtI82
 keDQ==
X-Gm-Message-State: APjAAAWdfqo6o91EX5qF3I4eAL6LB40jfTOm6dezWE2uIPOpCT+LM5g1
 1PYscXRAHv4ezhm61UxbvNs=
X-Google-Smtp-Source: APXvYqxATaOreJ64gZqKr1ZADSyl6aWSJgWFB9oHlNrQXSSjWVT8raTQwwJaAcjxe+B8VCxFKoLukw==
X-Received: by 2002:a05:6000:112:: with SMTP id
 o18mr5271656wrx.153.1560672960065; 
 Sun, 16 Jun 2019 01:16:00 -0700 (PDT)
Received: from kozik-lap ([194.230.155.186])
 by smtp.googlemail.com with ESMTPSA id z5sm6781677wrh.16.2019.06.16.01.15.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 16 Jun 2019 01:15:59 -0700 (PDT)
Date: Sun, 16 Jun 2019 10:15:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Kogut <joseph.kogut@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
Message-ID: <20190616081557.GA3826@kozik-lap>
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203144.3850-1-joseph.kogut@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, kgene@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDE6MzE6NDNQTSAtMDcwMCwgSm9zZXBoIEtvZ3V0IHdy
b3RlOgo+IERvY3VtZW50IHZlbmRvciBzcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZyBmb3IgTWFs
aSBncHVzIG9uIEV4eW5vcyBTb0NzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8
am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQKPiBpbmRleCAxYjFhNzQx
MjkxNDEuLmE5NzA0YzczNmQwNyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dAo+IEBAIC0xOCw2
ICsxOCw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gICAgICArICJhbWxvZ2ljLG1lc29uLWd4
bS1tYWxpIgo+ICAgICAgKyAicm9ja2NoaXAscmszMjg4LW1hbGkiCj4gICAgICArICJyb2NrY2hp
cCxyazMzOTktbWFsaSIKPiArICAgICsgInNhbXN1bmcsZXh5bm9zLW1hbGkiCgpBcmUgdGhlcmUg
YW55IGRyaXZlciBkaWZmZXJlbmNlcyBmb3IgRXh5bm9zPyBJZiBub3QgdGhlbiB3aHkgYWRkaW5n
CmFub3RoZXIgY29tcGF0aWJsZT8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgo+ICAKPiAgLSBy
ZWcgOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3Mgb2YgdGhlIGRldmljZSBhbmQgbGVuZ3RoIG9mIHRo
ZSByZWdpc3RlciBhcmVhLgo+ICAKPiAtLSAKPiAyLjIyLjAKPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
