Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153EB358D78
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 21:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B1F6E0C1;
	Thu,  8 Apr 2021 19:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4F56E0C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 19:27:02 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:9ef6:7b41:f88b:5bc5:8ea5] (unknown
 [IPv6:2804:431:e7dc:9ef6:7b41:f88b:5bc5:8ea5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2FD5F1F44B4B;
 Thu,  8 Apr 2021 20:26:59 +0100 (BST)
Subject: Re: [PATCH 1/2] drm/doc: document drm_mode_get_plane
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-2-leandro.ribeiro@collabora.com>
 <YG23lE7V0qjJNJu4@intel.com>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <3ce15bc5-0be3-6774-fd05-ceebbaf1b60e@collabora.com>
Date: Thu, 8 Apr 2021 16:26:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG23lE7V0qjJNJu4@intel.com>
Content-Language: en-US
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA0LzcvMjEgMTA6NDUgQU0sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBUdWUsIEFw
ciAwNiwgMjAyMSBhdCAwNDoyMToxN1BNIC0wMzAwLCBMZWFuZHJvIFJpYmVpcm8gd3JvdGU6Cj4+
IEFkZCBhIHNtYWxsIGRlc2NyaXB0aW9uIGFuZCBkb2N1bWVudCBzdHJ1Y3QgZmllbGRzIG9mCj4+
IGRybV9tb2RlX2dldF9wbGFuZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTGVhbmRybyBSaWJlaXJv
IDxsZWFuZHJvLnJpYmVpcm9AY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+ICBpbmNsdWRlL3VhcGkv
ZHJtL2RybV9tb2RlLmggfCAxOSArKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9k
cm1fbW9kZS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4+IGluZGV4IGQxYTkzZDJh
ODVmOS4uOTZmYzlhNmRhNjA4IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9t
b2RlLmgKPj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCj4+IEBAIC0zMTIsMTYg
KzMxMiwzNSBAQCBzdHJ1Y3QgZHJtX21vZGVfc2V0X3BsYW5lIHsKPj4gIAlfX3UzMiBzcmNfdzsK
Pj4gIH07Cj4+ICAKPj4gKy8qKgo+PiArICogc3RydWN0IGRybV9tb2RlX2dldF9wbGFuZSAtIEdl
dCBwbGFuZSBtZXRhZGF0YS4KPj4gKyAqCj4+ICsgKiBVc2Vyc3BhY2UgY2FuIHBlcmZvcm0gYSBH
RVRQTEFORSBpb2N0bCB0byByZXRyaWV2ZSBpbmZvcm1hdGlvbiBhYm91dCBhCj4+ICsgKiBwbGFu
ZS4KPj4gKyAqLwo+PiAgc3RydWN0IGRybV9tb2RlX2dldF9wbGFuZSB7Cj4+ICsJLyoqIEBwbGFu
ZV9pZDogT2JqZWN0IElEIG9mIHRoZSBwbGFuZS4gKi8KPj4gIAlfX3UzMiBwbGFuZV9pZDsKPj4g
IAo+PiArCS8qKiBAY3J0Y19pZDogT2JqZWN0IElEIG9mIHRoZSBjdXJyZW50IENSVEMuICovCj4+
ICAJX191MzIgY3J0Y19pZDsKPj4gKwkvKiogQGZiX2lkOiBPYmplY3QgSUQgb2YgdGhlIGN1cnJl
bnQgZmIuICovCj4+ICAJX191MzIgZmJfaWQ7Cj4+ICAKPj4gKwkvKioKPj4gKwkgKiBAcG9zc2li
bGVfY3J0Y3M6IFBvaW50ZXIgdG8gYGBfX3UzMmBgIGFycmF5IG9mIENSVEMncyB0aGF0IGFyZQo+
PiArCSAqIGNvbXBhdGlibGUgd2l0aCB0aGUgcGxhbmUuCj4+ICsJICovCj4gCj4gSXQncyBhIGJp
dG1hc2suCgpUaGFuayB5b3UsIEknbGwgZml4IHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4g
Cj4+ICAJX191MzIgcG9zc2libGVfY3J0Y3M7Cj4+ICsJLyoqIEBnYW1tYV9zaXplOiBTaXplIG9m
IHRoZSBsZWdhY3kgZ2FtbWEgdGFibGUuICovCj4+ICAJX191MzIgZ2FtbWFfc2l6ZTsKPj4gIAo+
PiArCS8qKiBAY291bnRfZm9ybWF0X3R5cGVzOiBOdW1iZXIgb2YgZm9ybWF0cy4gKi8KPj4gIAlf
X3UzMiBjb3VudF9mb3JtYXRfdHlwZXM7Cj4+ICsJLyoqCj4+ICsJICogQGZvcm1hdF90eXBlX3B0
cjogUG9pbnRlciB0byBgYF9fdTMyYGAgYXJyYXkgb2YgZm9ybWF0cyB0aGF0IGFyZQo+PiArCSAq
IHN1cHBvcnRlZCBieSB0aGUgcGxhbmUuIFRoZXNlIGZvcm1hdHMgZG8gbm90IHJlcXVpcmUgbW9k
aWZpZXJzLgo+PiArCSAqLwo+PiAgCV9fdTY0IGZvcm1hdF90eXBlX3B0cjsKPj4gIH07Cj4+ICAK
Pj4gLS0gCj4+IDIuMzEuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
