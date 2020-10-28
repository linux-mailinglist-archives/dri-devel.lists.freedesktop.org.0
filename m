Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2BA29CF58
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 10:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357206E4C7;
	Wed, 28 Oct 2020 09:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47886E4C7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 09:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0GulZkdnWomNXqleX+nVVTJCySdixjR8SeKk4VanFEU=; b=g9bjzYpyJQcCbhP8Xfp3kAt6We
 JlGrZXrT+mPK9p5bzQ4TB5SGwrkN0fqer++glHrZ3jNx1JfpXgrWXPWpfgI5VCPyISOPugEkBXA4I
 3lGVGCbx/RXiDYw19f0i0cproGwlka0Nwcp9rkjSdeL+yw3ETb11z4aar0iiCmCd989uVD8y7/c8T
 hRxfla1tvChzV/nyKdzYt1YJW4w42nZWNoSXel4ybVqRItaNd9AsHFncLILOq8UXCz9LTO0fwcsxd
 6edfR8A8PVIG/LJy5ztocByPtENNsaKc3a1XyfvUFTfz3ltnxlubNCXSMNQ3fFnt8sGuy2ESvoVQZ
 tTgmGyLw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kXi9c-0001wS-F4; Wed, 28 Oct 2020 11:54:04 +0200
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
 <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
 <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
 <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <6ef6337d-3bb5-bbba-f39c-6de1722ddc44@kapsi.fi>
Date: Wed, 28 Oct 2020 11:54:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
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

T24gMTAvMjcvMjAgOTowNiBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI2LjEwLjIwMjAg
MTI6MTEsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4KPj4+IFRoZSBmaXJzdCBwYXRj
aGVzIHNob3VsZCBiZSB0aGUgb25lcyB0aGF0IGFyZSByZWxldmFudCB0byB0aGUgZXhpc3RpbmcK
Pj4+IHVzZXJzcGFjZSBjb2RlLCBsaWtlIHN1cHBvcnQgZm9yIHRoZSB3YWl0cy4KPj4KPj4gQ2Fu
IHlvdSBlbGFib3JhdGUgd2hhdCB5b3UgbWVhbiBieSB0aGlzPwo+IAo+IEFsbCBmZWF0dXJlcyB0
aGF0IGRvbid0IGhhdmUgYW4gaW1tZWRpYXRlIHJlYWwgdXNlLWNhc2Ugc2hvdWxkIGJlIHBsYWNl
ZAo+IGxhdGVyIGluIHRoZSBzZXJpZXMgYmVjYXVzZSB3ZSBtYXkgZGVmZXIgbWVyZ2luZyBvZiB0
aG9zZSBwYXRjaGVzIHVudGlsCj4gd2Ugd2lsbCBzZWUgdXNlcnNwYWNlIHRoYXQgdXNlcyB0aG9z
ZSBmZWF0dXJlcyBzaW5jZSB3ZSBjYW4ndCByZWFsbHkKPiBkZWNpZGUgd2hldGhlciB0aGVzZSBh
cmUgZGVjaXNpb25zIHRoYXQgd2Ugd29uJ3QgcmVncmV0IGxhdGVyIG9uLCBvbmx5Cj4gcHJhY3Rp
Y2FsIGFwcGxpY2F0aW9uIGNhbiBjb25maXJtIHRoZSBjb3JyZWN0bmVzcy4KCkkgd2FzIG1vcmUg
cmVmZXJyaW5nIHRvIHRoZSAic3VwcG9ydCBmb3Igd2FpdHMiIHBhcnQsIHNob3VsZCBoYXZlIApj
bGFyaWZpZWQgdGhhdC4KCj4gCj4+PiBQYXJ0aWFsIG1hcHBpbmdzIHNob3VsZCBiZSBhIHNlcGFy
YXRlIGZlYXR1cmUgYmVjYXVzZSBpdCdzIGEKPj4+IHF1ZXN0aW9uYWJsZSBmZWF0dXJlIHRoYXQg
bmVlZHMgdG8gYmUgcHJvdmVkIGJ5IGEgcmVhbCB1c2Vyc3BhY2UgZmlyc3QuCj4+PiBNYXliZSBp
dCB3b3VsZCBiZSBldmVuIGJldHRlciB0byBkcm9wIGl0IGZvciB0aGUgc3RhcnRlciwgdG8gZWFz
ZQo+Pj4gcmV2aWV3aW5nLgo+Pgo+PiBDb25zaWRlcmluZyB0aGF0IHRoZSAibm8tb3AiIHN1cHBv
cnQgZm9yIGl0IChtYXAgdGhlIHdob2xlIGJ1ZmZlciBidXQKPj4ganVzdCBrZWVwIHRyYWNrIG9m
IHRoZSBzdGFydGluZyBvZmZzZXQpIGlzIG9ubHkgYSBjb3VwbGUgb2YgbGluZXMsIEknZAo+PiBs
aWtlIHRvIGtlZXAgaXQgaW4uCj4gCj4gVGhlcmUgaXMgbm8gdHJhY2tpbmcgaW4gdGhlIGN1cnJl
bnQgY29kZSB3aGljaCBwcmV2ZW50cyB0aGUgZHVwbGljYXRlZAo+IG1hcHBpbmdzLCB3aWxsIHdl
IG5lZWQgdG8gY2FyZSBhYm91dCBpdD8gVGhpcyBhIGJpdCB0b28gcXVlc3Rpb25hYmxlCj4gZmVh
dHVyZSBmb3Igbm93LCBJTU8uIEknZCBsaWtlIHRvIHNlZSBpdCBhcyBhIHNlcGFyYXRlIHBhdGNo
LgoKSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbnkgbmVlZCB0byBzcGVjaWFsIGNhc2UgZHVwbGlj
YXRlZCBtYXBwaW5ncy4gSSAKdGhpbmsgdGhpcyBpcyBhIHByZXR0eSBvYnZpb3VzIGZlYXR1cmUg
dG8gaGF2ZSwgYnV0IEkgY2FuIHJlbmFtZSB0aGVtIHRvIApyZXNlcnZlZDAgYW5kIHJlc2VydmVk
MSBhbmQgcmVxdWlyZSB0aGF0IHJlc2VydmVkMCBpcyB6ZXJvIGFuZCByZXNlcnZlZDEgCmlzIHRo
ZSBzaXplIG9mIHRoZSBwYXNzZWQgR0VNIG9iamVjdC4KCj4gCj4gLi4uCj4+PiBJJ2QgbGlrZSB0
byBzZWUgdGhlIERSTV9TQ0hFRCBhbmQgc3luY29iaiBzdXBwb3J0LiBJIGNhbiBoZWxwIHlvdSB3
aXRoCj4+PiBpdCBpZiBpdCdzIG91dCBvZiB5b3VycyBzY29wZSBmb3Igbm93Lgo+Pj4KPj4KPj4g
SSBhbHJlYWR5IHdyb3RlIHNvbWUgY29kZSBmb3Igc3luY29iaiBJIGNhbiBwcm9iYWJseSBwdWxs
IGluLiBSZWdhcmRpbmcKPj4gRFJNX1NDSEVELCBoZWxwIGlzIGFjY2VwdGVkLiBIb3dldmVyLCB3
ZSBzaG91bGQga2VlcCB1c2luZyB0aGUgaGFyZHdhcmUKPj4gc2NoZWR1bGVyLCBhbmQgY29uc2lk
ZXJpbmcgaXQncyBhIGJpZ2dlciBwaWVjZSBvZiB3b3JrLCBsZXQncyBub3QgYmxvY2sKPj4gdGhp
cyBzZXJpZXMgb24gaXQuCj4gCj4gSSdkIGxpa2UgdG8gc2VlIGFsbCB0aGUgY3VzdG9tIElPQ1RM
cyB0byBiZSBkZXByZWNhdGVkIGFuZCByZXBsYWNlZCB3aXRoCj4gdGhlIGdlbmVyaWMgRFJNIEFQ
SSB3aGVyZXZlciBwb3NzaWJsZS4gSGVuY2UsIEkgdGhpbmsgaXQgc2hvdWxkIGJlIGEKPiBtYW5k
YXRvcnkgZmVhdHVyZXMgdGhhdCB3ZSBuZWVkIHRvIGZvY3VzIG9uLiBUaGUgY3VycmVudCBXSVAg
dXNlcnNwYWNlCj4gYWxyZWFkeSB1c2VzIGFuZCByZWxpZXMgb24gRFJNX1NDSEVELgo+IAoKIEZy
b20gbXkgcG9pbnQgb2YgdmlldywgdGhlIEFCSSBuZWVkcyB0byBiZSBkZXNpZ25lZCBzdWNoIHRo
YXQgaXQgY2FuIApyZXBsYWNlIHdoYXQgd2UgaGF2ZSBkb3duc3RyZWFtLCBpLmUuIGl0IG5lZWRz
IHRvIHN1cHBvcnQgdGhlIHVzZWNhc2VzIAp0aGUgZG93bnN0cmVhbSBudmhvc3QgQUJJIHN1cHBv
cnRzIGN1cnJlbnRseS4gT3RoZXJ3aXNlIHRoZXJlIGlzIG5vIAptaWdyYXRpb24gcGF0aCB0byB1
cHN0cmVhbSBhbmQgaXQncyBub3Qgd29ydGggaXQgZm9yIG1lIHRvIHdvcmsgb24gdGhpcy4KCkFs
dGhvdWdoLCBJIGRvbid0IHNlZSB3aGF0IHRoaXMgQUJJIGlzIG1pc3NpbmcgdGhhdCB5b3VyIHVz
ZXJzcGFjZSB3b3VsZCAKcmVseSBvbi4gRG9lcyBpdCBzdWJtaXQgam9icyBpbiByZXZlcnNlIG9y
ZGVyIHRoYXQgd291bGQgZGVhZGxvY2sgaWYgCmRybV9zY2hlZCBkaWRuJ3QgcmVvcmRlciB0aGVt
IGJhc2VkIG9uIHByZWZlbmNlcywgb3Igc29tZXRoaW5nPwoKU29mdHdhcmUtYmFzZWQgc2NoZWR1
bGluZyBtaWdodCBtYWtlIHNlbnNlIGluIHNpdHVhdGlvbnMgd2hlcmUgdGhlIApjaGFubmVsIGlz
IHNoYXJlZCBieSBhbGwgcHJvY2Vzc2VzLCBidXQgYXQgbGVhc3QgZm9yIG1vZGVybiBjaGlwcyB0
aGF0IAphcmUgZGVzaWduZWQgdG8gdXNlIGhhcmR3YXJlIHNjaGVkdWxpbmcsIEkgd2FudCB0byB1
c2UgdGhhdCBjYXBhYmlsaXR5LgoKTWlra28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
