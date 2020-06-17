Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545831FEC41
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4966EB13;
	Thu, 18 Jun 2020 07:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026466E02B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 17:14:09 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n24so3782931lji.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 10:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ol8wJ0Ar+0WXAazQ6Zc8KnmCQN6jIxvcfv9I6pv77y8=;
 b=L4npYbNcAsVHBbGJ//fKoV8U9viNmJxA9T2kxtQncuEIUq3Fbrb+J06rGe5dWV0duH
 iHQEPP32axfGgYn/S8WL0XLL+f2u6NLQm6TlMANSafLiPdL/IrxCRVOeZtnlTHTz4/pU
 mS4mClFOf/NbyfkVj2In5kwzkLFlTbDTG8PkJGHu8g/lFDAtYN+HoR6DulWul7rin210
 Sh80Tkff54qReGnmtEojvZiRmmrcEWvnlUiuPzUK1hRcs02ryYPE7675+6u6KY/fJOA+
 aSTLaBjop6+4VC4YnkqCwDA3SIKQ0GHPNkMPHdZaAnzJTEeZ/n1v2G0YvZje2nVAUz25
 EVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ol8wJ0Ar+0WXAazQ6Zc8KnmCQN6jIxvcfv9I6pv77y8=;
 b=dSp0ivk4SSXdO9wjssNeqXwJvgACv7g6bvEUWGwKQx2KIs1SEwpPpP8qLoWzGtGiiH
 9XLivgLl/D729RqNh8vA5bTUWXi7mm91PDS9rnng0k/+HKvx9V1IhyGfvUZ1UQ7l8C48
 FZzNsU84whTohq7RcRul70JeHhJgwIE7V0uvJZz5316ZiHX21obnL3AvpB5mVZzGU1uy
 WVeVSHiag/JlbMxH1gd9OdMrQqxYaPToGei1jHQelWossN4vM7/q+/EHi4RVRrIKkqE3
 Gt7oMkWy6qBJ5LiBdVzGYvwXvHxB3ExREnPDsqVn8rj3rUoZQsZEAJViVYLEhmBWLryO
 LN/A==
X-Gm-Message-State: AOAM533md3uilQuS+dynHMbwAINvjom4p4b4gaovm0G2xDyqxlCZNh7O
 x4OjHVsg37VeBdS7qrighiI=
X-Google-Smtp-Source: ABdhPJyaYtF9klst9couhUW+AQHaqb1DmTJjkPF8/AOeqytSQkgQljNa7GWfBHj8pRRA1Xcfp+N4DQ==
X-Received: by 2002:a2e:920a:: with SMTP id k10mr105816ljg.413.1592414048294; 
 Wed, 17 Jun 2020 10:14:08 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id i23sm82452ljh.56.2020.06.17.10.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 10:14:07 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
 <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
 <20200617141015.GB3536291@ulmo>
 <cef8e371-03a8-455e-561d-fca9d0b88309@gmail.com>
 <20200617163724.GA3547875@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fcb11625-b17c-752b-de12-29f916ade7cb@gmail.com>
Date: Wed, 17 Jun 2020 20:14:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200617163724.GA3547875@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTcuMDYuMjAyMCAxOTozNywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBXZWQsIEp1
biAxNywgMjAyMCBhdCAwNToyMDoxNFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDE3LjA2LjIwMjAgMTc6MTAsIFRoaWVycnkgUmVkaW5nINC/0LjRiNC10YI6Cj4+PiBPbiBUdWUs
IEp1biAxNiwgMjAyMCBhdCAwOTozOToxOVBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+Pj4gMTYuMDYuMjAyMCAyMToxNCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4+Pj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPj4+Pj4KPj4+Pj4gQXMg
b2YgY29tbWl0IDRkYzU1NTI1YjA5NSAoImRybTogcGxhbmU6IFZlcmlmeSB0aGF0IG5vIG9yIGFs
bCBwbGFuZXMKPj4+Pj4gaGF2ZSBhIHpwb3MgcHJvcGVydHkiKSBhIHdhcm5pbmcgaXMgZW1pdHRl
ZCBpZiB0aGVyZSdzIGEgbWl4IG9mIHBsYW5lcwo+Pj4+PiB3aXRoIGFuZCB3aXRob3V0IGEgenBv
cyBwcm9wZXJ0eS4KPj4+Pj4KPj4+Pj4gT24gVGVncmEsIGN1cnNvciBwbGFuZXMgYXJlIGFsd2F5
cyBjb21wb3NpdGVkIG9uIHRvcCBvZiBhbGwgb3RoZXIKPj4+Pj4gcGxhbmVzLCB3aGljaCBpcyB3
aHkgdGhleSBuZXZlciBoYWQgYSB6cG9zIHByb3BlcnR5IGF0dGFjaGVkIHRvIHRoZW0uCj4+Pj4+
IEhvd2V2ZXIsIHNpbmNlIHRoZSBjb21wb3NpdGlvbiBvcmRlciBpcyBmaXhlZCwgdGhpcyBpcyB0
cml2aWFsIHRvCj4+Pj4+IHJlbWVkeSBieSBzaW1wbHkgYXR0YWNoaW5nIGFuIGltbXV0YWJsZSB6
cG9zIHByb3BlcnR5IHRvIHRoZW0uCj4+Pj4+Cj4+Pj4+IHYzOiBkbyBub3QgaGFyZGNvZGUgenBv
cyBmb3Igb3ZlcmxheSBwbGFuZXMgdXNlZCBhcyBjdXJzb3IgKERtaXRyeSkKPj4+Pj4gdjI6IGhh
cmRjb2RlIGN1cnNvciBwbGFuZSB6cG9zIHRvIDI1NSBpbnN0ZWFkIG9mIDAgKFZpbGxlKQo+Pj4+
Pgo+Pj4+PiBSZXBvcnRlZC1ieTogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNv
bT4KPj4+Pj4gLS0tCj4+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyB8IDEgKwo+Pj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5j
Cj4+Pj4+IGluZGV4IDgzZjMxYzZlODkxYy4uMDRkNjg0OGQxOWZjIDEwMDY0NAo+Pj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZGMuYwo+Pj4+PiBAQCAtOTU3LDYgKzk1Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX3Bs
YW5lICp0ZWdyYV9kY19jdXJzb3JfcGxhbmVfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0s
Cj4+Pj4+ICAJfQo+Pj4+PiAgCj4+Pj4+ICAJZHJtX3BsYW5lX2hlbHBlcl9hZGQoJnBsYW5lLT5i
YXNlLCAmdGVncmFfY3Vyc29yX3BsYW5lX2hlbHBlcl9mdW5jcyk7Cj4+Pj4+ICsJZHJtX3BsYW5l
X2NyZWF0ZV96cG9zX2ltbXV0YWJsZV9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIDI1NSk7Cj4+Pj4+
ICAKPj4+Pj4gIAlyZXR1cm4gJnBsYW5lLT5iYXNlOwo+Pj4+PiAgfQo+Pj4+Pgo+Pj4+Cj4+Pj4g
TG9va3MgbmljZSwgdGhhbmtzISBTaW5jZSB5b3UgZHJvcHBlZCBhbGwgb3RoZXIgenBvcyBjaGFu
Z2VzIGZvciBvdGhlcgo+Pj4+IHBsYW5lcyBhbmQgZ2l2ZW4gdGhhdCB0aGUgb3RoZXIgcGxhbmVz
IGhhdmUgMjU1IGZvciB0aGUgbWF4IHpwb3MsIHdoYXQKPj4+PiBhYm91dCB0byBzZXQgdGhlIGN1
cnNvcidzIHpwb3MgdG8gMjU2Pwo+Pj4KPj4+IEknZCBwcmVmZXIgdG8gaGF2ZSBhbGwgb2YgdGhl
IHBsYW5lcycgenBvcyB3aXRoaW4gdGhlIHNhbWUgcmFuZ2UuIEJ5Cj4+PiBkZWZhdWx0IHRoZSBv
dGhlciBwbGFuZXMgd2lsbCBiZSBvbiB0aGUgdmVyeSBib3R0b20gZW5kIG9mIHRoYXQgcmFuZ2UK
Pj4+IGFuZCB0aGUgYXRvbWljIGNvcmUgd2lsbCBub3JtYWxpemUgdGhlIHpwb3MgZm9yIGFsbCBw
bGFuZXMgYW55d2F5LCBzbwo+Pj4gdGhlIGN1cnNvciBwbGFuZSB3aWxsIGVuZCB1cCB3aXRoIGEg
dmVyeSBzbWFsbCBub3JtYWxpemVkIHpwb3MgaW4gdGhlCj4+PiBlbmQuCj4+Pgo+Pj4gVGhlIHpw
b3MgZG9jdW1lbnRhdGlvbiBhbHJlYWR5IG1lbnRpb25zIHRoYXQgdGhlIGJlaGF2aW91ciBpcyB1
bmRlZmluZWQKPj4+IGlmIHR3byBwbGFuZXMgaGF2ZSB0aGUgc2FtZSB6cG9zIHZhbHVlLCBzbyBJ
IHRoaW5rIHVzZXJzcGFjZSBpcyBnb2luZyB0bwo+Pj4ga25vdyBob3cgdG8gc2V0IHRoZXNlIGFu
eXdheS4KPj4+Cj4+PiBJdCBtaWdodCBiZSB3b3J0aCB0byBkbyBhIGZvbGxvdy11cCBwYXRjaCB0
aGF0IGlzIHNtYXJ0ZXIgYWJvdXQgc2V0dGluZwo+Pj4gdGhlIHJhbmdlIG9mIHZhbGlkIHZhbHVl
cy4gMC0yNTUgaXMgdHJ1ZSBvbiBsYXRlciBjaGlwcyB3aGVyZSB3ZQo+Pj4gYWN0dWFsbHkgaGF2
ZSBhIHByb3BlciAibGF5ZXIgZGVwdGgiIHJlZ2lzdGVyIGZpZWxkIGFuZCBJIHdhbnRlZCB0aGlz
IHRvCj4+PiBiZSB1bmlmb3JtIGFjcm9zcyBhbGwgZ2VuZXJhdGlvbnMuIE90aGVyIGRyaXZlcnMg
c2VlbSB0byBzZXQgdGhlIHVwcGVyCj4+PiBsaW1pdCBvbiB0aGUgenBvcyByYW5nZSB0byBiZSBl
cXVhbCB0byB0aGUgbnVtYmVyIG9mIHBsYW5lcyBhdmFpbGFibGUsCj4+PiBzbyB0aGF0IHRoZXJl
IGFyZW4ndCBwb3RlbnRpYWxseSBiaWcgZ2FwcyBpbiB0aGUgbnVtYmVyaW5nLiBUaGF0IHNhaWQs
Cj4+PiBzaW5jZSB0aGUgY29yZSBhbHJlYWR5IG5vcm1hbGl6ZXMgdGhlIHpwb3MgZm9yIHVzLCBJ
IGRvbid0IHNlZSBhIGJpZwo+Pj4gYmVuZWZpdCBpbiBleHBsaWNpdGx5IGNsaXBwaW5nIHRoZSBy
YW5nZS4KPj4KPj4gQnV0IHRoZSBjdXJzb3IgcGxhbmUgZG9lc24ndCB1c2UgdGhlICJsYXllciBk
ZXB0aCIgcmVnaXN0ZXIsIGRvZXNuJ3QgaXQ/Cj4+IFNvIHRoZSB6cG9zIG92ZXIgMjU1IHNob3Vs
ZG4ndCBtYXR0ZXIgaW4gdGhpcyBjYXNlLgo+Pgo+PiBJIGtub3cgdGhhdCBEUk0gc2hvdWxkIG5v
cm1hbGl6ZXMgdGhlIGdpdmVuIHpwb3MsIGJ1dCBzdGlsbCBpdCBtYWtlcyBtZQo+PiBhIGJpdCB1
bmNvbWZvcnRhYmxlIGtub3dpbmcgdGhhdCB0aGVyZSBhcmUgdGhlIHJhbmdlcyBvdmVybGFwIHZp
c2libGUgdG8KPj4gdXNlcnNwYWNlIDopCj4gCj4gVXNlcnNwYWNlIGhhcyB0byBiZSBhYmxlIHRv
IGRlYWwgd2l0aCB0aGlzIGFueXdheSBiZWNhdXNlIGl0IGNhbid0IG1ha2UKPiBhbnkgYXNzdW1w
dGlvbnMgYWJvdXQgd2hhdCBoYXJkd2FyZSBzdXBwb3J0cyB1bmRlcm5lYXRoLiBBIGN1cnNvciBv
biBhCj4gZGlmZmVyZW50IHBsYXRmb3JtIG1heSB2ZXJ5IHdlbGwgYmUgc3RhY2thYmxlIGFueXdo
ZXJlIGluIHRoZSBsYXlvdXQgc28KPiBpdCBtdXN0IGVuc3VyZSB0aGF0IHRoZSBjdXJzb3IgYWx3
YXlzIGhhcyB0aGUgaGlnaGVzdCB6cG9zIChwcm92aWRlZAo+IHRoYXQgdGhhdCdzIHdoYXQgaXQg
d2FudHMpLiBJbW11dGFibGUgMjU1IGJhc2ljYWxseSBqdXN0IHNheXMgdGhhdCB0aGUKPiBjdXJz
b3IgaXMgYWx3YXlzIGdvaW5nIHRvIGJlIGF0IHRoZSB0b3AuIC9JZi8gdXNlcnNwYWNlIHRoZW4g
ZGVjaWRlcyB0bwo+IHNldCBzb21lIG90aGVyIHBsYW5lJ3MgenBvcyA9IDI1NSwgdGhlbiB3ZSdy
ZSBpbiB0aGUgInVuZGVmaW5lZCIKPiBiZWhhdmlvdXIgY2FzZSB0aGF0IHRoZSBkb2N1bWVudGF0
aW9uIG1lbnRpb25zLCBpbiB3aGljaCBjYXNlIHRoZQo+IGJlaGF2aW91ciBvbiBUZWdyYSB3b3Vs
ZCBzdGlsbCBiZSBzYW5lIGluIHNob3dpbmcgdGhlIGN1cnNvciBvbiB0b3AuCj4gCj4gU28gSSBk
b24ndCB0aGluayB0aGVyZSdzIHJlYWxseSBhbiBpc3N1ZSB3aXRoIHRoZSBvdmVybGFwLgoKSXQg
c2hvdWxkIHdvcmsgb2theSwgYnV0IGlmIGN1cnNvciBoYWQgenBvcyBzZXQgdG8gMjU2IHRoZW4g
aXQgd291bGQKbG93ZXIgdGhlIGNoYW5jZSBmb3IgdXNlcnNwYWNlIHRvIGNyZWF0ZSB0aGUgdW5k
ZWZpbmVkIGJlaGF2aW9yIHNpdHVhdGlvbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
