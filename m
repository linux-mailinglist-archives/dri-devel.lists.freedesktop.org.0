Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C42519A870
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 11:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8737D6E06B;
	Wed,  1 Apr 2020 09:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9046E06B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 09:17:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 65so29668166wrl.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l5IajePeU/dx5D7NGN8U0Zv8QpLcwY/S5m8HcnkPGIg=;
 b=ApsuXBD6/kuC3JYNzkTLSEp+Z18Ij0DDJcwP+l8mIk9wNBlGgUKR6FwkpXnMls6HkP
 dIfZ2w7bmMOUZZm9npf4IliTmYn3GCz3fDS3/NoVyiqPT5e8U0SSlN2rRq+l1QlBfizb
 WF3GqY911agx7Wh37LbHVRaFWqEgcPeyx/woiezDY1ZmXr+VohX9melKHdI7NERoIF20
 f6GDtQDP7HL3n7REcIUWht87VHsE7d8YnB3FHXd+G1kXgSpe+N1kAU6fRLXP2Yn8+RW7
 zUBQw7XKWBDwLyK7uersARjgyBHXKkh4yL4oJXPpUcDPG76cyHBs3pdECAoDvyqlwBWA
 aeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=l5IajePeU/dx5D7NGN8U0Zv8QpLcwY/S5m8HcnkPGIg=;
 b=NkpRREjIdKD4dllschJrlL7vVFCkognG24hZjy4E9mnwhzpakN2E2nAo/AikkINsx0
 5AVRWybgqmm1Ic6upe0mwgI+7JedO4W20116m6/y/AZ+GKvOW0Q50bvAVx5kEslzkHGK
 ZJSBBFJEyxMiuMN4w5x5pHlQIRwwfkJinoEnukEX1lVbfd2WFQD/ycY/JTGD3oqhq2Fl
 jJHZiiIqMmW81E/DLRJAEJPpq8I/xz5pWbnhkXValMcPbQ5ALB8OL3ysCGxFTcoDJ6x+
 fxcCxQq1d0BEbQHfARPBx1KL/Dip1WdaxmsBgc16rnzGCGTsbTOlpBYOzWWjB4USGqdu
 ajZg==
X-Gm-Message-State: ANhLgQ1Lp1ExlBEIXnheZN3HNPFzr4URLsepJej/SJOtfSi15nGFWXUX
 YwX1l709pDj9bhczpe/nh3M=
X-Google-Smtp-Source: ADFU+vt+kiDjDaLZobQKEWOpey2tz+zx5HA8nB1Z6xjmJ+blmXXJQ+rN2KysXfnURxHPSufkm4lFSQ==
X-Received: by 2002:adf:a319:: with SMTP id c25mr25008497wrb.197.1585732650689; 
 Wed, 01 Apr 2020 02:17:30 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h81sm1985224wme.42.2020.04.01.02.17.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Apr 2020 02:17:30 -0700 (PDT)
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
To: Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>, 
 christian.koenig@amd.com
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
 <20200331091618.GM2363188@phenom.ffwll.local>
 <158564641293.18289.1145145659054294433@build.alporthouse.com>
 <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
 <158566075049.18289.17918401274396829066@build.alporthouse.com>
 <547dca13-bd62-9319-ee44-6894ee1b60af@gmail.com>
 <158573119432.5852.5430250256131238311@build.alporthouse.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <95c061fb-6189-855d-bde9-57d4c2d99aff@gmail.com>
Date: Wed, 1 Apr 2020 11:17:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <158573119432.5852.5430250256131238311@build.alporthouse.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 Andi Shyti <andi.shyti@intel.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMDQuMjAgdW0gMTA6NTMgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBDaHJp
c3RpYW4gS8O2bmlnICgyMDIwLTA0LTAxIDA4OjI5OjM0KQo+PiBBbSAzMS4wMy4yMCB1bSAxNTox
OSBzY2hyaWViIENocmlzIFdpbHNvbjoKPj4+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAyMC0w
My0zMSAxMTozODo1MCkKPj4+PiBPbiBUdWUsIE1hciAzMSwgMjAyMCBhdCAxMToyMCBBTSBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6Cj4+Pj4+IFF1b3Rpbmcg
RGFuaWVsIFZldHRlciAoMjAyMC0wMy0zMSAxMDoxNjoxOCkKPj4+Pj4+IE9uIFR1ZSwgTWFyIDMx
LCAyMDIwIGF0IDEwOjU5OjQ1QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+
PiBbU05JUF0KPj4+IFdlIGFsbG93IHVzZXJzcGFjZSB0byBwb2lzb24gdGhlIGRybV9tbSBhdCBy
b3VnaGx5IDhLIGludGVydmFscywgYQo+Pj4gc2VhcmNoIHNwYWNlIG9mIDM1YiB3aXRoIHR5cGlj
YWxseSBPKE5eMikgYmVoYXZpb3VyIGFuZCBlYWNoIG5vZGUKPj4+IHRyYXZlcnNhbCAocmJfbmV4
dC9yYl9wcmV2KSB3aWxsIGl0c2VsZiBiZSBjb3N0bHkuIEV2ZW4gb3VyIHNpbXBsZSB0ZXN0cwo+
Pj4gY2FuIGdlbmVyYXRlIGEgc2VhcmNoIG9mIHNldmVyYWwgbWludXRlcyBiZWZvcmUgb3VyIHBh
dGllbmNlIHJ1bnMgb3V0Lm8KPj4+IEFueSBkcm1fbW0gdGhhdCBhbGxvd3MgZm9yIHVzZXJzcGFj
ZSB0byBjb250cm9sIGFsaWdubWVudCBjYW4gYmUKPj4+IGFyYml0cmFyaWx5IGZyYWdtZW50ZWQs
IGhlbmNlIGEgcmFpc2VkIGV5ZWJyb3cgdGhhdCB0aGlzIHNlYXJjaCB3b3VsZCBiZQo+Pj4gYWxs
b3dlZCBpbiBhdG9taWMgY29udGV4dC4KPj4gV293LCB0aGF0IGlzIGluZGVlZCBxdWl0ZSBhIGxv
dC4KPj4KPj4gV2hhdCBpcyB0aGUgY3JpdGVyaWEgdXNlIGZvciBvcmRlcmluZyB0aGUgdHJlZT8g
SnVzdCB0aGUgc2l6ZSBvciBpcyB0aGF0Cj4+IHNpemUrYWxpZ25tZW50Pwo+IFRoZSB0cmVlIGlz
IGp1c3Qgc2l6ZS4gQWxpZ25tZW50IGlzIGEgbGl0dGxlIHVzZWQgcGFyYW1ldGVyLCBidXQgdGhl
cmUncwo+IGEgcmVxdWlyZW1lbnQgZm9yIHVzZXJzcGFjZSB0byBiZSBhYmxlIHRvIGNvbnRyb2wg
aXQgLS0gYWx0aG91Z2ggaXQgaXMKPiBzdHJpY3RseSB0aGUgb2xkZXIgaW50ZXJmYWNlLCBpdCBp
cyBzdGlsbCBvcGVuIHRvIGFidXNlLgo+Cj4gQ29udmVydGluZyB0aGUgdHJlZSB0byBbc2l6ZSwg
ZmZzKGFkZHIpXSB3b3VsZCBoZWxwIGZvciBtYW55LCBidXQgb24gdG9wCj4gb2YgdGhhdCB3ZSBo
YXZlIHpvbmVzIGluIHRoZSBkcm1fbW0sIHNvIHNlYXJjaC1pbi1yYW5nZSBjYW4gYmUgYWJ1c2Vk
IG9uCj4gdG9wIG9mIHNlYXJjaC1mb3ItYWxpZ25tZW50LgoKVGhlIGRpZmZlcmVuY2UgaXMgdGhh
dCBzZWFyY2ggaW4gcmFuZ2UgaXMgbm90IGNvbnRyb2xsYWJsZSBieSB1c2Vyc3BhY2UsIApidXQg
YXQgbGVhc3QgZm9yIGFtZGdwdSB0aGUgYWxpZ25tZW50IGlzIHZlcnkgd2VsbCBjb250cm9sbGFi
bGUuCgo+PiBOZXZlciBsb29rZWQgaW50byB0aGlzLCBidXQgbWF5YmUgd2UgaGF2ZSBhIGxvdyBo
YW5naW5nIGZydWl0IGZvciBhbgo+PiBpbXByb3ZlbWVudCBoZXJlPwo+IEEgYml0IC0tIGFsaWdu
bWVudCBpcyBzbyByYXJlbHkgdXNlZCBpbiBwcmFjdGljZSwgb3B0aW1pc2luZyBpdCB3YXMgbm90
Cj4gYSBjb25jZXJuLCBqdXN0IHNvbWVvbmUgZWxzZSBoYXMgbm93IG5vdGljZWQgdGhlIHBvdGVu
dGlhbCBmb3IgYWJ1c2UuCgpXZWxsIHdlIGRvIHVzZSBhbGlnbm1lbnQgcmF0aGVyIHdpZGVseS4g
SUlSQyB3ZSBjYW4gaGF2ZSBldmVyeXRoaW5nIApiZXR3ZWVuIDRLIGFuZCAyTUIgYmFzZWQgb24g
dGhlIHRpbGxpbmcgZmxhZ3MsIG1lbW9yeSBjaGFubmVsIGNvbmZpZyBldGMgCmV0Yy4uLgoKPiBU
aGV5IHJhbiBhIHRlc3QsIGdldCBib3JlZCBhbmQgY29tcGxhaW5lZCB0aGF0IGl0IGRpZG4ndCBy
ZXNwb25kIHRvIF5DCj4gZm9yIGEgbG9uZyBwZXJpb2Qgb2YgdGltZSBhbmQgZnJvbSB0aGF0IGRl
cml2ZSBhIHByb29mLW9mLWNvbmNlcHQgdGVzdCB0bwo+IHNob3cgaG93IGl0IGNhbiBiZSB1c2Vk
IGJ5IG9uZSBjbGllbnQgdG8gdXBzZXQgYW5vdGhlciA6fAoKQW5kIGFzIGZhciBhcyBJIGNhbiBz
ZWUgdGhhdCBpcyBhIHJlYWxseSB2YWxpZCBwcm9ibGVtIHdlIG5lZWQgdG8gZml4LiAKR2l2ZSBt
ZSBhIHNlY29uZCB0byB3cml0ZSBhIHRlc3QgY2FzZSBmb3IgdGhpcy4KClRoYW5rcyBmb3IgcG9p
bnRpbmcgdGhhdCBvdXQsCkNocmlzdGlhbi4KCj4gICAKPj4gSSdtIG5vdCAxMDAlIHN1cmUsIGJ1
dCBtb3ZpbmcgYXdheSBmcm9tIGF0b21pYyBjb250ZXh0IHdvdWxkbid0IGJlIHRoYXQKPj4gZWFz
eS4KPiBGYWlyIGVub3VnaC4gSSB3b3VsZCBub3Qgd29ycnkgdW5sZXNzIHRoZSBsYXlvdXQgaXMg
Y29udHJvbGxhYmxlIGJ5IHRoZQo+IHVzZXIgLS0gYnV0IHdlIHByb2JhYmx5IHdhbnQgc29tZSBv
dGhlciBtZWFucyBvZiBib3VuZGluZyB0aGUgc2VhcmNoLgo+IC1DaHJpcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
