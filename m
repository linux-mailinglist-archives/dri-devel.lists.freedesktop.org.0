Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8EB20CA65
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 22:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D596E3B2;
	Sun, 28 Jun 2020 20:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FA16E195
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 23:27:55 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i3so14049616ljg.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 16:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EnXw4bugMF7c8ntOpSKESccHjrLLw0Pd5rUigUujDqI=;
 b=VCniF0Hzjz6JyX4nYw0h6UPyJfbrQWSnrlNaCrHsUBqw5QAd/QTTZBeMQxscgIaDzn
 S/vWixqU92/Qte51MrGZqHQfoUNHkZPRf8bnVqSjZxCkO0f+q4O1NzdIZpblvTYhAKWU
 KM6GwnNdsENy/Sx+Z64DxepIpKaS5pj+Tw7FMTzvaBn/UtHZpC/hVtC4Abrv2dxrndQW
 KNO9G9GcE4UrOO+21RZjmiuFjKtMGRAiTQAjrMWaNLH+n/Cz9rNPoG//riYZQ33tM2TG
 oBySDPBHItcdJ13d9spS1gETtFn05sKZACmiYvJHNrLuIPWpIgWbbCAyVvUFFMpohHZC
 oEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EnXw4bugMF7c8ntOpSKESccHjrLLw0Pd5rUigUujDqI=;
 b=qkjO2dgZoRRsz8S9KZjavKQLhE78mlWPSk6+RKpJZjZHjU6Zu37SAmNzycjpwVJ2Xx
 IuxPIXZjV9z1Rw2cyxx3JSM7vQNR+hWNWf20swsZ5XdKkmr/Q8lQocME9G5OL87NGxAU
 TuF2+GLjzkQSGX5xN4qJYzDZlO6XI7WJ5ORj0/B/HvPp88LC+7LCj4Ajap0jVB7c+P1F
 tggeVsq6ZkTuhsLY/PvkCZUYtGISnsy3xUyhmnZV0VZ7CId21R7lRjooux/Wiv723mgO
 PoPoqI0PhjNBh8tw03PFCqkVC6q2vn+wFlDOh1fihKJ3S8PjKne8NPO4kYiu4rESufjR
 tROQ==
X-Gm-Message-State: AOAM531HiNn+kGehqrFBixQtanL6vEDMUXVeV5t3JAkvr7p7jCdnQZlf
 uVNf5kAMwD2JlgpuHt7O1EE=
X-Google-Smtp-Source: ABdhPJx+klT8Fl5w2gwaFvqvhDrsTl+BjgeuD9WY+fCibnM04chA6gXvARpm/t+PVHgt1KdhE7qsRg==
X-Received: by 2002:a2e:b889:: with SMTP id r9mr4868742ljp.92.1593300474199;
 Sat, 27 Jun 2020 16:27:54 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id b6sm7733197lfe.28.2020.06.27.16.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jun 2020 16:27:53 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
Date: Sun, 28 Jun 2020 02:27:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 28 Jun 2020 20:36:36 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gCj4gIyMjIElP
Q1RMIEhPU1QxWF9BTExPQ0FURV9TWU5DUE9JTlQgKG9uIC9kZXYvaG9zdDF4KQo+IAo+IEFsbG9j
YXRlcyBhIGZyZWUgc3luY3BvaW50LCByZXR1cm5pbmcgYSBmaWxlIGRlc2NyaXB0b3IgcmVwcmVz
ZW50aW5nIGl0Lgo+IE9ubHkgdGhlIG93bmVyIG9mIHRoZSBmaWxlIGRlc2NyaXB0b3IgaXMgYWxs
b3dlZCB0byBtdXRhdGUgdGhlIHZhbHVlIG9mCj4gdGhlIHN5bmNwb2ludC4KPiAKPiBgYGAKPiBz
dHJ1Y3QgaG9zdDF4X2N0cmxfYWxsb2NhdGVfc3luY3BvaW50IHsKPiDCoMKgwqDCoMKgwqAgLyoq
Cj4gwqDCoMKgwqDCoMKgwqAgKiBAZmQ6Cj4gwqDCoMKgwqDCoMKgwqAgKgo+IMKgwqDCoMKgwqDC
oMKgICogW291dF0gTmV3IGZpbGUgZGVzY3JpcHRvciByZXByZXNlbnRpbmcgdGhlIGFsbG9jYXRl
ZCBzeW5jcG9pbnQuCj4gwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqAgX19zMzIgZmQ7
Cj4gCj4gwqDCoMKgwqDCoMKgIF9fdTMyIHJlc2VydmVkWzNdOwo+IH07CgpXZSBzaG91bGQgbmVl
ZCBhdCBsZWFzdCB0aGVzZSBiYXNpYyB0aGluZ3MgZnJvbSB0aGUgc3luYyBwb2ludHMgQVBJOgoK
LSBFeGVjdXRpb24gY29udGV4dCBzaG91bGRuJ3QgYmUgYWJsZSB0byB0YW1wZXIgc3luYyBwb2lu
dHMgb2YgdGhlIG90aGVyCmNvbnRleHRzLgoKLSBTeW5jIHBvaW50IGNvdWxkIGJlIHNoYXJlZCB3
aXRoIG90aGVyIGNvbnRleHRzIGZvciBleHBsaWNpdCBmZW5jaW5nLgoKLSBTeW5jIHBvaW50cyBz
aG91bGQgd29yayByZWxpYWJseS4KClNvbWUgcHJvYmxlbXMgb2YgdGhlIGN1cnJlbnQgSG9zdDF4
IGRyaXZlciwgbGlrZSB3aGVyZSBpdCBmYWxscyBvdmVyIGlmCnN5bmMgcG9pbnQgdmFsdWUgaXMg
b3V0LW9mLXN5bmMgKyBhbGwgdGhlIGhhbmctam9iIHJlY292ZXJ5IGxhYm9yIGNvdWxkCmJlIGVh
c2lseSByZWR1Y2VkIGlmIHN5bmMgcG9pbnQgaGVhbHRoIGlzIHByb3RlY3RlZCBieSBleHRyYSBV
QVBJCmNvbnN0cmFpbnRzLgoKU28gSSB0aGluayB3ZSBtYXkgd2FudCB0aGUgZm9sbG93aW5nOgoK
MS4gV2Ugc3RpbGwgc2hvdWxkIG5lZWQgdG8gYXNzaWduIHN5bmMgcG9pbnQgSUQgdG8gYSBEUk0t
Y2hhbm5lbCdzCmNvbnRleHQuIFRoaXMgc3luYyBwb2ludCBJRCB3aWxsIGJlIHVzZWQgZm9yIGEg
Y29tbWFuZHMgc3RyZWFtIGZvcm1pbmcsCmxpa2UgaXQgaXMgZG9uZSBieSB0aGUgY3VycmVudCBz
dGFnaW5nIFVBUEkuCgpTbyB3ZSBzaG91bGQgbmVlZCB0byByZXRhaW4gdGhlIERSTV9URUdSQV9H
RVRfU1lOQ1BUIElPQ1RMLCBidXQgaW1wcm92ZSBpdC4KCjIuIEFsbG9jYXRlZCBzeW5jIHBvaW50
IG11c3QgaGF2ZSBhIGNsZWFuIGhhcmR3YXJlIHN0YXRlLgoKMy4gU3luYyBwb2ludHMgc2hvdWxk
IGJlIHByb3Blcmx5IHJlZmNvdW50ZWQuIEpvYidzIHN5bmMgcG9pbnRzCnNob3VsZG4ndCBiZSBy
ZS11c2VkIHdoaWxlIGpvYiBpcyBhbGl2ZS4KCjQuIFRoZSBqb2IncyBzeW5jIHBvaW50IGNhbid0
IGJlIHJlLXVzZWQgYWZ0ZXIgam9iJ3Mgc3VibWlzc2lvbiAoVUFQSQpjb25zdHJhaW50ISkuIFVz
ZXJzcGFjZSBtdXN0IGZyZWUgc3luYyBwb2ludCBhbmQgYWxsb2NhdGUgYSBuZXcgb25lIGZvcgp0
aGUgbmV4dCBqb2Igc3VibWlzc2lvbi4gQW5kIG5vdyB3ZToKCiAgLSBLbm93IHRoYXQgam9iJ3Mg
c3luYyBwb2ludCBpcyBhbHdheXMgaW4gYSBoZWFsdGh5IHN0YXRlIQoKICAtIFdlJ3JlIG5vdCBs
aW1pdGVkIGJ5IGEgbnVtYmVyIG9mIHBoeXNpY2FsbHkgYXZhaWxhYmxlIGhhcmR3YXJlIHN5bmMK
cG9pbnRzISBBbGxvY2F0aW9uIHNob3VsZCBibG9jayB1bnRpbCBmcmVlIHN5bmMgcG9pbnQgaXMg
YXZhaWxhYmxlLgoKICAtIFRoZSBsb2dpY2FsIG51bWJlciBvZiBqb2IncyBzeW5jIHBvaW50IGlu
Y3JlbWVudHMgbWF0Y2hlcyB0aGUgU1AKaGFyZHdhcmUgc3RhdGUhIFdoaWNoIGlzIGhhbmR5IGZv
ciBhIGpvYidzIGRlYnVnZ2luZy4KCk9wdGlvbmFsbHksIHRoZSBqb2IncyBzeW5jIHBvaW50IGNv
dWxkIGJlIGF1dG8tcmVtb3ZlZCBmcm9tIHRoZSBEUk0ncwpjb250ZXh0IGFmdGVyIGpvYidzIHN1
Ym1pc3Npb24sIGF2b2lkaW5nIGEgbmVlZCBmb3IgYW4gZXh0cmEgU1lOQ1BUX1BVVApJT0NUTCBp
bnZvY2F0aW9uIHRvIGJlIGRvbmUgYnkgdXNlcnNwYWNlIGFmdGVyIHRoZSBqb2IncyBzdWJtaXNz
aW9uLgpDb3VsZCBiZSBhIGpvYidzIGZsYWcuCgpXZSBjb3VsZCBhdm9pZCBhIG5lZWQgZm9yIGEg
c3RhdGljYWxseS1hbGxvY2F0ZWQgc3luYyBwb2ludHMgYXQgYWxsIGZvcgphIHBhdGNoZWQgY21k
c3RyZWFtcyEgVGhlIHN5bmMgcG9pbnQgY291bGQgYmUgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGF0
IGEKam9iJ3Mgc3VibWlzc2lvbiB0aW1lIGJ5IHRoZSBrZXJuZWwgZHJpdmVyIGFuZCB0aGVuIGNt
ZHN0cmVhbSB3aWxsIGJlCnBhdGNoZWQgd2l0aCB0aGlzIHN5bmMgcG9pbnQuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
