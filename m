Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A58267F04
	for <lists+dri-devel@lfdr.de>; Sun, 13 Sep 2020 11:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF8D6E139;
	Sun, 13 Sep 2020 09:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01486E139
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Sep 2020 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Lfu09LMF3J0CbNmYFr8EahUrvUMGY6J2P159wTaFeo=; b=mW9ELElO33S1fACdlrYAXlTUu9
 M/Na5Owl9axlSlIo+DVtzT8iEVZFBTt7ArjtBJ1MTHV6hqQSunZqHUrLkp2fxZ+NIa6DEmK7n32TR
 byE4EH9y1aiPTKbgH6YpXOEikI3+Bq8l1FtqLC74ogWd68ElPUaSIyNIp6PMbzjeiKTR119lmtqW/
 QG4tutiCK6mvVMnwfge9N/cUVtChFDRbEVCUGilqlRgDOYAzbtEjLY3xmC1uuY3iadqQFo2GccZIa
 Nwb73uoK5tsDHoDhBtpMz3qmV/8N/aAn3W/1qpSYL0cgGsmDFKTrs03pJKw+sPlj5Ftz8UKX4Wg4Q
 i5ENY/9w==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kHOfX-0001jl-G0; Sun, 13 Sep 2020 12:51:35 +0300
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
 <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
 <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
 <28f18a23-b588-004d-4945-91b7a593607a@kapsi.fi>
 <3f80aff2-23ce-9b1f-d242-e46e974fbeed@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <56c956a3-af14-559b-8022-2228a65e82a6@kapsi.fi>
Date: Sun, 13 Sep 2020 12:51:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3f80aff2-23ce-9b1f-d242-e46e974fbeed@gmail.com>
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

T24gOS8xMy8yMCAxMjo1MSBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDEyLjA5LjIwMjAg
MTY6MzEsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+IC4uLgo+Pj4gSSdtIG5vdyB0YWtp
bmcgYSBjbG9zZXIgbG9vayBhdCB0aGlzIHBhdGNoIGFuZCBpdCByYWlzZXMgc29tZSBtb3JlCj4+
PiBxdWVzdGlvbnMsIGxpa2UgZm9yIGV4YW1wbGUgYnkgbG9va2luZyBhdCB0aGUgIk9uIGpvYiB0
aW1lb3V0LCB3ZSBzdG9wCj4+PiB0aGUgY2hhbm5lbCwgTk9QIGFsbCBmdXR1cmUgam9icyBvbiB0
aGUgY2hhbm5lbCB1c2luZyB0aGUgc2FtZSBzeW5jcG9pbnQKPj4+IC4uLiIgdGhyb3VnaCB0aGUg
cHJpc20gb2YgZ3JhdGUta2VybmVsIGV4cGVyaWVuY2UsIEknbSBub3Qgc3VyZSBob3cgaXQKPj4+
IGNvdWxkIGNvLWV4aXN0IHdpdGggdGhlIGRybS1zY2hlZHVsZXIgYW5kIHdoeSBpdCdzIG5lZWRl
ZCBhdCBhbGwuIEJ1dCBJCj4+PiB0aGluayB3ZSBuZWVkIGEgZmVhdHVyZS1jb21wbGV0ZSB2ZXJz
aW9uIChhdCBsZWFzdCBhIHJvdWdoIHZlcnNpb24pLCBzbwo+Pj4gdGhhdCB3ZSBjb3VsZCBzdGFy
dCB0aGUgdGVzdGluZywgYW5kIHRoZW4gaXQgc2hvdWxkIGJlIGVhc2llciB0byByZXZpZXcKPj4+
IGFuZCBkaXNjdXNzIHN1Y2ggdGhpbmdzLgo+Pj4KPj4KPj4gVGhlIHJlYXNvbiB0aGlzIGlzIG5l
ZWRlZCBpcyB0aGF0IGlmIGEgam9iIHRpbWVzIG91dCBhbmQgd2UgZG9uJ3QgZG8gaXRzCj4+IHN5
bmNwb2ludCBpbmNyZW1lbnRzIG9uIHRoZSBDUFUsIHRoZW4gYSBzdWNjZXNzaXZlIGpvYiBpbmNy
ZW1lbnRpbmcgdGhhdAo+PiBzYW1lIHN5bmNwb2ludCB3b3VsZCBjYXVzZSBmZW5jZXMgdG8gc2ln
bmFsIGluY29ycmVjdGx5LiBUaGUgam9iIHRoYXQKPj4gd2FzIHN1cHBvc2VkIHRvIHNpZ25hbCB0
aG9zZSBmZW5jZXMgZGlkbid0IGFjdHVhbGx5IHJ1bjsgYW5kIGFueSBkYXRhCj4+IHRob3NlIGZl
bmNlcyB3ZXJlIHByb3RlY3Rpbmcgd291bGQgc3RpbGwgYmUgZ2FyYmFnZS4KPiAKPiBJJ2xsIG5l
ZWQgdG8gcmUtcmVhZCB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBiZWNhdXNlIElJUkMsIEkgd2Fz
Cj4gc3VnZ2VzdGluZyB0aGF0IG9uY2Ugam9iIGlzIGh1bmcsIGFsbCBqb2JzIHNob3VsZCBiZSBy
ZW1vdmVkIGZyb20KPiBxdWV1ZS9QQiBhbmQgcmUtc3VibWl0dGVkLCB0aGVuIHRoZSByZS1zdWJt
aXR0ZWQgam9icyB3aWxsIHVzZSB0aGUKPiBuZXcvdXBkYXRlZCBzeW5jIHBvaW50IGJhc2UuID4K
PiBBbmQgd2UgcHJvYmFibHkgc2hvdWxkIG5lZWQgYW5vdGhlciBkcm1fdGVncmFfc3VibWl0X2Nt
ZCB0eXBlIHRoYXQgd2FpdHMKPiBmb3IgYSByZWxhdGl2ZSBzeW5jIHBvaW50IGluY3JlbWVudC4g
VGhlCj4gZHJtX3RlZ3JhX3N1Ym1pdF9jbWRfd2FpdF9zeW5jcHQgdXNlcyBhYnNvbHV0ZSBzeW5j
IHBvaW50IHZhbHVlIGFuZCBpdAo+IHNob3VsZG4ndCBiZSB1c2VkIGZvciBzeW5jIHBvaW50IGlu
Y3JlbWVudHMgdGhhdCBhcmUgaW50ZXJuYWwgdG8gYSBqb2IKPiBiZWNhdXNlIGl0IGNvbXBsaWNh
dGVzIHRoZSByZWNvdmVyeS4KPiAKPiBBbGwgd2FpdHMgdGhhdCBhcmUgaW50ZXJuYWwgdG8gYSBq
b2Igc2hvdWxkIG9ubHkgd2FpdCBmb3IgcmVsYXRpdmUgc3luYwo+IHBvaW50IGluY3JlbWVudHMu
ID4KPiBJbiB0aGUgZ3JhdGUta2VybmVsIGV2ZXJ5IGpvYiB1c2VzIHVuaXF1ZS1hbmQtY2xlYW4g
c3luYyBwb2ludCAod2hpY2ggaXMKPiBhbHNvIGludGVybmFsIHRvIHRoZSBrZXJuZWwgZHJpdmVy
KSBhbmQgYSByZWxhdGl2ZSB3YWl0IFsxXSBpcyB1c2VkIGZvcgo+IHRoZSBqb2IncyBpbnRlcm5h
bCBzeW5jIHBvaW50IGluY3JlbWVudHMgWzJdWzNdWzRdLCBhbmQgdGh1cywga2VybmVsCj4gZHJp
dmVyIHNpbXBseSBqdW1wcyBvdmVyIGEgaHVuZyBqb2IgYnkgdXBkYXRpbmcgRE1BR0VUIHRvIHBv
aW50IGF0IHRoZQo+IHN0YXJ0IG9mIGEgbmV4dCBqb2IuCgpJc3N1ZXMgSSBoYXZlIHdpdGggdGhp
cyBhcHByb2FjaDoKCiogQm90aCB0aGlzIGFuZCBteSBhcHByb2FjaCBoYXZlIHRoZSByZXF1aXJl
bWVudCBmb3IgdXNlcnNwYWNlLCB0aGF0IGlmIAphIGpvYiBoYW5ncywgdGhlIHVzZXJzcGFjZSBt
dXN0IGVuc3VyZSBhbGwgZXh0ZXJuYWwgd2FpdGVycyBoYXZlIHRpbWVkIApvdXQgLyBiZWVuIHN0
b3BwZWQgYmVmb3JlIHRoZSBzeW5jcG9pbnQgY2FuIGJlIGZyZWVkLCBhcyBpZiB0aGUgCnN5bmNw
b2ludCBnZXRzIHJldXNlZCBiZWZvcmUgdGhlbiwgZmFsc2Ugd2FpdGVyIGNvbXBsZXRpb25zIGNh
biBoYXBwZW4uCgpTbyBmcmVlaW5nIHRoZSBzeW5jcG9pbnQgbXVzdCBiZSBleHBvc2VkIHRvIHVz
ZXJzcGFjZS4gVGhlIGtlcm5lbCBjYW5ub3QgCmRvIHRoaXMgc2luY2UgdGhlcmUgbWF5IGJlIHdh
aXRlcnMgdGhhdCB0aGUga2VybmVsIGlzIG5vdCBhd2FyZSBvZi4gTXkgCnByb3Bvc2FsIG9ubHkg
aGFzIG9uZSBzeW5jcG9pbnQsIHdoaWNoIEkgZmVlbCBtYWtlcyB0aGlzIHBhcnQgc2ltcGxlciwg
dG9vLgoKKiBJIGJlbGlldmUgdGhpcyBwcm9wb3NhbCByZXF1aXJlcyBhbGxvY2F0aW5nIGEgc3lu
Y3BvaW50IGZvciBlYWNoIApleHRlcm5hbGx5IHZpc2libGUgc3luY3BvaW50IGluY3JlbWVudCB0
aGF0IHRoZSBqb2IgZG9lcy4gVGhpcyBjYW4gdXNlIAp1cCBxdWl0ZSBhIGZldyBzeW5jcG9pbnRz
LCBhbmQgaXQgbWFrZXMgc3luY3BvaW50cyBhIGR5bmFtaWNhbGx5IAphbGxvY2F0ZWQgcmVzb3Vy
Y2Ugd2l0aCB1bmJvdW5kZWQgYWxsb2NhdGlvbiBsYXRlbmN5LiBUaGlzIGlzIGEgcHJvYmxlbSAK
Zm9yIHNhZmV0eS1yZWxhdGVkIHN5c3RlbXMuCgoqIElmIGEgam9iIGZhaWxzIG9uIGEgInZpcnR1
YWwgY2hhbm5lbCIgKHVzZXJjdHgpLCBJIHRoaW5rIGl0J3MgYSAKcmVhc29uYWJsZSBleHBlY3Rh
dGlvbiB0aGF0IGZ1cnRoZXIgam9icyBvbiB0aGF0ICJ2aXJ0dWFsIGNoYW5uZWwiIHdpbGwgCm5v
dCBleGVjdXRlLCBhbmQgSSB0aGluayBpbXBsZW1lbnRpbmcgdGhhdCBtb2RlbCBpcyBzaW1wbGVy
IHRoYW4gZG9pbmcgCnJlY292ZXJ5LgoKTWlra28KCj4gCj4gWzFdCj4gaHR0cHM6Ly9naXRodWIu
Y29tL2dyYXRlLWRyaXZlci9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
dWFwaS9wYXRjaGluZy5jI0wzNjcKPiAKPiBbMl0KPiBodHRwczovL2dpdGh1Yi5jb20vZ3JhdGUt
ZHJpdmVyL3hmODYtdmlkZW8tb3BlbnRlZ3JhL2Jsb2IvbWFzdGVyL3NyYy9ncHUvZ3IzZC5jI0w0
ODYKPiBbM10KPiBodHRwczovL2dpdGh1Yi5jb20vZ3JhdGUtZHJpdmVyL3hmODYtdmlkZW8tb3Bl
bnRlZ3JhL2Jsb2IvbWFzdGVyL3NyYy9leGEvY29weV8yZC5jI0wzODkKPiBbNF0KPiBodHRwczov
L2dpdGh1Yi5jb20vZ3JhdGUtZHJpdmVyL3hmODYtdmlkZW8tb3BlbnRlZ3JhL2Jsb2IvbWFzdGVy
L3NyYy9ncHUvdGVncmFfc3RyZWFtX3YyLmMjTDUzNgo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
