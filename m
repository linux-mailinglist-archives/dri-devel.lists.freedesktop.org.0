Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47B720E1A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 19:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C2E8970E;
	Thu, 16 May 2019 17:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0998970E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 17:40:55 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id c24so2856011vsp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgE84Psb/U3etWxpJVt5b8VqKHdbZZrtGPq4Io8QnvM=;
 b=d1Vjaa9Aj6cb3W2yEY27AAce/L63uXud8OR3imoIU/qSIeeixWkw6NQBctudO+YerI
 q8APfGCmNCXG1g3F3gIHqYu8bTy5uWoX4MngTzd83HjrAe9JhIIDwVxTPKYPp6x5Pji2
 uBlBldzyU27wLU3PsjTzTBlDfdZaI0emUlUg4ZBHULe0+vMcTX3uVvAWHjkTfUc6mmvV
 2weaCcFdC8bB8529sDGoVLJ0CmkEcFdpzlmqiS05fKF75/XQKtvOsSQ74dn3adcfjilw
 CMo/tbClmZk3KOgbHMBAFNfI7jBgniPHiY8nZJfxkmgwCQeyOxuuQRPNkzIem+eAXfew
 qPGQ==
X-Gm-Message-State: APjAAAUbiivDLn7FBJGLopYGF6THw6uOKCc1/9/iD81MVkq2Kbu45UvY
 Li07q/wFMZK3Xhj8+auGQMPjQnEnCyA=
X-Google-Smtp-Source: APXvYqwPqPW8igJjJe9RX1FdnCLZ6cFJ5d3BGyQ+8JieNjQTsmO6y9SKN84jMVFaSw64hRAf8U2ybQ==
X-Received: by 2002:a67:edc8:: with SMTP id e8mr24530470vsp.190.1558028454813; 
 Thu, 16 May 2019 10:40:54 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
 by smtp.gmail.com with ESMTPSA id r70sm5003368vke.36.2019.05.16.10.40.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 10:40:54 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id e2so2837239vsc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:40:53 -0700 (PDT)
X-Received: by 2002:a67:1cc2:: with SMTP id c185mr1516432vsc.20.1558028453360; 
 Thu, 16 May 2019 10:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190516172510.181473-1-mka@chromium.org>
In-Reply-To: <20190516172510.181473-1-mka@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 May 2019 10:40:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQcv1+HC2eAk2ctBofufCi9-VvWc+OnY0mtBw3L-YG+Q@mail.gmail.com>
Message-ID: <CAD=FV=UQcv1+HC2eAk2ctBofufCi9-VvWc+OnY0mtBw3L-YG+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: add #cooling-cells property to
 the ARM Mali Midgard GPU binding
To: Matthias Kaehlcke <mka@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dgE84Psb/U3etWxpJVt5b8VqKHdbZZrtGPq4Io8QnvM=;
 b=AIRBhrVhFgw7bH2pwHcH9I6R1AqBcsTlPNnNcXJpBf/pEYgcBTvHtbbQvYiD0GdjC3
 Vcii/zl8/NPtJhsrz/3lINqpDAb6oedjkKAJK8LzPcY1+uUm6aNi4S9Dtla3/QabW+ws
 yU6hWLGod2ZBeAEJzafr03Uc6WR2SvzI45sUc=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMDoyNSBBTSBNYXR0aGlhcyBLYWVobGNrZSA8
bWthQGNocm9taXVtLm9yZz4gd3JvdGU6Cgo+IFRoZSBHUFUgY2FuIGJlIHVzZWQgYXMgYSB0aGVy
bWFsIGNvb2xpbmcgZGV2aWNlLCBhZGQgYW4gb3B0aW9uYWwKPiAnI2Nvb2xpbmctY2VsbHMnIHBy
b3BlcnR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1
bS5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIHBhdGNoIGFkZGVkIHRvIHRoZSBzZXJp
ZXMKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFs
aS1taWRnYXJkLnR4dCB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2Fy
bSxtYWxpLW1pZGdhcmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
dS9hcm0sbWFsaS1taWRnYXJkLnR4dAo+IGluZGV4IDE4YTJjZGUyZTVmMy4uNjFmZDQxYTIwZjk5
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJt
LG1hbGktbWlkZ2FyZC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0Cj4gQEAgLTM3LDYgKzM3LDggQEAgT3B0aW9uYWwg
cHJvcGVydGllczoKPiAgLSBvcGVyYXRpbmctcG9pbnRzLXYyIDogUmVmZXIgdG8gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL29wcC9vcHAudHh0Cj4gICAgZm9yIGRldGFpbHMuCj4K
PiArLSAjY29vbGluZy1jZWxsczogUmVmZXIgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RoZXJtYWwvdGhlcm1hbC50eHQKPiArICBmb3IgZGV0YWlscy4KPgo+ICBFeGFtcGxl
IGZvciBhIE1hbGktVDc2MDoKPgo+IEBAIC01MSw2ICs1Myw3IEBAIGdwdUBmZmEzMDAwMCB7Cj4g
ICAgICAgICBtYWxpLXN1cHBseSA9IDwmdmRkX2dwdT47Cj4gICAgICAgICBvcGVyYXRpbmctcG9p
bnRzLXYyID0gPCZncHVfb3BwX3RhYmxlPjsKPiAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBv
d2VyIFJLMzI4OF9QRF9HUFU+Owo+ICsgICAgICAgI2Nvb2xpbmctY2VsbHMgPSA8Mj47Cj4gIH07
CgpZb3Ugd2lsbCBjb25mbGljdCB3aXRoIGQ1ZmYxYWRiMzgwOSAoImR0LWJpbmRpbmdzOiBncHU6
IG1hbGktbWlkZ2FyZDoKQWRkIHJlc2V0cyBwcm9wZXJ0eSIpLCBidXQgaXQncyBlYXN5IHRvIHJl
YmFzZS4gIEknbGwgbGVhdmUgaXQgdG8Kd2hvZXZlciBpcyBnb2luZyB0byBsYW5kIHRoaXMgdG8g
ZGVjaWRlIGlmIHRoZXkgd291bGQgbGlrZSB5b3UgdG8KcmUtcG9zdCBvciBpZiB0aGV5IGNhbiBo
YW5kbGUgcmVzb2x2aW5nIHRoZSBjb25mbGljdCB0aGVtc2VsdmVzLgorS2V2aW4gd2hvIGFwcGVh
cnMgdG8gYmUgdGhlIG9uZSB3aG8gbGFuZGVkIHRoZSBjb25mbGljdGluZyBjb21taXQuCgpXaXRo
IHRoYXQ6CgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0u
b3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
