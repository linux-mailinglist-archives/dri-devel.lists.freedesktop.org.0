Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF69D12824
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E592D89612;
	Fri,  3 May 2019 06:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82023898A4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:31:18 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id t184so2729681oie.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 13:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F4NuyACR7kWdwk2pxyEEzTmoyY0p4baZn8V+2zxFbkU=;
 b=Q3VDo5WcZeXc6nwDnLOTU1YNd4fXds8Cd8UP+FiiNjUeu8Yv8uDLu7/RQhRBYXT4P4
 kInMNGFBpsCa+lcu4BS4oYXTlRCflcmX4t38tJjpGH6/Rk9G/fhYeUL7JirZ1q8frnNu
 i/Pnfj21nMHk8yS/jX1gejFCTQU1gByC86uKwaCFVL4Cv68ob1jL9Aoss5d5Ue9swSW3
 YZsbDeAlPl09yyxJWCb1edw1u/cB5yfmQoaEBetQ2H6Xhj2FGmE4N37KnikL0cycHEZo
 JTIBsnTuK8AujU9ZSgmi6NXz20bmt3ObdeWrcHS7VCckhCJXbS8s100G8GucwiJ7R57B
 cWTg==
X-Gm-Message-State: APjAAAXW0ycXZL4rQsCYDESUNg2TROdvjJRcxyellyTOg9WUzlDwU9KL
 VlVxdzi/TNiMFtmxRU+ngtNVD9flv8Sjwqb77WxP2g==
X-Google-Smtp-Source: APXvYqyv7U3c3/5E8Xpz+CaXQWMEbo9q2DbywjZmEyXTPMBwLDRVupd16uBn1uC9IO9899Bd7I1oCjWXNFgmgzKzHb0=
X-Received: by 2002:aca:441:: with SMTP id 62mr2544000oie.123.1556829077356;
 Thu, 02 May 2019 13:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
In-Reply-To: <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 2 May 2019 13:31:08 -0700
Message-ID: <CAJs_Fx6N88yG_67gnkYLWnOyADa3EkCk8CBk9gFfza+oNijnkQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
To: Greg Hartman <ghartman@google.com>
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F4NuyACR7kWdwk2pxyEEzTmoyY0p4baZn8V+2zxFbkU=;
 b=G2JF2WcOY8TWMcESgsyZcex77lg7AIUfvTKYXbvThBD4Gri/FM8IcOXALR+4G/WyIg
 zjfH/fbiOVgBIvxD9DVlhYU9xAhJ+jXT997/Imo550kOB/8qmzcR9l0cY7ZdLpjG3zkh
 RkoTMC5hH1UQa5CvfZyOz453EzEYhanne5bos=
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dan Willemsen <dwillemsen@google.com>, Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZnlpLCBKb2huIHB1c2hlZCBhIE1SIHcvIHRoZSBzYW1lIHBhdGNoZXM6Cmh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvbWVyZ2VfcmVxdWVzdHMvNzk1CgooSSdtIG5vdCBy
ZWFsbHkgYW4gZXhwZXJ0IG9uIGFuZHJvaWQgYnVpbGQgc3lzdGVtLCBidXQgaWYgaXQgd29ya3Ms
CnRoZW4gYWNrLWJ5IGZyb20gbWUpCgpCUiwKLVIKCk9uIFRodSwgTWF5IDIsIDIwMTkgYXQgMToy
MCBQTSBHcmVnIEhhcnRtYW4gPGdoYXJ0bWFuQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gKyBkd2ls
bGVtc2VuQGdvb2dsZS5jb20gYmFja2dyb3VuZCBvbiB0aGUgYnVpbGQgY2hhbmdlcy4KPgo+IFRo
YW5rcyBmb3IgZG9pbmcgdGhpcy4gSXQgd2lsbCBiZSBoZWxwZnVsIHRvIGhhdmUgZml4ZXMgdG8g
bWFrZSB0aGlzIGJ1aWxkIGFnYWluLgo+Cj4gT24gVGh1LCBNYXkgMiwgMjAxOSBhdCAxMTowMyBB
TSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IFNvbWV3
aGF0IHJlY2VudCBjaGFuZ2VzIGluIHRoZSBBT1NQIGJ1aWxkIHN5c3RlbSBoYXMgYmVlbiBtYWRl
Cj4+IHdoaWNoIGZhaXJseSBzZXZlcmVseSByZXN0cmljdHMgdGhlIGJ1aWxkIGVudmlyb25tZW50
LiBUaGlzIGhhcwo+PiBtYWRlIGl0IGRpZmZpY3VsdCB0byB0ZXN0IG1lc2EvbWFzdGVyIHcvIEFP
U1AvbWFzdGVyLgo+Pgo+PiBJJ20gd29ya2luZyB3aXRoIG90aGVycyB0byB0cnkgdG8gcmVtZWR5
IHRoaXMsIGJ1dCBhcyBhIGZpcnN0Cj4+IHN0ZXAgSSB1c2VkIHNvbWUgaGFja3MgdG8gdGVtcG9y
YXJpbHkgcmVtb3ZlIHRoZSBidWlsZCBlbnZpcm9ubWVudAo+PiByZXN0cmljdGlvbnMsIGFuZCB1
bnN1cHJpemluZ2x5IGZvdW5kIG1lc2EvbWFzdGVyIGhhcyBhIGZldwo+PiBidWlsZCBpc3N1ZXMg
d2hlbiB0cnlpbmcgdG8gYnVpbGQgdy8gZnJlZWRyZW5vLgo+Pgo+PiBTbyB0aGlzIHBhdGNoIHNl
dCBwcm92aWRlcyBvbmx5IHNvbWUgdmVyeSBiYXNpYyBidWlsZCBmaXhlcwo+PiB0aGF0IGFyZSBu
ZWVkZWQgdG8gZ2V0IG1lc2EvbWFzdGVyIGJ1aWxkaW5nIHcvIEFPU1AvbWFzdGVyCj4+IChtaW51
cyB0aGUgYnVpbGQgcmVzdHJpY3Rpb25zIG9uIGV4dGVybmFsIHRvb2xzKS4KPj4KPj4gRmVlZGJh
Y2sgd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZCEKPj4KPj4gdGhhbmtzCj4+IC1qb2huCj4+
Cj4+IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4+IENjOiBFbWlsIFZl
bGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT4KPj4gQ2M6IEFtaXQgUHVuZGlyIDxhbWl0
LnB1bmRpckBsaW5hcm8ub3JnPgo+PiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGlu
YXJvLm9yZz4KPj4gQ2M6IEFsaXN0YWlyIFN0cmFjaGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNvbT4K
Pj4gQ2M6IEdyZWcgSGFydG1hbiA8Z2hhcnRtYW5AZ29vZ2xlLmNvbT4KPj4gQ2M6IFRhcGFuaSBQ
w6RsbGkgPHRhcGFuaS5wYWxsaUBpbnRlbC5jb20+Cj4+IENjOiBKYXNvbiBFa3N0cmFuZCA8amFz
b25Aamxla3N0cmFuZC5uZXQ+Cj4+Cj4+IEFsaXN0YWlyIFN0cmFjaGFuICgxKToKPj4gICBtZXNh
OiBhbmRyb2lkOiBSZW1vdmUgdW5uZWNlc3NhcnkgZGVwZW5kZW5jeSB0cmFja2luZyBydWxlcwo+
Pgo+PiBBbWl0IFB1bmRpciAoMSk6Cj4+ICAgbWVzYTogYW5kcm9pZDogZnJlZWRyZW5vOiBidWls
ZCBsaWJmcmVlZHJlbm9fe2RybSxpcjN9IHN0YXRpYyBsaWJzCj4+Cj4+IEpvaG4gU3R1bHR6ICgx
KToKPj4gICBtZXNhOiBhbmRyb2lkOiBmcmVlZHJlbm86IEZpeCBidWlsZCBmYWlsdXJlIGR1ZSB0
byBwYXRoIGNoYW5nZQo+Pgo+PiAgQW5kcm9pZC5tayAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4+ICBzcmMvY29tcGlsZXIvQW5kcm9pZC5nbHNsLmdlbi5tayAgICAg
ICAgICAgICB8ICAyIC0KPj4gIHNyYy9jb21waWxlci9BbmRyb2lkLm5pci5nZW4ubWsgICAgICAg
ICAgICAgIHwgIDIgLQo+PiAgc3JjL2ZyZWVkcmVuby9BbmRyb2lkLmRybS5tayAgICAgICAgICAg
ICAgICAgfCA0MSArKysrKysrKysrKysrKysrCj4+ICBzcmMvZnJlZWRyZW5vL0FuZHJvaWQuaXIz
Lm1rICAgICAgICAgICAgICAgICB8IDUxICsrKysrKysrKysrKysrKysrKysrCj4+ICBzcmMvZnJl
ZWRyZW5vL0FuZHJvaWQubWsgICAgICAgICAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKwo+
PiAgc3JjL2ZyZWVkcmVuby9NYWtlZmlsZS5zb3VyY2VzICAgICAgICAgICAgICAgfCAgMiArCj4+
ICBzcmMvZ2FsbGl1bS9BbmRyb2lkLmNvbW1vbi5tayAgICAgICAgICAgICAgICB8ICA1ICstCj4+
ICBzcmMvZ2FsbGl1bS9kcml2ZXJzL2ZyZWVkcmVuby9BbmRyb2lkLmdlbi5tayB8ICAyICstCj4+
ICBzcmMvZ2FsbGl1bS9kcml2ZXJzL2ZyZWVkcmVuby9BbmRyb2lkLm1rICAgICB8ICAyICstCj4+
ICBzcmMvZ2FsbGl1bS90YXJnZXRzL2RyaS9BbmRyb2lkLm1rICAgICAgICAgICB8ICA0ICsrCj4+
ICAxMSBmaWxlcyBjaGFuZ2VkLCAxMzUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzcmMvZnJlZWRyZW5vL0FuZHJvaWQuZHJtLm1rCj4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgc3JjL2ZyZWVkcmVuby9BbmRyb2lkLmlyMy5tawo+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNyYy9mcmVlZHJlbm8vQW5kcm9pZC5tawo+Pgo+PiAtLQo+PiAyLjE3LjEKPj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
