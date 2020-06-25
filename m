Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D622F209BCA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25036E8A0;
	Thu, 25 Jun 2020 09:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F0E6E8A0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rJ8/3dKlR6UdgvJARN4X5NXocLtd/y87+BNOyXJLebQ=; b=V37uxWeVYsyGBMXkO11d2N7IWl
 8sIU9guRW4YwUU7kXc9t1GoAcQdp+aEwPyG0a7EnnafKOVvkHEy2t2WDR7wRQg4UG+08VFsTnRcbt
 5BbUyTQVLXaoxFf7u5Sp7veYbWW6ui6Jjyy0n7Pg6RtTwUk6XB8FAilfLHAeasSmSjBB8uuvLms9H
 +HbKNq4JuP3z39Me2V2Cw+dQCO18/lE6MWjjueQDb/5wFZzgGJCziSKyKteVwQEJIILUBMwd/r46M
 UIG56D90ZECtvS5MnJ7kbQqmKVUNI0EKjUDaREZ1+ZJdxNWdDnGa8YlXrUYeGQjqduer/BSKLfr3p
 sjxnAWhg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1joO0V-0000fc-Nq; Thu, 25 Jun 2020 12:17:19 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <867dea06-8741-82e8-3e26-9a017ad9057a@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <e04c02f0-b034-6e5b-51bf-0a142f3138a6@kapsi.fi>
Date: Thu, 25 Jun 2020 12:17:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <867dea06-8741-82e8-3e26-9a017ad9057a@gmail.com>
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

T24gNi8yNC8yMCAxMTo1NSBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDIzLjA2LjIwMjAg
MTU6MDksIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+IC4uLgo+PiAqIFByZXZpb3VzbHkg
cHJlc2VudCBHRU0gSU9DVExzIChHRU1fQ1JFQVRFLCBHRU1fTU1BUCkgYXJlIG5vdCBwcmVzZW50
Lgo+PiBOb3Qgc3VyZSBpZiB0aGV5IGFyZSBzdGlsbCBuZWVkZWQuCj4gCj4gSGVsbG8gTWlra28h
Cj4gCj4gQSBxdWljayBjb21tZW50IGZvciB0aGUgc3RhcnRlci4gU3dpdGNoaW5nIGF3YXkgZnJv
bSB0aGUgVGVncmEtc3BlY2lmaWMKPiBHRU0gSU9DVExzIHRvIHRoZSBkbWEtYnVmIGhlYXBzIGlz
IGEgc3VjaCByYWRpY2FsIGNoYW5nZSEgQnV0IEkgbGlrZSBpdCEKPiAKPiBQcmV2aW91c2x5IEkg
d2FzIGN1cmlvdXMgYWJvdXQgd2hldGhlciB3ZSBjb3VsZCBoYXZlIG11bHRpcGxlIENNQQo+IHJl
Z2lvbnMgKG9uZSBzaGFyZWQvcmV1c2FibGUgYW5kIG90aGVyIHByaXZhdGUsIGZvciBleGFtcGxl
KSBmb3IgdGhlCj4gVGVncmEgRFJNIGRyaXZlciBhbmQgYXQgYSBxdWljayBnbGFuY2UgdGhlIGRt
YS1idWYgaGVhcHMgY291bGQgYmUgYSBuaWNlCj4gc29sdXRpb24gdGhhdCBhdm9pZHMgcmUtaW52
ZW50aW5nIGEgZHJpdmVyLXNwZWNpZmljIHRoaW5ncyBmb3IgdGhhdC4KPiAKPiBJJ20gaW5zdGFu
dGx5IGZvcmVzZWVpbmcgdGhlc2UgdHlwZXMgb2YgaGVhcHM6Cj4gCj4gMS4gTGFyZ2UgcmV1c2Fi
bGUgQ01BIGhlYXAuCj4gMi4gU21hbGxlciBub24tcmV1c2FibGUgY29tbW9uIENNQSB0aGF0IGNv
dWxkIGJlIHVzZWQgd2hlbiBhbGxvY2F0aW9uCj4gZnJvbSBhIHJldXNhYmxlIENNQSBmYWlscy4g
T3IgdmljZSB2ZXJzYSwgd2hlbiB3ZSB3YW50IHRvIHJlZHVjZSB0aGUKPiBjaGFuY2UgdG8gYmxv
Y2sgZm9yIGEgbG9uZyB0aW1lIG9uIGFsbG9jYXRpb24sIGZvciBleGFtcGxlLgo+IDMuIFNwYXJz
ZSAoc3lzdGVtKSBtZW1vcnkgaGVhcC4KPiAKPiBJdCdzIHRoZSBmaXJzdCB0aW1lIEknbSBsb29r
aW5nIGF0IHRoZSBkbWEtYnVmIGhlYXBzIGFuZCBpdCBzb3VuZHMgbGlrZQo+IGEgdmVyeSBuaWNl
IGlkZWEgdG8gdXRpbGl6ZSB0aGVtIQo+IAo+IFRoZSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAx
OS8xMS8xOC83ODcgc2F5cyB0aGF0IHRoZSBzeXN0ZW0tY29udGlndW91cwo+IGFuZCBjYXJ2ZW91
dCBoZWFwcyB3ZSBub3QgYWRkZWQgYmVjYXVzZSB0aGV5IHdlcmUgbm90IG5lZWRlZCwgYnV0IHRo
ZXkKPiB3aWxsIGJlIG5lZWRlZCBmb3IgdGhlIFRlZ3JhMjAgZHJpdmVycyBhbmQgZm9yIHRoZSBj
YXNlIHdoZXJlIElPTU1VIGlzCj4gZGlzYWJsZWQuIEl0IHNob3VsZG4ndCBiZSBkaWZmaWN1bHQg
dG8gYWRkIHRoZXNlIHR5cGVzIG9mIGhlYXBzLgo+IAo+IEknbGwgY29udGludWUgdG8gZXhhbWlu
ZSB0aGUgZG1hLWJ1ZiBoZWFwcyBpbiBhIG1vcmUgZGV0YWlscy4KPiAKClN1cmUsIGxldCdzIGdv
IHdpdGggdGhpcyBmb3Igbm93LiBXZSBjYW4gYW55d2F5IGFkZCBHRU0gSU9DVExzIGxhdGVyIGlm
IAp0aGV5IGFyZSBuZWVkZWQsIHdpdGhvdXQgYW55IGNvbXBhdGliaWxpdHkgaXNzdWVzLgoKTWlr
a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
