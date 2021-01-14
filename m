Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD712F5ED9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 11:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67D76E1B7;
	Thu, 14 Jan 2021 10:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8366E1B7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFpufrVcAzuD08MJh2U29ATH1a3jKI9L6u0BQyURH5s=; b=erdm3c8kqIOCXITieH19aZLuO6
 1No7sj1M7PaOo+eywXVcA5Kx7cjwS3e5k2BGL0ikBBwOhW3EwSDRjXRYPXP2/JxlbmJF7BGI7ib3o
 e7K9svapXToB7dfuRcNV8kXQ6L/2CAGv+fm2pEHyTzgTT5TQdzelP5jyMrS1CxGSKnwcsrLq9tw80
 zOu+81uY9npQlOFFVwUcNzRTv4E8FiYxNX7A+vRyF9kgeS2ALgZoY4m8JEE4aWCM4S/km2/eLBcBS
 FvsV7rLTf/h+kzXVaaX0hL5KEXF+VvsDaE2G8lx2p5WqrahY4R4TA1MoTzCCpUcPFW6zuwB5OwwiG
 ShGOtMjw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kzzxP-0008Js-QS; Thu, 14 Jan 2021 12:34:23 +0200
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
 <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
Date: Thu, 14 Jan 2021 12:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
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

T24gMS8xNC8yMSAxMDozNiBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDEzLjAxLjIwMjEg
MjE6NTYsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+PiBPbiAxLzEzLzIxIDg6MTQgUE0s
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDExLjAxLjIwMjEgMTY6MDAsIE1pa2tvIFBlcnR0
dW5lbiDQv9C40YjQtdGCOgo+Pj4+ICtzdHJ1Y3QgZHJtX3RlZ3JhX3N1Ym1pdF9idWYgewo+Pj4+
ICvCoMKgwqAgLyoqCj4+Pj4gK8KgwqDCoMKgICogQG1hcHBpbmdfaWQ6IFtpbl0KPj4+PiArwqDC
oMKgwqAgKgo+Pj4+ICvCoMKgwqDCoCAqIElkZW50aWZpZXIgb2YgdGhlIG1hcHBpbmcgdG8gdXNl
IGluIHRoZSBzdWJtaXNzaW9uLgo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+ICvCoMKgwqAgX191MzIg
bWFwcGluZ19pZDsKPj4+Cj4+PiBJJ20gbm93IGluIHByb2Nlc3Mgb2YgdHJ5aW5nIG91dCB0aGUg
VUFQSSB1c2luZyBncmF0ZSBkcml2ZXJzIGFuZCB0aGlzCj4+PiBiZWNvbWVzIHRoZSBmaXJzdCBv
YnN0YWNsZS4KPj4+Cj4+PiBMb29rcyBsaWtlIHRoaXMgaXMgbm90IGdvaW5nIHRvIHdvcmsgd2Vs
bCBmb3Igb2xkZXIgVGVncmEgU29DcywgaW4KPj4+IHBhcnRpY3VsYXIgZm9yIFQyMCwgd2hpY2gg
aGFzIGEgc21hbGwgR0FSVC4KPj4+Cj4+PiBHaXZlbiB0aGF0IHRoZSB1c2VmdWxuZXNzIG9mIHRo
ZSBwYXJ0aWFsIG1hcHBpbmcgZmVhdHVyZSBpcyB2ZXJ5Cj4+PiBxdWVzdGlvbmFibGUgdW50aWwg
aXQgd2lsbCBiZSBwcm92ZW4gd2l0aCBhIHJlYWwgdXNlcnNwYWNlLCB3ZSBzaG91bGQKPj4+IHN0
YXJ0IHdpdGggYSBkeW5hbWljIG1hcHBpbmdzIHRoYXQgYXJlIGRvbmUgYXQgYSB0aW1lIG9mIGpv
YiBzdWJtaXNzaW9uLgo+Pj4KPj4+IERSTSBhbHJlYWR5IHNob3VsZCBoYXZlIGV2ZXJ5dGhpbmcg
bmVjZXNzYXJ5IGZvciBjcmVhdGluZyBhbmQgbWFuYWdpbmcKPj4+IGNhY2hlcyBvZiBtYXBwaW5n
cywgZ3JhdGUga2VybmVsIGRyaXZlciBoYXMgYmVlbiB1c2luZyBkcm1fbW1fc2NhbiBmb3IgYQo+
Pj4gbG9uZyB0aW1lIG5vdyBmb3IgdGhhdC4KPj4+Cj4+PiBJdCBzaG91bGQgYmUgZmluZSB0byBz
dXBwb3J0IHRoZSBzdGF0aWMgbWFwcGluZyBmZWF0dXJlLCBidXQgaXQgc2hvdWxkCj4+PiBiZSBk
b25lIHNlcGFyYXRlbHkgd2l0aCB0aGUgZHJtX21tIGludGVncmF0aW9uLCBJTU8uCj4+Pgo+Pj4g
V2hhdCBkbyB0aGluaz8KPj4+Cj4+Cj4+IENhbiB5b3UgZWxhYm9yYXRlIG9uIHRoZSByZXF1aXJl
bWVudHMgdG8gYmUgYWJsZSB0byB1c2UgR0FSVD8gQXJlIHRoZXJlCj4+IGFueSBvdGhlciByZWFz
b25zIHRoaXMgd291bGQgbm90IHdvcmsgb24gb2xkZXIgY2hpcHM/Cj4gCj4gV2UgaGF2ZSBhbGwg
RFJNIGRldmljZXMgaW4gYSBzaW5nbGUgYWRkcmVzcyBzcGFjZSBvbiBUMzArLCBoZW5jZSBoYXZp
bmcKPiBkdXBsaWNhdGVkIG1hcHBpbmdzIGZvciBlYWNoIGRldmljZSBzaG91bGQgYmUgYSBiaXQg
d2FzdGVmdWwuCgpJIGd1ZXNzIHRoaXMgc2hvdWxkIGJlIHByZXR0eSBlYXN5IHRvIGNoYW5nZSB0
byBvbmx5IGtlZXAgb25lIG1hcHBpbmcgCnBlciBHRU0gb2JqZWN0LgoKPiAKPj4gSSB0aGluayB3
ZSBzaG91bGQga2VlcCBDSEFOTkVMX01BUCBhbmQgbWFwcGluZ19pZHMsIGJ1dCBpZiBlLmcuIGZv
ciBHQVJUCj4+IHdlIGNhbm5vdCBkbyBtYXBwaW5nIGltbWVkaWF0ZWx5IGF0IENIQU5ORUxfTUFQ
IHRpbWUsIHdlIGNhbiBqdXN0IHRyZWF0Cj4+IGl0IGFzIGEgInJlZ2lzdHJhdGlvbiIgY2FsbCBm
b3IgdGhlIEdFTSBvYmplY3QgLSBwb3RlbnRpYWxseSBuby1vcCBsaWtlCj4+IGRpcmVjdCBwaHlz
aWNhbCBhZGRyZXNzaW5nIGlzLiBXZSBjYW4gdGhlbiBkbyB3aGF0ZXZlciBpcyBuZWVkZWQgYXQK
Pj4gc3VibWl0IHRpbWUuIFRoaXMgd2F5IHdlIGNhbiBoYXZlIHRoZSBiZXN0IG9mIGJvdGggd29y
bGRzLgo+IAo+IEkgaGF2ZSBzb21lIHRob3VnaHRzIG5vdywgYnV0IG5vdGhpbmcgY29uY3JldGUg
eWV0LiBNYXliZSB3ZSB3aWxsIG5lZWQKPiB0byBjcmVhdGUgYSBwZXItU29DIG9wcyBmb3IgTU0u
CgpZZXAsIEkgdGhpbmsgc29tZSBzcGVjaWFsaXplZCBjb2RlIHdpbGwgYmUgbmVlZGVkLCBidXQg
aG9wZWZ1bGx5IGl0IHdpbGwgCmJlIHJlbGF0aXZlbHkgbWlub3IuCgo+IAo+IEknbGwgZmluaXNo
IHdpdGggdHJ5aW5nIHdoYXQgd2UgY3VycmVudGx5IGhhdmUgdG8gc2VlIHdoYXQgZWxzZSBpcwo+
IG1pc3NpbmcgYW5kIHRoZW4gd2Ugd2lsbCBkZWNpZGUgd2hhdCB0byBkbyBhYm91dCBpdC4KPiAK
CkdyZWF0IDopCgo+PiBOb3RlIHRoYXQgcGFydGlhbCBtYXBwaW5ncyBhcmUgYWxyZWFkeSBub3Qg
cHJlc2VudCBpbiB0aGlzIHZlcnNpb24gb2YKPj4gdGhlIFVBUEkuCj4gCj4gT2gsIHJpZ2h0IDop
IEkgaGF2ZW4ndCBnb3QgY2xvc2VseSB0byB0aGlzIHBhcnQgb2YgcmV2aWV3aW5nIHlldC4KPiAK
Ck1pa2tvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
