Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675592C907E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4144B89C03;
	Mon, 30 Nov 2020 22:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B25889C03;
 Mon, 30 Nov 2020 22:04:58 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id i7so3052278oot.8;
 Mon, 30 Nov 2020 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5jOvGDqYf8zwrULgytMiBGj6XTmbLQAdGK6UJTFHbSU=;
 b=PAQIbC+HD7aZnMbhp9k94L+xvj5VCnYs1qRBegTa8+NGGphW9fIvh7QjHswN/vqJ+N
 VEL1PZMabbMQ2vN40BSrZeXTlduFD5Z9sEPpE4HxLbduzIFROwjBoxoLn6BtlS9CXQ8W
 JNlSchueWOcpR4KeIyvY4O8H2djoxCOkzsR4ypvdn3PwmNjW7yBaKIzyA1JhYBT5JhQH
 atdvQ0gUclZI1PECyNBcCBQrB7FM3UO/m8gc+fQ09O7+0zQj/bIPNKKw/gtxb0M6wLOd
 e2ntyVrhLyCQdKfkzcxpGzMhZunlkHjBRba540/jUu1kAZEDgohbsptCDrZB0qO/2gBk
 klQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5jOvGDqYf8zwrULgytMiBGj6XTmbLQAdGK6UJTFHbSU=;
 b=WMjMGcxgmUUNoko34Q6fiP21+CPo+SVkCjhjGFVn6NSAX15+FT4LYcjuusGh/V8cZb
 tIz7yjsGnAXtD9lKYqdWkFxTDOt1pRtQWMg65XAnoB70fUgFbs7SrKApjoCf5NO3j1n9
 Ap9A7Ui6ouo7wLU2AqJXeZYrsbe2fFVgdAIXo1N4CVyHT0stNLw8Vo3rOj2mTFg7jLQr
 lyB1AZnHyal7+I/RhZhmx7K2Ljm2oAAzc5ildA34Ys0ShdT+ypO2aVx3NmX0OIDNWSgf
 Ij/bfw8M0EjGoB+TrLSvP87ErZf32/IUrs9rFbvyyNOXEMjoxNcc9GFz9L38wp9GsPC3
 YI0Q==
X-Gm-Message-State: AOAM533oXUSsv1rDT/i0h71ib0qavA+AToCjMpLeAENkQteXeLynu42E
 I8jv+D9JRRKZmU/amsGkqheQFuVj8mQsZDIzfto=
X-Google-Smtp-Source: ABdhPJzdjixBlHwXzStQhUKKU6mUgnrY3S88+jIZBk29S2eq07JyrKnnbnUAJiA6e8+nCQCMloGuHeuHFCBlQgu31eE=
X-Received: by 2002:a4a:3e91:: with SMTP id t139mr16906483oot.90.1606773897183; 
 Mon, 30 Nov 2020 14:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-3-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-3-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:04:45 -0500
Message-ID: <CADnq5_OURGRBDONuMy9Bee2Jo+e6pfCaKyk8z6Fn60F2PcF_Ag@mail.gmail.com>
Subject: Re: [PATCH 02/40] drm/amd/amdgpu/gmc_v10_0: Suppy some missing
 function doc descriptions
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jOjI3
ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndm1odWInIG5vdCBkZXNj
cmliZWQgaW4gJ2dtY192MTBfMF9mbHVzaF9ncHVfdGxiJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjEwXzAuYzoyNzg6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2ZsdXNoX3R5cGUnIG5vdCBkZXNjcmliZWQgaW4gJ2dtY192MTBfMF9mbHVzaF9ncHVf
dGxiJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYzozNzE6IHdhcm5p
bmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ZsdXNoX3R5cGUnIG5vdCBkZXNjcmli
ZWQgaW4gJ2dtY192MTBfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkJwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjEwXzAuYzozNzE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2FsbF9odWInIG5vdCBkZXNjcmliZWQgaW4gJ2dtY192MTBfMF9mbHVzaF9ncHVf
dGxiX3Bhc2lkJwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8
ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+
IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyB8IDQgKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjEwXzAuYwo+IGluZGV4IGQ5Mzk5MzI0YmU0NzQuLjQ4ODdiMGU2NmU5NzUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwo+IEBAIC0yNzAsNiArMjcw
LDggQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2ZsdXNoX3ZtX2h1YihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgo+ICAgKiBAdm1pZDogdm0gaW5zdGFuY2UgdG8gZmx1c2gKPiArICogQHZtaHVi
OiB2bWh1YiB0eXBlCj4gKyAqIEBmbHVzaF90eXBlOiB0aGUgZmx1c2ggdHlwZQo+ICAgKgo+ICAg
KiBGbHVzaCB0aGUgVExCIGZvciB0aGUgcmVxdWVzdGVkIHBhZ2UgdGFibGUuCj4gICAqLwo+IEBA
IC0zNjIsNiArMzY0LDggQEAgc3RhdGljIHZvaWQgZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCj4gICAqCj4gICAqIEBhZGV2
OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiAgICogQHBhc2lkOiBwYXNpZCB0byBiZSBmbHVzaAo+
ICsgKiBAZmx1c2hfdHlwZTogdGhlIGZsdXNoIHR5cGUKPiArICogQGFsbF9odWI6IFVzZWQgd2l0
aCBQQUNLRVQzX0lOVkFMSURBVEVfVExCU19BTExfSFVCKCkKPiAgICoKPiAgICogRmx1c2ggdGhl
IFRMQiBmb3IgdGhlIHJlcXVlc3RlZCBwYXNpZC4KPiAgICovCj4gLS0KPiAyLjI1LjEKPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
