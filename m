Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3362E262AB5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404106EAD9;
	Wed,  9 Sep 2020 08:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308FA6EAD9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZVtGQHyrKlJmsSnNJwKFYsAAKRKi8Qv3hhTuIN2JcW8=; b=HcLdHIUwPEaPPfradkGM0M8FN+
 eHM1LM+o3zfrf7SojeHYg7NH5SlCSI06mzcPpUvFfkg8bgSFvI9ZIWyYP744aCv2g9mjJMgubDkw1
 3tOdBr+KeVvbfqqVcvAU3D+ykjTkv6Qc8uXzU9ZkvfxT897Fqd/eg7PyKMLYfycbRK6pqJtgE/kbm
 YTmevJICb+rFQoYjzkDGDMkKstPQPnyrhIcF7pkTwHxHMBT6yRugXq0tMhJRaaTJReP2Z4quYYrER
 Uq4hKTvdmAySfWx+IC44HBjgvXTC07AMPHiHZlfxgt5BuYuJII6GmwG0mvPUE13eV/txNy4LYkVVR
 uCSLFmhA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFviO-0001i4-IS; Wed, 09 Sep 2020 11:44:28 +0300
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <963bb17d-9501-0118-b5c2-a06d68c3eb9f@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <8fb335d3-5af9-5922-579c-e3575772732a@kapsi.fi>
Date: Wed, 9 Sep 2020 11:44:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <963bb17d-9501-0118-b5c2-a06d68c3eb9f@gmail.com>
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

T24gOS85LzIwIDU6MjAgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNS4wOS4yMDIwIDEz
OjM0LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4gSGkgYWxsLAo+Pgo+PiBoZXJlJ3Mg
YSBzZWNvbmQgcmV2aXNpb24gb2YgdGhlIEhvc3QxeC9UZWdyYURSTSBVQVBJIHByb3Bvc2FsLAo+
PiBob3BlZnVsbHkgd2l0aCBtb3N0IGlzc3VlcyBmcm9tIHYxIHJlc29sdmVkLCBhbmQgYWxzbyB3
aXRoCj4+IGFuIGltcGxlbWVudGF0aW9uLiBUaGVyZSBhcmUgc3RpbGwgb3BlbiBpc3N1ZXMgd2l0
aCB0aGUKPj4gaW1wbGVtZW50YXRpb246Cj4+Cj4+ICogUmVsb2NzIGFyZSBub3cgaGFuZGxlZCBv
biBUZWdyYURSTSBzaWRlIGluc3RlYWQgb2YgSG9zdDF4LAo+PiAgICBzbyB0aGUgZmlyZXdhbGwg
aXMgbm90IGF3YXJlIG9mIHRoZW0sIGNhdXNpbmcgc3VibWlzc2lvbgo+PiAgICBmYWlsdXJlIHdo
ZXJlIHRoZSBmaXJld2FsbCBpcyBlbmFibGVkLiBQcm9wb3NlZCBzb2x1dGlvbgo+PiAgICBpcyB0
byBtb3ZlIHRoZSBmaXJld2FsbCB0byBUZWdyYURSTSBzaWRlLCBidXQgdGhpcyBoYXNuJ3QKPj4g
ICAgYmVlbiBkb25lIHlldC4KPj4gKiBGb3IgdGhlIG5ldyBVQVBJLCBzeW5jcG9pbnQgcmVjb3Zl
cnkgb24gam9iIHRpbWVvdXQgaXMKPj4gICAgZGlzYWJsZWQuIFdoYXQgdGhpcyBtZWFucyBpcyB0
aGF0IHVwb24gam9iIHRpbWVvdXQsCj4+ICAgIGFsbCBmdXJ0aGVyIGpvYnMgdXNpbmcgdGhhdCBz
eW5jcG9pbnQgYXJlIGNhbmNlbGxlZCwKPj4gICAgYW5kIHRoZSBzeW5jcG9pbnQgaXMgbWFya2Vk
IHVudXNhYmxlIHVudGlsIGl0IGlzIGZyZWVkLgo+PiAgICBIb3dldmVyLCB0aGVyZSBpcyBjdXJy
ZW50bHkgYSByYWNlIGJldHdlZW4gdGhlIHRpbWVvdXQKPj4gICAgaGFuZGxlciBhbmQgam9iIHN1
Ym1pc3Npb24sIHdoZXJlIHN1Ym1pc3Npb24gY2FuIG9ic2VydmUKPj4gICAgdGhlIHN5bmNwb2lu
dCBpbiBub24tbG9ja2VkIHN0YXRlIGFuZCB5ZXQgdGhlIGpvYgo+PiAgICBjYW5jZWxsYXRpb25z
IHdvbid0IGNhbmNlbCB0aGUgbmV3IGpvYi4KPj4gKiBXYWl0aW5nIGZvciBETUEgcmVzZXJ2YXRp
b24gZmVuY2VzIGlzIG5vdCBpbXBsZW1lbnRlZCB5ZXQuCj4+ICogSSBoYXZlIG9ubHkgdGVzdGVk
IG9uIFRlZ3JhMTg2Lgo+Pgo+PiBUaGUgc2VyaWVzIGNvbnNpc3RzIG9mIHRocmVlIHBhcnRzOgo+
Pgo+PiAqIFRoZSBmaXJzdCBwYXJ0IGNvbnRhaW5zIHNvbWUgZml4ZXMgYW5kIGltcHJvdmVtZW50
cyB0bwo+PiAgICB0aGUgSG9zdDF4IGRyaXZlciBvZiBtb3JlIGdlbmVyYWwgbmF0dXJlLAo+PiAq
IFRoZSBzZWNvbmQgcGFydCBhZGRzIHRoZSBIb3N0MXggc2lkZSBVQVBJLCBhcyB3ZWxsIGFzCj4+
ICAgIEhvc3QxeC1zaWRlIGNoYW5nZXMgbmVlZGVkIGZvciB0aGUgbmV3IFRlZ3JhRFJNIFVBUEks
Cj4+ICogVGhlIHRoaXJkIHBhcnQgYWRkcyB0aGUgbmV3IFRlZ3JhRFJNIFVBUEkuCj4+Cj4+IEkg
aGF2ZSB3cml0dGVuIHNvbWUgdGVzdHMgdG8gdGVzdCB0aGUgbmV3IGludGVyZmFjZSwKPj4gc2Vl
IGh0dHBzOi8vZ2l0aHViLmNvbS9jeW5kaXMvdWFwaS10ZXN0LiBQb3J0aW5nIG9mIHByb3Blcgo+
PiB1c2Vyc3BhY2UgKGUuZy4gb3BlbnRlZ3JhLCB2ZHBhdS10ZWdyYSkgd2lsbCBjb21lIG9uY2UK
Pj4gdGhlcmUgaXMgc29tZSBkZWdyZWUgb2YgY29uY2x1c2lvbiBvbiB0aGUgVUFQSSBkZWZpbml0
aW9uLgo+IAo+IENvdWxkIHlvdSBwbGVhc2UgZW51bWVyYXRlIGFsbCB0aGUgY3VycmVudGx5IG9w
ZW5lZCBxdWVzdGlvbnM/Cj4gCgpXaGljaCBvcGVuIHF1ZXN0aW9ucyBkbyB5b3UgcmVmZXIgdG8/
IFRoZSBvcGVuIGl0ZW1zIG9mIHYxIHNob3VsZCBiZSAKY2xvc2VkIG5vdzsgZm9yIGZlbmNlcyB3
ZSBzZXR1cCBhbiBTVyB0aW1lb3V0IHRvIHByZXZlbnQgdGhlbSBmcm9tIApzdGlja2luZyBhcm91
bmQgZm9yZXZlciwgYW5kIHJlZ2FyZGluZyBHRU0gdGhlIEdFTSBJT0NUTHMgYXJlIGFnYWluIApi
ZWluZyB1c2VkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
