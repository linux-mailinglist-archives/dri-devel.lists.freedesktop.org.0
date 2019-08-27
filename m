Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6629E707
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FC1899E7;
	Tue, 27 Aug 2019 11:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2A5899E7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:48:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RBmsZf064647;
 Tue, 27 Aug 2019 06:48:54 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RBms3l071690
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 06:48:54 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 06:48:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 06:48:53 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RBmqrM044445;
 Tue, 27 Aug 2019 06:48:52 -0500
Subject: Re: Display-Port HPD handling, link status, and bandwidth checks
To: Ilia Mirkin <imirkin@alum.mit.edu>, Jyri Sarha <jsarha@ti.com>
References: <7f5204a1-cc3a-d6a3-be07-b2c316761e46@ti.com>
 <CAKb7Uvh2Ygp2sWGk-GOUzA699fr=R0=S8ejmXKsNOj3MEkzGxA@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <74956cba-8066-34b7-c2bf-f1c0c79acb62@ti.com>
Date: Tue, 27 Aug 2019 14:48:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKb7Uvh2Ygp2sWGk-GOUzA699fr=R0=S8ejmXKsNOj3MEkzGxA@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1566906534;
 bh=SpjuYgkd+l1jUclZedIe0Ht9sAvRz+lkflH8qjEvjv8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uflDi/S5uC/e6GeUCG6YVSUlN0iE3tvBxo4JHxdgKr+dxJcmWMqjkq9brjapFIa1K
 mQrMrmFpYVwplbfcZQdJGeA1w5mcSJH/x3PsFwOTjJOCkrvvQ00z8igosj8tPIoy5o
 o3CWU/qtMjd6/ssZkk8JYzwZO6CrBZC2LrGKq0pY=
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDgvMjAxOSAyMzoyMywgSWxpYSBNaXJraW4gd3JvdGU6Cj4gWW91J2xsIHByb2JhYmx5
IGdldCBhIG1vcmUgZGV0YWlsZWQgcmVwbHkgZHVyaW5nIHRoZSB3ZWVrLCBidXQgZm9yIG5vdwo+
IGhhdmUgYSBsb29rIGF0IHRoZSAibGluay1zdGF0dXMiIHByb3BlcnR5LCB3aGljaCB3YXMgbWFk
ZSBmb3IKPiBwcmVjaXNlbHkgdGhpcyBzaXR1YXRpb24uIEkgdGhpbmsgYmFzaWNhbGx5IHRoZSBp
ZGVhIGlzIHRvIGlnbm9yZSBsaW5rCj4gdHJhaW5pbmcgYXMgcGFydCBvZiB0aGUgbW9kZXNldCwg
YW5kIGp1c3QgcmV0dXJuIHRoZSBsaW5rIHN0YXR1cwo+IGRlcGVuZGluZyBvbiB0aGUgc3VjY2Vz
cy4gKEFuZCB5b3Ugc2hvdWxkIGZpbHRlciBvdXQgdG90YWxseQo+IGluZmVhc2libGUgbW9kZXMs
IGkuZS4gb3V0c2lkZSB0aGUgbW9uaXRvcidzIG1heCBsYW5lcy9iYW5kd2lkdGgKPiBjYXBhYmls
aXRpZXMsIHdoaWNoIEkgYmVsaWV2ZSBhcmUgYXZhaWxhYmxlIHZpYSBEUENEIG9yIEVESUQuKQo+
IAo+IFNlZSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9ncHUvZHJtLWtt
cy5odG1sIGZvciBhIGJpdAo+IG1vcmUgaW5mbyBhcyB3ZWxsLgoKV2UndmUgZ290IHNpbWlsYXIg
aXNzdWUgd2l0aCBIRE1JIHRvby4gSWYgSFBEIGZpcnN0IGdvZXMgbG93LCB0aGVuIGhpZ2gsIApi
dXQgdGhlIHVzZXJzcGFjZSBoYXNuJ3QgaGFuZGxlZCB0aGUgSFBEIGV2ZW50IGluIGJldHdlZW4s
IHRoZSAKdXNlcnNwYWNlcyBJIGxvb2tlZCBhdCBqdXN0IHRoaW5rIHRoYXQgbm90aGluZyBoYXMg
aGFwcGVuZWQuCgpTbyBtYXliZSBhbnkgdGltZSB0aGVyZSdzIGEgSFBEIC0+IGxvdywgd2Ugc2hv
dWxkIHNldCBsaW5rLXN0YXR1cyB0byAKYmFkLCBob3BlIHRoYXQgdXNlcnNwYWNlIGtub3dzIGFi
b3V0IHRoZSBwcm9wZXJ0eSwgYW5kIGF0IG5leHQgbW9kZXNldCwgCnNldCBpdCBiYWNrIHRvIGdv
b2QuCgogIFRvbWkKCj4gCj4gQ2hlZXJzLAo+IAo+ICAgIC1pbGlhCj4gCj4gT24gU3VuLCBBdWcg
MjUsIDIwMTkgYXQgNzoxMiBBTSBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPiB3cm90ZToKPj4K
Pj4gSGksCj4+Cj4+IEkgYW0gd29ya2luZyBvbiBhIG5ldyBEaXNwbGF5UG9ydCBicmlkZ2UtZHJp
dmVyIGFuZCB0aGVyZSBpcyBhIGNvdXBsZSBvZgo+PiB0aGluZ3MgdGhhdCBJIGRvIG5vdCBrbm93
IGhvdyB0byBoYW5kbGUuCj4+Cj4+IDEuIFdoZW4gc2hvdWxkIHRoZSBsaW5rIHRyYWluaW5nIGhh
cHBlbj8KPj4gICAgIGEpIEluIGNvbm5lY3RvciBkZXRlY3QoKT8KPj4gICAgICAgIC0gVGhpcyB3
b3VsZCBlbmFibGUgdXMgdG8gZG8gbW9kZSBmaWx0ZXJpbmcgKGluIG1vZGVfdmFsaWQoKSkKPj4g
ICAgICAgICAgYmFzZWQgb24gdGhlIGVzdGFibGlzaGVkIGxpbmsgYmFuZC13aWR0aCAodGhlbiBh
Z2Fpbgo+PiAgICAgICAgICBtb2RlX3ZhbGlkKCkgZG9jdW1lbnRhdGlvbiBzdWdnZXN0cyB0aGF0
IG1vZGVzIHNob3VsZCBvbmx5Cj4+ICAgICAgICAgIGJlIGZpbHRlcmVkIGJhc2VkIG9uICJjb25m
aWd1cmF0aW9uLWludmFyaWFudCBoYXJkd2FyZQo+PiAgICAgICAgICBjb25zdHJhaW50cyIpLgo+
PiAgICAgYikgSW4gY2hlY2sgcGhhc2UgKHRoaXMgd291bGQgY3VycmVudGx5IG1lYW4gbW9kZV9m
aXh1cCk/Cj4+ICAgICAgICAtIFRoaXMgaXMgdGhlIGxhc3QgcG9pbnQgd2hlcmUgd2UgY2FuIHJl
amVjdCBhIG1vZGUgdGhhdCBjYW4gbm90Cj4+ICAgICAgICAgIGJlIHNlbnQgb3ZlciB0aGUgRFAt
bGluawo+PiAgICAgYykgSW4gY29tbWl0IHBoYXNlIChlLmcuIGJyaWRnZSBlbmFibGUoKSkKPj4g
ICAgICAgIC0gVGhpcyBpcyBiYWQgc2luY2Ugd2Ugc2hvdWxkIG5vdCBmYWlsIGFueSBtb3JlIGlu
IHRoZSBjb21taXQKPj4gICAgICAgICAgcGhhc2UKPj4KPj4gMi4gRFAtbGluayBzb21ldGltZXMg
ZHJvcHMgYWZ0ZXIgYSBzdWNjZXNmdWwgbGluayB0cmFpbmluZyBhbmQgRFAtc2luawo+PiAgICAg
aXMgc3VwcG9zZWQgdG8gc2VuZCBzaG9ydCBIUEQgcHVsc2UgYWJvdXQgaXQuIFdoYXQgYXJlIHRo
ZQo+PiAgICAgcmVjb21tZW5kZWQgd2F5cyB0byBoYW5kbGUgdGhlIHNpdHVhdGlvbj8KPj4KPj4g
ICAgIGEpIFNlbmQgaG90cGx1ZyBldmVudCBhbmQgbGV0IHRoZSBEUk0gY2xpZW50IGRlYWwgd2l0
aCBpdD8KPj4gICAgICAgIC0gVGhpcyBkb2VzIG5vdCB3b3JrIHRvbyB3ZWxsIGJlY2F1c2UgZXZl
biBpZiB0aGUgY2xpZW50IHRyaWVzCj4+ICAgICAgICAgIHRvIHJlc3RvcmUgdGhlIGRpc3BsYXkg
YnkgY29tbWl0dGluZyB0aGUgc2FtZSBzdGF0ZSBhZ2FpbiAtCj4+ICAgICAgICAgIGxpa2UgZmJk
ZXYgZG9lcyAtIHRoZSBicmlkZ2UgZG9lcyBub3QgZ28gdHJvdWdoIGRpc2FibGUtZW5hYmxlCj4+
ICAgICAgICAgIGN5Y2xlLCBzaW5jZSBkaXNwbGF5IG1vZGUgaGFzIG5vdCBjaGFuZ2VkLgo+PiAg
ICAgICAgLSBEZXNwaXRlIGl0IG5vdCB3b3JraW5nIHNvIHdlbGwsIHRoaXMgaXMgd2hhdCB0aGUg
bW9zdCBkcml2ZXJzCj4+ICAgICAgICAgIGFwcGVhciB0byBkby4KPj4KPj4gICAgIGIpIERyaXZl
ciBpbnRlcm5hbGx5IHJlLXRyYWlucyB0aGUgbGluayBidXQgc2VuZCBhIGhvdHBsdWcgZXZlbnQK
Pj4gICAgICAgIGFsd2F5cyBhZnRlciBpdD8KPj4gICAgICAgIC0gVGhpcyBpcyB3aGF0IGk5MTUg
ZG9lcywgaWYgSSByZWFkIHRoZSBjb2RlIHJpZ2h0Lgo+PiAgICAgICAgLSBIb3cgdG8gdHJlYXQg
YSB0cmFpbmluZyBmYWlsdXJlPyBTZW5kaW5nIGhvdHBsdWcgZXZlbnQgZG9lcyBub3QKPj4gICAg
ICAgICAgcmVhbGx5IGhlbHAgKHNlZSBhYm92ZSkuCj4+Cj4+ICAgICBjKSBTaWxlbnRseSByZS10
cmFpbiB0aGUgbGluayBpZiB3ZSB3ZXJlIGFibGUgdG8gcmVzdG9yZSB0aGUgbGluawo+PiAgICAg
ICAgYW5kIHRoZSBkaXNwbGF5IG1vZGUsIGFuZCBzZW5kIEhQRCBvbmx5IGlmIHNvbWV0aGluZyB3
ZW50IHdyb25nPwo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEp5cmkKPj4KPj4gLS0KPj4gVGV4YXMg
SW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2ku
Cj4+IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6
IEhlbHNpbmtpCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmth
dHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBL
b3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
