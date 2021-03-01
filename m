Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164D32792E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5566E4FF;
	Mon,  1 Mar 2021 08:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3E16E4FF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:28:35 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id 40so7312650otu.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 00:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Po0BcOHVOJTG0hvFYjPlIwmZEd13oK67+UakEhu7B6Q=;
 b=YfA/r0mER8n6UfMIfPlTKU0tRsfBtD2fSPCMtOkQ8qPbEjf0wZj6SbP66leHhGrHh+
 Hefkni+38PRa4KEDwHN6qnHZRU5pOke97rViY26d9G2cKSpStSv9bG/3mRknk5+4smVr
 eJo5XoeUTuVG3dYspWAIHl+D7uvwXlei75bAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Po0BcOHVOJTG0hvFYjPlIwmZEd13oK67+UakEhu7B6Q=;
 b=duP0HYoTvvcY1UwcnSfqe8RV9lgPXqRR9YQsjyxbzIDcQGinci/HxCSA7fk0rO2Oc0
 u4F5v6+CaX0gmhmhZqeYoe1WjhzSyO7zkSeTtqbMYngwk0ZGQUQLUysLY8LaqsZM4egf
 D0Nss6CEPq9pWORSu3RZqrV696JI7tDJ1gU5sowBGVslcXM3a4Y1hTM5tjU2/jurQvSJ
 hCvi72eAiAUkFJ58mzc03xP6lzof+pFJ5D+DvOjW00Q3TiwmVoEVW8B3Y/+nTulFq8o3
 +Bo5mvTemUMaTDfvWaFmAYKiZgFtQvhiPNO8uXHQEBXB5dpCpFvQEf6ZDTA55RJeTmeD
 Y1AA==
X-Gm-Message-State: AOAM5338poTKd0BA95nzdijUrgXHLcPt+qcno10GIwkg12w7qqP7JiIN
 AmnZrivXz6S5TlE5lA32EZC0zlqDLlrFLDvG5b+rIQ==
X-Google-Smtp-Source: ABdhPJympOz7bwbjwQR+/YqRgluV9bZ9F2UL/K13jiisJVkY2GNo/v3HZSpiXQHFFJMtqZ1UFhbbahYsC9DYYMGGasg=
X-Received: by 2002:a9d:6481:: with SMTP id g1mr2759310otl.303.1614587314867; 
 Mon, 01 Mar 2021 00:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
In-Reply-To: <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 1 Mar 2021 09:28:23 +0100
Message-ID: <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBGZWIgMjcsIDIwMjEgYXQgOTowNiBBTSBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwp
Cjx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPiBPbiAyLzI2LzIxIDI6MjggUE0sIERh
bmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBTbyBJIHRoaW5rIGl0IHN0b3BzIGd1cC4gQnV0IEkgaGF2
ZW4ndCB2ZXJpZmllZCBhdCBhbGwuIFdvdWxkIGJlIGdvb2QKPiA+IGlmIENocmlzdGlhbiBjYW4g
Y2hlY2sgdGhpcyB3aXRoIHNvbWUgZGlyZWN0IGlvIHRvIGEgYnVmZmVyIGluIHN5c3RlbQo+ID4g
bWVtb3J5Lgo+Cj4gSG1tLAo+Cj4gRG9jcyAoYWdhaW4gdm1fbm9ybWFsX3BhZ2UoKSBzYXkpCj4K
PiAgICogVk1fTUlYRURNQVAgbWFwcGluZ3MgY2FuIGxpa2V3aXNlIGNvbnRhaW4gbWVtb3J5IHdp
dGggb3Igd2l0aG91dCAic3RydWN0Cj4gICAqIHBhZ2UiIGJhY2tpbmcsIGhvd2V2ZXIgdGhlIGRp
ZmZlcmVuY2UgaXMgdGhhdCBfYWxsXyBwYWdlcyB3aXRoIGEgc3RydWN0Cj4gICAqIHBhZ2UgKHRo
YXQgaXMsIHRob3NlIHdoZXJlIHBmbl92YWxpZCBpcyB0cnVlKSBhcmUgcmVmY291bnRlZCBhbmQK
PiBjb25zaWRlcmVkCj4gICAqIG5vcm1hbCBwYWdlcyBieSB0aGUgVk0uIFRoZSBkaXNhZHZhbnRh
Z2UgaXMgdGhhdCBwYWdlcyBhcmUgcmVmY291bnRlZAo+ICAgKiAod2hpY2ggY2FuIGJlIHNsb3dl
ciBhbmQgc2ltcGx5IG5vdCBhbiBvcHRpb24gZm9yIHNvbWUgUEZOTUFQCj4gdXNlcnMpLiBUaGUK
PiAgICogYWR2YW50YWdlIGlzIHRoYXQgd2UgZG9uJ3QgaGF2ZSB0byBmb2xsb3cgdGhlIHN0cmlj
dCBsaW5lYXJpdHkgcnVsZSBvZgo+ICAgKiBQRk5NQVAgbWFwcGluZ3MgaW4gb3JkZXIgdG8gc3Vw
cG9ydCBDT1dhYmxlIG1hcHBpbmdzLgo+Cj4gYnV0IGl0J3MgdHJ1ZSBfX3ZtX2luc2VydF9taXhl
ZCgpIGVuZHMgdXAgaW4gdGhlIGluc2VydF9wZm4oKSBwYXRoLCBzbwo+IHRoZSBhYm92ZSBpc24n
dCByZWFsbHkgdHJ1ZSwgd2hpY2ggbWFrZXMgbWUgd29uZGVyIGlmIGFuZCBpbiB0aGF0IGNhc2UK
PiB3aHkgdGhlcmUgY291bGQgYW55IGxvbmdlciBldmVyIGJlIGEgc2lnbmlmaWNhbnQgcGVyZm9y
bWFuY2UgZGlmZmVyZW5jZQo+IGJldHdlZW4gTUlYRURNQVAgYW5kIFBGTk1BUC4KClllYWggaXQn
cyBkZWZpbml0ZWx5IGNvbmZ1c2luZy4gSSBndWVzcyBJJ2xsIGhhY2sgdXAgYSBwYXRjaCBhbmQg
c2VlCndoYXQgc3RpY2tzLgoKPiBCVFcgcmVnYXJkaW5nIHRoZSBUVE0gaHVnZXB0ZXMsIEkgZG9u
J3QgdGhpbmsgd2UgZXZlciBsYW5kZWQgdGhhdCBkZXZtYXAKPiBoYWNrLCBzbyB0aGV5IGFyZSAo
Zm9yIHRoZSBub24tZ3VwIGNhc2UpIHJlbHlpbmcgb24KPiB2bWFfaXNfc3BlY2lhbF9odWdlKCku
IEZvciB0aGUgZ3VwIGNhc2UsIEkgdGhpbmsgdGhlIGJ1ZyBpcyBzdGlsbCB0aGVyZS4KCk1heWJl
IHRoZXJlJ3MgYW5vdGhlciBkZXZtYXAgaGFjaywgYnV0IHRoZSB0dG1fdm1faW5zZXJ0IGZ1bmN0
aW9ucyBkbwp1c2UgUEZOX0RFViBhbmQgYWxsIHRoYXQuIEFuZCBJIHRoaW5rIHRoYXQgc3RvcHMg
Z3VwX2Zhc3QgZnJvbSB0cnlpbmcKdG8gZmluZCB0aGUgdW5kZXJseWluZyBwYWdlLgotRGFuaWVs
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
