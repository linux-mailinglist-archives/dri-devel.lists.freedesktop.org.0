Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ADAD4075
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778866E113;
	Fri, 11 Oct 2019 13:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01C6E113
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:07:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j18so11846837wrq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 06:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zVg2xbr1PraFjyIgSGU9riJaRjOm8BqZCaOALjBKqUw=;
 b=WhM1ARFjeuhv2MeIrZj1a0hSZjHkJvJNRAM1XA2SneL4QcCzgtq7ipO0fK/tfgQmDF
 C2S0ifmZ5Ao6M8Iw46p8PDQRw94EFOT98DoE+dAN1sfWe1i6c5x3Ohsr/qCCDz9Y0EVT
 6dywVdZ7Fo2To0JhJ+gs2HV/4gD9Ofn2h0dDtG3nnYV3KM2wibZbmMs7VJcE9lnUBw1x
 6NhjG8XZ9oTlSWaNspJQf8krlmDteUWkGSjKx6XK0IWhfaCMLURviIqOq+uo5y07xVFh
 TivXSji0aNBcwsVvK0xHE854M/AaO+/uLK53jvhbcDCr1PYcRp/hESVbf7yk3M3mwBe5
 kF8Q==
X-Gm-Message-State: APjAAAV4sXvysG0T2QswtR8ZsJmqD30L0ABGI6yBUsFMov72KFLgGTzx
 MPBEvNSwH12aoyXmZ7tfZubLU0mQyl2PZJB43rs=
X-Google-Smtp-Source: APXvYqyjODu756cYC1ZXLnE9CnwZm1IOe5anaDetwbx14CnUvMkZzs3FgNfVNlB5rbHfALBrq3nJSONUkbIAIbBveUk=
X-Received: by 2002:adf:ed02:: with SMTP id a2mr140100wro.11.1570799276758;
 Fri, 11 Oct 2019 06:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191009121447.31017-1-ben.dooks@codethink.co.uk>
 <6f09197a-d266-aa00-47b8-dd3deede59c9@codethink.co.uk>
In-Reply-To: <6f09197a-d266-aa00-47b8-dd3deede59c9@codethink.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 11 Oct 2019 09:07:44 -0400
Message-ID: <CADnq5_PnCak2gVQSC-WK-Hs=+RorTr__Z3Lqu5MfhP_YJZe00g@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: make unexported items static
To: Ben Dooks <ben.dooks@codethink.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zVg2xbr1PraFjyIgSGU9riJaRjOm8BqZCaOALjBKqUw=;
 b=RxQXGPcrjMc2Y8SDKZHxv30ziRrE48WNW7ApX73Sl6uZGBvLWY2rwARwjzIRODFxtt
 NyuS6t4yG6sjOSsI4NtJm/uVNGU3IXaHYgg8MdSr5raG3iCNkk53glmCXhBqOTlpmI8O
 PEbQWSDAvmdhv+3yUfA5L7W1F2sFBiFEKtNGnOdygejPHXHCU+93hAjz+RhUSrONb+oX
 SIvwaCb6Yzu4tIhReWrAEM2OUS82nxqNgu0JMYm2reA2Q8YdX9mC6qKci+ApD5Wh8jp1
 5w8hfPJHJdLoQ7JYL+tjm+JiiBsCoWNOcdXIHMmQlM/XKNkXpAS60gcdZ4xlOf34tPPP
 ApGg==
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
Cc: linux-kernel@lists.codethink.co.uk, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxyZWFkeSBhcHBsaWVkLiAgdGhhbmtzLgoKQWxleAoKT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQg
Mjo0OCBBTSBCZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+IHdyb3RlOgo+Cj4g
T24gMDkvMTAvMjAxOSAxMzoxNCwgQmVuIERvb2tzIHdyb3RlOgo+ID4gVGhlIGRybV9zY2hlZF9m
ZW5jZV9vcHNfe3NjaGVkdWxlZCxmaW5pc2hlZH0gYXJlIG5vdCBleHBvcnRlZAo+ID4gZnJvbSB0
aGUgZmlsZSBzbyBtYWtlIHRoZW0gc3RhdGljIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcKPiA+IHdh
cm5pbmdzIGZyb20gc3BhcnNlOgo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfZmVuY2UuYzoxMzE6Mjg6IHdhcm5pbmc6IHN5bWJvbCAnZHJtX3NjaGVkX2ZlbmNlX29wc19z
Y2hlZHVsZWQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4gPiBkcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2ZlbmNlLmM6MTM3OjI4OiB3YXJuaW5nOiBzeW1i
b2wgJ2RybV9zY2hlZF9mZW5jZV9vcHNfZmluaXNoZWQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9v
a3NAY29kZXRoaW5rLmNvLnVrPgo+Cj4gSWYgaXQgaXMgdXNlZnVsIEkgY2FuIGdldCB0aGVzZSBp
bnRvIGEgcHVibGljIGdpdCByZXBvIGFuZCBzZW5kCj4gYSBwdWxsIHJlcXVlc3QuCj4KPiAtLQo+
IEJlbiBEb29rcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodHRwOi8vd3d3LmNvZGV0
aGluay5jby51ay8KPiBTZW5pb3IgRW5naW5lZXIgICAgICAgICAgICAgICAgICAgICAgICAgQ29k
ZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwo+Cj4gaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVr
L3ByaXZhY3kuaHRtbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
