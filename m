Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6BB26E24A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 19:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C1289206;
	Thu, 17 Sep 2020 17:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267A689206
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 17:25:03 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id y13so3085300iow.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CqYxKt476hR3TTFF0OPhS2FDpNqXcLicmfcVy365+RE=;
 b=kDijGxaFsy0Fx1DBJ1DPcnkSBQUrCA95fmWOOOskitN+EMFd2wlne6Xh7JYoAm9HAx
 gEr0sVCuKQd920CYqMGED9kbS+y826E77Nqd+OIoEGarDdyj8QJY+baXknHG1vxaOmNk
 M87i/cEnyRSXuZre+/kZ+XqqRFEDTGscGl6KZkkgT235MCnLN3f6wxVKmSfkMtoUVWeI
 1he6a6l8guWlcvZpRpHsjCIESM6NNJLXi873FbgA+Bvt18K6GcelhZyPCdfZ1DjUPx2O
 4Pcy5cpm6qp6ymM3EofMkk8ozoekm00DxtQmJ04cNcmYGoBHZu5GR0xIgBt3pINtt3VB
 2b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CqYxKt476hR3TTFF0OPhS2FDpNqXcLicmfcVy365+RE=;
 b=t9Cx87pgCdIB/i1/JpvyXU8TnSFU5Gzvh+nsUaUb6rAhJQyNubhFFSgRD1Z015E6PE
 L3i2ydNM28t1yZE12U7MF0dyKcCMmCWtNBISXIq7BT/JsA5wX2MWPD08GW8lwKEgy9YA
 Vu1wp/FIqJDryrBJDmq1k8FsavgqdcxLabbokHZbW2rNj48dSlJPUmMb7dipAInPVUlf
 3bTlR5BQq6fuzVLCt/pP/6UttXLPzu+p77h5SDm7cemSFTo7ezfdaoQn/RXLYygMYtRK
 H76bQ611QzSiTHJfWUCP8xjRWC3Gkvd11xvdw31JKm6si7BsLxFd1kJ28sp4vXnt/TBc
 LVgQ==
X-Gm-Message-State: AOAM532Gb1h+z50zq0BicWa+piNc1/fjtbEk03Vlmg1d9AyKmfwX/XP7
 Y3y6BWOjnmtzj1AAUXt1BK/7BweUN6aRFluZjDaGDg==
X-Google-Smtp-Source: ABdhPJxs7OGJ7hZTuQ1WqBLcV0e0QWNm4niJf9SPlPDeeC+169mDAzZbWtKlilgyvPaCcnx6J3wV2OnbVvroP467Nfw=
X-Received: by 2002:a05:6602:2e81:: with SMTP id
 m1mr24076500iow.64.1600363502410; 
 Thu, 17 Sep 2020 10:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200917164721.2038541-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200917164721.2038541-1-daniel.vetter@ffwll.ch>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Thu, 17 Sep 2020 19:24:58 +0200
Message-ID: <CAP+8YyEqh4HRx7G5VefwEYTrLQthki7Zoxxx=g=EVYnz3dNDMw@mail.gmail.com>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Juston Li <juston.li@intel.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEJhcyBOaWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1aXplbi5ubD4KCk9u
IFRodSwgU2VwIDE3LCAyMDIwIGF0IDY6NDggUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBFdmVuIGZvciBsZWdhY3kgdXNlcnNwYWNlLCBzaW5jZSBv
dGhlcndpc2UgR0VURkIyIGlzIGJyb2tlbiBhbmQgaWYgeW91Cj4gc3dpdGNoIGJldHdlZW4gbW9k
aWZpZXItbGVzcyBhbmQgbW9kaWZpZXItYXdhcmUgY29tcG9zaXRvcnMsIHNtb290aAo+IHRyYW5z
aXRpb25zIGJyZWFrLgo+Cj4gQWxzbyBpdCdzIGp1c3QgYmVzdCBwcmFjdGljZSB0byBtYWtlIHN1
cmUgbW9kaWZpZXJzIGFyZSBpbnZhcmlhbnQgZm9yCj4gYSBnaXZlbiBkcm1fZmIsIGFuZCB0aGF0
IGEgbW9kaWZpZXItYXdhcmUga21zIGRyaXZlcnMgb25seSBoYXMgb25lCj4gcGxhY2UgdG8gc3Rv
cmUgdGhlbSwgaWdub3JpbmcgYW55IG9sZCBpbXBsaWNpdCBibyBmbGFncyBvciB3aGF0ZXZlcgo+
IGVsc2UgbWlnaHQgZmxvYXQgYXJvdW5kLgo+Cj4gTW90aXZhdGVkIGJ5IHNvbWUgaXJjIGRpc2N1
c3Npb24gd2l0aCBCYXMgYWJvdXQgYW1kZ3B1IG1vZGlmaWVyCj4gc3VwcG9ydC4KPgo+IEFja2Vk
LWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4gQWNrZWQtYnk6IERhbmllbCBT
dG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5OiBQZWtrYSBQYWFsYW5lbiA8
cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvbT4KPiBGaXhlczogNDU1ZTAwZjE0MTJmICgiZHJt
OiBBZGQgZ2V0ZmIyIGlvY3RsIikKPiBDYzogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNvbGxhYm9y
YS5jb20+Cj4gQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogQmFzIE5pZXV3ZW5odWl6ZW4gPGJh
c0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+IENjOiBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwu
Y29tPgo+IENjOiAiV2VudGxhbmQsIEhhcnJ5IiA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAt
LS0KPiBTZW5kaW5nIHRoaXMgb3V0IGFnYWluIHRvIGRvdWJsZS1jaGVjayB0aGVyZSdzIG5vIG9i
amVjdGlvbnMgb3IgY29uY2VybnMuCj4gRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCBsb29raW5nIGF0
IHRoZSBjb2RlIHRoZSBsYXRlc3QgbW9kaWZpZXIgcGF0Y2hlcyBmb3IKPiBhbWRncHUgZm9sbG93
IHRoaXMgbm93Lgo+Cj4gQ2hlZXJzLCBEYW5pZWwKPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX21v
ZGVfY29uZmlnLmggfCAxMyArKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgg
Yi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaAo+IGluZGV4IGExOGY3M2ViM2NmNi4uNWZm
YmI0ZWQ1YjM1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oCj4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgKPiBAQCAtNTgsNiArNTgsMTIgQEAg
c3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyB7Cj4gICAgICAgICAgKiBhY3R1YWwgbW9kaWZp
ZXIgdXNlZCBpZiB0aGUgcmVxdWVzdCBkb2Vzbid0IGhhdmUgaXQgc3BlY2lmaWVkLAo+ICAgICAg
ICAgICogaWUuIHdoZW4gKEBtb2RlX2NtZC0+ZmxhZ3MgJiBEUk1fTU9ERV9GQl9NT0RJRklFUlMp
ID09IDAuCj4gICAgICAgICAgKgo+ICsgICAgICAgICogSU1QT1JUQU5UOiBUaGVzZSBpbXBsaWVk
IG1vZGlmaWVycyBmb3IgbGVnYWN5IHVzZXJzcGFjZSBtdXN0IGJlCj4gKyAgICAgICAgKiBzdG9y
ZWQgaW4gc3RydWN0ICZkcm1fZnJhbWVidWZmZXIsIGluY2x1ZGluZyBhbGwgcmVsZXZhbnQgbWV0
YWRhdGEKPiArICAgICAgICAqIGxpa2UgJmRybV9mcmFtZWJ1ZmZlci5waXRjaGVzIGFuZCAmZHJt
X2ZyYW1lYnVmZmVyLm9mZnNldHMgaWYgdGhlCj4gKyAgICAgICAgKiBtb2RpZmllciBlbmFibGVz
IGFkZGl0aW9uYWwgcGxhbmVzIGJleW9uZCB0aGUgZm91cmNjIHBpeGVsIGZvcm1hdAo+ICsgICAg
ICAgICogY29kZS4gVGhpcyBpcyByZXF1aXJlZCBieSB0aGUgR0VURkIyIGlvY3RsLgo+ICsgICAg
ICAgICoKPiAgICAgICAgICAqIElmIHRoZSBwYXJhbWV0ZXJzIGFyZSBkZWVtZWQgdmFsaWQgYW5k
IHRoZSBiYWNraW5nIHN0b3JhZ2Ugb2JqZWN0cyBpbgo+ICAgICAgICAgICogdGhlIHVuZGVybHlp
bmcgbWVtb3J5IG1hbmFnZXIgYWxsIGV4aXN0LCB0aGVuIHRoZSBkcml2ZXIgYWxsb2NhdGVzCj4g
ICAgICAgICAgKiBhIG5ldyAmZHJtX2ZyYW1lYnVmZmVyIHN0cnVjdHVyZSwgc3ViY2xhc3NlZCB0
byBjb250YWluCj4gQEAgLTkxNSw2ICs5MjEsMTMgQEAgc3RydWN0IGRybV9tb2RlX2NvbmZpZyB7
Cj4gICAgICAgICAgKiBAYWxsb3dfZmJfbW9kaWZpZXJzOgo+ICAgICAgICAgICoKPiAgICAgICAg
ICAqIFdoZXRoZXIgdGhlIGRyaXZlciBzdXBwb3J0cyBmYiBtb2RpZmllcnMgaW4gdGhlIEFEREZC
Mi4xIGlvY3RsIGNhbGwuCj4gKyAgICAgICAgKgo+ICsgICAgICAgICogSU1QT1JUQU5UOgo+ICsg
ICAgICAgICoKPiArICAgICAgICAqIElmIHRoaXMgaXMgc2V0IHRoZSBkcml2ZXIgbXVzdCBmaWxs
IG91dCB0aGUgZnVsbCBpbXBsaWNpdCBtb2RpZmllcgo+ICsgICAgICAgICogaW5mb3JtYXRpb24g
aW4gdGhlaXIgJmRybV9tb2RlX2NvbmZpZ19mdW5jcy5mYl9jcmVhdGUgaG9vayBmb3IgbGVnYWN5
Cj4gKyAgICAgICAgKiB1c2Vyc3BhY2Ugd2hpY2ggZG9lcyBub3Qgc2V0IG1vZGlmaWVycy4gT3Ro
ZXJ3aXNlIHRoZSBHRVRGQjIgaW9jdGwgaXMKPiArICAgICAgICAqIGJyb2tlbiBmb3IgbW9kaWZp
ZXIgYXdhcmUgdXNlcnNwYWNlLgo+ICAgICAgICAgICovCj4gICAgICAgICBib29sIGFsbG93X2Zi
X21vZGlmaWVyczsKPgo+IC0tCj4gMi4yOC4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
