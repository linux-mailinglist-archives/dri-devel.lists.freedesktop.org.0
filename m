Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592C932790C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595589CC4;
	Mon,  1 Mar 2021 08:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8209189CC4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VBhVOW7QddtMZpz+i56Kuzuo/t/oTeHJKm9TIPy0ZrU=; b=KvojWjMs7Rqo59UeM8TaVNO7NA
 r+EMH+klyQOf9zUwGCJItMjEJ9wl9G6SCL2pC08mH+y2rin7yioNEKj7ddTgP9GottnYPJqoQHJzk
 C3qCcIl4hfPADOYEFn7w6/XCKPYmcHYQwE2u/cBOcx6S3aXhzqhvJaAlC46/JRXmiuizGu3mB7jsF
 XKeVYUaoNP6ixZqx4Qw6JoILG+AZglZkkAXGcp8rg3dq+GFaE+Xrja75S6tsSc3MaIfJMIPIzT13X
 thO7+DtjoNVTSblVaS20jKlJm/3+PLZsaniyFeTWhuLu2wpedph0m1/qLLWpnXTJ9lwOPFY+6+hrQ
 hTMsScZQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lGdll-0006AF-6M; Mon, 01 Mar 2021 10:19:09 +0200
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi> <YBLtPv/1mGXwtibX@ulmo>
 <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
 <25248139-5487-a15b-8965-1a29a71eacd7@kapsi.fi>
 <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <25beafda-8dd2-aeb9-1497-2c17907fbfd3@kapsi.fi>
Date: Mon, 1 Mar 2021 10:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi8yNy8yMSAxOjE5IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDMuMDIuMjAyMSAx
NDoxOCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gLi4uCj4+PiBJJ2xsIG5lZWQgbW9y
ZSB0aW1lIHRvIHRoaW5rIGFib3V0IGl0Lgo+Pj4KPj4KPj4gSG93IGFib3V0IHNvbWV0aGluZyBs
aWtlIHRoaXM6Cj4+Cj4+IFR1cm4gdGhlIHN5bmNwdF9pbmNyIGZpZWxkIGJhY2sgaW50byBhbiBh
cnJheSBvZiBzdHJ1Y3RzIGxpa2UKPj4KPj4gI2RlZmluZSBEUk1fVEVHUkFfU1VCTUlUX1NZTkNQ
VF9JTkNSX1JFUExBQ0VfU1lOQ09CSsKgwqDCoMKgwqDCoMKgICgxPDwwKQo+PiAjZGVmaW5lIERS
TV9URUdSQV9TVUJNSVRfU1lOQ1BUX0lOQ1JfUEFUQ0hfRFlOQU1JQ19TWU5DUFTCoMKgwqAgKDE8
PDEpCj4+Cj4+IHN0cnVjdCBkcm1fdGVncmFfc3VibWl0X3N5bmNwdF9pbmNyIHsKPj4gIMKgwqDC
oMKgLyogY2FuIGJlIGxlZnQgYXMgemVybyBpZiB1c2luZyBkeW5hbWljIHN5bmNwdCAqLwo+PiAg
wqDCoMKgwqBfX3UzMiBzeW5jcHRfaWQ7Cj4+ICDCoMKgwqDCoF9fdTMyIGZsYWdzOwo+Pgo+PiAg
wqDCoMKgwqBzdHJ1Y3Qgewo+PiAgwqDCoMKgwqDCoMKgwqAgX191MzIgc3luY29iajsKPj4gIMKg
wqDCoMKgwqDCoMKgIF9fdTMyIHZhbHVlOwo+PiAgwqDCoMKgwqB9IGZlbmNlOwo+Pgo+PiAgwqDC
oMKgwqAvKiBwYXRjaCB3b3JkIGFzIHN1Y2g6Cj4+ICDCoMKgwqDCoMKgwqDCoMKgICogKndvcmQg
PSAqd29yZCB8IChzeW5jcHRfaWQgPDwgc2hpZnQpCj4+ICDCoMKgwqDCoMKgwqDCoMKgICovCj4+
ICDCoMKgwqDCoHN0cnVjdCB7Cj4+ICDCoMKgwqDCoMKgwqDCoCBfX3UzMiBnYXRoZXJfb2Zmc2V0
X3dvcmRzOwo+PiAgwqDCoMKgwqDCoMKgwqAgX191MzIgc2hpZnQ7Cj4+ICDCoMKgwqDCoH0gcGF0
Y2g7Cj4+IH07Cj4+Cj4+IFNvIHRoaXMgd2lsbCB3b3JrIHNpbWlsYXJseSB0byB0aGUgYnVmZmVy
IHJlbG9jIHN5c3RlbTsgdGhlIGtlcm5lbAo+PiBkcml2ZXIgd2lsbCBhbGxvY2F0ZSBhIGpvYiBz
eW5jcG9pbnQgYW5kIHBhdGNoIGluIHRoZSBzeW5jcG9pbnQgSUQgaWYKPj4gcmVxdWVzdGVkLCBh
bmQgYWxsb3dzIG91dHB1dHRpbmcgc3luY29ianMgZm9yIGVhY2ggaW5jcmVtZW50Lgo+IAo+IEkg
aGF2ZW4ndCBnb3QgYW55IGdyZWF0IGlkZWFzIHNvIGZhciwgYnV0IGl0IGZlZWxzIHRoYXQgd2ls
bCBiZSBlYXNpZXIKPiBhbmQgY2xlYW5lciBpZiB3ZSBjb3VsZCBoYXZlIHNlcGFyYXRlIGpvYiBw
YXRocyAoYW5kIGpvYiBJT0NUTFMpIGJhc2VkCj4gb24gaGFyZHdhcmUgZ2VuZXJhdGlvbiBzaW5j
ZSB0aGUgd29ya2xvYWRzIGEgdG9vIGRpZmZlcmVudC4gVGhlIG5lZWRzIG9mCj4gYSBuZXdlciBo
L3cgYXJlIHRvbyBvYnNjdXJlIGZvciBtZSBhbmQgYWJzZW5jZSBvZiB1c2Vyc3BhY2UgY29kZSwK
PiBmaXJtd2FyZSBzb3VyY2VzIGFuZCBmdWxsIGgvdyBkb2N1bWVudGF0aW9uIGRvIG5vdCBoZWxw
Lgo+IAo+IFRoZXJlIHN0aWxsIHNob3VsZCBiZSBxdWl0ZSBhIGxvdCB0byBzaGFyZSwgYnV0IHRo
aW5ncyBsaWtlCj4gbWFwcGluZy10by1jaGFubmVsIGFuZCBWTSBzeW5jIHBvaW50cyBhcmUgdG9v
IGZhciBhd2F5IGZyb20gb2xkZXIgaC93LAo+IElNTy4gVGhpcyBtZWFucyB0aGF0IGNvZGUgcGF0
aCBiZWZvcmUgZHJtLXNjaGVkIGFuZCBwYXRoIGZvciBqb2ItdGltZW91dAo+IGhhbmRsaW5nIHNo
b3VsZCBiZSBzZXBhcmF0ZS4KPiAKPiBNYXliZSBsYXRlciBvbiBpdCB3aWxsIGJlY29tZSBjbGVh
bmVyIHRoYXQgd2UgYWN0dWFsbHkgY291bGQgdW5pZnkgaXQKPiBhbGwgbmljZWx5LCBidXQgZm9y
IG5vdyBpdCBkb2Vzbid0IGxvb2sgbGlrZSBhIGdvb2QgaWRlYSB0byBtZS4KPiAKPiBNaWtrbywg
ZG8geW91IGhhdmUgYW55IG9iamVjdGlvbnMgdG8gdHJ5aW5nIG91dCB2YXJpYW50IHdpdGggdGhl
Cj4gc2VwYXJhdGUgcGF0aHM/Cj4gCgpJJ20gb24gdmFjYXRpb24gZm9yIHRoZSBuZXh0IHR3byB3
ZWVrcy4gSSdsbCB0aGluayBhYm91dCBpdCBhbmQgcG9zdCBhIApwcm9wb3NhbCBvbmNlIEknbSBi
YWNrIHRvIHdvcmsuCgpNaWtrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
