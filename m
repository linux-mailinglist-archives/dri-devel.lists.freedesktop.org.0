Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB9C20C093
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 12:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09B06E131;
	Sat, 27 Jun 2020 10:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A156ECA2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:59:49 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c11so5216339lfh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BTgjm1/Uo1UjiBvzl85JcjpsUjI/1gpOs7wPPQzwe9Y=;
 b=vgCs6TNe08tb7eIjiBF30Ufr+wiA4b4IyKvFzEof+cgdnTf/1EKrqK/QEUw5Vfdo/z
 bUcEtziVVOHmUypUGb5Y9Ymi0/PG3f+q2oEGAqCpE9KqpNAXL63ACsSSIzVULwmWpHXO
 b+mUDDTlOTWtHnM4ksWNvt3Yx10eKY7S6lFl8UOTKhSLb41xLUQIEzdW5cw67D9XvWn8
 WbeACF6/ANEev1ECd047bjdTknmPdtxtSO823GB5GYtd1g9yyhrYLlXzzntZ2EBYpblw
 fwJBWLQRt1qVD+I6BEpVM/27dGNbkG+YbQtqkmQH6L/Z59gHJDwgh0agdkRohAXnTyYJ
 q/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BTgjm1/Uo1UjiBvzl85JcjpsUjI/1gpOs7wPPQzwe9Y=;
 b=n/xdgq5KrCZwAeGr9UfLcXKtnpuHzYV/vk08WVy+zUqfc3Mx9Ibd/a8bbCHLMWq0Wf
 NvP1wqQ67OsaCJorWKA7/mBzdQ9m/0Qtt3v0wXWTwuQaV+Y7S1dZl3S42kK20Cbzj+5E
 wegk5X2zsB2aszTEQvAn743R0CRmtTio3EZioW6jruc4gWRiFUGz6Zq1eA9mpfyJxL9j
 CsTn4O0jfO6Dd+Y/hlKIAtVcam9hDzt8bEonsYGq2s2x3TAxvoctrmIpFn6mGx6AphV5
 XJpnyA7nurrR1331r2bqXyAobFVNVV5vnOu1ep5aozmIfra2wsv4tBIDiMGgb+P5Cgjp
 GEOQ==
X-Gm-Message-State: AOAM530Ui0ulC+17KRde4T//j5Bp6l9oIoIr5TELhNEENcE3v6l4vt96
 pQrzCUyOG3DcBysH33GWE3o9vDgG7UQ=
X-Google-Smtp-Source: ABdhPJz2TVL9rOK8hVAUH0vUXmMcdVxq0RO6Hu+BIQvYwoalcK0BLwZY1BgTsFDoZ//yFhjqY43Bqg==
X-Received: by 2002:a19:6a02:: with SMTP id u2mr1967899lfu.9.1593179987416;
 Fri, 26 Jun 2020 06:59:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id f21sm761497ljj.121.2020.06.26.06.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2020 06:59:46 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
 <20200626114040.GA3143884@ulmo> <20200626133837.GE3278063@phenom.ffwll.local>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b46516eb-4077-c3ac-83d0-d8c57660dc3e@gmail.com>
Date: Fri, 26 Jun 2020 16:59:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200626133837.GE3278063@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 27 Jun 2020 10:12:42 +0000
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, gustavo@padovan.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjYuMDYuMjAyMCAxNjozOCwgRGFuaWVsIFZldHRlciDQv9C40YjQtdGCOgo+IE9uIEZyaSwgSnVu
IDI2LCAyMDIwIGF0IDAxOjQwOjQwUE0gKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+PiBP
biBGcmksIEp1biAyNiwgMjAyMCBhdCAwMTowNjo1OFBNICswMjAwLCBLYXJvbCBIZXJic3Qgd3Jv
dGU6Cj4+PiBPbiBUdWUsIEp1biAyMywgMjAyMCBhdCAzOjAzIFBNIE1pa2tvIFBlcnR0dW5lbiA8
Y3luZGlzQGthcHNpLmZpPiB3cm90ZToKPj4+Pgo+Pj4+ICMgSG9zdDF4L1RlZ3JhRFJNIFVBUEkg
cHJvcG9zYWwKPj4+Pgo+Pj4+IFRoaXMgaXMgYSBwcm9wb3NhbCBmb3IgYSBzdGFibGUgVUFQSSBm
b3IgSG9zdDF4IGFuZCBUZWdyYURSTSwgdG8gcmVwbGFjZQo+Pj4+IHRoZSBjdXJyZW50IFRlZ3Jh
RFJNIFVBUEkgdGhhdCBpcyBiZWhpbmQgYFNUQUdJTkdgIGFuZCBxdWl0ZSBvYnNvbGV0ZSBpbgo+
Pj4+IG1hbnkgd2F5cy4KPj4+Pgo+Pj4+IEkgaGF2ZW4ndCB3cml0dGVuIGFueSBpbXBsZW1lbnRh
dGlvbiB5ZXQgLS0gSSdsbCBkbyB0aGF0IG9uY2UgdGhlcmUgaXMKPj4+PiBzb21lIGFncmVlbWVu
dCBvbiB0aGUgaGlnaC1sZXZlbCBkZXNpZ24uCj4+Pj4KPj4+PiBDdXJyZW50IG9wZW4gaXRlbXM6
Cj4+Pj4KPj4+PiAqIFRoZSBzeW5jcG9pbnQgVUFQSSBhbGxvd3MgdXNlcnNwYWNlIHRvIGNyZWF0
ZSBzeW5jX2ZpbGUgRkRzIHdpdGgKPj4+PiBhcmJpdHJhcnkgc3luY3BvaW50IGZlbmNlcy4gZG1h
X2ZlbmNlIGNvZGUgY3VycmVudGx5IHNlZW1zIHRvIGFzc3VtZSBhbGwKPj4+PiBmZW5jZXMgd2ls
bCBiZSBzaWduYWxlZCwgd2hpY2ggd291bGQgbm90IG5lY2Vzc2FyaWx5IGJlIHRoZSBjYXNlIHdp
dGgKPj4+PiB0aGlzIGludGVyZmFjZS4KPj4+PiAqIFByZXZpb3VzbHkgcHJlc2VudCBHRU0gSU9D
VExzIChHRU1fQ1JFQVRFLCBHRU1fTU1BUCkgYXJlIG5vdCBwcmVzZW50Lgo+Pj4+IE5vdCBzdXJl
IGlmIHRoZXkgYXJlIHN0aWxsIG5lZWRlZC4KPj4+Pgo+Pj4KPj4+IEhpLCBhcyB0aGlzIHdhc24n
dCBhZGRyZXNzZWQgaGVyZSAoYW5kIHNvcnJ5IGlmIEkgbWlzc2VkIGl0KTogaXMgdGhlcmUKPj4+
IGFuIG9wZW4gc291cmNlIHVzZXJzcGFjZSBtYWtpbmcgdXNlIG9mIHRoaXMgVUFQST8gQmVjYXVz
ZSB0aGlzIGlzCj4+PiBzb21ldGhpbmcgd2hpY2ggbmVlZHMgdG8gYmUgc2VlbiBiZWZvcmUgaXQg
Y2FuIGJlIGluY2x1ZGVkIGF0IGFsbC4KPj4KPj4gVGhlcmUncyBhIHNldCBvZiBjb21taXRzIHRo
YXQgaW1wbGVtZW50IGFuIGVhcmxpZXIgZHJhZnQgaGVyZToKPj4KPj4gICAgIGh0dHBzOi8vZ2l0
aHViLmNvbS90aGllcnJ5cmVkaW5nL2xpbnV4L3RyZWUvZm9yLTUuNi9kcm0tdGVncmEtZGVzdGFn
ZS1hYmkKPj4KPj4gYW5kIGNvcnJlc3BvbmRpbmcgY2hhbmdlcyB0byBsaWJkcm0gdG8gbWFrZSB1
c2Ugb2YgdGhhdCBhbmQgaW1wbGVtZW50Cj4+IHRlc3RzIHVzaW5nIHRoZSB2YXJpb3VzIGdlbmVy
YXRpb25zIG9mIFZJQyBoZXJlOgo+Pgo+PiAgICAgaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9+dGFnci9kcm0vbG9nLwo+Pgo+PiBCZWZvcmUgYWN0dWFsbHkganVtcGluZyB0byBhbiBpbXBs
ZW1lbnRhdGlvbiB3ZSB3YW50ZWQgdG8gZ28gb3ZlciB0aGUKPj4gZGVzaWduIGEgYml0IG1vcmUg
dG8gYXZvaWQgd2FzdGluZyBhIGxvdCBvZiB3b3JrLCBsaWtlIHdlJ3ZlIGRvbmUgaW4KPj4gdGhl
IHBhc3QuIFR1cm5zIG91dCBpdCBpc24ndCBlYXN5IHRvIGdldCBldmVyeW9uZSB0byBhZ3JlZSBv
biBhIGdvb2QKPj4gQUJJLiBXaG8gd291bGQndmUgdGhvdWdodD8gPSkKPj4KPj4gSSBleHBlY3Qg
dGhhdCBvbmNlIHRoZSBkaXNjdXNzaW9uIGFyb3VuZCB0aGUgQUJJIHNldHRsZXMgTWlra28gd2ls
bAo+PiBzdGFydCBvbiBpbXBsZW1lbnRpbmcgdGhpcyBBQkkgaW4gdGhlIGtlcm5lbCBhbmQgd2Un
bGwgdXBkYXRlIHRoZQo+PiBsaWJkcm0gcGF0Y2hlcyB0byBtYWtlIHVzZSBvZiB0aGUgbmV3IEFC
SSBhcyB3ZWxsLgo+IAo+IERvIHdlIGhhdmUgbW9yZSB0aGFuIGxpYmRybSBhbmQgdGVzdHMgZm9y
IHRoaXMsIGxpa2Ugc29tZXRoaW5nIHNvbWV3aGF0Cj4gZnVuY3Rpb25hbD8gU2luY2UgdGVncmFk
cm0gbGFuZGVkIHllYXJzIGFnbyB3ZSd2ZSByZWZpbmVkIHRoZSBjcml0ZXJpYSBhCj4gYml0IGlu
IHRoaXMgcmVnYXJkLCBsYXRlc3QgdmVyc2lvbiBpcyBleHBsaWNpdCBpbiB0aGF0IGl0IG5lZWRz
IHRvIGJlCj4gc29tZXRoaW5nIHRoYXQncyBmdW5jdGlvbmFsIChmb3IgZW5kLXVzZXJzIGluIHNv
bWUgZm9ybSksIG5vdCBqdXN0Cj4gaW5mcmFzdHJ1Y3R1cmUgYW5kIHRlc3RzLgoKV2UgaGF2ZSBP
cGVudGVncmEgWzFdIGFuZCBWRFBBVSBbMl0gdXNlcnNwYWNlIGRyaXZlcnMgZm9yIG9sZGVyIFRl
Z3JhClNvQ3MgdGhhdCBoYXZlIGJlZW4gdXNpbmcgdGhlIHN0YWdpbmcgVUFQSSBmb3IgeWVhcnMg
bm93LgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9ncmF0ZS1kcml2ZXIveGY4Ni12aWRlby1vcGVu
dGVncmEKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9ncmF0ZS1kcml2ZXIvbGlidmRwYXUtdGVncmEK
ClRoZSBVQVBJIGFuZCB0aGUga2VybmVsIGRyaXZlciB1cGRhdGVzIGFyZSB2ZXJ5IG5lZWRlZCBm
b3IgdGhlc2UgZHJpdmVycwpiZWNhdXNlIG9mIHRoZSBtaXNzaW5nIFVBUEkgc3luY2hyb25pemF0
aW9uIGZlYXR1cmVzIGFuZCBwZXJmb3JtYW5jZQpwcm9ibGVtcyBvZiB0aGUga2VybmVsIGRyaXZl
ci4KClNvIHdlIGFscmVhZHkgaGF2ZSBzb21lIHJlYWwtd29ybGQgdXNlcnNwYWNlIGZvciB0aGUg
dGVzdGluZyEKCkl0J3Mgbm90IHRoZSBmaXJzdCBhbmQgbm90IHRoZSBzZWNvbmQgdGltZSB3ZSdy
ZSBkaXNjdXNzaW5nIHRoZSBUZWdyYQpEUk0gVUFQSSBjaGFuZ2VzLCBidXQgdGhpcyB0aW1lIGl0
IGZlZWxzIGxpa2UgdGhlcmUgaXMgYSBnb29kIGNoYW5jZQp0aGF0IGl0IHdpbGwgZmluYWxseSBt
YXRlcmlhbGl6ZSBhbmQgSSdtIHZlcnkgaGFwcHkgYWJvdXQgaXQgOikKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
