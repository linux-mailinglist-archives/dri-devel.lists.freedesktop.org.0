Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFB19A639
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D9E6E8F3;
	Wed,  1 Apr 2020 07:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7B86E8F3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 07:29:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e9so5942252wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ooi4S+1V1pEPqBmFPvA72AhwefzRwoTM3OrU25m0y/s=;
 b=q3NlIuLvc3/q7VWREDOcVYnpH9E7p5PjxXY8Xj11l7q0BG8lP9JKh/qdiyhVZETL09
 LZwb7HBREBvcUG9iWSvZab6rrPZoJC7gOYeL/NJ1NNPCzcBx25jtCzNB+oPM0R57IW1F
 BsqthoknBF7HGlzQOFwi6+aHRHL3zh5+G6G5HCkVhxca4bo24yUZUdzjf/PL0pvgKKxv
 AUY6yJVb0HL8Eb9po4SCcfFAJX2BgjlyNQb4D2YBbEqnAAjkT4HQE6xxEu5eWTXRLu/N
 V79DYzd1Yk7AjiR3IRnqaBRAhR+1n19hZS107Hg6EZiuFfeh9FE+jY7FiBWHfq7BUvkg
 cZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ooi4S+1V1pEPqBmFPvA72AhwefzRwoTM3OrU25m0y/s=;
 b=Yc6kgTdPMR4FT9a8KyX3+cYWChf1T0WtbFehEL5nCAxYK+8CtJ/avQNZwud7y4b41X
 DkB+ZROYHLAn4hED5dg+W+ZQsz8hryu9hF6V9Dn4R50NtTVayzPmLKWTlMEv6usYpuO0
 gQhbttDri19RFKyuRn6+QLRmEcvlsMIiZgDG/zhi8jlQM9eflKsN0ls/2dKcMXeG9FyD
 DNeomgXDEpQCRMfTcnOhj3Aws2YmDCWIjpzzVvB3pZy8dvrht+mKo/K9gwlR436l59T1
 3ZEGHJALURgnRyphVsch5v0MrYgqaJD5kRikG28xEKNNrGu5YobvV/Qvia938B08QCU4
 /+cg==
X-Gm-Message-State: AGi0PuZKayRZLEU9pIlY3aP8glw4d+cHi5RdmImxGTuyTdnNyd47udxD
 blZri8QTkVAvjFmAWWkd3lo=
X-Google-Smtp-Source: APiQypLTRzlKMnXN7aEQ2NUKjDNAuGXAr8f3opMCaPJT0jv7U9WOZAQBJu+7j0AlRvpiKwALhWcQ0Q==
X-Received: by 2002:a1c:9886:: with SMTP id a128mr2750475wme.75.1585726176751; 
 Wed, 01 Apr 2020 00:29:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p5sm1511580wrg.49.2020.04.01.00.29.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Apr 2020 00:29:36 -0700 (PDT)
Subject: Re: [PATCH] drm/mm: revert "Break long searches in fragmented address
 spaces"
To: Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>
References: <20200330123425.3944-1-christian.koenig@amd.com>
 <c124b5d1-efc6-e826-2387-9f9ad06d1df0@gmail.com>
 <20200331091618.GM2363188@phenom.ffwll.local>
 <158564641293.18289.1145145659054294433@build.alporthouse.com>
 <CAKMK7uGNxhZB9Fd3i7rGK42pAgoJACRoR_NrrXF6rfCFkrg4GQ@mail.gmail.com>
 <158566075049.18289.17918401274396829066@build.alporthouse.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <547dca13-bd62-9319-ee44-6894ee1b60af@gmail.com>
Date: Wed, 1 Apr 2020 09:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <158566075049.18289.17918401274396829066@build.alporthouse.com>
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

QW0gMzEuMDMuMjAgdW0gMTU6MTkgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBEYW5p
ZWwgVmV0dGVyICgyMDIwLTAzLTMxIDExOjM4OjUwKQo+PiBPbiBUdWUsIE1hciAzMSwgMjAyMCBh
dCAxMToyMCBBTSBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6
Cj4+PiBRdW90aW5nIERhbmllbCBWZXR0ZXIgKDIwMjAtMDMtMzEgMTA6MTY6MTgpCj4+Pj4gT24g
VHVlLCBNYXIgMzEsIDIwMjAgYXQgMTA6NTk6NDVBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3
cm90ZToKPj4+Pj4gQSBub3Qgc28gZ2VudGxlIHBpbmcsIHNpbmNlIHRoaXMgcHJldHR5IG11Y2gg
YnJva2UgYWxsIFRUTSBiYXNlZCBkcml2ZXJzLgo+Pj4+Pgo+Pj4+PiBDb3VsZCB3ZSByZXZlcnQg
dGhpcyBmb3Igbm93Pwo+Pj4+IEFsd2F5cyBhY2sgZm9yIHJldmVydC4KPj4+Pgo+Pj4+IEFja2Vk
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+Pj4gU28geW91IGRp
ZG4ndCBjaGVjayB0aGUgZWFybGllciBwYXRjaCBlaXRoZXI/Cj4+IEkgZGlkLCBidXQgd2Fzbid0
IHN1cGVyIHNvbGQgb24gdGhlIGlkZWEgb2YgbW9yZSBmbGFncyB0byBzbWFjayBhbiByLWIKPj4g
b250byBpdCwgc28gZmlndXJlZCBJJ2xsIHRocm93IHRoZSBkZWZhdWx0IGFjay1mb3ItcmV2ZXJ0
IG9uIHRoaXMKPj4gbWVhbndoaWxlLgo+IFdlIGFsbG93IHVzZXJzcGFjZSB0byBwb2lzb24gdGhl
IGRybV9tbSBhdCByb3VnaGx5IDhLIGludGVydmFscywgYQo+IHNlYXJjaCBzcGFjZSBvZiAzNWIg
d2l0aCB0eXBpY2FsbHkgTyhOXjIpIGJlaGF2aW91ciBhbmQgZWFjaCBub2RlCj4gdHJhdmVyc2Fs
IChyYl9uZXh0L3JiX3ByZXYpIHdpbGwgaXRzZWxmIGJlIGNvc3RseS4gRXZlbiBvdXIgc2ltcGxl
IHRlc3RzCj4gY2FuIGdlbmVyYXRlIGEgc2VhcmNoIG9mIHNldmVyYWwgbWludXRlcyBiZWZvcmUg
b3VyIHBhdGllbmNlIHJ1bnMgb3V0Lm8KPiBBbnkgZHJtX21tIHRoYXQgYWxsb3dzIGZvciB1c2Vy
c3BhY2UgdG8gY29udHJvbCBhbGlnbm1lbnQgY2FuIGJlCj4gYXJiaXRyYXJpbHkgZnJhZ21lbnRl
ZCwgaGVuY2UgYSByYWlzZWQgZXllYnJvdyB0aGF0IHRoaXMgc2VhcmNoIHdvdWxkIGJlCj4gYWxs
b3dlZCBpbiBhdG9taWMgY29udGV4dC4KCldvdywgdGhhdCBpcyBpbmRlZWQgcXVpdGUgYSBsb3Qu
CgpXaGF0IGlzIHRoZSBjcml0ZXJpYSB1c2UgZm9yIG9yZGVyaW5nIHRoZSB0cmVlPyBKdXN0IHRo
ZSBzaXplIG9yIGlzIHRoYXQgCnNpemUrYWxpZ25tZW50PwoKTmV2ZXIgbG9va2VkIGludG8gdGhp
cywgYnV0IG1heWJlIHdlIGhhdmUgYSBsb3cgaGFuZ2luZyBmcnVpdCBmb3IgYW4gCmltcHJvdmVt
ZW50IGhlcmU/CgpJJ20gbm90IDEwMCUgc3VyZSwgYnV0IG1vdmluZyBhd2F5IGZyb20gYXRvbWlj
IGNvbnRleHQgd291bGRuJ3QgYmUgdGhhdCAKZWFzeS4KCkNocmlzdGlhbi4KCj4gLUNocmlzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
