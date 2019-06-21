Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CA4EA11
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 16:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6D66E8C2;
	Fri, 21 Jun 2019 14:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32126E8C2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 14:00:25 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m23so6013632lje.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 07:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HdPpqlE5KQOryOI+FWcAGSlfSeIeXjYoyYw5O4jWzks=;
 b=rFot+lpHOCCsbheYT2elXo8c/jesTmvjlrHu3IgKUOwzbXLndR72PYBDoxF3Zl7qQk
 Gl5i1H1SdDNuBw/yLjsrK3iaSDwj0JH6ISG1dSiWZePOMn13I//VeK0yANEZcM1BsJmV
 HlhZGNPY+Tv9lvolUUn82WAi23eNqOvxeeA8GWNwjEfqw9kOIAcDvuPoYBoN3tvvFmKp
 UahSJex/jlrKbSm8gqal1wLmLZx31TlpSzj/CpEEKAc+VYbicJX/4ttWCqOS3ykHGkqU
 BGhDNGO0zEtANcSSJAKNQy67HvfpbbXCkd+gJNz1p5lvGt8d6bCK8Xxngug0OANwQECb
 OM0A==
X-Gm-Message-State: APjAAAUjcn9k9xOoIXVDb9bW/TKtF0ZIqLX6trkIUW094EUifeH+CeiA
 VOU2YytJaXc2nCo7pItKDY0ewfcX8K0ogIeFESE=
X-Google-Smtp-Source: APXvYqzHIiebJqKGNowqGUaOStPrvIC4CDHyk3T1vJyUD7aGteNqYdBz5YnghaRqCjI8auZqhyn4Z6jZuR2Eayg9KkA=
X-Received: by 2002:a2e:8650:: with SMTP id i16mr24506131ljj.178.1561125624436; 
 Fri, 21 Jun 2019 07:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
 <1561037428-13855-2-git-send-email-robert.chiras@nxp.com>
In-Reply-To: <1561037428-13855-2-git-send-email-robert.chiras@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 21 Jun 2019 11:00:42 -0300
Message-ID: <CAOMZO5DunK3+ovBd0c0X4NTf-zkW1Tjz6KgXFMaRQKMk2SBMiw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add support for
 Raydium RM67191 panel
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HdPpqlE5KQOryOI+FWcAGSlfSeIeXjYoyYw5O4jWzks=;
 b=LIGoxNHDQCkPWYXbaamae5C9X8NCDUGNdSiwdnSAcKkGC4KheSc0mzoT1Cskr/yd3g
 Wr+SU7sDp7Tw4CZQsezQV5/q+W+jASBXRTn4tXM+mHtiTG6qGGoASTAURKHSApuJo8+9
 QSvN/nn5pFLhP5f1auMMhhQJOUwITRGQmUXw8MOjooFLqNZiGRoAfcCeG2jRn4wRla4B
 WOxnCjZpJj+JoxeuujISG7BfaNMLW8WNf+KRHTrtZ5JinzZaFhuGLfA64Tt0muspivH1
 zKh2eVkJotVuzkZGoS8ljYhrxU/37XydWz/dvzJeUU91iFZtbCmsHJOwsPRxLF+825bO
 N6CA==
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LAoKT24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMTA6MzIgQU0gUm9iZXJ0IENoaXJh
cyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPiB3cm90ZToKPgo+IEFkZCBkdC1iaW5kaW5ncyBkb2N1
bWVudGF0aW9uIGZvciBSYXlkaXVtIFJNNjcxOTEgRFNJIHBhbmVsLgo+Cj4gU2lnbmVkLW9mZi1i
eTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPgo+IFJldmlld2VkLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQgICAgIHwgMzkgKysrKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5
ZGl1bSxybTY3MTkxLnR4dAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi41MmFmMjcyCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQKPiBAQCAtMCwwICsxLDM5IEBACj4gK1JheWRpdW0g
Uk02NzE3MSBPTEVEIExDRCBwYW5lbCB3aXRoIE1JUEktRFNJIHByb3RvY29sCj4gKwo+ICtSZXF1
aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBhdGlibGU6ICAgICAgICAgICJyYXlkaXVtLHJtNjcx
OTEiCj4gKy0gcmVnOiAgICAgICAgICAgICAgICAgdmlydHVhbCBjaGFubmVsIGZvciBNSVBJLURT
SSBwcm90b2NvbAo+ICsgICAgICAgICAgICAgICAgICAgICAgIG11c3QgYmUgPDA+Cj4gKy0gZHNp
LWxhbmVzOiAgICAgICAgICAgbnVtYmVyIG9mIERTSSBsYW5lcyB0byBiZSB1c2VkCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgbXVzdCBiZSA8Mz4gb3IgPDQ+Cj4gKy0gcG9ydDogICAgICAgICAg
ICAgICAgaW5wdXQgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVmaW5pdGlvbiBhcwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGRlZmluZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dyYXBoLnR4dDsKPiArICAgICAgICAgICAgICAgICAgICAgICB0aGUgaW5wdXQgcG9y
dCBzaG91bGQgYmUgY29ubmVjdGVkIHRvIGEgTUlQSS1EU0kgZGV2aWNlCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZHJpdmVyCj4gKwo+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ICstIHJlc2V0
LWdwaW9zOiAgICAgICAgIGEgR1BJTyBzcGVjIGZvciB0aGUgUlNUX0IgR1BJTyBwaW4KPiArLSB3
aWR0aC1tbTogICAgICAgICAgICBzZWUgcGFuZWwtY29tbW9uLnR4dAo+ICstIGhlaWdodC1tbTog
ICAgICAgICAgIHNlZSBwYW5lbC1jb21tb24udHh0Cj4gKy0gdmlkZW8tbW9kZTogICAgICAgICAg
MCAtIGJ1cnN0LW1vZGUKPiArICAgICAgICAgICAgICAgICAgICAgICAxIC0gbm9uLWJ1cnN0IHdp
dGggc3luYyBldmVudAo+ICsgICAgICAgICAgICAgICAgICAgICAgIDIgLSBub24tYnVyc3Qgd2l0
aCBzeW5jIHBvIHVsc2UKCk5vIHBvd2VyLXN1cHBseSBwcm9wZXJ0eT8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
