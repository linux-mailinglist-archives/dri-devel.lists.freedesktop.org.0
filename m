Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113935640E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463F66E2C8;
	Wed, 26 Jun 2019 08:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D103A6E100
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:19:48 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id i10so728293iol.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 06:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CjQxlcCcMybS1PlA3cbedI86fLsLoU2UaRYnx0yjR64=;
 b=adOKkDkMxa9lAkDlY+Wf2FtPbPESbZuIfA7kV0GZWbfc2/uTS7NQps4/UlUW6um51r
 jRrSvfEFjcp2Rt6UuLm3RE2hOlUY/YeC9Po2tm6AxET2w9l+ngj9aRyy8S05jOwJoz00
 uCY5/BpFTWf3bERQDbyCYIdyAr5kJ0WNCjqqAscALQxUlBhuUnOd/nRZkP0zol3if9Aa
 qhYysp9nNvGqOw2PfYoSGICX4+N4f7iU89skVXHnywl1ZuGiJtMQXSFxIeraBfpYQB/f
 ziCvQ4NvZ8zjGKFTgktsYY2+s2iDnQiU7K2EY3n+m3/UYMLNaNljMf1f8fxehlBD5QiB
 M10g==
X-Gm-Message-State: APjAAAUzFyq8kOM0myuTHEiiXA0xkjCdbl0kYR+0KZ1WDzAZL8sWAmxR
 o8zsQBxwEDpMojR/fVD9+wNxmBBHPkmCORWuxYetCw==
X-Google-Smtp-Source: APXvYqz8IMITSh/Xie95zh7BbBKKdq7Ur761LqrsqGuNmBgDWZZxs0U+4ZdvPrS8GrP20xK3X9tsxWaSp/jOQBj+4hM=
X-Received: by 2002:a6b:b256:: with SMTP id b83mr19284468iof.48.1561468788034; 
 Tue, 25 Jun 2019 06:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
 <20190624160330.38048-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190624160330.38048-3-hverkuil-cisco@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Tue, 25 Jun 2019 15:19:37 +0200
Message-ID: <CALFZZQGuAB9rt4Px0VXPwRE1HOipxmT7q1tF890bMBiNw2JLgA@mail.gmail.com>
Subject: Re: [PATCHv8 02/13] cec: add struct cec_connector_info support
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CjQxlcCcMybS1PlA3cbedI86fLsLoU2UaRYnx0yjR64=;
 b=KeT30z/A3i+X9U6BGJsY7TlwhrAfYCRSTkIx6yUYHoYcXKsERLYGzvZiDQjOSWqBVU
 8/o311LX4TqrP4Rp3nLMJRNHrZhqc39M/62AUtHJHOx/6oKxW6gBFHr41MrAh0cj6tQk
 1ipgm4HlNazyDETEXifCzS16ss6fdgFY02yeW5ykUG171fFJuoGW24HawgYMnkjNden+
 FYoInYEwrX/GQpuUJjTH3tOpQ+D5EvCqywQ3p3zlcsseVjbSt8Iuu2x9JsHS9fo12UuB
 Rm6ePAEkk7Qsw11WNRZyvNqbWc8MSMC7i7/k5V7l3oK2GrxGTVm168Bqfqr7AvnsFEid
 zj7A==
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
Cc: Cheng-yi Chiang <cychiang@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucy4KClBhdGNoZXMgMSBhbmQgMiBsb29rIGdvb2QgdG8gbWUuIFRoZXJlIGlzIG9uZSBj
b21tZW50IGhlcmUgdGhhdCBJCmZvcmdvdCB0byB1cGRhdGUgYXMgdGhlIGNvZGUgZXZvbHZlZC4K
Ck9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDY6MDMgUE0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1j
aXNjb0B4czRhbGwubmw+IHdyb3RlOgouLi4KPiArLyoqCj4gKyAqIHN0cnVjdCBjZWNfZXZlbnRf
Y29ubmVjdG9yIC0gdGVsbHMgaWYgYW5kIHdoaWNoIGNvbm5lY3RvciBpcyBhc3NvY2lhdGVkCj4g
KyAqIHdpdGggdGhlIENFQyBhZGFwdGVyLgo+ICsgKiBAY2FyZF9ubzogZHJtIGNhcmQgbnVtYmVy
Cj4gKyAqIEBjb25uZWN0b3JfaWQ6IGRybSBjb25uZWN0b3IgSUQKPiArICovCj4gK3N0cnVjdCBj
ZWNfZHJtX2Nvbm5lY3Rvcl9pbmZvIHsKPiArICAgICAgIF9fdTMyIGNhcmRfbm87Cj4gKyAgICAg
ICBfX3UzMiBjb25uZWN0b3JfaWQ7Cj4gK307Cj4gKwpUaGUgY29tbWVudCBmb3IgdGhlIGFib3Zl
IHN0cnVjdCBpcyBub3cgYXBwcm9wcmlhdGUgZm9yIHRoZSBzdHJ1Y3QgYmVsb3cuCgo+ICsjZGVm
aW5lIENFQ19DT05ORUNUT1JfVFlQRV9OT19DT05ORUNUT1IgICAgICAgIDAKPiArI2RlZmluZSBD
RUNfQ09OTkVDVE9SX1RZUEVfRFJNICAgICAgICAgMQo+ICtzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9p
bmZvIHsKPiArICAgICAgIF9fdTMyIHR5cGU7Cj4gKyAgICAgICB1bmlvbiB7Cj4gKyAgICAgICAg
ICAgICAgIHN0cnVjdCBjZWNfZHJtX2Nvbm5lY3Rvcl9pbmZvIGRybTsKPiArICAgICAgICAgICAg
ICAgX191MzIgcmF3WzE2XTsKPiArICAgICAgIH07Cj4gK307Cj4gKwoKQmVzdCByZWdhcmRzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
