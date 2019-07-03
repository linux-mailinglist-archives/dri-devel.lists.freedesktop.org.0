Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E81F5E2CF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 13:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D386E11A;
	Wed,  3 Jul 2019 11:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C536E11A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 11:32:29 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i34so200586qta.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 04:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Q71nykmZnftwjkHSkA+Jk39GDfEUnad16+NV/JTo7Y=;
 b=k7NrnhJo9PUMYI55FjggEAQZbQYzeegFR+HBsysJN8+6hf0JYcdDs8va86V2z7s6ow
 7429exwXkgSiqKoxcNRgLZx/1nrFxy9McainPGzwn5WOzke55kzqyZdq5Hv8/Do8AKCW
 NyIqRHU7XfulwgBNgemCx6zAGPYNiY0wGK6kcjUXYhqQ7+llhKIA6pZK2M9JBUt7y2BE
 mI2OCCpiV2kSd3GR6/od0bgrR1VH0zDoErajvh0KrWUrEpBr63nOJ9YdurZL2FE4vmGQ
 pqx95dlFg/1BsaqZENQGaTrHvFafypG/LkYK6rWo8pMvQ8stN5Fu0dh23Gwas2KraPPF
 Ph9g==
X-Gm-Message-State: APjAAAUHVG96LyuI1GjY8O1h51XBawVF6RaKwCWxJtsfQHI1zSrEX+jt
 1qA/coLIKfeubN4mRSvZBQnslw==
X-Google-Smtp-Source: APXvYqyzud3g07TciC4VF5eJmUl92j4XscGm6M0TvSKIGlHXYnM3cBpfQ1p+ZmlBIf/e4UAadZGy9w==
X-Received: by 2002:ac8:2774:: with SMTP id h49mr28980055qth.97.1562153548407; 
 Wed, 03 Jul 2019 04:32:28 -0700 (PDT)
Received: from [192.168.1.157] (pool-96-235-39-235.pitbpa.fios.verizon.net.
 [96.235.39.235])
 by smtp.gmail.com with ESMTPSA id f25sm977214qta.81.2019.07.03.04.32.27
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 04:32:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] staging: android: ion: Remove file ion_carveout_heap.c
To: Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 John Stultz <john.stultz@linaro.org>
References: <20190703081842.22872-1-nishkadg.linux@gmail.com>
 <20190703083745.GB8996@kroah.com>
 <CAKMK7uFAaw3sL_A6gGOeot80fvukjZqprLptLER=riA1_p4zWw@mail.gmail.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <759555d8-98bf-44d3-4fa3-3d927f9a33db@redhat.com>
Date: Wed, 3 Jul 2019 07:32:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFAaw3sL_A6gGOeot80fvukjZqprLptLER=riA1_p4zWw@mail.gmail.com>
Content-Language: en-US
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
Cc: driverdevel <devel@driverdev.osuosl.org>, Todd Kjos <tkjos@android.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, joel@joelfernandes.org,
 maco@android.com, christian@brauner.io
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8zLzE5IDU6NTAgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBKdWwgMywg
MjAxOSBhdCAxMDozNyBBTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3Jv
dGU6Cj4+Cj4+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDAxOjQ4OjQxUE0gKzA1MzAsIE5pc2hr
YSBEYXNndXB0YSB3cm90ZToKPj4+IFJlbW92ZSBmaWxlIGlvbl9jYXJ2ZW91dF9oZWFwLmMgYXMg
aXRzIGZ1bmN0aW9ucyBhbmQgZGVmaW5pdGlvbnMgYXJlIG5vdAo+Pj4gdXNlZCBhbnl3aGVyZS4K
Pj4+IElzc3VlIGZvdW5kIHdpdGggQ29jY2luZWxsZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBO
aXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gICBk
cml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vS2NvbmZpZyAgICAgICAgICAgfCAgIDkgLS0KPj4+
ICAgZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL01ha2VmaWxlICAgICAgICAgIHwgICAxIC0K
Pj4+ICAgLi4uL3N0YWdpbmcvYW5kcm9pZC9pb24vaW9uX2NhcnZlb3V0X2hlYXAuYyAgIHwgMTMz
IC0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+PiBJIGtlZXAgdHJ5aW5nIHRvIGRvIHRoaXMsIGJ1dCBv
dGhlcnMgcG9pbnQgb3V0IHRoYXQgdGhlIGlvbiBjb2RlIGlzCj4+ICJnb2luZyB0byBiZSBmaXhl
ZCB1cCBzb29uIiBhbmQgdGhhdCBwZW9wbGUgcmVseSBvbiB0aGlzIGludGVyZmFjZSBub3cuCj4+
IFdlbGwsICJjb2RlIG91dHNpZGUgb2YgdGhlIGtlcm5lbCB0cmVlIiByZWxpZXMgb24gdGhpcywg
d2hpY2ggaXMgbm90IG9rLAo+PiBidXQgdGhlICJzb29uIiBwZW9wbGUga2VlcCBpbnNpc3Rpbmcg
b24gaXQuLi4KPj4KPj4gT2RkcyBhcmUgSSBzaG91bGQganVzdCBkZWxldGUgYWxsIG9mIElPTiwg
YXMgdGhlcmUgaGFzbid0IGJlZW4gYW55Cj4+IGZvcndhcmQgcHJvZ3Jlc3Mgb24gaXQgaW4gYSBs
b25nIHRpbWUuCj4+Cj4+IEhvcGVmdWxseSB0aGF0IHdha2VzIHNvbWUgcGVvcGxlIHVwLi4uCj4g
Cj4gSm9obiBTdHVsdHogaGFzIGRvbmUgYSBzdGVhZHkgc3RyZWFtIG9uIGlvbiBkZXN0YWdpbmcg
cGF0Y2ggc2VyaWVzCj4gcGFzdCBmZXcgbW9udGhzLCB1bmQgdGhlIGhlYWRpbmcgb2YgIkRNQS1C
VUYgSGVhcHMiLCB0YXJnZXRpbmcKPiBkcml2ZXJzL2RtYS1idWYuIEknbSBub3QgZm9sbG93aW5n
IHRoZSBkZXRhaWxzLCBhbmQgaXQgc2VlbXMgYSBiaXQgYQo+IGNyYXdsLCBidXQgdGhlcmUncyBk
ZWZpbml0ZWx5IHdvcmsgZ29pbmcgb24gLi4uIEp1c3QgcHJvYmFibHkgbm90Cj4gaW4tcGxhY2Ug
aW4gc3RhZ2luZyBJIHRoaW5rLgo+IC1EYW5pZWwKPiAKCgpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lLzIyMzcwNS5odG1sCgpJdCBpcyBt
YWtpbmcgc2xvdyBhbmQgc3RlYWR5IHByb2dyZXNzLiBQYXJ0IG9mIHRoaXMgaXMgdHJ5aW5nIHRv
Cm1ha2Ugc3VyZSB3ZSBhY3R1YWxseSBnZXQgdGhpcyByaWdodCBiZWZvcmUgbW92aW5nIGFueXRo
aW5nCm91dCBvZiBzdGFnaW5nLgoKVGhhdCBzYWlkLCBJIHRoaW5rIHdlJ3JlIGF0IHRoZSBwb2lu
dCB3aGVyZSBub2JvZHkgd2FudHMgdGhlCmNhcnZlb3V0IGFuZCBjaHVuayBoZWFwcyBzbyBJJ2Qg
YWN0dWFsbHkgYmUgb2theSB3aXRoIHJlbW92aW5nCnRob3NlIGZpbGVzLiBKdXN0IHRvIGJlIGV4
cGxpY2l0OgoKQWNrZWQtYnk6IExhdXJhIEFiYm90dCA8bGFiYm90dEByZWRoYXQuY29tPgoKVGhh
bmtzLApMYXVyYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
