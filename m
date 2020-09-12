Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC03267AA0
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 15:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A136E290;
	Sat, 12 Sep 2020 13:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05E26E290
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ddacKGL97I74ZStIHKqHFVEiRrwAsDG8WpYCuGniG44=; b=XibWX2OFNuK5/XyCkjIE1wwCJq
 I9BtPUeOhCcvs1toNZDBt35qo2inUvKpV9XA3I8GjmddinYD32Aokn25+T8ZkVMS3ULjhq2z0wN/J
 S0Ab8ac4BMTZYRfVXgCJQk7UKXv3FNyLnDs2ub1LZYcoVx6n1lYxdPsjjrk/pf8aJu8LXaI5ZYFCX
 6fS0MOfPn9g36OJiqE4DmbzeIEVeA3lOrQLKIPVWi+RUZWa+NkEnL0vM6ra+FYAPyM0WmsFqFGAJm
 mqzUtXcaVFKVZAii05C4NbA4kaGwAU23zPE2OWNQF5h5S8iKTdF8V3r+TjW2A1sxHTnejOd0mwTBJ
 m0rbo75w==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kH5d1-0000ko-JT; Sat, 12 Sep 2020 16:31:43 +0300
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
 <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
 <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
Date: Sat, 12 Sep 2020 16:31:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMi8yMCAzOjUzIFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTIuMDkuMjAyMCAw
MToxMSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IE9uIDkvMTEvMjAgNzo0MCBQTSwg
RG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1
bmVuINC/0LjRiNC10YI6Cj4+Pj4gK8KgwqDCoCB9IGVsc2Ugewo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgaG9zdDF4X2pvYiAqZmFpbGVkX2pvYiA9IGpvYjsKPj4+PiArCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGhvc3QxeF9qb2JfZHVtcChkZXYsIGpvYik7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBob3N0MXhfc3luY3B0X3NldF9sb2NrZWQoam9iLT5zeW5jcHQpOwo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBmYWlsZWRfam9iLT5jYW5jZWxsZWQgPSB0cnVlOwo+Pj4+ICsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeV9jb250aW51ZShqb2IsICZjZG1hLT5zeW5j
X3F1ZXVlLCBsaXN0KSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50
IGk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChqb2ItPnN5bmNwdCAh
PSBmYWlsZWRfam9iLT5zeW5jcHQpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb250aW51ZTsKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0g
MDsgaSA8IGpvYi0+bnVtX3Nsb3RzOyBpKyspIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGludCBzbG90ID0gKGpvYi0+Zmlyc3RfZ2V0LzggKyBpKSAlCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBIT1NUMVhfUFVTSEJVRkZFUl9TTE9UUzsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHUzMiAqbWFwcGVkID0gY2RtYS0+cHVzaF9idWZmZXIubWFwcGVkOwo+Pj4+ICsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcHBlZFsyKnNsb3QrMF0gPSAweDFi
YWQwMDAwOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwcGVkWzIqc2xv
dCsxXSA9IDB4MWJhZDAwMDA7Cj4+Pgo+Pj4gVGhlIDB4MWJhZDAwMDAgaXMgYSB2YWxpZCBtZW1v
cnkgYWRkcmVzcyBvbiBUZWdyYTIwLgo+Pj4KPj4+IFRoZSAweDYwMDAwMDAwIGlzIGludmFsaWQg
cGh5cyBhZGRyZXNzIGZvciBhbGwgaGFyZHdhcmUgZ2VuZXJhdGlvbnMuCj4+PiBJdCdzIHVzZWQg
YnkgZ3JhdGUta2VybmVsIFsxXSBhbmQgVkRFIGRyaXZlciBbMl0uIE5vdGUgdGhhdCB0aGUgMHg2
IDw8Cj4+PiAyOCBpcyBhbHNvIGludmFsaWQgSG9zdDF4IG9wY29kZSwgd2hpbGUgMHgxIHNob3Vs
ZCBicmVhayBDRE1BIHBhcnNlcgo+Pj4gZHVyaW5nIG9mIFBCIGRlYnVnLWR1bXBpbmcuCj4+Pgo+
Pj4gWzFdCj4+PiBodHRwczovL2dpdGh1Yi5jb20vZ3JhdGUtZHJpdmVyL2xpbnV4L2Jsb2IvbWFz
dGVyL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uaCNMMTYKPj4+Cj4+Pgo+Pj4gWzJdCj4+PiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS45LXJjNC9zb3VyY2UvZHJpdmVycy9z
dGFnaW5nL21lZGlhL3RlZ3JhLXZkZS9pb21tdS5jI0w5OQo+Pj4KPj4+Cj4+PiBUaGUgVkRFIGRy
aXZlciByZXNlcnZlcyB0aGUgdHJhcHBpbmcgSU9WQSBhZGRyZXNzZXMsIEkgYXNzdW1lIHRoZSBI
b3N0MXgKPj4+IGRyaXZlciBzaG91bGQgZG8gdGhlIHNhbWUuCj4+Pgo+Pgo+PiBUaGUgMHgxYmFk
MDAwMCdzIGFyZSBub3QgaW50ZW5kZWQgdG8gYmUgbWVtb3J5IGFkZHJlc3NlcywgdGhleSBhcmUg
Tk9PUAo+PiBvcGNvZGVzIChJTkNSIG9mIDAgd29yZHMgdG8gb2Zmc2V0IDB4YmFkKS4gSSdsbCBm
aXggdGhpcyB0byB1c2UgcHJvcGVyCj4+IGZ1bmN0aW9ucyB0byBjb25zdHJ1Y3QgdGhlIG9wY29k
ZXMgYW5kIGFkZCBzb21lIGNvbW1lbnRzLiBUaGVzZSBuZWVkIHRvCj4+IGJlIE5PT1Agb3Bjb2Rl
cyBzbyB0aGUgY29tbWFuZCBwYXJzZXIgc2tpcHMgb3ZlciB0aGVzZSAiY2FuY2VsbGVkIiBqb2Jz
Cj4+IHdoZW4gdGhlIGNoYW5uZWwgaXMgcmVzdW1lZC4KPj4KPj4gQlRXLCAweDYwMDAwMDAwIGlz
IHZhbGlkIG9uIFRlZ3JhMTk0IGFuZCBsYXRlci4KPiAKPiBBdCBhIHF1aWNrIGdsYW5jZSBpdCBs
b29rZWQgbGlrZSBhIG1lbW9yeSBhZGRyZXNzIDopCgpJdCBkb2VzIGxvb2sgYSBiaXQgbGlrZSBv
bmUgOikgSSdsbCBhZGQgYSBjb21tZW50IHRvIG1ha2UgaXQgY2xlYXIuCgo+IAo+IEknbSBub3cg
dGFraW5nIGEgY2xvc2VyIGxvb2sgYXQgdGhpcyBwYXRjaCBhbmQgaXQgcmFpc2VzIHNvbWUgbW9y
ZQo+IHF1ZXN0aW9ucywgbGlrZSBmb3IgZXhhbXBsZSBieSBsb29raW5nIGF0IHRoZSAiT24gam9i
IHRpbWVvdXQsIHdlIHN0b3AKPiB0aGUgY2hhbm5lbCwgTk9QIGFsbCBmdXR1cmUgam9icyBvbiB0
aGUgY2hhbm5lbCB1c2luZyB0aGUgc2FtZSBzeW5jcG9pbnQKPiAuLi4iIHRocm91Z2ggdGhlIHBy
aXNtIG9mIGdyYXRlLWtlcm5lbCBleHBlcmllbmNlLCBJJ20gbm90IHN1cmUgaG93IGl0Cj4gY291
bGQgY28tZXhpc3Qgd2l0aCB0aGUgZHJtLXNjaGVkdWxlciBhbmQgd2h5IGl0J3MgbmVlZGVkIGF0
IGFsbC4gQnV0IEkKPiB0aGluayB3ZSBuZWVkIGEgZmVhdHVyZS1jb21wbGV0ZSB2ZXJzaW9uIChh
dCBsZWFzdCBhIHJvdWdoIHZlcnNpb24pLCBzbwo+IHRoYXQgd2UgY291bGQgc3RhcnQgdGhlIHRl
c3RpbmcsIGFuZCB0aGVuIGl0IHNob3VsZCBiZSBlYXNpZXIgdG8gcmV2aWV3Cj4gYW5kIGRpc2N1
c3Mgc3VjaCB0aGluZ3MuCj4gCgpUaGUgcmVhc29uIHRoaXMgaXMgbmVlZGVkIGlzIHRoYXQgaWYg
YSBqb2IgdGltZXMgb3V0IGFuZCB3ZSBkb24ndCBkbyBpdHMgCnN5bmNwb2ludCBpbmNyZW1lbnRz
IG9uIHRoZSBDUFUsIHRoZW4gYSBzdWNjZXNzaXZlIGpvYiBpbmNyZW1lbnRpbmcgdGhhdCAKc2Ft
ZSBzeW5jcG9pbnQgd291bGQgY2F1c2UgZmVuY2VzIHRvIHNpZ25hbCBpbmNvcnJlY3RseS4gVGhl
IGpvYiB0aGF0IAp3YXMgc3VwcG9zZWQgdG8gc2lnbmFsIHRob3NlIGZlbmNlcyBkaWRuJ3QgYWN0
dWFsbHkgcnVuOyBhbmQgYW55IGRhdGEgCnRob3NlIGZlbmNlcyB3ZXJlIHByb3RlY3Rpbmcgd291
bGQgc3RpbGwgYmUgZ2FyYmFnZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
