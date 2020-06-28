Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA420C745
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 11:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC6B6E05A;
	Sun, 28 Jun 2020 09:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CE06E05A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VXN78PjDaDZVNux9a7v7mx9coiRjhsMF6rM3m4hRSg0=; b=rlBbGFGqIHE21Dsg9Yj8jfBCgs
 ebrUse4WpAzDQ3NNCzMoeDXMo8HdgPsAm669kBIKjgx+szDgdy3BN+HXtKwO6sj5GLQ8BnsAJks/N
 saQGsktjgau3iqia/VzE/daKPiy541BT7Vr0aRlgQ3363Kd031uvm8zooN5CneKjwI+xfzklrbCM/
 oVVRoQCI639R4LNxL6lw7gT7NsyEliBZfRz4KHeOB1YeIQGr8CyMB2CTdwPVau6mvuVVTk/H6fvJZ
 lEjIkKBsuggRE2ih6NZZTiM/BaHXNc1YRm48Vv2b90B4KwhVdAoScfDtg1IYQtJg5CoUELz1QLQeD
 wdooMs4Q==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1jpTrk-0007J8-8t; Sun, 28 Jun 2020 12:44:48 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
Date: Sun, 28 Jun 2020 12:44:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yOC8yMCAyOjI3IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjMuMDYuMjAyMCAx
NTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+Cj4+ICMjIyBJT0NUTCBIT1NUMVhf
QUxMT0NBVEVfU1lOQ1BPSU5UIChvbiAvZGV2L2hvc3QxeCkKPj4KPj4gQWxsb2NhdGVzIGEgZnJl
ZSBzeW5jcG9pbnQsIHJldHVybmluZyBhIGZpbGUgZGVzY3JpcHRvciByZXByZXNlbnRpbmcgaXQu
Cj4+IE9ubHkgdGhlIG93bmVyIG9mIHRoZSBmaWxlIGRlc2NyaXB0b3IgaXMgYWxsb3dlZCB0byBt
dXRhdGUgdGhlIHZhbHVlIG9mCj4+IHRoZSBzeW5jcG9pbnQuCj4+Cj4+IGBgYAo+PiBzdHJ1Y3Qg
aG9zdDF4X2N0cmxfYWxsb2NhdGVfc3luY3BvaW50IHsKPj4gIMKgwqDCoMKgwqDCoCAvKioKPj4g
IMKgwqDCoMKgwqDCoMKgICogQGZkOgo+PiAgwqDCoMKgwqDCoMKgwqAgKgo+PiAgwqDCoMKgwqDC
oMKgwqAgKiBbb3V0XSBOZXcgZmlsZSBkZXNjcmlwdG9yIHJlcHJlc2VudGluZyB0aGUgYWxsb2Nh
dGVkIHN5bmNwb2ludC4KPj4gIMKgwqDCoMKgwqDCoMKgICovCj4+ICDCoMKgwqDCoMKgwqAgX19z
MzIgZmQ7Cj4+Cj4+ICDCoMKgwqDCoMKgwqAgX191MzIgcmVzZXJ2ZWRbM107Cj4+IH07Cj4gCj4g
V2Ugc2hvdWxkIG5lZWQgYXQgbGVhc3QgdGhlc2UgYmFzaWMgdGhpbmdzIGZyb20gdGhlIHN5bmMg
cG9pbnRzIEFQSSA+Cj4gLSBFeGVjdXRpb24gY29udGV4dCBzaG91bGRuJ3QgYmUgYWJsZSB0byB0
YW1wZXIgc3luYyBwb2ludHMgb2YgdGhlIG90aGVyCj4gY29udGV4dHMuCgpUaGlzIGlzIGNvdmVy
ZWQgYnkgdGhpcyBVQVBJIC0gd2hlbiBzdWJtaXR0aW5nLCBhcyBwYXJ0IG9mIHRoZSAKc3luY3B0
X2luY3Igc3RydWN0IHlvdSBwYXNzIHRoZSBzeW5jcG9pbnQgRkQuIFRoaXMgd2F5IHRoZSBkcml2
ZXIgY2FuIApjaGVjayB0aGUgc3luY3BvaW50cyB1c2VkIGFyZSBjb3JyZWN0LCBvciBwcm9ncmFt
IEhXIHByb3RlY3Rpb24uCgo+IAo+IC0gU3luYyBwb2ludCBjb3VsZCBiZSBzaGFyZWQgd2l0aCBv
dGhlciBjb250ZXh0cyBmb3IgZXhwbGljaXQgZmVuY2luZy4KCk5vdCBzdXJlIHdoYXQgeW91IHNw
ZWNpZmljYWxseSBtZWFuOyB5b3UgY2FuIGdldCB0aGUgSUQgb3V0IG9mIHRoZSAKc3luY3BvaW50
IGZkIGFuZCBzaGFyZSB0aGUgSUQgZm9yIHJlYWQtb25seSBhY2Nlc3MuIChPciB0aGUgRkQgZm9y
IApyZWFkLXdyaXRlIGFjY2VzcykKCj4gCj4gLSBTeW5jIHBvaW50cyBzaG91bGQgd29yayByZWxp
YWJseS4KPiAKPiBTb21lIHByb2JsZW1zIG9mIHRoZSBjdXJyZW50IEhvc3QxeCBkcml2ZXIsIGxp
a2Ugd2hlcmUgaXQgZmFsbHMgb3ZlciBpZgo+IHN5bmMgcG9pbnQgdmFsdWUgaXMgb3V0LW9mLXN5
bmMgKyBhbGwgdGhlIGhhbmctam9iIHJlY292ZXJ5IGxhYm9yIGNvdWxkCj4gYmUgZWFzaWx5IHJl
ZHVjZWQgaWYgc3luYyBwb2ludCBoZWFsdGggaXMgcHJvdGVjdGVkIGJ5IGV4dHJhIFVBUEkKPiBj
b25zdHJhaW50cy4gPgo+IFNvIEkgdGhpbmsgd2UgbWF5IHdhbnQgdGhlIGZvbGxvd2luZzoKPiAK
PiAxLiBXZSBzdGlsbCBzaG91bGQgbmVlZCB0byBhc3NpZ24gc3luYyBwb2ludCBJRCB0byBhIERS
TS1jaGFubmVsJ3MKPiBjb250ZXh0LiBUaGlzIHN5bmMgcG9pbnQgSUQgd2lsbCBiZSB1c2VkIGZv
ciBhIGNvbW1hbmRzIHN0cmVhbSBmb3JtaW5nLAo+IGxpa2UgaXQgaXMgZG9uZSBieSB0aGUgY3Vy
cmVudCBzdGFnaW5nIFVBUEkuCj4gCj4gU28gd2Ugc2hvdWxkIG5lZWQgdG8gcmV0YWluIHRoZSBE
Uk1fVEVHUkFfR0VUX1NZTkNQVCBJT0NUTCwgYnV0IGltcHJvdmUgaXQuCj4gCj4gMi4gQWxsb2Nh
dGVkIHN5bmMgcG9pbnQgbXVzdCBoYXZlIGEgY2xlYW4gaGFyZHdhcmUgc3RhdGUuCgpXaGF0IGRv
IHlvdSBtZWFuIGJ5IGNsZWFuIGhhcmR3YXJlIHN0YXRlPwoKPiAKPiAzLiBTeW5jIHBvaW50cyBz
aG91bGQgYmUgcHJvcGVybHkgcmVmY291bnRlZC4gSm9iJ3Mgc3luYyBwb2ludHMKPiBzaG91bGRu
J3QgYmUgcmUtdXNlZCB3aGlsZSBqb2IgaXMgYWxpdmUuCj4gCj4gNC4gVGhlIGpvYidzIHN5bmMg
cG9pbnQgY2FuJ3QgYmUgcmUtdXNlZCBhZnRlciBqb2IncyBzdWJtaXNzaW9uIChVQVBJCj4gY29u
c3RyYWludCEpLiBVc2Vyc3BhY2UgbXVzdCBmcmVlIHN5bmMgcG9pbnQgYW5kIGFsbG9jYXRlIGEg
bmV3IG9uZSBmb3IKPiB0aGUgbmV4dCBqb2Igc3VibWlzc2lvbi4gQW5kIG5vdyB3ZToKPiAKPiAg
ICAtIEtub3cgdGhhdCBqb2IncyBzeW5jIHBvaW50IGlzIGFsd2F5cyBpbiBhIGhlYWx0aHkgc3Rh
dGUhCj4gCj4gICAgLSBXZSdyZSBub3QgbGltaXRlZCBieSBhIG51bWJlciBvZiBwaHlzaWNhbGx5
IGF2YWlsYWJsZSBoYXJkd2FyZSBzeW5jCj4gcG9pbnRzISBBbGxvY2F0aW9uIHNob3VsZCBibG9j
ayB1bnRpbCBmcmVlIHN5bmMgcG9pbnQgaXMgYXZhaWxhYmxlLgo+IAo+ICAgIC0gVGhlIGxvZ2lj
YWwgbnVtYmVyIG9mIGpvYidzIHN5bmMgcG9pbnQgaW5jcmVtZW50cyBtYXRjaGVzIHRoZSBTUAo+
IGhhcmR3YXJlIHN0YXRlISBXaGljaCBpcyBoYW5keSBmb3IgYSBqb2IncyBkZWJ1Z2dpbmcuCj4g
Cj4gT3B0aW9uYWxseSwgdGhlIGpvYidzIHN5bmMgcG9pbnQgY291bGQgYmUgYXV0by1yZW1vdmVk
IGZyb20gdGhlIERSTSdzCj4gY29udGV4dCBhZnRlciBqb2IncyBzdWJtaXNzaW9uLCBhdm9pZGlu
ZyBhIG5lZWQgZm9yIGFuIGV4dHJhIFNZTkNQVF9QVVQKPiBJT0NUTCBpbnZvY2F0aW9uIHRvIGJl
IGRvbmUgYnkgdXNlcnNwYWNlIGFmdGVyIHRoZSBqb2IncyBzdWJtaXNzaW9uLgo+IENvdWxkIGJl
IGEgam9iJ3MgZmxhZy4KCkkgdGhpbmsgdGhpcyB3b3VsZCBjYXVzZSBwcm9ibGVtcyB3aGVyZSBh
ZnRlciBhIGpvYiBjb21wbGV0ZXMgYnV0IGJlZm9yZSAKdGhlIGZlbmNlIGhhcyBiZWVuIHdhaXRl
ZCwgdGhlIHN5bmNwb2ludCBpcyBhbHJlYWR5IHJlY3ljbGVkIChlc3BlY2lhbGx5IAppZiB0aGUg
c3luY3BvaW50IGlzIHJlc2V0IGludG8gc29tZSBjbGVhbiBzdGF0ZSkuCgpJIHdvdWxkIHByZWZl
ciBoYXZpbmcgYSBzeW5jcG9pbnQgZm9yIGVhY2ggdXNlcnNwYWNlIGNoYW5uZWwgY29udGV4dCAK
KHNldmVyYWwgb2Ygd2hpY2ggY291bGQgc2hhcmUgYSBoYXJkd2FyZSBjaGFubmVsIGlmIE1MT0NL
aW5nIGlzIG5vdCB1c2VkKS4KCkluIG15IGV4cGVyaWVuY2UgaXQncyB0aGVuIG5vdCBkaWZmaWN1
bHQgdG8gcGlucG9pbnQgd2hpY2ggam9iIGhhcyAKZmFpbGVkLCBhbmQgaWYgZWFjaCB1c2Vyc3Bh
Y2UgY2hhbm5lbCBjb250ZXh0IHVzZXMgYSBzZXBhcmF0ZSBzeW5jcG9pbnQsIAphIGhhbmdpbmcg
am9iIHdvdWxkbid0IG1lc3Mgd2l0aCBvdGhlciBhcHBsaWNhdGlvbidzIGpvYnMsIGVpdGhlci4K
Ck1pa2tvCgo+IAo+IFdlIGNvdWxkIGF2b2lkIGEgbmVlZCBmb3IgYSBzdGF0aWNhbGx5LWFsbG9j
YXRlZCBzeW5jIHBvaW50cyBhdCBhbGwgZm9yCj4gYSBwYXRjaGVkIGNtZHN0cmVhbXMhIFRoZSBz
eW5jIHBvaW50IGNvdWxkIGJlIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBhdCBhCj4gam9iJ3Mgc3Vi
bWlzc2lvbiB0aW1lIGJ5IHRoZSBrZXJuZWwgZHJpdmVyIGFuZCB0aGVuIGNtZHN0cmVhbSB3aWxs
IGJlCj4gcGF0Y2hlZCB3aXRoIHRoaXMgc3luYyBwb2ludC4KPiAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
