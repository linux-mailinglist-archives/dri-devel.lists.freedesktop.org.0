Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827DA56630
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 12:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C1D6E34A;
	Wed, 26 Jun 2019 10:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015B26E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 10:05:15 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id i125so1115020qkd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8GxBHjEl/HkjJN0KxhPrYWN2tVibJBYt5mD/tHBXzA4=;
 b=ctjvK8oDHqrcPtxsOVGaVDLp19g4gTkK6VCBkHe8EWHuC7L44KSyruTPpCZyr2EH5D
 zroCGSsl8fVEkFmewUDAuzrWouHI/dTNWn4Czis1ws142eCi+GqWdz0gXTEtqeve/PFE
 tbCI59k45Xa6yLnr0uMnBe/6zuVx2uXMQD4UgMIF70IUW+Hd6J5yi5x9IAcy/B9ZRJ4t
 LyYmLnRyg5rdbmd2e9/iyVsKt+yri3sVwN6Stt/LV+yxgcSKdF2+39IqGF0ZYBGg8PZM
 8O6xpXexMhTpxUBYpFH020W2qcp//Aqd/PDB1BCinCcYcBvpYfh1RwPzJP+3VIoMo88f
 E9zw==
X-Gm-Message-State: APjAAAVLfa6V8AUJRcn5QhqPV4YD+on/6pavfTpSMe6pgcjSHWdUjLfO
 /YbRe7ovn3ftgNCQJBgv0f+6SJo2m47ybHbAnZNcijY84ro=
X-Google-Smtp-Source: APXvYqwvDI1x1cbZnITI0hLHL05+bPOxuZo/hHrmJuwWRSMvNZG0cc2TbzUJ64pxd462VcefsHS/55RwI9HV/qN6baE=
X-Received: by 2002:a37:660b:: with SMTP id a11mr2983209qkc.342.1561543514879; 
 Wed, 26 Jun 2019 03:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 26 Jun 2019 11:04:58 +0100
Message-ID: <CAHbf0-EVONHWEVv5_no8sAefURV2FAC_2r8u-Fv8RuLVojyiNw@mail.gmail.com>
Subject: Re: [PATCH 0/7] gem_bo.resv prime unification, leftovers
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8GxBHjEl/HkjJN0KxhPrYWN2tVibJBYt5mD/tHBXzA4=;
 b=t4chpurlgDiiBaguGc1VKW0LQLQwXjqWcFT4HgSfS2A/yw5KxchoDofUcLopScslv6
 +Ui05dCNMm7TCC4m6Xn3L/GDBDwKD6BbTowU5bViO6SUE3ahdCy5XKiug30AmgFYRZpI
 WEX6ksxjHSfccugFz54kjogaCcdeFo/VMPR0WhNVnquaCfAmtyGU6kNUQ+JEKT8mftw7
 GMyfIi2J2Zne7GIVLgdjRIkB3RXQ7GgGiOhwn07WKY7B/TSNBU0Y1EQlTygcAJjNO6Td
 6EMl8K9sEZlcTGTs1ECYJP08tvRCyZQBqNS5S2wMBj6OvDDyFQvOzxZ8MELtw4iPBtTc
 Xpwg==
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdsbCB0cnkgdGVzdGluZyB0aGlzIG9uIG15IFNreWxha2UvVG9uZ2Egc2V0dXAgdG9uaWdodAoK
T24gVHVlLCAyNSBKdW4gMjAxOSBhdCAyMTo0MiwgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBIZXJlJ3MgdGhlIHVubWVyZ2VkIGxl
ZnRvdmVycyBmcm9tIG15IGJpZyBwcmltZSBjbGVhbnVwIHNlcmllczoKPiAtIHVzaW5nIHRoZSBw
cmVwYXJlX2ZiIGhlbHBlciBpbiB2YzQmbXNtLCBub3cgaG9wZWZ1bGx5IGZpeGVkIHVwLiBUaGUK
PiAgIGhlbHBlciBzaG91bGQgYmUgbm93IGV2ZW4gbW9yZSB1c2VmdWwuCj4KPiAtIGFtZCZudiBk
cml2ZXIgLT5nZW1fcHJpbWVfcmVzX29iaiBjYWxsYmFjayByZW1vdmFsLiBJIHRoaW5rIHRoaXMg
b25lCj4gICBtaWdodCBoYXZlIGZ1bmN0aW9uYWwgY29uZmxpY3RzIHdpdGggR2VyZCdzIHBhdGNo
IHNlcmllcyB0byBlbWJlZAo+ICAgZHJtX2dlbV9vYmplY3QgaW4gdHRtX2JvLCBvciBhdCBsZWFz
dCBuZWVkcyB0byBiZSByZS1yZXZpZXdlZCBiZWZvcmUgd2UKPiAgIG1lcmdlIHRoZSAybmQgc2Vy
aWVzLgo+Cj4gQ29tbWVudHMsIHRlc3RpbmcsIGZlZWRiYWNrIGFzIHVzdWFsIHZlcnkgbXVjaCB3
ZWxjb21lLgo+Cj4gVGhhbmtzLCBEYW5pZWwKPgo+IERhbmllbCBWZXR0ZXIgKDcpOgo+ICAgZHJt
L2ZiLWhlbHBlcjogdXNlIGdlbV9iby5yZXN2LCBub3QgZG1hX2J1Zi5yZXN2IGluIHByZXBhcmVf
ZmIKPiAgIGRybS9tc206IFVzZSBkcm1fZ2VtX2ZiX3ByZXBhcmVfZmIKPiAgIGRybS92YzQ6IFVz
ZSBkcm1fZ2VtX2ZiX3ByZXBhcmVfZmIKPiAgIGRybS9yYWRlb246IEZpbGwgb3V0IGdlbV9vYmpl
Y3QtPnJlc3YKPiAgIGRybS9ub3V2ZWF1OiBGaWxsIG91dCBnZW1fb2JqZWN0LT5yZXN2Cj4gICBk
cm0vYW1kZ3B1OiBGaWxsIG91dCBnZW1fb2JqZWN0LT5yZXN2Cj4gICBkcm0vcHJpbWU6IERpdGNo
IGdlbV9wcmltZV9yZXNfb2JqIGhvb2sKPgo+ICBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAg
ICAgICAgICAgICAgICAgICB8ICA5IC0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZG1hX2J1Zi5jICB8IDE3ICstLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5oICB8ICAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgICAgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuYyAgIHwgIDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fZnJhbWVidWZmZXJfaGVscGVyLmMgfCAyOSArKysrKysrKysrLS0tLS0tLS0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgICAgICAgICAgICAgICAgICB8ICAzIC0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9wbGFuZS5jICAgIHwgIDggKystLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tc20vbXNtX2F0b21pYy5jICAgICAgICAgICAgIHwgIDggKystLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAgICAgICAgIHwgIDIgKysKPiAg
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyAgICAgICAgfCAgMSAtCj4gIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmggICAgICAgIHwgIDEgLQo+ICBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMgICAgICB8ICA3IC0tLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jICAgICAgICAgIHwgIDIgLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMgICAgICAgfCAgMSArCj4gIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMgICAgICAgIHwgIDcgLS0tLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYyAgICAgICAgICAgICAgfCAgNSArKy0tCj4gIGlu
Y2x1ZGUvZHJtL2RybV9kcnYuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgMTIgLS0tLS0tLS0K
PiAgMTggZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgOTAgZGVsZXRpb25zKC0pCj4K
PiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
