Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9112883A2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596D26EC66;
	Fri,  9 Oct 2020 07:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289C36EC4F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:33:08 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id cq12so8374518edb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zHLZR+cdQxUXAapkvnhHRxEGDbtuU0jlMqUOlyS9CQ8=;
 b=IwKJFEewQoSKcdG2YAPPCbvHXC/d2fJCXSoWKxPDWofdhldJOtN8hS/Pi5QmL2msmn
 fgO0tfHHRvDJp5uq9wMO8PF1j4J3ajDFOYcMFiiaYbCL9NgUHnvdfzApp7sEygo8gHxC
 XuNUH0cjc2UyhfzR8KOepak+beCJyiDatAyXYrrwq6vTnuio5ewdh3s45qi6I4MnPepn
 RvfsaAkCY5dUJqRtOzl726dnOvp9VkasIudKgL/r8Bwc1xElpx5geFYNETeMzzNk/itj
 Se2doJ6dBHD+gWR5v+n062bMQQl2yZI38NO7DfFv72qUtNzYYk4S/7RgNX+cj0ebgjTt
 XBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zHLZR+cdQxUXAapkvnhHRxEGDbtuU0jlMqUOlyS9CQ8=;
 b=mG0yxIXNCqzFPlCMBDOUnbJil8k2OSUlWtcEedCEwKNGPvacw2E4ajMuFsH1Ope6WG
 bcfL7AuvjqlOj+zlF/4qTFMDTMZQVQgSXDuxQw5v4ji8Mlr053DCRg6AFOFEoIrHxc5F
 ntWcHPSeCKMhh+tAPvO3814bVEQNIAm/BtZUFlcPhZ/yXb368XpSBNw+w+r9rOV3YiTN
 CyStWPmmewCCgPnDJG4eKlEP1DKHcPrM7p1GQ5F+0z/epXrl9mWvocWB2KlqGBm1UEvm
 AkJySNDZvc6j7t7KjdxoXixG9gvutO4mZbqLFZTM2fuz4RkrWrVFXfHlfZSGqV32JrT4
 AL6A==
X-Gm-Message-State: AOAM533s4MqR72XLhPhYLICi4Q9BLR0+aQZLa7IfVwEynrH+OTyMWxAO
 qhDfwd8JgcuDpPw70yqj5oQ=
X-Google-Smtp-Source: ABdhPJzXIarjT4XlMBlwIGVzLRN/9SvySlM1kW8J0vZXEormyHb9njn+Y4gL6yZ2ZXkN7zR7BWjQ5A==
X-Received: by 2002:aa7:d29a:: with SMTP id w26mr12533300edq.59.1602228786703; 
 Fri, 09 Oct 2020 00:33:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id gv10sm5824756ejb.46.2020.10.09.00.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 00:33:06 -0700 (PDT)
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
To: John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk, airlied@redhat.com, akpm@linux-foundation.org,
 daniel@ffwll.ch, sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <b6b77e60-f93d-efe4-e267-983a2bdbbe71@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <747e1832-0341-9029-95f6-638f0f1a6f76@gmail.com>
Date: Fri, 9 Oct 2020 09:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b6b77e60-f93d-efe4-e267-983a2bdbbe71@nvidia.com>
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMTAuMjAgdW0gMjM6NDkgc2NocmllYiBKb2huIEh1YmJhcmQ6Cj4gT24gMTAvOC8yMCA0
OjIzIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBZGQgdGhlIG5ldyB2bWFfc2V0X2Zp
bGUoKSBmdW5jdGlvbiB0byBhbGxvdyBjaGFuZ2luZwo+PiB2bWEtPnZtX2ZpbGUgd2l0aCB0aGUg
bmVjZXNzYXJ5IHJlZmNvdW50IGRhbmNlLgo+Pgo+PiB2MjogYWRkIG1vcmUgdXNlcnMgb2YgdGhp
cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNiArKysrKy0tLS0tLS0tLS0tCj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmPCoMKgwqDCoMKgIHzCoCA0ICstLS0K
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jIHzCoCAzICst
LQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jwqDCoCB8wqAg
NCArKy0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDQgKy0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2dlbS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3Zn
ZW0vdmdlbV9kcnYuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKy0tCj4+IMKgIGRyaXZl
cnMvc3RhZ2luZy9hbmRyb2lkL2FzaG1lbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDUgKyst
LS0KPj4gwqAgaW5jbHVkZS9saW51eC9tbS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsrCj4+IMKgIG1tL21tYXAuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE2
ICsrKysrKysrKysrKysrKysKPj4gwqAgMTAgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygr
KSwgMjggZGVsZXRpb25zKC0pCj4KPiBMb29rcyBsaWtlIGEgbmljZSBjbGVhbnVwLiBUd28gY29t
bWVudHMgYmVsb3cuCj4KPiAuLi4KPgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fbW1hbi5jCj4+IGluZGV4IDNkNjllNTFmM2U0ZC4uYzlkNWYxYTM4YWYzIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMKPj4gQEAgLTg5Myw4ICs4
OTMsOCBAQCBpbnQgaTkxNV9nZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IAo+PiB2
bV9hcmVhX3N0cnVjdCAqdm1hKQo+PiDCoMKgwqDCoMKgwqAgKiByZXF1aXJlcyBhdm9pZGluZyBl
eHRyYW5lb3VzIHJlZmVyZW5jZXMgdG8gdGhlaXIgZmlscCwgaGVuY2UgCj4+IHdoeQo+PiDCoMKg
wqDCoMKgwqAgKiB3ZSBwcmVmZXIgdG8gdXNlIGFuIGFub255bW91cyBmaWxlIGZvciB0aGVpciBt
bWFwcy4KPj4gwqDCoMKgwqDCoMKgICovCj4+IC3CoMKgwqAgZnB1dCh2bWEtPnZtX2ZpbGUpOwo+
PiAtwqDCoMKgIHZtYS0+dm1fZmlsZSA9IGFub247Cj4+ICvCoMKgwqAgdm1hX3NldF9maWxlKHZt
YSwgYW5vbik7Cj4+ICvCoMKgwqAgZnB1dChhbm9uKTsKPgo+IFRoYXQncyBvbmUgZnB1dCgpIHRv
byBtYW55LCBpc24ndCBpdD8KCk5vLCB0aGUgb3RoZXIgY2FzZXMgd2VyZSByZXBsYWNpbmcgdGhl
IHZtX2ZpbGUgd2l0aCBzb21ldGhpbmcgCnByZS1hbGxvY2F0ZWQgYW5kIGFsc28gZ3JhYmJlZCBh
IG5ldyByZWZlcmVuY2UuCgpCdXQgdGhpcyBjYXNlIGhlcmUgdXNlcyB0aGUgZnJlc2hseSBhbGxv
Y2F0ZWQgYW5vbiBmaWxlIGFuZCBzbyAKdm1hX3NldF9maWxlKCkgZ3JhYnMgYW5vdGhlciBleHRy
YSByZWZlcmVuY2Ugd2hpY2ggd2UgbmVlZCB0byBkcm9wLgoKVGhlIGFsdGVybmF0aXZlIGlzIHRv
IGp1c3Qga2VlcCBpdCBhcyBpdCBpcy4gT3BpbmlvbnM/Cgo+Cj4KPiAuLi4KPgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvYXNobWVtLmMgCj4+IGIvZHJpdmVycy9zdGFn
aW5nL2FuZHJvaWQvYXNobWVtLmMKPj4gaW5kZXggMTBiNGJlMWYzZTc4Li5hNTFkYzA4OTg5NmUg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2FzaG1lbS5jCj4+ICsrKyBi
L2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2FzaG1lbS5jCj4+IEBAIC00NTAsOSArNDUwLDggQEAg
c3RhdGljIGludCBhc2htZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IAo+PiB2bV9h
cmVhX3N0cnVjdCAqdm1hKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdm1hX3NldF9hbm9ueW1vdXMo
dm1hKTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqAgaWYgKHZtYS0+dm1fZmlsZSkKPj4g
LcKgwqDCoMKgwqDCoMKgIGZwdXQodm1hLT52bV9maWxlKTsKPj4gLcKgwqDCoCB2bWEtPnZtX2Zp
bGUgPSBhc21hLT5maWxlOwo+PiArwqDCoMKgIHZtYV9zZXRfZmlsZSh2bWEsIGFzbWEtPmZpbGUp
Owo+PiArwqDCoMKgIGZwdXQoYXNtYS0+ZmlsZSk7Cj4KPiBTYW1lIGhlcmU6IHRoYXQgZnB1dCgp
IHNlZW1zIHdyb25nLCBhcyBpdCB3YXMgYWxyZWFkeSBkb25lIHdpdGhpbiAKPiB2bWFfc2V0X2Zp
bGUoKS4KCk5vLCB0aGF0IGNhc2UgaXMgY29ycmVjdCBhcyB3ZWxsLiBUaGUgQW5kcm9pZCBjb2Rl
IGhlcmUgaGFzIHRoZSBtYXRjaGluZyAKZ2V0X2ZpbGUoKSBhIGZldyBsaW5lcyB1cCwgc2VlIHRo
ZSBzdXJyb3VuZGluZyBjb2RlLgoKSSBkaWRuJ3Qgd2FudGVkIHRvIHJlcGxhY2UgdGhhdCBzaW5j
ZSBpdCBkb2VzIHNvbWUgc3RyYW5nZSBlcnJvciAKaGFuZGxpbmcgaGVyZSwgc28gdGhlIHJlc3Vs
dCBpcyB0aGF0IHdlIG5lZWQgdG8gZHJvcCB0aGUgZXh0cmEgcmVmZXJlbmNlIAphcyBhZ2Fpbi4K
CldlIGNvdWxkIGFsc28ga2VlcCBpdCBsaWtlIGl0IGlzIG9yIG1heWJlIGJldHRlciBwdXQgYSBU
T0RPIGNvbW1lbnQgb24gaXQuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4KPgo+IHRoYW5rcywK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
