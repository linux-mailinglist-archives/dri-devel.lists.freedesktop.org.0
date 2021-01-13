Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF562F52BD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 19:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1D76EC00;
	Wed, 13 Jan 2021 18:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109C76EC00
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 18:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EkbPFiDWmzFHAIu8oihwICgsB4QuGqf1Zx3RAWAzrXQ=; b=TF2b9SO/CNHdAHE8FNtIW7s7Yg
 gaW+HHtFfXbuU1jTpOVUi+sjSZCXXioJj1DPfER0Y/SbMEzTeRC6uKRLKbAr8PGrDySVBfFr5f1bv
 1LPjkAIsRVHknYpefeTUFf10UFPE3p5NS0Gmpa7OQ77PUIYIuYHbdc+p9dcHQdDTfjGeRkBuA3YLR
 Ll4O0OjA1xAcIazaqHdnkK5M6oe41HbYwn+7mUGI7z67M+9nxpWV5FqT0V/rRMvfLN/cYH6vilfe+
 SnTZ1hACX1PC8CV2c63A0aEmDjWg5fLBYq7n1yD/ZHvXs7WNKmJnzTsA1V8Jx+gdr6ZNNgIk2RfMj
 27luJC9A==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kzlJO-0006cz-Vu; Wed, 13 Jan 2021 20:56:07 +0200
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
Date: Wed, 13 Jan 2021 20:56:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
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

T24gMS8xMy8yMSA4OjE0IFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTEuMDEuMjAyMSAx
NjowMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+ICtzdHJ1Y3QgZHJtX3RlZ3JhX3N1
Ym1pdF9idWYgewo+PiArCS8qKgo+PiArCSAqIEBtYXBwaW5nX2lkOiBbaW5dCj4+ICsJICoKPj4g
KwkgKiBJZGVudGlmaWVyIG9mIHRoZSBtYXBwaW5nIHRvIHVzZSBpbiB0aGUgc3VibWlzc2lvbi4K
Pj4gKwkgKi8KPj4gKwlfX3UzMiBtYXBwaW5nX2lkOwo+IAo+IEknbSBub3cgaW4gcHJvY2VzcyBv
ZiB0cnlpbmcgb3V0IHRoZSBVQVBJIHVzaW5nIGdyYXRlIGRyaXZlcnMgYW5kIHRoaXMKPiBiZWNv
bWVzIHRoZSBmaXJzdCBvYnN0YWNsZS4KPiAKPiBMb29rcyBsaWtlIHRoaXMgaXMgbm90IGdvaW5n
IHRvIHdvcmsgd2VsbCBmb3Igb2xkZXIgVGVncmEgU29DcywgaW4KPiBwYXJ0aWN1bGFyIGZvciBU
MjAsIHdoaWNoIGhhcyBhIHNtYWxsIEdBUlQuCj4gCj4gR2l2ZW4gdGhhdCB0aGUgdXNlZnVsbmVz
cyBvZiB0aGUgcGFydGlhbCBtYXBwaW5nIGZlYXR1cmUgaXMgdmVyeQo+IHF1ZXN0aW9uYWJsZSB1
bnRpbCBpdCB3aWxsIGJlIHByb3ZlbiB3aXRoIGEgcmVhbCB1c2Vyc3BhY2UsIHdlIHNob3VsZAo+
IHN0YXJ0IHdpdGggYSBkeW5hbWljIG1hcHBpbmdzIHRoYXQgYXJlIGRvbmUgYXQgYSB0aW1lIG9m
IGpvYiBzdWJtaXNzaW9uLgo+IAo+IERSTSBhbHJlYWR5IHNob3VsZCBoYXZlIGV2ZXJ5dGhpbmcg
bmVjZXNzYXJ5IGZvciBjcmVhdGluZyBhbmQgbWFuYWdpbmcKPiBjYWNoZXMgb2YgbWFwcGluZ3Ms
IGdyYXRlIGtlcm5lbCBkcml2ZXIgaGFzIGJlZW4gdXNpbmcgZHJtX21tX3NjYW4gZm9yIGEKPiBs
b25nIHRpbWUgbm93IGZvciB0aGF0Lgo+IAo+IEl0IHNob3VsZCBiZSBmaW5lIHRvIHN1cHBvcnQg
dGhlIHN0YXRpYyBtYXBwaW5nIGZlYXR1cmUsIGJ1dCBpdCBzaG91bGQKPiBiZSBkb25lIHNlcGFy
YXRlbHkgd2l0aCB0aGUgZHJtX21tIGludGVncmF0aW9uLCBJTU8uCj4gCj4gV2hhdCBkbyB0aGlu
az8KPiAKCkNhbiB5b3UgZWxhYm9yYXRlIG9uIHRoZSByZXF1aXJlbWVudHMgdG8gYmUgYWJsZSB0
byB1c2UgR0FSVD8gQXJlIHRoZXJlIAphbnkgb3RoZXIgcmVhc29ucyB0aGlzIHdvdWxkIG5vdCB3
b3JrIG9uIG9sZGVyIGNoaXBzPwoKSSB0aGluayB3ZSBzaG91bGQga2VlcCBDSEFOTkVMX01BUCBh
bmQgbWFwcGluZ19pZHMsIGJ1dCBpZiBlLmcuIGZvciBHQVJUIAp3ZSBjYW5ub3QgZG8gbWFwcGlu
ZyBpbW1lZGlhdGVseSBhdCBDSEFOTkVMX01BUCB0aW1lLCB3ZSBjYW4ganVzdCB0cmVhdCAKaXQg
YXMgYSAicmVnaXN0cmF0aW9uIiBjYWxsIGZvciB0aGUgR0VNIG9iamVjdCAtIHBvdGVudGlhbGx5
IG5vLW9wIGxpa2UgCmRpcmVjdCBwaHlzaWNhbCBhZGRyZXNzaW5nIGlzLiBXZSBjYW4gdGhlbiBk
byB3aGF0ZXZlciBpcyBuZWVkZWQgYXQgCnN1Ym1pdCB0aW1lLiBUaGlzIHdheSB3ZSBjYW4gaGF2
ZSB0aGUgYmVzdCBvZiBib3RoIHdvcmxkcy4KCk5vdGUgdGhhdCBwYXJ0aWFsIG1hcHBpbmdzIGFy
ZSBhbHJlYWR5IG5vdCBwcmVzZW50IGluIHRoaXMgdmVyc2lvbiBvZiAKdGhlIFVBUEkuCgpNaWtr
bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
