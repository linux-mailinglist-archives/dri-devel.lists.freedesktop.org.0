Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C02C9281
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 00:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7394589BA1;
	Mon, 30 Nov 2020 23:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1270389B68;
 Mon, 30 Nov 2020 23:28:38 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id c80so16193020oib.2;
 Mon, 30 Nov 2020 15:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/ib7F0wrlRrbhxbZ6/EzZShONgbtSJ0jIgAfxKhWyPA=;
 b=OLCPN3Au3UUPcRNJgSYmlA4bAg1MaFhQXY6bjWwjrJsqy2b9KN+hRPS4tezmPolKyB
 LVo/sIwDfC7iz8P8hMVVXnLaRSK/CYO9p5uecCxPM1td8Rw3c3QuQgtkyB+X31J8N7Om
 DSoTDX0u+qr812aeTrN9mpJXGVu1WV0H8FdlSprIb9R8TvZg629KbyLaQPiAl0Z/Xbp2
 RrBQYnWC5p6Qo9HVh9kk+abS9Lb1TccwrU/aXnKE5mm9KpkFvZ5ulK9noDO62FoVDXEu
 QHJTnLB43wYLoVOuxOMk16dArCEi4xNGRRp5r6qYKRFVrnwiQZXRc+YEa/fs257NZ2lN
 SFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ib7F0wrlRrbhxbZ6/EzZShONgbtSJ0jIgAfxKhWyPA=;
 b=feXPfIvc+LeMTRH9MOVSLToPJu1utmmdpj+H2lUOmxnjYHdbMQj5UGVAfxyNz2M0Xc
 z6QoE699sjeOMAm0yNNd7m1wkRnm3EI4NWFJr81sgXGn96BqU57w0dui7Q6VQtVe+irZ
 nkE5F4SzVrYZwDpb16qmn9xN78r1k1ac8XaF3M6iqimqeKh01EJFl6KOFZC8rRlWx9xV
 ruXHQ7JMreeuV0E9tZV4kcSe8Qz4XZfTn/uerhm3aNmXxn8RCsMxmiLBgmzIkWaD8Q84
 5eyQ9DI0hik15DpekeER6PExzVZg3l8cnUECIW3II/gqO4wVKrl3Nfcy8txH2fOz7BCI
 L/ng==
X-Gm-Message-State: AOAM532Fd9MRt9jFruATTjQ3300LA3pP0RHmpecxRi7i76tVi/0Jqspt
 VyDm6DICV59bEJIg1Fs9QAwleq0R9LDm5lTtd+k=
X-Google-Smtp-Source: ABdhPJzP2wePVUwNhPUll3zT7E0oyWKKyNq5Pe6VKXzpawH6iUFiKk89j+QfN4UBxZjCrdOngEWEHY8ZFUSywXqwwR4=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr150944oib.120.1606778917428; 
 Mon, 30 Nov 2020 15:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-10-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-10-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 18:28:26 -0500
Message-ID: <CADnq5_Ox53r0qF-bDOSVZY0hD09WwFqFTEqDPsvRCpBCs6-aXg@mail.gmail.com>
Subject: Re: [PATCH 09/40] drm/amd/pm/powerplay/hwmgr/hwmgr: Move
 'smu8_init_function_pointers()' prototype to shared header
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0MyBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4gQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBL
w7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENj
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9pbmMvaHdtZ3IuaCAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL3BtL3Bvd2VycGxheS9od21nci9od21nci5jIHwgMSAtCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL2luYy9od21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdt
Z3IuaAo+IGluZGV4IDFiYjM3OTQ5OGExMjEuLjBlMjJjYmEzY2UzYTYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvaHdtZ3IuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG0vaW5jL2h3bWdyLmgKPiBAQCAtODI4LDUgKzgyOCw2IEBAIGludCBod21ncl9oYW5k
bGVfdGFzayhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAo+Cj4gICNkZWZpbmUgUEhNX0VOVElSRV9S
RUdJU1RFUl9NQVNLIDB4RkZGRkZGRkZVCj4KPiAraW50IHNtdThfaW5pdF9mdW5jdGlvbl9wb2lu
dGVycyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKPgo+ICAjZW5kaWYgLyogX0hXTUdSX0hfICov
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL2h3
bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9od21nci5jCj4g
aW5kZXggNzM5ZTIxNWVjOGI3Zi4uZWMxN2EzZTYzZWEwMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9od21nci5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYwo+IEBAIC00Nyw3ICs0Nyw2IEBA
IGV4dGVybiBjb25zdCBzdHJ1Y3QgcHBfc211bWdyX2Z1bmMgc211MTBfc211X2Z1bmNzOwo+ICBl
eHRlcm4gY29uc3Qgc3RydWN0IHBwX3NtdW1ncl9mdW5jIHZlZ2EyMF9zbXVfZnVuY3M7Cj4KPiAg
ZXh0ZXJuIGludCBzbXU3X2luaXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0IHBwX2h3bWdyICpo
d21ncik7Cj4gLWV4dGVybiBpbnQgc211OF9pbml0X2Z1bmN0aW9uX3BvaW50ZXJzKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IpOwo+ICBleHRlcm4gaW50IHZlZ2ExMF9od21ncl9pbml0KHN0cnVjdCBw
cF9od21nciAqaHdtZ3IpOwo+ICBleHRlcm4gaW50IHZlZ2ExMl9od21ncl9pbml0KHN0cnVjdCBw
cF9od21nciAqaHdtZ3IpOwo+ICBleHRlcm4gaW50IHZlZ2EyMF9od21ncl9pbml0KHN0cnVjdCBw
cF9od21nciAqaHdtZ3IpOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
