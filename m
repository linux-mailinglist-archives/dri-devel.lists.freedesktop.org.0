Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E42299FA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 16:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89736E823;
	Wed, 22 Jul 2020 14:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5336E822;
 Wed, 22 Jul 2020 14:23:48 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id br7so2410747ejb.5;
 Wed, 22 Jul 2020 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4eDGMiirBr/9wj0aV+FWFSQ39qot6+wnOp4Iy5F1qKw=;
 b=awDiXnCAOzBfXEM7w8PJ3tM3M1ix7xTsKONg8BwDAqtB/5SooWmpeYqhsBclY3dz1T
 8UxHDsup2Iw2w0nR4a/Af6J2xG8/DkpECOZs2nPn1p5ESnv/FFdQ4jXOer0Nvdc+Z1QL
 lPKaVIHuvz/eakMsfVLRj+gUUe/Nu7XfFTwheAZdGUHeQzTkD2ZeFkdZ6S0AqZUc/a8u
 Ef8PCJqmOrOtOIPZKl/U7LO1q/QY3WR1M0whWlEyt1JbQefsCYzAg0GTz8K4YmjRdEbs
 VoJ0oYhlIzs3BeTpU6By8xlkTXpzgEWGtGWjGXwdeYU9JW9EySZIpKX4nwKGeGpux0V4
 9Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=4eDGMiirBr/9wj0aV+FWFSQ39qot6+wnOp4Iy5F1qKw=;
 b=SHdtvsodNIzMPK2W89C0/yqXCuEEa2B8pBcKzHLX36NB/5XSjvhsA/ALDyA+KdypuK
 iVqMJ+VM/Pb3ZlhclwYUJMKSO2JVKpdw/xpwWpEL0AIA+DLVOHtlIxfu9cILaP2xtyhD
 dmMKLZvDTmatDqcI3J59UNOBRMgXOjZ8aAld5L0FB5nRd0LDnYVpZ6FpHmi45c/Sr6CK
 SjRWH3+vESo4bN/LuwW0cR6sQvexKwxdOFnb53Y3fX1fiCsaCxWNPFVRLSK/vLB/3GcW
 syAPiBsEMSYuYTtrtMFyzlXbXhETP5l2Xt/BvKiaMckneCbwRpeKRhfx7insyDIoxBrN
 Dquw==
X-Gm-Message-State: AOAM532SdiQGHyPwYS3llwfn6NrzHzBa5NIrMcvJVzGP7hO9pxdqxxBd
 pmlVwULVbphwHv/DsSaBlJA=
X-Google-Smtp-Source: ABdhPJweXE+1WURAaIs/HR95z4aF6xhhUwmufaRJKgZqDHvsKPtNi9tuWkQG2Tj3wIdhocnD1H/YYA==
X-Received: by 2002:a17:906:4f16:: with SMTP id
 t22mr29680343eju.179.1595427826873; 
 Wed, 22 Jul 2020 07:23:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g21sm17224edr.45.2020.07.22.07.23.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jul 2020 07:23:46 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf.rst: Document why indefinite
 fences are a bad idea
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <93b673b7-bb48-96eb-dc2c-bd4f9304000e@shipmail.org>
 <20200721074157.GB3278063@phenom.ffwll.local>
 <3603bb71-318b-eb53-0532-9daab62dce86@amd.com>
 <57a5eb9d-b74f-8ce4-7199-94e911d9b68b@shipmail.org>
 <CAPM=9twUWeenf-26GEvkuKo3wHgS3BCyrva=sNaWo6+=A5qdoQ@mail.gmail.com>
 <805c49b7-f0b3-45dc-5fe3-b352f0971527@shipmail.org>
 <CAKMK7uHhhxBC2MvnNnU9FjxJaWkEcP3m5m7AN3yzfw=wxFsckA@mail.gmail.com>
 <92393d26-d863-aac6-6d27-53cad6854e13@shipmail.org>
 <CAKMK7uF8jpyuCF8uUbEeJUedErxqRGa8JY+RuURg7H1XXWXzkw@mail.gmail.com>
 <8fd999f2-cbf6-813c-6ad4-131948fb5cc5@shipmail.org>
 <CAKMK7uH0rcyepP2hDpNB-yuvNyjee1tPmxWUyefS5j7i-N6Pfw@mail.gmail.com>
 <df5414f5-ac5c-d212-500c-b05c7c78ce84@shipmail.org>
 <CAKMK7uF27SifuvMatuP2kJPTf+LVmVbG098cE2cqorYYo7UHkw@mail.gmail.com>
 <697d1b5e-5d1c-1655-23f8-7a3f652606f3@shipmail.org>
 <CAKMK7uGSkgdJyyvGe8SF_vWfgyaCWn5p0GvZZdLvkxmrS6tYbQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c742c557-f48f-1591-1d1d-a5181b408a67@gmail.com>
Date: Wed, 22 Jul 2020 16:23:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGSkgdJyyvGe8SF_vWfgyaCWn5p0GvZZdLvkxmrS6tYbQ@mail.gmail.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Steve Pronovost <spronovo@microsoft.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Jesse Natalie <jenatali@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMjAgdW0gMTY6MDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDIyLCAyMDIwIGF0IDM6MTIgUE0gVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQo+IDx0aG9tYXNf
b3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4gT24gMjAyMC0wNy0yMiAxNDo0MSwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPj4+IEknbSBwcmV0dHkgc3VyZSB0aGVyZSdzIG1vcmUgYnVncywgSSBqdXN0
IGhhdmVuJ3QgaGVhcmQgZnJvbSB0aGVtIHlldC4KPj4+IEFsc28gZHVlIHRvIHRoZSBvcHQtaW4g
bmF0dXJlIG9mIGRtYS1mZW5jZSB3ZSBjYW4gbGltaXQgdGhlIHNjb3BlIG9mCj4+PiB3aGF0IHdl
IGZpeCBmYWlybHkgbmF0dXJhbGx5LCBqdXN0IGRvbid0IHB1dCB0aGVtIHdoZXJlIG5vIG9uZSBj
YXJlcwo+Pj4gOi0pIE9mIGNvdXJzZSB0aGF0IGFsc28gaGlkZXMgZ2VuZXJhbCBsb2NraW5nIGlz
c3VlcyBpbiBkbWFfZmVuY2UKPj4+IHNpZ25hbGxpbmcgY29kZSwgYnV0IHdlbGwgKnNocnVnKi4K
Pj4gSG1tLCB5ZXMuIEFub3RoZXIgcG90ZW50aWFsIGJpZyBwcm9ibGVtIHdvdWxkIGJlIGRyaXZl
cnMgdGhhdCB3YW50IHRvCj4+IHVzZSBncHUgcGFnZSBmYXVsdHMgaW4gdGhlIGRtYS1mZW5jZSBj
cml0aWNhbCBzZWN0aW9ucyB3aXRoIHRoZQo+PiBiYXRjaC1iYXNlZCBwcm9ncmFtbWluZyBtb2Rl
bC4KPiBZZWFoIHRoYXQncyBhIG1hc3NpdmUgY2FuIG9mIHdvcm1zLiBCdXQgbHVja2lseSB0aGVy
ZSdzIG5vIHN1Y2ggZHJpdmVyCj4gbWVyZ2VkIGluIHVwc3RyZWFtLCBzbyBob3BlZnVsbHkgd2Ug
Y2FuIHRoaW5rIGFib3V0IGFsbCB0aGUKPiBjb25zdHJhaW50cyBhbmQgaG93IHRvIGJlc3QgYW5u
b3RhdGUmZW5mb3JjZSB0aGlzIGJlZm9yZSB3ZSBsYW5kIGFueQo+IGNvZGUgYW5kIGhhdmUgYmln
IHJlZ3JldHMuCgpEbyB5b3Ugd2FudCBhIGJhZCBuZXdzPyBJIG9uY2UgbWFkZSBhIHByb3RvdHlw
ZSBmb3IgdGhhdCB3aGVuIFZlZ2ExMCAKY2FtZSBvdXQuCgpCdXQgd2UgYWJhbmRvbmVkIHRoaXMg
YXBwcm9hY2ggZm9yIHRoZSB0aGUgYmF0Y2ggYmFzZWQgYXBwcm9hY2ggYmVjYXVzZSAKb2YgdGhl
IGhvcnJpYmxlIHBlcmZvcm1hbmNlLgoKS0ZEIGlzIGdvaW5nIHRvIHNlZSB0aGF0LCBidXQgdGhp
cyBpcyBvbmx5IHdpdGggdXNlciBxdWV1ZXMgYW5kIG5vIApkbWFfZmVuY2UgaW52b2x2ZWQgd2hh
dHNvZXZlci4KCkNocmlzdGlhbi4KCj4gLURhbmllbAo+Cj4KPgo+IC0tCj4gRGFuaWVsIFZldHRl
cgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZm
d2xsLmNoCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
