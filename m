Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD9E2F3C5D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77231893EB;
	Tue, 12 Jan 2021 22:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79A8893EB;
 Tue, 12 Jan 2021 22:33:45 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id d203so78249oia.0;
 Tue, 12 Jan 2021 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CnsNnPy+bsfMKTYrwaIqDDLsmnzZ6j8Zf4XsN63EhlU=;
 b=sfDjIrahyO+tZlCCvhLOVmMHfJXby6n+dOfQGqUYDpWNA+HJRItI7sIA6glJ+oQQLW
 cprmEzHiZbtgc78VCt60Y9ydiqhmgvRLdI2weafm4pkSNHG8o4X9jJLrUwavl2ZD+Z6H
 EuI+Ry1ENElnH/toY9rJFu5Ez4KtLJ92YM7BtWDqxapmvH+YV3ikppZikdpyQzqydESj
 qqcsyyuueeYEzdwSnCVI3hXKTnu1kU1DiOyJBxrZ1eTMWg7sVVuAJmr6ui2C73jV2qBK
 tv36MBk9FgSJBrJ0U3TxyiMZavkC+PCAaYO62yzKhqj4nEq84lQkxmIp9j+wtXbKMpqM
 RMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CnsNnPy+bsfMKTYrwaIqDDLsmnzZ6j8Zf4XsN63EhlU=;
 b=etb1qYntSPjfeeqOlypI18f/Ycg2OAYdaqiu29szB0m15h1we9ZLG7PAjTNIrBkr8X
 qHkZi3dguCSeXzQmFP7Za+fcY7kACuotpusuWblEA66WNlICmN4oEJcWF1+Z2hVQQaYb
 GtAOSvuve6mWDlVyfDv0Sfj1JQgEInZqFEHyduVTP9pVz9sgYi+O1cwmc6S9z2+uECv+
 k5h6uDv7OdI/AzMlT+6jKBUytfMA9ZJYyZpqSa5zG+7kg42ZiZMzYjj1+48agTDve//u
 Qp7f+L4weea7qU0UskfvoOFQDdSHEp1ObzZ/GH4YmsIZQuAAa0z39y+4oqEVpAv79As0
 rmFg==
X-Gm-Message-State: AOAM532cpUb+b1UUmcwarKwyCKH6SJscTAFKRNCBAptncRFhrScKBYpE
 wDMMVTMpsVeIIUrj7R/49/7mcvppZA4MQC5exWNF7caO
X-Google-Smtp-Source: ABdhPJzUHHy22Etzqthjkdgc52meKfKSSamolFRvdaCr+cih6G1UX/Tr9FYEO3Q+fi35oSwYDecSCNaszYOd2c03Opk=
X-Received: by 2002:a54:4083:: with SMTP id i3mr833397oii.120.1610490825155;
 Tue, 12 Jan 2021 14:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-31-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-31-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:33:33 -0500
Message-ID: <CADnq5_OrAqWKEz1dRDectDDuRz4d+LoizAfYd4-OpOEfYADYAQ@mail.gmail.com>
Subject: Re: [PATCH 30/40] drm/amd/display/dc/dce110/dce110_timing_generator_v:
 Demote kernel-doc abuse and line up comments
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3YuYzo1NDogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAndGcnIG5vdCBkZXNjcmliZWQgaW4gJ2RjZTExMF90aW1pbmdf
Z2VuZXJhdG9yX3ZfZW5hYmxlX2NydGMnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3YuYzoyMTY6IHdhcm5p
bmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3RnJyBub3QgZGVzY3JpYmVkIGluICdk
Y2UxMTBfdGltaW5nX2dlbmVyYXRvcl92X3dhaXRfZm9yX3ZhY3RpdmUnCj4KPiBDYzogSGFycnkg
V2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5s
aUBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKCj4gLS0t
Cj4gIC4uLi9kYy9kY2UxMTAvZGNlMTEwX3RpbWluZ19nZW5lcmF0b3Jfdi5jICAgICB8IDE5ICsr
KysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZTExMC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvcl92LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdfZ2VuZXJhdG9yX3YuYwo+IGluZGV4
IGExM2EyZjU4OTQ0ZTMuLmM1MDkzODRmZmY1NDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfdGltaW5nX2dlbmVyYXRvcl92LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF90aW1pbmdf
Z2VuZXJhdG9yX3YuYwo+IEBAIC00NiwxNyArNDYsMTYgQEAKPiAgICoKPiAgICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKiovCj4KPiAtLyoqCj4gLSogRW5hYmxlIENSVENWCj4gLSovCj4gKy8qCj4g
KyAqIEVuYWJsZSBDUlRDVgo+ICsgKi8KPgo+ICBzdGF0aWMgYm9vbCBkY2UxMTBfdGltaW5nX2dl
bmVyYXRvcl92X2VuYWJsZV9jcnRjKHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICp0ZykKPiAgewo+
ICAvKgo+IC0qIFNldCBNQVNURVJfVVBEQVRFX01PREUgdG8gMAo+IC0qIFRoaXMgaXMgbmVlZGVk
IGZvciBEUlIsIGFuZCBhbHNvIHN1Z2dlc3RlZCB0byBiZSBkZWZhdWx0IHZhbHVlIGJ5IFN5ZWQu
Cj4gLSovCj4gLQo+ICsgKiBTZXQgTUFTVEVSX1VQREFURV9NT0RFIHRvIDAKPiArICogVGhpcyBp
cyBuZWVkZWQgZm9yIERSUiwgYW5kIGFsc28gc3VnZ2VzdGVkIHRvIGJlIGRlZmF1bHQgdmFsdWUg
YnkgU3llZC4KPiArICovCj4gICAgICAgICB1aW50MzJfdCB2YWx1ZTsKPgo+ICAgICAgICAgdmFs
dWUgPSAwOwo+IEBAIC0yMDksOSArMjA4LDkgQEAgc3RhdGljIHZvaWQgZGNlMTEwX3RpbWluZ19n
ZW5lcmF0b3Jfdl93YWl0X2Zvcl92Ymxhbmsoc3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKnQKPiAg
ICAgICAgIH0KPiAgfQo+Cj4gLS8qKgo+IC0qIFdhaXQgdGlsbCB3ZSBhcmUgaW4gVkFjdGl2ZSAo
YW55d2hlcmUgaW4gVkFjdGl2ZSkKPiAtKi8KPiArLyoKPiArICogV2FpdCB0aWxsIHdlIGFyZSBp
biBWQWN0aXZlIChhbnl3aGVyZSBpbiBWQWN0aXZlKQo+ICsgKi8KPiAgc3RhdGljIHZvaWQgZGNl
MTEwX3RpbWluZ19nZW5lcmF0b3Jfdl93YWl0X2Zvcl92YWN0aXZlKHN0cnVjdCB0aW1pbmdfZ2Vu
ZXJhdG9yICp0ZykKPiAgewo+ICAgICAgICAgd2hpbGUgKGRjZTExMF90aW1pbmdfZ2VuZXJhdG9y
X3ZfaXNfaW5fdmVydGljYWxfYmxhbmsodGcpKSB7Cj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
