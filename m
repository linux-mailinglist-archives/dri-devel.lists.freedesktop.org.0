Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2553172EA7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368016E4DE;
	Wed, 24 Jul 2019 12:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969CB6E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:26:21 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m24so87834216ioo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0rTt0PWs8SlpFEmIlcfrWeoOuNH1aWKTFUUCUoidq3I=;
 b=Y+Os4XiCpI1ClmntI8DYtokF+ieDHzc4O9c5ymINFk2LWZxUD8YnpM9Rtk3oLmOZlx
 fYmrqMxigf9iLVZytuYsVCwOEd7MYTfAYWXOgCYsBW2gRmkuV8sIrx/qaiFdOTkH8MZU
 QN35BH8ZwCZxBWe2UKAlonDloTXfP4mei8qSi81GGhc1GPAf3SRBMd+7Ry5m7c2PgLYf
 fdC+gzvOBSo7fw30q/jnkruIKtnDR4wKMtZmgVyvqF381XGupoVa+xLvkzd9XIT+oORE
 nEOZ+PWuC2BDm2oSr+lMG53x9XI2GGLEd4KkD5n6HpxWRc5M81PixpeQLxYsWs4HPNqA
 F62A==
X-Gm-Message-State: APjAAAXwm0m8oe3sEHDF4UiflQu9NiKT8iiBPrNRRJNXHUsnY5iQf+t5
 Wf0f6BCbTzEWlzovNberAJiQ5VueO+lwCc7wXAk=
X-Google-Smtp-Source: APXvYqzLUytR+h+JqxzA0jh/OfN1pkCtT3uoRs01qtgiGnfU4aT24rqrogERbdvlD5vcFQubZ9LAL7ZCQLkdsMP8f5A=
X-Received: by 2002:a5d:80c3:: with SMTP id h3mr67287206ior.167.1563956780894; 
 Wed, 24 Jul 2019 01:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-8-brgl@bgdev.pl>
 <20190722160908.GZ9224@smile.fi.intel.com>
 <CAMRc=McGTk+i0SzWN7AvGu3deYbXX_rJX=7+dKRpKFPKM_qxDA@mail.gmail.com>
 <20190723153426.GL9224@smile.fi.intel.com>
In-Reply-To: <20190723153426.GL9224@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jul 2019 10:26:10 +0200
Message-ID: <CAMRc=MfbSUAoEeD-KhmiV57dT2mcQTftLjNbdnFYJ59e6X5QDQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0rTt0PWs8SlpFEmIlcfrWeoOuNH1aWKTFUUCUoidq3I=;
 b=deaX2weZdsR6CofrHgiWHgzvTlM6h0FNL2PCIdFa3ZeR+qEBKz/x2vejPlXRHVbmMl
 JcIU64QqYqXdMxbvfzRnMtxCpqigpmmONPmag0B3S94ydkRIBrNpe+pn6g1aMLWZubZ6
 UTzvInvq4w6iEOuIXPRd561yuPuJSvUrs266ftIc1nWLg3ThVkDpL/f+JQCyW061otPx
 iMDnLvksu7iT66jS8dBgADOsTBJhFtV7c5959cGfsIwCrCTAUGbyH+sqfbEEaX/g7W9P
 LzHLbNF3ottZFcV9EwyxFemoIAjtlIYkP3wQJVnx/oskfEntjJZYTsB3vBBLbKrJ4T5I
 5YeQ==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

d3QuLCAyMyBsaXAgMjAxOSBvIDE3OjM0IEFuZHkgU2hldmNoZW5rbwo8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPiBuYXBpc2HFgihhKToKPgo+IE9uIFR1ZSwgSnVsIDIzLCAyMDE5
IGF0IDA4OjI5OjUyQU0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBwb24u
LCAyMiBsaXAgMjAxOSBvIDE4OjA5IEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4gbmFwaXNhxYIoYSk6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgSnVs
IDIyLCAyMDE5IGF0IDA1OjAzOjAyUE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6
Cj4gPiA+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJl
LmNvbT4KPiA+ID4gPgo+ID4gPiA+IEluc3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2gg
dGltZSwgdXNlIGEgaGVscGVyIHZhcmlhYmxlIGZvcgo+ID4gPiA+IHRoZSBhc3NvY2lhdGVkIGRl
dmljZSBwb2ludGVyLgo+ID4gPgo+ID4gPiA+ICBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ID4gIHsKPiA+ID4gPiAtICAg
ICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSAqcGRhdGEgPQo+ID4gPiA+IC0g
ICAgICAgICAgICAgZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsKPiA+ID4gPiArICAgICBz
dHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSAqcGRhdGE7Cj4gPiA+ID4gICAgICAg
c3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzIHByb3BzOwo+ID4gPiA+ICAgICAgIHN0cnVjdCBi
YWNrbGlnaHRfZGV2aWNlICpibDsKPiA+ID4gPiAgICAgICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQg
KmdibDsKPiA+ID4gPiAgICAgICBlbnVtIGdwaW9kX2ZsYWdzIGZsYWdzOwo+ID4gPiA+ICsgICAg
IHN0cnVjdCBkZXZpY2UgKmRldjsKPiA+ID4KPiA+ID4gQ2FuJ3Qgd2UgZG8KPiA+ID4KPiA+ID4g
ICAgICAgICBzdHJ1Y3QgZGV2aWNlIGRldiA9ICZwZGV2LT5kZXY7Cj4gPiA+ICAgICAgICAgc3Ry
dWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0
YShkZXYpOwo+ID4gPgo+ID4gPiA/IEl0IGZpdHMgODAgbmljZWx5Lgo+ID4gPgo+ID4KPiA+IElN
TyBpdCdzIG1vcmUgcmVhZGFibGUgbGlrZSB0aGF0IHdpdGggdGhlIHJldmVyc2UgY2hyaXN0bWFz
IHRyZWUgbGF5b3V0Lgo+Cj4gSXQgbWFrZXMgbW9yZSBjaHVybiBpbiB0aGUgb3JpZ2luYWwgY29k
ZSBhbmQgZm9yIGluaXRpYWxpemVycyB0aGUgb3JkZXIgaXMKPiBkZWZpbmVkIGJ5IGl0cyBuYXR1
cmUuCj4KPiAtLQo+IFdpdGggQmVzdCBSZWdhcmRzLAo+IEFuZHkgU2hldmNoZW5rbwo+Cj4KCkZh
aXIgZW5vdWdoLCBJIGNoYW5nZWQgaXQgaW4gdjMuCgpCYXJ0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
