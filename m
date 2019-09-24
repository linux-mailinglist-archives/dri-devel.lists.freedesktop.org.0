Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45021BD0E2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 19:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137A6EAD1;
	Tue, 24 Sep 2019 17:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADA96EAE2;
 Tue, 24 Sep 2019 17:46:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x2so1138226wmj.2;
 Tue, 24 Sep 2019 10:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2Mira1dFBL7GR57P+XCHMJ8L8FwCdGosTKuVvg9i6E=;
 b=M5LdAQaJ/yhd81NVCywWVLdM6mfwy/POXuebxb68KgTFSiO1cwmTVBqcDjXscl4PJ5
 OwCmVVaMqYfpfdmqeZGXYEfXgwKus4+rUqYkq+Y0/ffKU80K45dEWYPDIBglod+iGmxd
 PQVBKtsDmX7mcQrpXdD/loXYmTusfBNm8kE4CSQFIJUDydGeerbg7VA5phLYyFMKRdeH
 rkNjofBiVJAsjDdEyyxV4cbwmpNk1iy38PmYnrKYaruuQfQO/IAbpZJ/M24HJ48p2Fem
 x7RC6Ja4oOWwKQ4zpxl57fyMWak4I316rfLpPsjLeWcc02MFrWODRvcmRShaCaKAsLob
 W82w==
X-Gm-Message-State: APjAAAV1nszdaw4M4yu7r2NOujN4rLX5oIKQxzJsg3K3O/I/Jqdu+GfC
 tHsjeb9JKmjsisYs/32cEMD/a2+YpJ4mbxVaEOc=
X-Google-Smtp-Source: APXvYqwKAbCTo/8+vo8zpDRLlqQMgY2EPP84tqDgzEmqfeTEl1yA6Jf+De1oQ2boZ720FrQY+RURgz64WFq/2n+6Ikw=
X-Received: by 2002:a1c:3281:: with SMTP id y123mr1364007wmy.34.1569347186788; 
 Tue, 24 Sep 2019 10:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569329774.git.jani.nikula@intel.com>
 <a82e299adfaf158603bfc2dd84a62558e68b7c24.1569329774.git.jani.nikula@intel.com>
In-Reply-To: <a82e299adfaf158603bfc2dd84a62558e68b7c24.1569329774.git.jani.nikula@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2019 13:46:15 -0400
Message-ID: <CADnq5_NLn-KkfNAzWy1+X8JUSxCavRvg3fL8yudanKrOjtHaWg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] drm/print: rename drm_debug to __drm_debug to
 discourage use
To: Jani Nikula <jani.nikula@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=S2Mira1dFBL7GR57P+XCHMJ8L8FwCdGosTKuVvg9i6E=;
 b=YbJ9vt/uCbTUqrUNMlpWP8PI0MKvnFFiczBm3Gn+ZmaCOC4K4rYbHTambGKkKM8D37
 RIUDVkHRZHgXvEAaFHVVCpQM6M5034ajacCmlxgISFjrEo9V0DLS4UbuK1lcrsUPMkVw
 ljAmBx9EmpT2ULnCqEujXZRJeg5xqsy4b0bydzQh/ACtCpMfstn/Agg2SXsvKTdX6P7n
 QWtiuCiVzV7K9CWIDEx4MnZ5TdBHB291FMoTBwPr3OPALN+RpQK6ulXxCS9o78Tf4VI9
 rf4T1o+L23E7yaAbjAy3Vm7vioGzBNhRe5PycNVb4ozK4zdxHxlDuYRWzvGwnrc3W7jV
 j0Ag==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgOTowMCBBTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPiB3cm90ZToKPgo+IGRybV9kZWJ1Z19lbmFibGVkKCkgaXMgdGhlIHdheSB0byBj
aGVjay4gX19kcm1fZGVidWcgaXMgbm93IHJlc2VydmVkIGZvcgo+IGRybSBwcmludCBjb2RlIG9u
bHkuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPgo+IHYyOiBSZWJhc2Ugb24gbW92ZSB1bmxpa2Vs
eSgpIHRvIGRybV9kZWJ1Z19lbmFibGVkKCkKPgo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5j
IHwgOCArKysrLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCAgICAgfCA1ICsrKy0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJpbnQuYwo+IGluZGV4IGE3Yzg5ZWM1ZmYyNi4uY2EzYzU2YjAyNmYwIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJpbnQuYwo+IEBAIC0zNywxMSArMzcsMTEgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJp
bnQuaD4KPgo+ICAvKgo+IC0gKiBkcm1fZGVidWc6IEVuYWJsZSBkZWJ1ZyBvdXRwdXQuCj4gKyAq
IF9fZHJtX2RlYnVnOiBFbmFibGUgZGVidWcgb3V0cHV0Lgo+ICAgKiBCaXRtYXNrIG9mIERSTV9V
VF94LiBTZWUgaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggZm9yIGRldGFpbHMuCj4gICAqLwo+IC11
bnNpZ25lZCBpbnQgZHJtX2RlYnVnOwo+IC1FWFBPUlRfU1lNQk9MKGRybV9kZWJ1Zyk7Cj4gK3Vu
c2lnbmVkIGludCBfX2RybV9kZWJ1ZzsKPiArRVhQT1JUX1NZTUJPTChfX2RybV9kZWJ1Zyk7Cj4K
PiAgTU9EVUxFX1BBUk1fREVTQyhkZWJ1ZywgIkVuYWJsZSBkZWJ1ZyBvdXRwdXQsIHdoZXJlIGVh
Y2ggYml0IGVuYWJsZXMgYSBkZWJ1ZyBjYXRlZ29yeS5cbiIKPiAgIlx0XHRCaXQgMCAoMHgwMSkg
IHdpbGwgZW5hYmxlIENPUkUgbWVzc2FnZXMgKGRybSBjb3JlIGNvZGUpXG4iCj4gQEAgLTUyLDcg
KzUyLDcgQEAgTU9EVUxFX1BBUk1fREVTQyhkZWJ1ZywgIkVuYWJsZSBkZWJ1ZyBvdXRwdXQsIHdo
ZXJlIGVhY2ggYml0IGVuYWJsZXMgYSBkZWJ1ZyBjYXQKPiAgIlx0XHRCaXQgNSAoMHgyMCkgIHdp
bGwgZW5hYmxlIFZCTCBtZXNzYWdlcyAodmJsYW5rIGNvZGUpXG4iCj4gICJcdFx0Qml0IDcgKDB4
ODApICB3aWxsIGVuYWJsZSBMRUFTRSBtZXNzYWdlcyAobGVhc2luZyBjb2RlKVxuIgo+ICAiXHRc
dEJpdCA4ICgweDEwMCkgd2lsbCBlbmFibGUgRFAgbWVzc2FnZXMgKGRpc3BsYXlwb3J0IGNvZGUp
Iik7Cj4gLW1vZHVsZV9wYXJhbV9uYW1lZChkZWJ1ZywgZHJtX2RlYnVnLCBpbnQsIDA2MDApOwo+
ICttb2R1bGVfcGFyYW1fbmFtZWQoZGVidWcsIF9fZHJtX2RlYnVnLCBpbnQsIDA2MDApOwo+Cj4g
IHZvaWQgX19kcm1fcHV0c19jb3JlZHVtcChzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIGNvbnN0IGNo
YXIgKnN0cikKPiAgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9wcmludC5oCj4gaW5kZXggNDYxOGU5MGNkMTI0Li5jZGU1NDkwMGQ1OTMg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPiArKysgYi9pbmNsdWRlL2Ry
bS9kcm1fcHJpbnQuaAo+IEBAIC0zNCw3ICszNCw4IEBACj4KPiAgI2luY2x1ZGUgPGRybS9kcm0u
aD4KPgo+IC1leHRlcm4gdW5zaWduZWQgaW50IGRybV9kZWJ1ZzsKPiArLyogRG8gKm5vdCogdXNl
IG91dHNpZGUgb2YgZHJtX3ByaW50LltjaF0hICovCj4gK2V4dGVybiB1bnNpZ25lZCBpbnQgX19k
cm1fZGVidWc7Cj4KPiAgLyoqCj4gICAqIERPQzogcHJpbnQKPiBAQCAtMjk2LDcgKzI5Nyw3IEBA
IHN0YXRpYyBpbmxpbmUgc3RydWN0IGRybV9wcmludGVyIGRybV9lcnJfcHJpbnRlcihjb25zdCBj
aGFyICpwcmVmaXgpCj4KPiAgc3RhdGljIGlubGluZSBib29sIGRybV9kZWJ1Z19lbmFibGVkKHVu
c2lnbmVkIGludCBjYXRlZ29yeSkKPiAgewo+IC0gICAgICAgcmV0dXJuIHVubGlrZWx5KGRybV9k
ZWJ1ZyAmIGNhdGVnb3J5KTsKPiArICAgICAgIHJldHVybiB1bmxpa2VseShfX2RybV9kZWJ1ZyAm
IGNhdGVnb3J5KTsKPiAgfQo+Cj4gIF9fcHJpbnRmKDMsIDQpCj4gLS0KPiAyLjIwLjEKPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
