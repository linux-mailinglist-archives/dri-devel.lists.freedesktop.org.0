Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D705E596
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 15:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB266E13C;
	Wed,  3 Jul 2019 13:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D0789F0A;
 Wed,  3 Jul 2019 13:35:34 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r6so2366379oti.3;
 Wed, 03 Jul 2019 06:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ilYLXRmSNDbArpnOIA2NUB9TLUV6IJmXZ4KA8x9/9GU=;
 b=MN06PQEyeMzpTinepilfQY1C+4e2Ojn+m2nd8ENkYotZB0AwfA9O8XZAFeRLQYDX2c
 QTq+G/DQDZS5n/KBiEP0fSDp7zvVnCH2JoXbbQht9hZKJq40uQVt4MiE5uAU446BYLda
 VKpMHGbLbaQJWomdwaEHPVTH9JgFcB3dNYSOPKVIb92ta+Vrk9M83T8We0LyLpn8qCmy
 oHCuBIUYVfHcuMDpL3Lpd+OB+h4mlynFmmIgb7nlU3uxigfnKcK7hS+cJ7Quv+UlpFil
 mTtwoe7isrRnjga4G2WkcqQqV/N1QIweg/aP8N7fehAFLBtmDajAwpLvF1JDd33B7Vfh
 GnIw==
X-Gm-Message-State: APjAAAXI7YdNbbgyEWyZzE/UStV1voa4hmel/AuNBRGAP6USvit3MzqI
 A8Xti4XIgKkhlXZyblo48QY0oH0bvon9gJHGhRo=
X-Google-Smtp-Source: APXvYqzgoD/NW6VhnzafIhsV7rv7O5P+eAiwPWCUb6Tgq06PVDADnj2k6T4geUyNdI9TWbVfgybTIRRKfAghRbDHZGk=
X-Received: by 2002:a9d:2941:: with SMTP id d59mr29835026otb.8.1562160933575; 
 Wed, 03 Jul 2019 06:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190701080022.9415-1-oleg.vasilev@intel.com>
 <CACvgo51-cXsojkE1Y_D0+3+Ax-GZ7gjuq-4xQ6eig9u4XCRsRw@mail.gmail.com>
 <5ebbf084848e6e3b319a4ad77771001a88aa9e37.camel@intel.com>
In-Reply-To: <5ebbf084848e6e3b319a4ad77771001a88aa9e37.camel@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Jul 2019 14:35:42 +0100
Message-ID: <CACvgo51EMpK91XN=zD+Fqn1oahRMP9iYMj7WtV5=CK0c2jwHUw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: report dp downstream port type as a
 subconnector property
To: "Vasilev, Oleg" <oleg.vasilev@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ilYLXRmSNDbArpnOIA2NUB9TLUV6IJmXZ4KA8x9/9GU=;
 b=PJsIJX454DZJqSLInF7dFN8G2mQ7QdnCZofr46CSchG5abXsGRw1jdu1GIy4Kk8P+J
 CjquoUfcpIKIfOhNsj1Q+Cc17+bKGyr5C25vxFEqEZ7194w04YruzX9o5XiR/eartRF7
 iHTpy6eujpORGn3m3ix76P3pO6Lexs7i7DN+amcn0i1UDQihYMqT4w3IE0zi8gkYP1Cg
 S+I9fUyU7AO5/PW1jbv0LD/Pmkp3JKCMQSi6VuDGULK0c+eFDrp24tW/E2OlEkBQ7eXA
 3Zi7daa4pnH6JTOqMPpv7/ORvJAAp2J/Lfm5o5YUWmNSkzSA/E1hqdSP1etSCDV/g1U4
 MR1g==
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzIEp1bCAyMDE5IGF0IDA5OjE5LCBWYXNpbGV2LCBPbGVnIDxvbGVnLnZhc2lsZXZA
aW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjAxOS0wNy0wMiBhdCAxNDozOCArMDEwMCwg
RW1pbCBWZWxpa292IHdyb3RlOgo+ID4gSGkgT2xlZywKPiA+Cj4gPiBPbiBNb24sIDEgSnVsIDIw
MTkgYXQgMDk6MDAsIE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KPiA+IHdy
b3RlOgo+ID4gPiBDdXJyZW50bHksIGRvd25zdHJlYW0gcG9ydCB0eXBlIGlzIG9ubHkgcmVwb3J0
ZWQgaW4gZGVidWdmcy4gVGhpcwo+ID4gPiBpbmZvcm1hdGlvbiBzaG91bGQgYmUgY29uc2lkZXJl
ZCBpbXBvcnRhbnQgc2luY2UgaXQgcmVmbGVjdHMgdGhlCj4gPiA+IGFjdHVhbAo+ID4gPiBwaHlz
aWNhbCBjb25uZWN0b3IgdHlwZS4gU29tZSB1c2Vyc3BhY2UgKGUuZy4gd2luZG93IGNvbXBvc2l0
b3JzKQo+ID4gPiBtYXkgd2FudCB0byBzaG93IHRoaXMgaW5mbyB0byBhIHVzZXIuCj4gPiA+Cj4g
PiA+IFRoZSAnc3ViY29ubmVjdG9yJyBwcm9wZXJ0eSBpcyBhbHJlYWR5IHV0aWxpemVkIGZvciBE
VkktSSBhbmQgVFYtCj4gPiA+IG91dCBmb3IKPiA+ID4gcmVwb3J0aW5nIGNvbm5lY3RvciBzdWJ0
eXBlLgo+ID4gPgo+ID4gPiBUaGUgaW5pdGlhbCBtb3RpdmF0aW9uIGZvciB0aGlzIGZlYXR1cmUg
Y2FtZSBmcm9tIGkyYyB0ZXN0IFsxXS4KPiA+ID4gSXQgaXMgc3VwcG9zZWQgdG8gYmUgc2tpcHBl
ZCBvbiBWR0EgY29ubmVjdG9ycywgYnV0IGl0IGNhbm5vdAo+ID4gPiBkZXRlY3QgVkdBIG92ZXIg
RFAgYW5kIGZhaWxzIGluc3RlYWQuCj4gPiA+Cj4gPiA+IFsxXTogaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA0MDk3Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE9s
ZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgMzgKPiA+ID4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwg
MzYKPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oICAgICB8ICAyICsrCj4gPiA+ICBpbmNsdWRlL2RybS9kcm1fZHBf
aGVscGVyLmggICAgIHwgIDMgKysrCj4gPiA+ICBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcu
aCAgIHwgIDYgKysrKysrCj4gPiA+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAgIHwg
MjIgKysrKysrKysrKysrLS0tLS0tLQo+ID4gPiAgNiBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+IENhbiB5b3UgcGxlYXNlIHVwZGF0ZSBv
dGhlciBkcml2ZXJzIHRvIG1ha2UgdXNlIG9mIHRoaXMgLSBxdWljayBncmVwCj4gPiBzaG93cyA1
LTEwIGluIHRvdGFsLgo+Cj4gSGksCj4KPiBTdXJlLCBJIGNhbiBkbyB0aGlzLiBTaG91bGQgSSBk
byB0aGlzIGlzIGEgcGFydCBvZiB0aGlzIHNlcmllcyBvcgo+IGJldHRlciBmaXJzdCBnZXQgaXQg
bWVyZ2VkLCBhbmQgdGhlbiBhZGQgc3VwcG9ydCBmb3Igb3RoZXIgZHJpdmVycz8KPgpTaW5jZSBp
dCdzIGEgdmVyeSBzbWFsbCBsaXN0LCBwZXJzb25hbGx5IEknZCBnbyB3aXRoIHBhcnQgb2YgdGhp
cyBzZXJpZXMuCklmIG90aGVycyBmZWVsIGRpZmZlcmVudGx5IGdvIHdpdGggdGhhdC4KClBsZWFz
ZSBkb24ndCBmb3JnZXQgdG8gYWRkcmVzcyBWaWxsZSBmZWVkYmFjay4KClRoYW5rcwpFbWlsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
