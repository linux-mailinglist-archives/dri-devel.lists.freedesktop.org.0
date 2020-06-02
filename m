Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6491EBD83
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 16:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC12B6E3DB;
	Tue,  2 Jun 2020 14:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613E26E3DB;
 Tue,  2 Jun 2020 14:00:32 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g12so1366598pll.10;
 Tue, 02 Jun 2020 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7yBqRQ05m/Z4dmTqP2jf4amoRtlJTzK7ps3isjshOVc=;
 b=BYLCVngy4uvXcIBPOgBUgVA0OPaE+H9Fyfe9LVc4F4uRNZXwKG1fmWo90RbVuFdj2h
 3VSgFyffB6NjRiZG+jajuSTEagKpWwT8ZLfryOA7RcaVRV3s57dUZGAGd/QeFaXOKSwN
 wNicNnfkZQHReNgWl0ZUZ6e/OEe5N3ppU6i4QtSFoOfo7QOX3U8HCQ11vyiP680D6vJU
 m4HXHkMCbfQzopvgRyWnUi9Ep/1/CjKLH7xvxAu2KZuk/mVwA9NycekR1paT5abB5qRO
 tcDU1qOcqKNaosOCMDzgpMb9XiDWRPgNIW4a8pre/lp/T+/zExpaJ5ifhkEElourHw2i
 J+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7yBqRQ05m/Z4dmTqP2jf4amoRtlJTzK7ps3isjshOVc=;
 b=ewphgVGfBc/Ms2KeSf+DaGZmVby+9BUfrSQcG5HSvMcAQ98UgDt9UZ97tj2/ocoZdn
 9FtPFjnJcoZe06s/A4bklRhZp6EtHdc8T4eDoNV3IHf5sqhhRPeMCu2cT7Gr5QRTi3wi
 qc5F9XAeDF1PxtpwJyBJ2aRLaaThBIRBsgG9NQvmWz0DIcCmiyL+ryv0He5thRcovaoU
 lqVF8KSwd+vbo+S+eu0YExfJASSVRU+gs1Yop4+lBHH2r7N20rKp3IsQG9rvkc2rCNhu
 Wf0BZ40Ez+yho7d5QT47WkZ4lFt2zvj2USWJ3cOBEMwkUfEhsWLDbkCve3j544Y5IIw/
 vVng==
X-Gm-Message-State: AOAM533QnoiX0jwv44TBhuGKUsECfws7v8QzwhH6KS1D3abuSk51ZVpk
 m5+Om5RyZDohZMHb89SiTTaik+6n7w4tbVqzJvI=
X-Google-Smtp-Source: ABdhPJxbQimuLaI1bwYXtc/xXdK9j/EbdTfKTdAZ6xD5IZjH/RkMWlo/QACxutOeZs5hbdkLutmcnDZurql5j/rBV8g=
X-Received: by 2002:a17:90a:1704:: with SMTP id
 z4mr5657315pjd.181.1591106431949; 
 Tue, 02 Jun 2020 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200602092030.31966-1-piotr.stankiewicz@intel.com>
 <14063C7AD467DE4B82DEDB5C278E8663010E23E538@FMSMSX108.amr.corp.intel.com>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663010E23E538@FMSMSX108.amr.corp.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jun 2020 17:00:20 +0300
Message-ID: <CAHp75Vfe5dQkOiFoAZx5b-NS1afiD-YC_w+5LcX8P1Hm0ASenA@mail.gmail.com>
Subject: Re: [PATCH 07/15] drm/amdgpu: use PCI_IRQ_MSI_TYPES where appropriate
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Stankiewicz, Piotr" <piotr.stankiewicz@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMiwgMjAyMCBhdCA0OjM4IFBNIFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5q
LnJ1aGxAaW50ZWwuY29tPiB3cm90ZToKPiA+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+
IE9uIEJlaGFsZiBPZgo+ID5QaW90ciBTdGFua2lld2ljego+ID5TZW50OiBUdWVzZGF5LCBKdW5l
IDIsIDIwMjAgNToyMSBBTQo+ID5UbzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPjsgQ2hyaXN0aWFuIEvDtm5pZwo+ID48Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsg
RGF2aWQgWmhvdSA8RGF2aWQxLlpob3VAYW1kLmNvbT47IERhdmlkCj4gPkFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+Q2M6IFN0YW5r
aWV3aWN6LCBQaW90ciA8cGlvdHIuc3RhbmtpZXdpY3pAaW50ZWwuY29tPjsgZHJpLQo+ID5kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBs
aW51eC0KPiA+a2VybmVsQHZnZXIua2VybmVsLm9yZwo+ID5TdWJqZWN0OiBbUEFUQ0ggMDcvMTVd
IGRybS9hbWRncHU6IHVzZSBQQ0lfSVJRX01TSV9UWVBFUyB3aGVyZQo+ID5hcHByb3ByaWF0ZQoK
Li4uCgo+ID4gICAgICAgICAgICAgICBpbnQgbnZlYyA9IHBjaV9tc2l4X3ZlY19jb3VudChhZGV2
LT5wZGV2KTsKPiA+ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzOwo+ID4KPiA+LSAg
ICAgICAgICAgICAgaWYgKG52ZWMgPD0gMCkgewo+ID4rICAgICAgICAgICAgICBpZiAobnZlYyA+
IDApCj4gPisgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgPSBQQ0lfSVJRX01TSV9UWVBFUzsK
PiA+KyAgICAgICAgICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGZsYWdzID0g
UENJX0lSUV9NU0k7Cj4gPi0gICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPi0gICAgICAgICAgICAg
ICAgICAgICAgZmxhZ3MgPSBQQ0lfSVJRX01TSSB8IFBDSV9JUlFfTVNJWDsKPiA+LSAgICAgICAg
ICAgICAgfQo+Cj4gTWlub3Igbml0Ogo+Cj4gSXMgaXQgcmVhbGx5IG5lY2Vzc2FyeSB0byBzZXQg
ZG8gdGhpcyBjaGVjaz8gIENhbiBmbGFncyBqdXN0Cj4gYmUgc2V0Pwo+Cj4gSS5lLjoKPiAgICAg
ICAgIGZsYWdzID0gUENJX0lSUV9NU0lfVFlQRVM7Cj4KPiBwY2lfYWxsb2NfaXJxX3ZlY3Rvcigp
IHRyaWVzIHN0dWZmIGluIG9yZGVyLiAgSWYgTVNJWCBpcyBub3QgYXZhaWxhYmxlLAo+IGl0IHdp
bGwgdHJ5IE1TSS4KClRoYXQncyBhbHNvIHdoYXQgSSBwcm9wb3NlZCBlYXJsaWVyLiBCdXQgSSBz
dWdnZXN0ZWQgYXMgd2VsbCB0byB3YWl0CmZvciBBTUQgcGVvcGxlIHRvIGNvbmZpcm0gdGhhdCBu
ZWl0aGVyIHBjaV9tc2l4X3ZlY19jb3VudCgpIG5vciBmbGFncwppcyBuZWVkZWQgYW5kIHdlIGNh
biBkaXJlY3RseSBzdXBwbHkgTVNJX1RZUEVTIHRvIHRoZSBiZWxvdyBjYWxsLgoKPiA+ICAgICAg
ICAgICAgICAgLyogd2Ugb25seSBuZWVkIG9uZSB2ZWN0b3IgKi8KPiA+ICAgICAgICAgICAgICAg
bnZlYyA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhhZGV2LT5wZGV2LCAxLCAxLCBmbGFncyk7Cgot
LSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
