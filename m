Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9E20AEB5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 11:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3BA6E1F9;
	Fri, 26 Jun 2020 09:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931846E1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=guEsgAmalX3M26sJZo+6FTNsUcEaVOB4IttcNk1SeyA=; b=Kc1zWBsOIhSS72lHVd92N/G7CA
 jOhpFEePZYyG0nI8Cqn8Fusa/SkrGj/VXkqLkb7HaFlE61BCV+Cdj7HSypl26uzMGycjxLMQBWAUb
 wsEUic0L0uq3N2aNr4V1+HEYJcm5G7I+0iZ5wHMgvStNL3etKibovLG/0tzRoptUe2eY4plq7oQAh
 FnUh+vCQACjHpcCq4eMe4tN0HZ/pKb+Dx5SLnOw1FhyzNc4k62eyCHJw+MRzmfkFgPnOm7yB1K7pX
 1/eUlDIfCaD4cwfsxh1ZhNmWX+xQbJl2rhGexLiZINlCg0ccxFM9T/5/UgLNzCt8F1Mqmj2HfNNAd
 s5Yeq3JA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1jokIG-0006ni-W1; Fri, 26 Jun 2020 12:05:09 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
 <5c0aa939-d722-5034-6328-4df5be8ee3c6@kapsi.fi>
 <c96af3cb-a15c-dd3f-ac5b-b0a56d2ed6d9@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <5e5fcd38-cc41-a3e8-6688-2b38d6476326@kapsi.fi>
Date: Fri, 26 Jun 2020 12:05:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c96af3cb-a15c-dd3f-ac5b-b0a56d2ed6d9@gmail.com>
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

T24gNi8yNi8yMCAyOjI0IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjUuMDYuMjAyMCAx
MjoxNiwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IE9uIDYvMjUvMjAgMjoxMSBBTSwg
RG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gMjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1
bmVuINC/0LjRiNC10YI6Cj4+Pj4gLyogQ29tbWFuZCBpcyBhbiBvcGNvZGUgZ2F0aGVyIGZyb20g
YSBHRU0gaGFuZGxlICovCj4+Pj4gI2RlZmluZSBEUk1fVEVHUkFfU1VCTUlUX0NPTU1BTkRfR0FU
SEVSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAKPj4+PiAvKiBDb21tYW5kIGlzIGFuIG9wY29k
ZSBnYXRoZXIgZnJvbSBhIHVzZXIgcG9pbnRlciAqLwo+Pj4+ICNkZWZpbmUgRFJNX1RFR1JBX1NV
Qk1JVF9DT01NQU5EX0dBVEhFUl9VUFRSwqDCoMKgwqDCoMKgwqAgMQo+Pj4KPj4+IEknbSBhIGJp
dCBkdWJpb3VzIGFib3V0IHdoZXRoZXIgd2UgcmVhbGx5IG5lZWQgdG8gcmV0YWluIHRoZSBub24t
VVBUUgo+Pj4gdmFyaWFudC4gVGhlIG1lbW9yeS1jb3B5aW5nIG92ZXJoZWFkIGlzIG5lZ2xpZ2li
bGUgYmVjYXVzZSBjbWRzdHJlYW0ncwo+Pj4gZGF0YSB1c3VhbGx5IGlzIGhvdCBpbiBDUFUncyBj
YWNoZQo+Pj4KPj4+IElJUkMsIHRoZSBtb3N0IChpZiBub3QgYWxsKSBvZiB0aGUgbW9kZXJuIERS
TSBkcml2ZXJzIGRyaXZlcnMgdXNlIHRoZQo+Pj4gdXNycHRyLW9ubHkgZm9yIHRoZSBjbWRzdHJl
YW0uCj4+Pgo+Pj4gQXQgbGVhc3QgdGhlcmUgaXMgbm8gYW55IHJlYWwtd29ybGQgdXNlcnNwYWNl
IGV4YW1wbGUgdG9kYXkgdGhhdCBjb3VsZAo+Pj4gYmVuZWZpdCBmcm9tIGEgbm9uLVVQVFIgdmFy
aWFudC4KPj4+Cj4+PiBJJ20gc3VnZ2VzdGluZyB0byBsZWF2ZSBvdXQgdGhlIG5vbi1VUFRSIGdh
dGhlciB2YXJpYW50IGZvciBub3csIGtlZXBpbmcKPj4+IGl0IGluIG1pbmQgYXMgYSBwb3RlbnRp
YWwgZnV0dXJlIGV4dGVuc2lvbiBvZiB0aGUgc3VibWlzc2lvbiBVQVBJLiBBbnkKPj4+IG9iamVj
dGlvbnM/Cj4+Pgo+Pgo+PiBTdXJlLCB3ZSBzaG91bGQgYmUgYWJsZSB0byBkcm9wIGl0LiBEb3du
c3RyZWFtIHVzZXJzcGFjZSBpcyB1c2luZyBpdCwKPj4gYnV0IHdlIHNob3VsZCBiZSBhYmxlIHRv
IGZpeCB0aGF0LiBJIHdhcyB0aGlua2luZyB0aGF0IHdlIGNhbiBkaXJlY3RseQo+PiBtYXAgdGhl
IHVzZXIgcGFnZXMgYW5kIHBvaW50IHRoZSBnYXRoZXIgdG8gdGhlbSB3aXRob3V0IGNvcHlpbmcg
LSB0aGF0Cj4+IHdheSB3ZSB3b3VsZG4ndCBuZWVkIHRvIG1ha2UgRE1BIGFsbG9jYXRpb25zIGlu
c2lkZSB0aGUgZHJpdmVyIGZvciBldmVyeQo+PiBzdWJtaXQuCj4gCj4gV2Ugd2lsbCBuZWVkIHRv
IGNyZWF0ZSBhIEhvc3QxeCBETUEgcG9vbCBhbmQgdGhlbiB0aGUgZHluYW1pYwo+IGFsbG9jYXRp
b25zIHdpbGwgYmUgY2hlYXAuIFRoaXMgaXMgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIHRoYXQg
d2UgY2FuCj4gZGlzY3VzcyBzZXBhcmF0ZWx5Lgo+IAo+IFdlIHdpbGwgbmVlZCB0aGUgVVBUUiBh
bnl3YXlzIGZvciB0aGUgb2xkZXIgVGVyZ2FzIGJlY2F1c2Ugd2UgbmVlZCB0bwo+IHZhbGlkYXRl
IHRoZSBjbWRzdHJlYW1zIGFuZCBpdCdzIG11Y2ggbW9yZSBlZmZpY2llbnQgdG8gY29weSBmcm9t
IFVQVFIKPiB0aGFuIGZyb20gdGhlIHVuY2FjaGVhYmxlIG1lbW9yeS4KPiAKPiBUaGUgbm9uLVVQ
VFIgdmFyaWFudCB3aWxsIGJlIGZpbmUgdG8gYWRkIGlmIHlvdSdsbCBoYXZlIGEgcmVhbHdvcmxk
Cj4gZXhhbXBsZSB0aGF0IGRlbW9uc3RyYXRlcyBhIG5vdGljZWFibGUgcGVyZm9ybWFuY2UgZGlm
ZmVyZW5jZS4KPiAKPiBQcmV2aW91c2x5LCBJIHRob3VnaHQgdGhhdCB0aGVyZSB3aWxsIGJlIHNv
bWUgcGVyZiBkaWZmZXJlbmNlIGlmIEdSM0QKPiBzaGFkZXJzIGFyZSBtb3ZlZCBpbnRvIHRoZSAi
aW5zZXJ0LW9wY29kZSIgZ2F0aGVyLCBidXQgaXQgd2FzIG5lZ2xpZ2libGUKPiBvbmNlIEkgaW1w
bGVtZW50ZWQgaXQgYW5kIGl0IHNob3VsZCBiZSBldmVuIG1vcmUgbmVnbGlnaWJsZSBvbiBhIG1v
ZGVybgo+IGhhcmR3YXJlLgo+IAo+PiAoT24gZWFybHkgVGVncmFzIHdlIGNvdWxkIGp1c3QgY29w
eSBpbnRvIHRoZSBwdXNoYnVmZmVyIGJ1dCB0aGF0Cj4+IHdvbid0IHdvcmsgZm9yIG5ld2VyIG9u
ZXMpLgo+IAo+IFllcywgd2Ugc2hvdWxkIGNvcHkgZGF0YSBpbnRvIGEgZ2F0aGVyIGFuZCB0aGVu
IHB1c2ggaXQgaW50byBjaGFubmVsJ3MKPiBwdXNoYnVmZmVyLiBKdXN0IGxpa2UgaXQgd29ya3Mg
d2l0aCB0aGUgY3VycmVudCB1cHN0cmVhbSBkcml2ZXIuCj4gCj4gT25jZSBhbGwgdGhlIFVBUEkg
d2lsbCBiZSBzZXR0bGVkLCB3ZSdsbCBhbHNvIG5lZWQgdG8gZGlzY3VzcyB0aGUKPiBwdXNoYnVm
ZmVyJ3MgaW1wbGVtZW50YXRpb24gYmVjYXVzZSB0aGUgY3VycmVudCBkcml2ZXIgaGFzIHNvbWUg
cHJvYmxlbXMKPiB3aXRoIGl0Lgo+IAoKVHJ1ZSwgZm9yIGVhcmxpZXIgVGVncmFzIHdlJ2xsIG5l
ZWQgdG8gY29weSBhbnl3YXkuIFNvIGxldCdzIGp1c3QgCmltcGxlbWVudCBjb3B5aW5nIGZvciBu
b3csIHdoaWxlIG1ha2luZyBzdXJlIHRoYXQgZXh0ZW5kaW5nIHRvIGRpcmVjdGx5IAptYXBwaW5n
IHBhZ2VzIHdpbGwgYmUgcG9zc2libGUgbGF0ZXIgKGRvbid0IGtub3cgd2h5IGl0IHdvdWxkbid0
IGJlKSwgCmFuZCBpbXBsZW1lbnQgZGlyZWN0IG1hcHBpbmcgb3IgR0VNIGdhdGhlcnMgbGF0ZXIg
aWYgbmVlZGVkLgoKTWlra28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
