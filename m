Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B1EC3BB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 14:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036216F7DB;
	Fri,  1 Nov 2019 13:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E92306F7DB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 13:34:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 536811F1;
 Fri,  1 Nov 2019 06:34:38 -0700 (PDT)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A03D53F718;
 Fri,  1 Nov 2019 06:34:37 -0700 (PDT)
Subject: Re: [PATCH 4/5] drm/panfrost: remove DRM_AUTH and respective comment
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-4-emil.l.velikov@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <d652ceaa-2c64-31f0-1793-14a5de51dc57@arm.com>
Date: Fri, 1 Nov 2019 13:34:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101130313.8862-4-emil.l.velikov@gmail.com>
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMTEvMjAxOSAxMzowMywgRW1pbCBWZWxpa292IHdyb3RlOgo+IEZyb206IEVtaWwgVmVs
aWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gCj4gQXMgb2YgZWFybGllciBjb21t
aXQgd2UgaGF2ZSBhZGRyZXNzIHNwYWNlIHNlcGFyYXRpb24uIFlldCB3ZSBmb3Jnb3QgdG8KPiBy
ZW1vdmUgdGhlIHJlc3BlY3RpdmUgY29tbWVudCBhbmQgRFJNX0FVVEggaW4gdGhlIGlvY3RsIGRl
Y2xhcmF0aW9uLgo+IAo+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEu
Y29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlA
YXJtLmNvbT4KPiBDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiBGaXhl
czogNzI4MmY3NjQ1ZDA2ICgiZHJtL3BhbmZyb3N0OiBJbXBsZW1lbnQgcGVyIEZEIGFkZHJlc3Mg
c3BhY2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xs
YWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5j
b20+CgpJJ20gbm90IHN1cmUgRFJNX0FVVEggcHJvdmlkZWQgdXMgd2l0aCBtdWNoIGluIHRoZSBm
aXJzdCBwbGFjZSAoYmVjYXVzZQpyZW5kZXIgbm9kZXMgY291bGQgc25vb3AvYWZmZWN0IHRoZSBw
cmltYXJ5IG5vZGUpLCBidXQgc2luY2Ugd2UgaGF2ZQphZGRyZXNzIHNwYWNlIHNlcGFyYXRpb24g
aXQncyBjbGVhcmx5IG5vdCByZXF1aXJlZCBub3cuCgpTdGV2ZQoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIHwgNiArLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiBpbmRleCBiYzJkZGViNTVmNWQuLmM2NzdiMmM5ZTQwOSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKPiBAQCAtNDUxLDE1
ICs0NTEsMTEgQEAgcGFuZnJvc3RfcG9zdGNsb3NlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0
cnVjdCBkcm1fZmlsZSAqZmlsZSkKPiAgCWtmcmVlKHBhbmZyb3N0X3ByaXYpOwo+ICB9Cj4gIAo+
IC0vKiBEUk1fQVVUSCBpcyByZXF1aXJlZCBvbiBTVUJNSVQgZm9yIG5vdywgd2hpbGUgYWxsIGNs
aWVudHMgc2hhcmUgYSBzaW5nbGUKPiAtICogYWRkcmVzcyBzcGFjZS4gIE5vdGUgdGhhdCByZW5k
ZXIgbm9kZXMgd291bGQgYmUgYWJsZSB0byBzdWJtaXQgam9icyB0aGF0Cj4gLSAqIGNvdWxkIGFj
Y2VzcyBCT3MgZnJvbSBjbGllbnRzIGF1dGhlbnRpY2F0ZWQgd2l0aCB0aGUgbWFzdGVyIG5vZGUu
Cj4gLSAqLwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pb2N0bF9kZXNjIHBhbmZyb3N0X2Ry
bV9kcml2ZXJfaW9jdGxzW10gPSB7Cj4gICNkZWZpbmUgUEFORlJPU1RfSU9DVEwobiwgZnVuYywg
ZmxhZ3MpIFwKPiAgCURSTV9JT0NUTF9ERUZfRFJWKFBBTkZST1NUXyMjbiwgcGFuZnJvc3RfaW9j
dGxfIyNmdW5jLCBmbGFncykKPiAgCj4gLQlQQU5GUk9TVF9JT0NUTChTVUJNSVQsCQlzdWJtaXQs
CQlEUk1fUkVOREVSX0FMTE9XIHwgRFJNX0FVVEgpLAo+ICsJUEFORlJPU1RfSU9DVEwoU1VCTUlU
LAkJc3VibWl0LAkJRFJNX1JFTkRFUl9BTExPVyksCj4gIAlQQU5GUk9TVF9JT0NUTChXQUlUX0JP
LAkJd2FpdF9ibywJRFJNX1JFTkRFUl9BTExPVyksCj4gIAlQQU5GUk9TVF9JT0NUTChDUkVBVEVf
Qk8sCWNyZWF0ZV9ibywJRFJNX1JFTkRFUl9BTExPVyksCj4gIAlQQU5GUk9TVF9JT0NUTChNTUFQ
X0JPLAkJbW1hcF9ibywJRFJNX1JFTkRFUl9BTExPVyksCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
