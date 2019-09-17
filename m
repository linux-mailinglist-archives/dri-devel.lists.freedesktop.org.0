Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856BB459A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 04:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449136EADF;
	Tue, 17 Sep 2019 02:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D636EADF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 02:43:44 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id a1so3945470ioc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 19:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8i6y9BcswUwxDG8PRuSI4um6ADi5O8L1cEP8Y4YnQbM=;
 b=I7Tl/uqdlSjMZwXdIncBkdoSUUWsOu0KbskvP+wfZECr65PZgZ9XgPHsjyP7uXfLQv
 tRsER3RxmDH1gLUgeXmgmBwLd5Pl0hGGEhOxDsP3NLz4b1fef8dP/g3m90Us22rC5Acj
 CY3d+xtWnBzOyk+YCNFW+xpJzagmAU77hm7kPW5eN9DbRGAg+xMXYlM8pqO9CPPZ8k4I
 NdjpSQnghsifdnfa4f/P/ppnPaJWl1BnJgBs1JIjalLlBUngBcmhGgJ4hUsMVkjDjMLS
 JtyOODdpDDoP4pL08I+cmdC8xqllaPQEmzdJeSoDdGyGf4jVXhaAvwezuPRl/KYm/eRE
 z1Qw==
X-Gm-Message-State: APjAAAXsh1mYNO/xnHTAv/obRUPMK6rVmCBkaKXiW92JOwjBG07dlUcK
 W948+Pidoyli70lKbf89Ywo9c8tHO20xCW0REfk=
X-Google-Smtp-Source: APXvYqzeJ+TNQWUjrodNrq8QcCsOV7BTjocJNcMZELwoxBqqTm0m2jUCi4tBN4jl2viWNfUXSX12dO5NB6pU9tUsgg0=
X-Received: by 2002:a5d:9b02:: with SMTP id y2mr1207664ion.146.1568688223539; 
 Mon, 16 Sep 2019 19:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190915211818.GH4352@sirena.co.uk>
 <CA+E=qVfm78f+2a2s=8Q7tL-fP7xCEj0v=_JXD_XbaR-2dfXmCA@mail.gmail.com>
In-Reply-To: <CA+E=qVfm78f+2a2s=8Q7tL-fP7xCEj0v=_JXD_XbaR-2dfXmCA@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 17 Sep 2019 10:43:32 +0800
Message-ID: <CAKGbVbvXD1XatAbC=yMO4X3usQSXMqHXCXhycU8afiKez_CHmA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
To: Vasily Khoruzhick <anarsoul@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8i6y9BcswUwxDG8PRuSI4um6ADi5O8L1cEP8Y4YnQbM=;
 b=CuA6rqyv0kHYgLtz1aSpPSoR7yFN4Eza0QUI6d1In3kgKq15yj+7RO4K6Ow4DyWyg/
 945CDD8FjbZlskpwVxaj2g2KdG0DhzsPCvbnwVe605mcLMVt9KOS1ok/xoRE6LO0CvKR
 shqWF25DsggrCMKpzFOUjWQyW51QMa8n6uAebwgZ6ta4HtPryiXJ4bMEepplWhr99COe
 jNw70hW2Is30/OUAEuOPub7AYYNtpYHMRGTMyWFt9wRKAIN5SDelH0grgitCTMkkKg4+
 i23wAAc0W60MS8j3HzuPqL8Wy45ZeFschcc++5hls0dgX8JGmlISGyCoaCr8Py/J0aRs
 l5QA==
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
Cc: Dave Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgMTozMCBQTSBWYXNpbHkgS2hvcnV6aGljayA8YW5hcnNv
dWxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgU2VwIDE1LCAyMDE5IGF0IDI6MTggUE0g
TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBhbGwsCj4K
PiBIaSBNYXJrLAo+Cj4gPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhlIGRybSB0cmVl
IGdvdCBhIGNvbmZsaWN0IGluOgo+ID4KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9n
ZW0uYwo+ID4KPiA+IGJldHdlZW4gY29tbWl0Ogo+ID4KPiA+ICAgMjE2NzBiZDc4YTI1MDAxY2Y4
ZSAoImRybS9saW1hOiBmaXggbGltYV9nZW1fd2FpdCgpIHJldHVybiB2YWx1ZSIpCj4gPgo+ID4g
ZnJvbSB0aGUgZHJtLW1pc2MtZml4ZXMgdHJlZSBhbmQgY29tbWl0Ogo+ID4KPiA+ICAgNTI3OTFl
ZWVjMWQ5ZjRhN2U3ZiAoImRtYS1idWY6IHJlbmFtZSByZXNlcnZhdGlvbl9vYmplY3QgdG8gZG1h
X3Jlc3YiKQo+ID4KPiA+IGZyb20gdGhlIGRybSB0cmVlLgo+ID4KPiA+IEkgZml4ZWQgaXQgdXAg
KHNlZSBiZWxvdykgYW5kIGNhbiBjYXJyeSB0aGUgZml4IGFzIG5lY2Vzc2FyeS4gVGhpcwo+ID4g
aXMgbm93IGZpeGVkIGFzIGZhciBhcyBsaW51eC1uZXh0IGlzIGNvbmNlcm5lZCwgYnV0IGFueSBu
b24gdHJpdmlhbAo+ID4gY29uZmxpY3RzIHNob3VsZCBiZSBtZW50aW9uZWQgdG8geW91ciB1cHN0
cmVhbSBtYWludGFpbmVyIHdoZW4geW91ciB0cmVlCj4gPiBpcyBzdWJtaXR0ZWQgZm9yIG1lcmdp
bmcuICBZb3UgbWF5IGFsc28gd2FudCB0byBjb25zaWRlciBjb29wZXJhdGluZwo+ID4gd2l0aCB0
aGUgbWFpbnRhaW5lciBvZiB0aGUgY29uZmxpY3RpbmcgdHJlZSB0byBtaW5pbWlzZSBhbnkgcGFy
dGljdWxhcmx5Cj4gPiBjb21wbGV4IGNvbmZsaWN0cy4KPgo+IEZpeCBsb29rcyBjb3JyZWN0IHRv
IG1lLiBTb3JyeSBmb3Igbm90IHRlc3RpbmcgbXkgcGF0Y2ggd2l0aAo+IGxpbnV4LW5leHQsIEkn
bGwgbWFrZSBzdXJlIGl0IGF0IGxlYXN0IGNvbXBpbGVzIG5leHQgdGltZS4KClRoaXMgaXMgbWVy
Z2UgY29uZmxpY3QsIG5vdCBjb21waWxlIGZhaWwsIGJlY2F1c2UgbGludXgtbmV4dCBhbmQgZHJt
LW1pc2MtZml4ZXMKYXJlIGJhc2VkIG9uIGRpZmZlcmVudCBjb2RlIGJhc2UsIHNvIGRybS1taXNj
LWZpeGVzIGRvIG5vdCBjb250YWluIGxhdGVzdCBkcm0KY29tbWl0cy4KClRoaXMgY29uZmxpY3Qg
c29sdmUgY2hhbmdlIGlzIGFsc28gT0sgZm9yIG1lLgoKVGhhbmtzLApRaWFuZwoKPgo+ID4gZGlm
ZiAtLWNjIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKPiA+IGluZGV4IGI2MDlkYzAz
MGQ2Y2EsZmYzZDlhY2MyNGZjZi4uMDAwMDAwMDAwMDAwMAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2xpbWEvbGltYV9nZW0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9n
ZW0uYwo+ID4gQEBAIC0zNDEsOCAtMzQxLDggKzM0MSw4IEBAQCBpbnQgbGltYV9nZW1fd2FpdChz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbGUKPiA+Cj4gPiAgICAgICAgIHRpbWVvdXQgPSBkcm1fdGltZW91
dF9hYnNfdG9famlmZmllcyh0aW1lb3V0X25zKTsKPiA+Cj4gPiAtICAgICAgIHJldCA9IGRybV9n
ZW1fcmVzZXJ2YXRpb25fb2JqZWN0X3dhaXQoZmlsZSwgaGFuZGxlLCB3cml0ZSwgdGltZW91dCk7
Cj4gPiArICAgICAgIHJldCA9IGRybV9nZW1fZG1hX3Jlc3Zfd2FpdChmaWxlLCBoYW5kbGUsIHdy
aXRlLCB0aW1lb3V0KTsKPiA+ICAtICAgICAgaWYgKHJldCA9PSAwKQo+ID4gICsgICAgICBpZiAo
cmV0ID09IC1FVElNRSkKPiA+ICAgICAgICAgICAgICAgICByZXQgPSB0aW1lb3V0ID8gLUVUSU1F
RE9VVCA6IC1FQlVTWTsKPiA+Cj4gPiAgICAgICAgIHJldHVybiByZXQ7Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
