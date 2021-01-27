Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6D43066DA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 22:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C2B6E8B2;
	Wed, 27 Jan 2021 21:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367C089BF1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PFr1PpZ+sLDeYeNOkv4pXr/k0mA3n8rwWzFd2Ytw6Lk=; b=NKToiTco1g4RyKH+LeCBlLsyYE
 naKzRclnRvcNQX6hxIR06mB62WdAsk4MlUQQ0cr0UZOJB25ea0KoBM2VmWoc2CVWTR6IEdzKZN3BV
 TJupFHEm2z4LkE8NUOtFemn9BLi0jduBErcXoQ76a4YKnYGkk9btZK1YXnLfbEC/dKXwMqMqwd5rd
 p8Fz5jtXbotU/yCrpdSpfeKNVyezf3zXECdrANshBvNcgsQAvFC3GhzQqdeGyh23+zseLo2i2QY2b
 tJd7Uf7tGReTiMhifpjTl9ZRjI0N/TC4O9ZOZN14WaTVRK2959WXbnFjg1Jk3R8NT1QwSp5/YtN8w
 s0NbsVCw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1l4soI-00086B-QU; Wed, 27 Jan 2021 23:57:10 +0200
Subject: Re: [PATCH v5 00/21] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <638c1aeb-921b-0ea2-5258-16c6d3183306@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <9f755e95-97fc-4f57-5e8d-426af589c857@kapsi.fi>
Date: Wed, 27 Jan 2021 23:57:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <638c1aeb-921b-0ea2-5258-16c6d3183306@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxLzI3LzIxIDExOjI2IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjYuMDEuMjAy
MSAwNTo0NSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+PiA1LiBUaGUgaGFyZHdhcmUg
c3RhdGUgb2Ygc3luYyBwb2ludHMgc2hvdWxkIGJlIHJlc2V0IHdoZW4gc3luYyBwb2ludCBpcwo+
Pj4gcmVxdWVzdGVkLCBub3Qgd2hlbiBob3N0MXggZHJpdmVyIGlzIGluaXRpYWxpemVkLgo+Pgo+
PiBUaGlzIG1heSBiZSBkb2FibGUsIGJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIGNyaXRpY2FsIGZv
ciB0aGlzIFVBUEksIHNvCj4+IGxldCdzIGNvbnNpZGVyIGl0IGFmdGVyIHRoaXMgc2VyaWVzLgo+
Pgo+PiBUaGUgdXNlcnNwYWNlIHNob3VsZCBhbnl3YXkgbm90IGJlIGFibGUgdG8gYXNzdW1lIHRo
ZSBpbml0aWFsIHZhbHVlIG9mCj4+IHRoZSBzeW5jcG9pbnQgdXBvbiBhbGxvY2F0aW9uLiBUaGUg
a2VybmVsIHNob3VsZCBzZXQgaXQgdG8gc29tZSBoaWdoCj4+IHZhbHVlIHRvIGNhdGNoIGFueSBp
c3N1ZXMgcmVsYXRlZCB0byB3cmFwYXJvdW5kLgo+IAo+IFRoaXMgaXMgY3JpdGljYWwgYmVjYXVz
ZSBtaW4gIT0gbWF4IHdoZW4gc3luYyBwb2ludCBpcyByZXF1ZXN0ZWQuCgpUaGF0IEkgd291bGQg
anVzdCBjb25zaWRlciBhIGJ1ZywgYW5kIGl0IGNhbiBiZSBmaXhlZC4gQnV0IGl0J3MgCm9ydGhv
Z29uYWwgdG8gd2hldGhlciB0aGUgdmFsdWUgZ2V0cyByZXNldCBldmVyeSB0aW1lIHRoZSBzeW5j
cG9pbnQgaXMgCmFsbG9jYXRlZC4KCj4gCj4+IEFsc28sIHRoaXMgbWFrZXMgY29kZSBtb3JlIGNv
bXBsaWNhdGVkIHNpbmNlIGl0IG5vdyBuZWVkcyB0byBlbnN1cmUgYWxsCj4+IHdhaXRzIG9uIHRo
ZSBzeW5jcG9pbnQgaGF2ZSBjb21wbGV0ZWQgYmVmb3JlIGZyZWVpbmcgdGhlIHN5bmNwb2ludCwK
Pj4gd2hpY2ggY2FuIGJlIG5vbnRyaXZpYWwgZS5nLiBpZiB0aGUgd2FpdGVyIGlzIGluIGEgZGlm
ZmVyZW50IHZpcnR1YWwKPj4gbWFjaGluZSBvciBzb21lIG90aGVyIGRldmljZSBjb25uZWN0ZWQg
dmlhIFBDSWUgKGEgcmVhbCB1c2VjYXNlKS4KPiAKPiBJdCBzb3VuZHMgdG8gbWUgdGhhdCB0aGVz
ZSBWTSBzeW5jIHBvaW50cyBzaG91bGQgYmUgdHJlYXRlZCB2ZXJ5Cj4gc2VwYXJhdGVseSBmcm9t
IGEgZ2VuZXJpYyBzeW5jIHBvaW50cywgZG9uJ3QgeW91IHRoaW5rIHNvPyBMZXQncyBub3QgbWl4
Cj4gdGhlbSBhbmQgZ2V0IHRoZSBnZW5lcmljIHN5bmMgcG9pbnRzIHVzYWJsZSBmaXJzdC4KPiAK
ClRoZXkgYXJlIG5vdCBzcGVjaWFsIGluIGFueSB3YXksIEknbSBqdXN0IHJlZmVycmluZyB0byBj
YXNlcyB3aGVyZSB0aGUgCndhaXRlciAoY29uc3VtZXIpIGlzIHJlbW90ZS4gVGhlIGFsbG9jYXRv
ciBvZiB0aGUgc3luY3BvaW50IChwcm9kdWNlcikgCmRvZXNuJ3QgbmVjZXNzYXJpbHkgZXZlbiBu
ZWVkIHRvIGtub3cgYWJvdXQgaXQuIFRoZSBzYW1lIGNvbmNlcm4gaXMgCmFwcGxpY2FibGUgd2l0
aGluIGEgc2luZ2xlIFZNLCBvciBzaW5nbGUgYXBwbGljYXRpb24gYXMgd2VsbC4gSnVzdCAKcHV0
dGluZyBvdXQgdGhlIHBvaW50IHRoYXQgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBuZWVkcyB0byBi
ZSB0YWtlbiBjYXJlIApvZiBpZiB3ZSB3ZXJlIHRvIHJlc2V0IHRoZSB2YWx1ZS4KCk1pa2tvCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
