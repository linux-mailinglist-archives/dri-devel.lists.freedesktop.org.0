Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA130746C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 12:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148A96E105;
	Thu, 28 Jan 2021 11:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EAB6E105
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mo3AkTen3Mb/LYk4vT7lQBVruefateYvv99Xrm8ZlH8=; b=N1I8QgICraeMPrpnfntTQWX/DP
 wAxs0DTYegvqUneH0E9xarqx8YjRg53s+T2dSIEptKe8aoI94kepSpqDEf3BXkDZ1LiEcNN8Z76OS
 NrvzD+/ZJAk7SmmJ1pdMu8R1ANwvP701y+sQ8aPkl1AlmUxsluA/hdEs5vYAZqWdpzFIOkGlGzk+9
 T8lrja9qKPTULNaayG18AGtCd7+c9bV4y37a2bSTaBIwmcjZltiu5cSvSFFdLb3TjKP0skCTiG2LG
 vJx+4Dw0ZzfwuKBtX1Y0eHbwaocGkQTjggnMroUza6AF8o49ZCckJIVuh0rsaYWHJ+v+0csZ6P1AP
 y4caXXNA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1l55AU-0005Hp-Ni; Thu, 28 Jan 2021 13:08:54 +0200
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi>
Date: Thu, 28 Jan 2021 13:08:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
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

T24gMS8yNy8yMSAxMToyMCBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI2LjAxLjIwMjEg
MDU6NDUsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4gMi4gV2Ugd2lsbCBwcm9iYWJs
eSBuZWVkIGEgZGVkaWNhdGVkIGRybV90ZWdyYV9zdWJtaXRfY21kIGZvciBzeW5jIHBvaW50Cj4+
PiBpbmNyZW1lbnRzLsKgIFRoZSBqb2IncyBzeW5jIHBvaW50IHdpbGwgYmUgYWxsb2NhdGVkIGR5
bmFtaWNhbGx5IHdoZW4gam9iCj4+PiBpcyBzdWJtaXR0ZWQuwqAgV2Ugd2lsbCBuZWVkIGEgZmFn
IGZvciB0aGUgc3luY19pbmNyIGFuZCB3YWl0X3N5bmNwdAo+Pj4gY29tbWFuZHMsIHNheWluZyAi
aXQncyBhIGpvYidzIHN5bmMgcG9pbnQgaW5jcmVtZW50L3dhaXQiCj4+Cj4+IE5lZ2F0aXZlLiBM
aWtlIEkgaGF2ZSBleHBsYWluZWQgaW4gcHJldmlvdXMgZGlzY3Vzc2lvbnMsIHdpdGggdGhlCj4+
IGN1cnJlbnQgd2F5IHRoZSB1c2FnZSBvZiBoYXJkd2FyZSByZXNvdXJjZXMgaXMgbXVjaCBtb3Jl
IGRldGVybWluaXN0aWMKPj4gYW5kIG9idmlvdXMuIEkgZGlzYWdyZWUgb24gdGhlIHBvaW50IHRo
YXQgdGhpcyBpcyBtdWNoIG1vcmUgY29tcGxpY2F0ZWQKPj4gZm9yIHRoZSB1c2Vyc3BhY2UuIFNl
cGFyYXRpbmcgc3luY3BvaW50IGFuZCBjaGFubmVsIGFsbG9jYXRpb24gaXMgb25lIG9mCj4+IHRo
ZSBwcmltYXJ5IG1vdGl2YXRpb25zIG9mIHRoaXMgc2VyaWVzIGZvciBtZS4KPiAKPiBTeW5jIHBv
aW50cyBhcmUgYSBsaW1pdGVkIHJlc291cmNlLiBUaGUgbW9zdCBzZW5zaWJsZSB3YXkgdG8gd29y
ayBhcm91bmQKPiBpdCBpcyB0byBrZWVwIHN5bmMgcG9pbnRzIHdpdGhpbiBrZXJuZWwgYXMgbXVj
aCBhcyBwb3NzaWJsZS4gVGhpcyBpcyBub3QKPiBvbmx5IG11Y2ggc2ltcGxlciBmb3IgdXNlciBz
cGFjZSwgYnV0IGFsc28gYWxsb3dzIHRvIHV0aWxpemUgRFJNIEFQSQo+IHByb3Blcmx5IHdpdGhv
dXQgcmUtaW52ZW50aW5nIHdoYXQgYWxyZWFkeSBleGlzdHMgYW5kIGl0J3MgZWFzaWVyIHRvCj4g
bWFpbnRhaW4gaGFyZHdhcmUgaW4gYSBnb29kIHN0YXRlLgoKSSd2ZSBzcGVudCB0aGUgbGFzdCBm
ZXcgeWVhcnMgZGVzaWduaW5nIGZvciBhdXRvbW90aXZlIGFuZCBpbmR1c3RyaWFsIApwcm9kdWN0
cywgd2hlcmUgd2UgZG9uJ3Qgd2FudCB0byBhdCBydW50aW1lIG5vdGljZSB0aGF0IHRoZSBzeXN0
ZW0gaXMgCm91dCBvZiBmcmVlIHN5bmNwb2ludHMgYW5kIGJlY2F1c2Ugb2YgdGhhdCB3ZSBjYW4g
b25seSBwcm9jZXNzIHRoZSBuZXh0IApjYW1lcmEgZnJhbWUgaW4gYSBzZWNvbmQgb3IgdHdvIGlu
c3RlYWQgb2YgMTYgbWlsbGlzZWNvbmRzLiBXZSBuZWVkIHRvIAprbm93IHRoYXQgb25jZSB3ZSBo
YXZlIGFsbG9jYXRlZCB0aGUgcmVzb3VyY2UsIGl0IGlzIHRoZXJlLiBUaGUgbmV3ZXIgCmNoaXBz
IGFyZSBhbHNvIGRlc2lnbmVkIHRvIHN1cHBvcnQgdGhpcy4KCkNvbnNpZGVyaW5nIExpbnV4IGlz
IGluY3JlYXNpbmdseSBiZWluZyB1c2VkIGZvciBzdWNoIGFwcGxpY2F0aW9ucywgYW5kIAp0aGV5
IGFyZSBpbXBvcnRhbnQgdGFyZ2V0IG1hcmtldHMgZm9yIE5WSURJQSwgdGhlc2UgbmVlZCB0byBi
ZSBzdXBwb3J0ZWQuCgpCZWNhdXNlIG9mIHRoZSBhYm92ZSBkZXNpZ24gY29uc3RyYWludCB0aGUg
dXNlcnNwYWNlIHNvZnR3YXJlIHRoYXQgcnVucyAKaW4gdGhlc2UgZW52aXJvbm1lbnRzIGFsc28g
ZXhwZWN0cyByZXNvdXJjZXMgdG8gYmUgYWxsb2NhdGVkIHVwIGZyb250LiAKVGhpcyBpc24ndCBh
IG1hdHRlciBvZiBoYXZpbmcgdG8gZGVzaWduIHRoYXQgc29mdHdhcmUgYWNjb3JkaW5nIHRvIHdo
YXQgCmtpbmQgb2YgYWxsb2NhdGlvbiBBUEkgd2UgZGVjaWRlIGRvIGF0IExpbnV4IGxldmVsIC0t
IGl0J3Mgbm8gdXNlIApkZXNpZ25pbmcgZm9yIGR5bmFtaWMgYWxsb2NhdGlvbiBpZiBpdCBsZWFk
cyB0byB5b3Ugbm90IG1lZXRpbmcgdGhlIApzYWZldHkgcmVxdWlyZW1lbnQgb2YgbmVlZGluZyB0
byBlbnN1cmUgeW91IGhhdmUgYWxsIHJlc291cmNlcyBhbGxvY2F0ZWQgCnVwIGZyb250LgoKVGhp
cyBpc24ndCBhIGdvb2QgZGVzaWduIGZlYXR1cmUganVzdCBpbiBhIGNhciwgYnV0IGluIGFueXRo
aW5nIHRoYXQgCm5lZWRzIHRvIGJlIHJlbGlhYmxlLiBIb3dldmVyLCBpdCBkb2VzIHBvc2Ugc29t
ZSB0cmFkZW9mZnMsIGFuZCBpZiB5b3UgCnRoaW5rIHRoYXQgcnVubmluZyBvdXQgb2Ygc3luY3Bv
aW50cyBvbiBUMjAtVDExNCBiZWNhdXNlIG9mIHVwZnJvbnQgCmFsbG9jYXRpb24gaXMgYW4gYWN0
dWFsIHByb2JsZW0sIEknbSBub3Qgb3Bwb3NlZCB0byBoYXZpbmcgYm90aCBvcHRpb25zIAphdmFp
bGFibGUuCgo+IAo+IElmIHlvdSBuZWVkIHRvIHVzZSBhIGRlZGljYXRlZCBzeW5jIHBvaW50IGZv
ciBWTXMsIHRoZW4ganVzdCBhbGxvY2F0ZQo+IHRoYXQgc3BlY2lhbCBzeW5jIHBvaW50IGFuZCB1
c2UgaXQuIEJ1dCB0aGlzIHN5bmMgcG9pbnQgd29uJ3QgYmUgdXNlZAo+IGZvciBqb2JzIHRyYWNr
aW5nIGJ5IGtlcm5lbCBkcml2ZXIuIElzIHRoZXJlIGFueSBwcm9ibGVtIHdpdGggdGhpcz8KCklu
IGFkZGl0aW9uIHRvIGFib3ZlLCBpdCB3b3VsZCBpbmNyZWFzZSB0aGUgbnVtYmVyIG9mIHN5bmNw
b2ludHMgCnJlcXVpcmVkLiBUaGUgbnVtYmVyIG9mIHN5bmNwb2ludHMgc3VwcG9ydGVkIGJ5IGhh
cmR3YXJlIGhhcyBiZWVuIApjYWxjdWxhdGVkIGZvciBzcGVjaWZpYyB1c2UgY2FzZXMsIGFuZCBp
bmNyZWFzaW5nIHRoZSBudW1iZXIgb2YgcmVxdWlyZWQgCnN5bmNwb2ludHMgcmlza3Mgbm90IGJl
aW5nIGFibGUgdG8gc3VwcG9ydCB0aG9zZSB1c2UgY2FzZXMuCgo+IAo+IFRoZSBwcmltYXJ5IG1v
dGl2YXRpb24gZm9yIG1lIGlzIHRvIGdldCBhIHByYWN0aWNhbGx5IHVzYWJsZSBrZXJuZWwKPiBk
cml2ZXIgZm9yIHVzZXJzcGFjZS4KPiAKCk1lIHRvby4gRm9yIHRoZSB0cmFkaXRpb25hbCAidGFi
bGV0IGNoaXBzIiB0aGUgdGFzayBpcyBxdWl0ZSB3ZWxsIApkZWZpbmVkIGFuZCBzdXBwb3J0ZWQu
IEJ1dCBteSBnb2FsIGlzIHRvIGFsc28gZ2V0IHJpZCBvZiB0aGUgamFuayBpbiAKZG93bnN0cmVh
bSBhbmQgYWxsb3cgZnVsbHktZmVhdHVyZWQgdXNlIG9mIFRlZ3JhIGRldmljZXMgb24gdXBzdHJl
YW0gCmtlcm5lbHMgYW5kIGZvciB0aGF0LCB0aGUgZHJpdmVyIG5lZWRzIHRvIGJlIHVzYWJsZSBm
b3IgdGhlIHdob2xlIHJhbmdlIApvZiB1c2UgY2FzZXMuCgpNaWtrbwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
