Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E122E2AE8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B698489BD2;
	Fri, 25 Dec 2020 09:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582336E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 15:10:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608736259; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0aAZ/bMuIrvzWM9gWlmih4RGaEX1HT300DY+Q/rbUMw=;
 b=COuvY2Oarugl44CuWsoMyTxEUxEq/Fkzo+Z0tcvqe6+KOqmvLMfzf+IAhEVef8nQWbvP4Joq
 QrmUeKKKcl1z5fjO2FxPpqwXEqTsnXceUr00etQw2kcRqnQahzoAO5G/eNQS7HUwc31iUrO/
 2B4/EmFgNLwzN71TwanCP0rObmU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fe35e016d2f42c6660c9c41 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 15:10:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 795B1C43465; Wed, 23 Dec 2020 15:10:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E4CBC433C6;
 Wed, 23 Dec 2020 15:10:56 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 23 Dec 2020 07:10:56 -0800
From: isaacm@codeaurora.org
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 3/7] iommu/arm-smmu: Add dependency on io-pgtable
 format modules
In-Reply-To: <b86f5972-2e9c-20bd-eee3-ee3ea53d5fe6@arm.com>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-4-git-send-email-isaacm@codeaurora.org>
 <3b0c191d-3fd0-73db-c1e3-4a80aa7953d7@arm.com>
 <e47f14b81d90772346ef28c9a7fd3365@codeaurora.org>
 <b86f5972-2e9c-20bd-eee3-ee3ea53d5fe6@arm.com>
Message-ID: <d2af5f0b1543ad374bc419507455a3cf@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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

T24gMjAyMC0xMi0yMyAwNTowNSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjAtMTItMjIg
MTk6NDksIGlzYWFjbUBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPj4gT24gMjAyMC0xMi0yMiAxMToy
NywgUm9iaW4gTXVycGh5IHdyb3RlOgo+Pj4gT24gMjAyMC0xMi0yMiAwMDo0NCwgSXNhYWMgSi4g
TWFuamFycmVzIHdyb3RlOgo+Pj4+IFRoZSBTTU1VIGRyaXZlciBkZXBlbmRzIG9uIHRoZSBhdmFp
bGFiaWxpdHkgb2YgdGhlIEFSTSBMUEFFIGFuZAo+Pj4+IEFSTSBWN1MgaW8tcGd0YWJsZSBmb3Jt
YXQgY29kZSB0byB3b3JrIHByb3Blcmx5LiBJbiBwcmVwYXJhdGlvbgo+Pj4gCj4+PiBOaXQ6IHdl
IGRvbid0IHJlYWxseSBkZXBlbmQgb24gdjdzIC0gd2UgKmNhbiogdXNlIGl0IGlmIGl0J3MKPj4+
IGF2YWlsYWJsZSwgYWRkcmVzcyBjb25zdHJhaW50cyBhcmUgc3VpdGFibGUsIGFuZCB0aGUgU01N
VQo+Pj4gaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgc3VwcG9ydHMgaXQgKG1hbnkgZG9uJ3QpLCBi
dXQgd2UgY2FuIHN0aWxsCj4+PiBxdWl0ZSBoYXBwaWx5IG5vdCB1c2UgaXQgZXZlbiBzby4gTFBB
RSBpcyBtYW5kYXRvcnkgaW4gdGhlCj4+PiBhcmNoaXRlY3R1cmUgc28gdGhhdCdzIG91ciBvbmx5
IGhhcmQgcmVxdWlyZW1lbnQsIGVtYm9kaWVkIGluIHRoZQo+Pj4ga2NvbmZpZyBzZWxlY3QuCj4+
PiAKPj4+IFRoaXMgZG9lcyBtZWFuIHRoZXJlIG1heSB0ZWNobmljYWxseSBzdGlsbCBiZSBhIGNv
cm5lciBjYXNlIGludm9sdmluZwo+Pj4gQVJNX1NNTVU9eSBhbmQgSU9fUEdUQUJMRV9BUk1fVjdT
PW0sIGJ1dCBhdCB3b3JzdCBpdCdzIG5vdyBhIHJ1bnRpbWUKPj4+IGZhaWx1cmUgcmF0aGVyIHRo
YW4gYSBidWlsZCBlcnJvciwgc28gdW5sZXNzIGFuZCB1bnRpbCBhbnlvbmUKPj4+IGRlbW9uc3Ry
YXRlcyB0aGF0IGl0IGFjdHVhbGx5IG1hdHRlcnMgSSBkb24ndCBmZWVsIHBhcnRpY3VsYXJseQo+
Pj4gaW5jbGluZWQgdG8gZ2l2ZSBpdCBtdWNoIHRob3VnaHQuCj4+PiAKPj4+IFJvYmluLgo+Pj4g
Cj4+IE9rYXksIEknbGwgZml4IHVwIHRoZSBjb21taXQgbWVzc2FnZSwgYXMgd2VsbCBhcyB0aGUg
Y29kZSwgc28gdGhhdCBpdAo+PiBvbmx5IGRlcGVuZHMgb24gaW8tcGd0YWJsZS1hcm0uCj4gCj4g
V2VsbCwgSUlVQyBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGtlZXAgdGhlIHNvZnRkZXAgZm9yIHdo
ZW4gdGhlIHY3cwo+IG1vZHVsZSAqaXMqIHByZXNlbnQ7IEkganVzdCB3YW50ZWQgdG8gY2xhcmlm
eSB0aGF0IGl0J3MgbW9yZSBvZiBhCj4gbmljZS10by1oYXZlIHJhdGhlciB0aGFuIGEgbmVjZXNz
aXR5Lgo+IAo+IFJvYmluLgo+IApVbmRlcnN0b29kLCBJIHdpbGwga2VlcCBpdCB0aGVyZSBhbmQg
cmV3b3JkIHRoZSBjb21taXQgbXNnLiBJIGp1c3QgdHJpZWQgCml0IG91dCBpbiBhbiBlbnZpcm9u
bWVudAp3aGVyZSB0aGUgaW8tcGd0YWJsZS1hcm0tdjdzIG1vZHVsZSBpc24ndCBwcmVzZW50LCBh
bmQgSSBkaWRuJ3Qgc2VlIGFueQp3YXJuaW5ncyBvciBlcnJvciBtZXNzYWdlcywgYW5kIHRoZSBT
TU1VIGRyaXZlciBtb2R1bGUgd2FzIGxvYWRlZCAKcHJvcGVybHksCnNvIHllcywgaXQncyBnb29k
IHRvIGhhdmUgaXQuCgpUaGFua3MsCklzYWFjCj4+IFRoYW5rcywKPj4gSXNhYWMKPj4+PiBmb3Ig
aGF2aW5nIHRoZSBpby1wZ3RhYmxlIGZvcm1hdHMgYXMgbW9kdWxlcywgYWRkIGEgInByZSIKPj4+
PiBkZXBlbmRlbmN5IHdpdGggTU9EVUxFX1NPRlRERVAoKSB0byBlbnN1cmUgdGhhdCB0aGUgaW8t
cGd0YWJsZQo+Pj4+IGZvcm1hdCBtb2R1bGVzIGFyZSBsb2FkZWQgYmVmb3JlIGxvYWRpbmcgdGhl
IEFSTSBTTU1VIGRyaXZlciBtb2R1bGUuCj4+Pj4gCj4+Pj4gU2lnbmVkLW9mZi1ieTogSXNhYWMg
Si4gTWFuamFycmVzIDxpc2FhY21AY29kZWF1cm9yYS5vcmc+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJp
dmVycy9pb21tdS9hcm0vYXJtLXNtbXUvYXJtLXNtbXUuYyB8IDEgKwo+Pj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lv
bW11L2FybS9hcm0tc21tdS9hcm0tc21tdS5jIAo+Pj4+IGIvZHJpdmVycy9pb21tdS9hcm0vYXJt
LXNtbXUvYXJtLXNtbXUuYwo+Pj4+IGluZGV4IGQ4YzZiZmQuLmE3MjY0OWYgMTAwNjQ0Cj4+Pj4g
LS0tIGEvZHJpdmVycy9pb21tdS9hcm0vYXJtLXNtbXUvYXJtLXNtbXUuYwo+Pj4+ICsrKyBiL2Ry
aXZlcnMvaW9tbXUvYXJtL2FybS1zbW11L2FybS1zbW11LmMKPj4+PiBAQCAtMjM1MSwzICsyMzUx
LDQgQEAgTU9EVUxFX0RFU0NSSVBUSU9OKCJJT01NVSBBUEkgZm9yIEFSTSAKPj4+PiBhcmNoaXRl
Y3RlZCBTTU1VIGltcGxlbWVudGF0aW9ucyIpOwo+Pj4+IMKgIE1PRFVMRV9BVVRIT1IoIldpbGwg
RGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Iik7Cj4+Pj4gwqAgTU9EVUxFX0FMSUFTKCJwbGF0Zm9y
bTphcm0tc21tdSIpOwo+Pj4+IMKgIE1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKPj4+PiArTU9E
VUxFX1NPRlRERVAoInByZTogaW8tcGd0YWJsZS1hcm0gaW8tcGd0YWJsZS1hcm0tdjdzIik7Cj4+
Pj4gCj4+PiAKPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+PiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+Pj4gbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
