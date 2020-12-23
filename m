Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AD92E1C76
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 14:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFBC6E0AD;
	Wed, 23 Dec 2020 13:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1956C6E0A0;
 Wed, 23 Dec 2020 13:05:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D5B330E;
 Wed, 23 Dec 2020 05:05:30 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B1333F66E;
 Wed, 23 Dec 2020 05:05:28 -0800 (PST)
Subject: Re: [PATCH v2 3/7] iommu/arm-smmu: Add dependency on io-pgtable
 format modules
To: isaacm@codeaurora.org
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-4-git-send-email-isaacm@codeaurora.org>
 <3b0c191d-3fd0-73db-c1e3-4a80aa7953d7@arm.com>
 <e47f14b81d90772346ef28c9a7fd3365@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b86f5972-2e9c-20bd-eee3-ee3ea53d5fe6@arm.com>
Date: Wed, 23 Dec 2020 13:05:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e47f14b81d90772346ef28c9a7fd3365@codeaurora.org>
Content-Language: en-GB
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
Cc: kernel-team@android.com, will@kernel.org, pdaly@codeaurora.org,
 linux-arm-msm@vger.kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 pratikp@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0xMi0yMiAxOTo0OSwgaXNhYWNtQGNvZGVhdXJvcmEub3JnIHdyb3RlOgo+IE9uIDIw
MjAtMTItMjIgMTE6MjcsIFJvYmluIE11cnBoeSB3cm90ZToKPj4gT24gMjAyMC0xMi0yMiAwMDo0
NCwgSXNhYWMgSi4gTWFuamFycmVzIHdyb3RlOgo+Pj4gVGhlIFNNTVUgZHJpdmVyIGRlcGVuZHMg
b24gdGhlIGF2YWlsYWJpbGl0eSBvZiB0aGUgQVJNIExQQUUgYW5kCj4+PiBBUk0gVjdTIGlvLXBn
dGFibGUgZm9ybWF0IGNvZGUgdG8gd29yayBwcm9wZXJseS4gSW4gcHJlcGFyYXRpb24KPj4KPj4g
Tml0OiB3ZSBkb24ndCByZWFsbHkgZGVwZW5kIG9uIHY3cyAtIHdlICpjYW4qIHVzZSBpdCBpZiBp
dCdzCj4+IGF2YWlsYWJsZSwgYWRkcmVzcyBjb25zdHJhaW50cyBhcmUgc3VpdGFibGUsIGFuZCB0
aGUgU01NVQo+PiBpbXBsZW1lbnRhdGlvbiBhY3R1YWxseSBzdXBwb3J0cyBpdCAobWFueSBkb24n
dCksIGJ1dCB3ZSBjYW4gc3RpbGwKPj4gcXVpdGUgaGFwcGlseSBub3QgdXNlIGl0IGV2ZW4gc28u
IExQQUUgaXMgbWFuZGF0b3J5IGluIHRoZQo+PiBhcmNoaXRlY3R1cmUgc28gdGhhdCdzIG91ciBv
bmx5IGhhcmQgcmVxdWlyZW1lbnQsIGVtYm9kaWVkIGluIHRoZQo+PiBrY29uZmlnIHNlbGVjdC4K
Pj4KPj4gVGhpcyBkb2VzIG1lYW4gdGhlcmUgbWF5IHRlY2huaWNhbGx5IHN0aWxsIGJlIGEgY29y
bmVyIGNhc2UgaW52b2x2aW5nCj4+IEFSTV9TTU1VPXkgYW5kIElPX1BHVEFCTEVfQVJNX1Y3Uz1t
LCBidXQgYXQgd29yc3QgaXQncyBub3cgYSBydW50aW1lCj4+IGZhaWx1cmUgcmF0aGVyIHRoYW4g
YSBidWlsZCBlcnJvciwgc28gdW5sZXNzIGFuZCB1bnRpbCBhbnlvbmUKPj4gZGVtb25zdHJhdGVz
IHRoYXQgaXQgYWN0dWFsbHkgbWF0dGVycyBJIGRvbid0IGZlZWwgcGFydGljdWxhcmx5Cj4+IGlu
Y2xpbmVkIHRvIGdpdmUgaXQgbXVjaCB0aG91Z2h0Lgo+Pgo+PiBSb2Jpbi4KPj4KPiBPa2F5LCBJ
J2xsIGZpeCB1cCB0aGUgY29tbWl0IG1lc3NhZ2UsIGFzIHdlbGwgYXMgdGhlIGNvZGUsIHNvIHRo
YXQgaXQKPiBvbmx5IGRlcGVuZHMgb24gaW8tcGd0YWJsZS1hcm0uCgpXZWxsLCBJSVVDIGl0IHdv
dWxkIG1ha2Ugc2Vuc2UgdG8ga2VlcCB0aGUgc29mdGRlcCBmb3Igd2hlbiB0aGUgdjdzIAptb2R1
bGUgKmlzKiBwcmVzZW50OyBJIGp1c3Qgd2FudGVkIHRvIGNsYXJpZnkgdGhhdCBpdCdzIG1vcmUg
b2YgYSAKbmljZS10by1oYXZlIHJhdGhlciB0aGFuIGEgbmVjZXNzaXR5LgoKUm9iaW4uCgo+IFRo
YW5rcywKPiBJc2FhYwo+Pj4gZm9yIGhhdmluZyB0aGUgaW8tcGd0YWJsZSBmb3JtYXRzIGFzIG1v
ZHVsZXMsIGFkZCBhICJwcmUiCj4+PiBkZXBlbmRlbmN5IHdpdGggTU9EVUxFX1NPRlRERVAoKSB0
byBlbnN1cmUgdGhhdCB0aGUgaW8tcGd0YWJsZQo+Pj4gZm9ybWF0IG1vZHVsZXMgYXJlIGxvYWRl
ZCBiZWZvcmUgbG9hZGluZyB0aGUgQVJNIFNNTVUgZHJpdmVyIG1vZHVsZS4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBJc2FhYyBKLiBNYW5qYXJyZXMgPGlzYWFjbUBjb2RlYXVyb3JhLm9yZz4KPj4+
IC0tLQo+Pj4gwqAgZHJpdmVycy9pb21tdS9hcm0vYXJtLXNtbXUvYXJtLXNtbXUuYyB8IDEgKwo+
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11L2FybS1zbW11LmMgCj4+PiBiL2RyaXZlcnMvaW9t
bXUvYXJtL2FybS1zbW11L2FybS1zbW11LmMKPj4+IGluZGV4IGQ4YzZiZmQuLmE3MjY0OWYgMTAw
NjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS9hcm0tc21tdS5jCj4+PiAr
KysgYi9kcml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS9hcm0tc21tdS5jCj4+PiBAQCAtMjM1MSwz
ICsyMzUxLDQgQEAgTU9EVUxFX0RFU0NSSVBUSU9OKCJJT01NVSBBUEkgZm9yIEFSTSAKPj4+IGFy
Y2hpdGVjdGVkIFNNTVUgaW1wbGVtZW50YXRpb25zIik7Cj4+PiDCoCBNT0RVTEVfQVVUSE9SKCJX
aWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPiIpOwo+Pj4gwqAgTU9EVUxFX0FMSUFTKCJwbGF0
Zm9ybTphcm0tc21tdSIpOwo+Pj4gwqAgTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwo+Pj4gK01P
RFVMRV9TT0ZUREVQKCJwcmU6IGlvLXBndGFibGUtYXJtIGlvLXBndGFibGUtYXJtLXY3cyIpOwo+
Pj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPj4gbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
