Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3012131BB72
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 15:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647846E8BF;
	Mon, 15 Feb 2021 14:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99866E8BF
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 14:54:45 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id jt13so11645470ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 06:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vVdEfWSlmLCjTZzZsqvvIxgWNNo8H9xjhu0/9T9YVpU=;
 b=XlIog/eMeAk3If6nDNMJc83j9eaD9nfSoxl0yxZ4R4Xq3lypZ8xHagLCcVTP7/DuRo
 rl65fgWOqlyAcRN9WjoOI3SNfk1bKQSD64aK5ernmrZdVqDxF6yfj2B6mkbbkEfys+QJ
 fx6ngTmXggNrbsiBUHyK/Zq2I6yGWzajmCtxhCV5K3WibSWKws1CHCc4onZBYLnxDiyA
 nv48s2MBsHnGyYZUblPQwk9KTsfRQxXLB8P1z74f+PYG5A5MCPbdKJXu8JPBa6tbBBAC
 7wvyRyuLf6nVbeuWvHapgwZsCvNyWzdxEkKK7Q459rL2C/5lS31JL+CBBLaZneUTEWid
 DafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vVdEfWSlmLCjTZzZsqvvIxgWNNo8H9xjhu0/9T9YVpU=;
 b=YPKjQ99zGimI2j3Ul8k81FShlLzlgklXrIS8jcEfxO7CN98wC9vN+lMO8mV9Snsc2l
 qXljN+ru2Jc6EyRC55jkb4xeeRTlOoEehUgeIqcFJyXDvifrmapsqZwAXhX3r5fYznls
 Wz7Bi4+9pHm+qyIfebOxFNP5FKlMVfGnPzwalh7Bm5hxz9pP9CBnr9ks0pQICcn+b/kh
 sG0/ILAwmG8yxxC1fzRDfNGuZVDDm2HNeCt8YBvfKVg2mWA4Ni50hgPoX8agjEKJNvRz
 aWNsGpxOz5xtfB2eaj9DvMMDqbCRGWVKAOf2587k71YrndDJ+kYXveoL+6KGwdfmRt2K
 TIdQ==
X-Gm-Message-State: AOAM530gotoTIKUuqhnBW/vYkx1UsMFpLzZvrywQ77zPvD9+IgE4rpR/
 DfdYqAOeUIYy0kmFMli7HLeKH/1UTRgKQw==
X-Google-Smtp-Source: ABdhPJyKyQ+rcI1yMgx5DeqIr7yds4RFmEThUICE4kKcuA/yo4/N31AymywJRuTF1ELr74NJdEQU1w==
X-Received: by 2002:a17:906:3412:: with SMTP id
 c18mr2583106ejb.146.1613400884593; 
 Mon, 15 Feb 2021 06:54:44 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:83c6:b72d:87bd:4259?
 ([2a02:908:1252:fb60:83c6:b72d:87bd:4259])
 by smtp.gmail.com with ESMTPSA id q20sm10743492ejs.17.2021.02.15.06.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 06:54:44 -0800 (PST)
Subject: Re: [Linaro-mm-sig] DMA-buf and uncached system memory
To: David Laight <David.Laight@ACULAB.COM>,
 =?UTF-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>, Simon Ser <contact@emersion.fr>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
 <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
 <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
 <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
 <fa3f6eefc0a940b38448b0efd4b3f4e3@AcuMS.aculab.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <33ffa837-a88a-db1c-7861-c70d67557665@gmail.com>
Date: Mon, 15 Feb 2021 15:54:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fa3f6eefc0a940b38448b0efd4b3f4e3@AcuMS.aculab.com>
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxNS4wMi4yMSB1bSAxNTo0MSBzY2hyaWViIERhdmlkIExhaWdodDoKPiBGcm9tOiBDaHJp
c3RpYW4gS8O2bmlnCj4+IFNlbnQ6IDE1IEZlYnJ1YXJ5IDIwMjEgMTI6MDUKPiAuLi4KPj4gU25v
b3BpbmcgdGhlIENQVSBjYWNoZXMgaW50cm9kdWNlcyBzb21lIGV4dHJhIGxhdGVuY3ksIHNvIHdo
YXQgY2FuCj4+IGhhcHBlbiBpcyB0aGF0IHRoZSByZXNwb25zZSB0byB0aGUgUENJZSByZWFkIGNv
bWVzIHRvIGxhdGUgZm9yIHRoZQo+PiBzY2Fub3V0LiBUaGUgcmVzdWx0IGlzIGFuIHVuZGVyZmxv
dyBhbmQgZmxpY2tlcmluZyB3aGVuZXZlciBzb21ldGhpbmcgaXMKPj4gaW4gdGhlIGNhY2hlIHdo
aWNoIG5lZWRzIHRvIGJlIGZsdXNoZWQgZmlyc3QuCj4gQXJlbid0IHlvdSBnb2luZyB0byBnZXQg
dGhlIHNhbWUgcHJvYmxlbSBpZiBhbnkgb3RoZXIgZW5kcG9pbnRzIGFyZQo+IGRvaW5nIG1lbW9y
eSByZWFkcz8KClRoZSBQQ0llIGRldmljZSBpbiB0aGlzIGNhc2UgaXMgcGFydCBvZiB0aGUgU29D
LCBzbyB3ZSBoYXZlIGEgaGlnaCAKcHJpb3JpdHkgY2hhbm5lbCB0byBtZW1vcnkuCgpCZWNhdXNl
IG9mIHRoaXMgdGhlIGhhcmR3YXJlIGRlc2lnbmVyIGFzc3VtZWQgdGhleSBoYXZlIGEgZ3VhcmFu
dGVlZCAKbWVtb3J5IGxhdGVuY3kuCgo+IFBvc3NpYmx5IGV2ZW4gb25lcyB0aGF0IGRvbid0IHJl
cXVpcmUgYSBjYWNoZSBzbm9vcCBhbmQgZmx1c2guCj4KPiBXaGF0IGFib3V0IGp1c3QgdGhlIGNw
dSBkb2luZyBhIHJlYWwgbWVtb3J5IHRyYW5zZmVyPwo+Cj4gT3IgYSBjb21iaW5hdGlvbiBvZiB0
aGUgdHdvIGFib3ZlIGhhcHBlbmluZyBqdXN0IGJlZm9yZSB5b3VyIHJlcXVlc3QuCj4KPiBJZiB5
b3UgZG9uJ3QgaGF2ZSBhIGJpZyBlbm91Z2ggZmlmbyB5b3UnbGwgbG9zZS4KPgo+IEkgZGlkICdm
aXgnIGEgc2ltaWxhcihpc2gpIGlzc3VlIHdpdGggdmlkZW8gRE1BIGxhdGVuY3kgb24gYW4gZW1i
ZWRkZWQKPiBzeXN0ZW0gYmFzZWQgdGhlIG9uIFNBMTEwMC9TQTExMDEgYnkgc2lnbmlmaWNhbnRs
eSByZWR1Y2luZyB0aGUgY2xvY2sKPiB0byB0aGUgVkdBIHBhbmVsIHdoZW5ldmVyIHRoZSBjcHUg
d2FzIGRvaW5nICdzbG93IGlvJy4KPiAoSW50ZXJsZWF2aW5nIGFuIHVuY2FjaGVkIGNwdSBEUkFN
IHdyaXRlIGJldHdlZW4gdGhlIHNsb3cgaW8gY3ljbGVzCj4gYWxzbyBmaXhlZCBpdC4pCj4gQnV0
IHRoZSB2aWRlbyB3YXMgdGhlIG9ubHkgRE1BIGRldmljZSBhbmQgdGhhdCB3YXMgYW4gZW1iZWRk
ZWQgc3lzdGVtLgo+IEdpdmVuIHRoZSBhcHBsaWNhdGlvbiBub3RlIGFib3V0IHZpZGVvIGxhdGVu
Y3kgZGlkbid0IG1lbnRpb24gd2hhdCB3YXMKPiBhY3R1YWxseSBoYXBwZW5pbmcsIEknbSBub3Qg
c3VyZSBob3cgbWFueSBwZW9wbGUgYWN0dWFsbHkgZ290IGl0IHdvcmtpbmchCgpZZWFoLCBJJ20g
YWxzbyBub3Qgc3VyZSBpZiBBTUQgZG9lc24ndCBzb2x2ZSB0aGlzIHdpdGggZGVlcGVyIGZpZm9z
IG9yIAptb3JlIHByZWZldGNoaW5nIGluIGZ1dHVyZSBkZXNpZ25zLgoKQnV0IHlvdSBnYXZlIG1l
IGF0IGxlYXN0IG9uZSBleGFtcGxlIHdoZXJlIHNvbWVib2R5IGhhZCBzaW1pbGFyIHByb2JsZW1z
LgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssCkNocmlzdGlhbi4KCj4KPiAJRGF2aWQKPgo+IC0K
PiBSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwg
TWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsKPiBSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdh
bGVzKQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
TGluYXJvLW1tLXNpZyBtYWlsaW5nIGxpc3QKPiBMaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5v
cmcKPiBodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9saW5hcm8tbW0t
c2lnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
