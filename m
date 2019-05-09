Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7194183B9
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 04:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7898991E;
	Thu,  9 May 2019 02:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF6089873;
 Thu,  9 May 2019 02:25:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so618907edr.2;
 Wed, 08 May 2019 19:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dV00bhvitZyhUixU9bkcFkopWQ37LaEH0x2qCgsghaQ=;
 b=G5IjM+WPAqwI6b+c804RcyZKoLs35SNUQSTbFoxRCjYjbmucJ46PaqKk/tisaxE/ve
 sv8oWGbOhcvhiyzqZHYto2/CYHV0ly9ZJtA6TfySGFMoat5Pu5SVpcdzWmQkBjK27/qR
 HFb6HiX5BqGx9KPKWy6ylGiWJ8HkPD3rO7+fQCe8456iV+kAoQMDXvIanoQz4UsCCApR
 Jw/2qSWA4+7BW7XetDoZhd1llG4QqKil2WonFGELEk2gH0iIJoC6QIJpPUvbG8BVk8R/
 RwAwoz7yYmgC5CmWfQnyzwyXflRWEGRRSiKIqm/AKOxcevH6nwgqqIzR+OwfRPnyPwUf
 nU6g==
X-Gm-Message-State: APjAAAW4fkXuGUcKwyPqtYNuArRgGNilnMpUWsGxZVpI7ih7t6ODH9b2
 4rdY8T1giGVfet5hw26Es0gpDyrivyT+J00BBV0=
X-Google-Smtp-Source: APXvYqymS3jNPYoPoYTVXnqAuO2BYYvz7TS/SDyCdCXiOkfqcA7noytpW9Gx0yFP/avBPOcvjhRerfKKN4Q4vJQvmFc=
X-Received: by 2002:a50:9441:: with SMTP id q1mr1091789eda.101.1557368753776; 
 Wed, 08 May 2019 19:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro> <20190509021616.GA26228@basecamp>
In-Reply-To: <20190509021616.GA26228@basecamp>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 May 2019 19:25:44 -0700
Message-ID: <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] ARM: dts: msm8974: add display support
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dV00bhvitZyhUixU9bkcFkopWQ37LaEH0x2qCgsghaQ=;
 b=fEf4IWGadCTWVwexFcQu9G5ffqcmzFCHyG2Y7VEWUC++JswOh9aeE5P+25F8g5ai6S
 uW1EZ8MgoDpiTEEwHQENtrcCTBaO5lzyTFf1ROoIVD31KFKY0FyN7KZzwZb2a1YAGx8z
 gfuW6K+13N39gmPdrPYvc/1oQrSSX24ZoHQvqWQ3H+c78bZEiMnQIunySmy411OO85Wr
 sqzUJnGN9kr0kvQdsiD5e9ir8lFZc8qIM2aX5uBaoQqr1PQJjMcZNPvLxQi9W9OtZCo3
 iGeq9K6qBoYuva44haY7ZuA49TOmNUdDtbBGb7+K8cKWgO3sa704DVvPekcbrRgCuwXT
 HX2g==
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgOCwgMjAxOSBhdCA3OjE2IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDExOjM5OjAyUE0g
LTA3MDAsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToKPiA+IE9uIFN1biAwNSBNYXkgMDY6MDQgUERU
IDIwMTksIEJyaWFuIE1hc25leSB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0
LmR0c2kKPiA+IFsuLl0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9
IDwmbW1jYyBNRFNTX01EUF9DTEs+LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPCZtbWNjIE1EU1NfQUhCX0NMSz4sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8Jm1tY2MgTURTU19BWElfQ0xLPiwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmbW1jYyBNRFNTX0JZVEUwX0NMSz4sCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Jm1tY2MgTURTU19QQ0xLMF9DTEs+
LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZtbWNjIE1EU1Nf
RVNDMF9DTEs+LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZt
bWNjIE1NU1NfTUlTQ19BSEJfQ0xLPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNsb2NrLW5hbWVzID0gIm1kcF9jb3JlIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgImlmYWNlIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgImJ1cyIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJieXRlIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInBpeGVsIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgImNvcmUiLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiY29yZV9tbXNzIjsKPiA+Cj4gPiBVbmxlc3MgSSBlbmFibGUgTU1TU19N
TVNTTk9DX0FYSV9DTEsgYW5kIE1NU1NfUzBfQVhJX0NMSyBJIGdldCBzb21lCj4gPiB1bmRlcnJ1
biBlcnJvciBmcm9tIERTSS4gWW91IGRvbid0IHNlZSBhbnl0aGluZyBsaWtlIHRoaXM/Cj4gPgo+
ID4gKFRoZXNlIGNsb2NrcyBhcmUgY29udHJvbGxlZCBieSBtc21fYnVzIGRvd25zdHJlYW0gYW5k
IHNob3VsZCBiZSBkcml2ZW4KPiA+IGJ5IGludGVyY29ubmVjdCB1cHN0cmVhbSkKPiA+Cj4gPgo+
ID4gQXBhcnQgZnJvbSB0aGlzLCBJIHRoaW5rIHRoaXMgbG9va3MgbmljZS4gSGFwcHkgdG8gc2Vl
IHRoZSBwcm9ncmVzcy4KPgo+IE5vLCBJJ20gbm90IHNlZWluZyBhbiB1bmRlcnJ1biBlcnJvcnMg
ZnJvbSB0aGUgRFNJLiBJIHRoaW5rIHRoZSBjbG9ja3MKPiBhcmUgZmluZSBzaW5jZSBJJ20gYWJs
ZSB0byBnZXQgdGhpcyB3b3JraW5nIHdpdGggNC4xNyB1c2luZyB0aGVzZSBzYW1lCj4gY2xvY2tz
LiBJIGp1c3Qgc2VudCBvdXQgdjIgYW5kIHRoZSBjb3ZlciBsZXR0ZXIgaGFzIHNvbWUgZGV0YWls
cywgYWxvbmcKPiB3aXRoIHRoZSBmdWxsIGRtZXNnLgoKc2luY2Ugd2UgZG9uJ3QgaGF2ZSBpbnRl
cmNvbm5lY3QgZHJpdmVyIGZvciA4OTc0LCBJIGd1ZXNzIHRoZXJlIGlzCnNvbWUgY2hhbmNlIHRo
YXQgdGhpbmdzIHdvcmsgb3Igbm90IGJhc2VkIG9uIGhvdyBsayBsZWF2ZXMgdGhpbmdzPwoKQlIs
Ci1SCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
