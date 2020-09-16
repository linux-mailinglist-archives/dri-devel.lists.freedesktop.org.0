Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DDB26C435
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D406EA3B;
	Wed, 16 Sep 2020 15:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5F26EA3C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:31:34 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id p9so10944830ejf.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FFVIMLw/qCsSLnB7Hf2n5qox/a9OEmYxxlddH5dk/ng=;
 b=NonqZq3rUzQcLEzLa0eBBE1h+gfBuDVn6anZ5i79FdEzJ+JYlB5SF7WfWfG3Mqvcrz
 mpBRMc8amwyC7GvLim/gZecRiJ0vOCz1yEPW5AGY5gdgIiAxVnKaz6+8cQWgOOE1JBWo
 umZ7lUC4fu6kdAIr/pLSd3uACF3Leq/HOcTZ1qLED+2Dh1I4zZFDqYA3g7QkB/mkQbHh
 cq+zcHmwJnCTpRvWYKWZ+sW6FV/DqDnOPIEaE1u4XZmMa77U6nIxauuufDzKAfmeZ6Cl
 CnFDeB1TboTcq3DxTXjkmIxcdUlTEg1NlZE99ETZER7DASL0l92c2vwTdrneuKiaL0fS
 h6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=FFVIMLw/qCsSLnB7Hf2n5qox/a9OEmYxxlddH5dk/ng=;
 b=Jwd2u1HqoBuyXE5i+M7V/Sj/Hrs+j0bOVJ2bchYjHSJPKfXp+BaegnnXusl6LQ8eQZ
 fU4U9hSfcgeaUS1ZO+S2v+Rc8z/VvBLqHQdW1zm5DMo1fFuttmHfaD98lAoxuk7ojKgR
 1JgfVvEQzM0a9IQimEZZeMM1ijb0CAbWDWOVv7VwND4AkMmklUjvkbgwSLwPbg2so8s8
 VnQuyRSmJSqdlynDjHUztBR6PoQlv8tFsDJTMDJPseHELxiITSuhvuuePDDNM2TSV2Ge
 fTlxxUZrpMRvk75wqFMfXNT8PyQ9h0Tv2YO6JyJdcmJHUgU4DLRNH88iqTJ8W+5UJEKm
 lYMg==
X-Gm-Message-State: AOAM530g8jowMPAn584E+j327/iZZRj/2vq0kS81x1H7Z1mR/YPCAdRC
 w1kTCjE0B9jeJUZygNbuXLw=
X-Google-Smtp-Source: ABdhPJx8ArZnxCH5L/M6w2OQ/SkKcPuPpgnzuN/T5LBMYwHsyZz643N/8p/J/r8TnQEqdpzY+GTdEQ==
X-Received: by 2002:a17:906:d965:: with SMTP id
 rp5mr25015415ejb.364.1600270293644; 
 Wed, 16 Sep 2020 08:31:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id lo25sm12877150ejb.53.2020.09.16.08.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 08:31:33 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local> <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
Date: Wed, 16 Sep 2020 17:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDkuMjAgdW0gMTc6MjQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgU2Vw
IDE2LCAyMDIwIGF0IDQ6MTQgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAxNi4wOS4yMCB1bSAxNjowNyBzY2hyaWViIEphc29uIEd1
bnRob3JwZToKPj4+IE9uIFdlZCwgU2VwIDE2LCAyMDIwIGF0IDExOjUzOjU5QU0gKzAyMDAsIERh
bmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pgo+Pj4+IEJ1dCB3aXRoaW4gdGhlIGRyaXZlciwgd2UgZ2Vu
ZXJhbGx5IG5lZWQgdGhvdXNhbmRzIG9mIHRoZXNlLCBhbmQgdGhhdAo+Pj4+IHRlbmRzIHRvIGJy
aW5nIGZkIGV4aGF1c3Rpb24gcHJvYmxlbXMgd2l0aCBpdC4gVGhhdCdzIHdoeSBhbGwgdGhlIHBy
aXZhdGUKPj4+PiBidWZmZXIgb2JqZWN0cyB3aGljaCBhcmVuJ3Qgc2hhcmVkIHdpdGggb3RoZXIg
cHJvY2VzcyBvciBvdGhlciBkcml2ZXJzIGFyZQo+Pj4+IGhhbmRsZXMgb25seSB2YWxpZCBmb3Ig
YSBzcGVjaWZpYyBmZCBpbnN0YW5jZSBvZiB0aGUgZHJtIGNoYXJkZXYgKGVhY2gKPj4+PiBvcGVu
IGdldHMgdGhlaXIgb3duIG5hbWVzcGFjZSksIGFuZCBvbmx5IGZvciBpb2N0bHMgZG9uZSBvbiB0
aGF0IGNoYXJkZXYuCj4+Pj4gQW5kIGZvciBtbWFwIHdlIGFzc2lnbiBmYWtlIChidXQgdW5pcXVl
IGFjcm9zcyBhbGwgb3BlbiBmZCBvbiBpdCkgb2Zmc2V0cwo+Pj4+IHdpdGhpbiB0aGUgb3ZlcmFs
bCBjaGFyZGV2LiBIZW5jZSBhbGwgdGhlIHBnb2ZmIG1hbmdsaW5nIGFuZCByZS1tYW5nbGluZy4K
Pj4+IEFyZSB0aGV5IHN0aWxsIHVuaXF1ZSBzdHJ1Y3QgZmlsZXM/IEp1c3Qgd2l0aG91dCBhIGZk
bm8/Cj4+IFllcywgZXhhY3RseS4KPiBOb3QgZW50aXJlbHksIHNpbmNlIGRtYS1idWYgaGFwcGVu
ZWQgYWZ0ZXIgZHJtIGNoYXJkZXYsIHNvIGZvciB0aGF0Cj4gaGlzdG9yaWNhbCByZWFzb24gdGhl
IHVuZGVybHlpbmcgc3RydWN0IGZpbGUgaXMgc2hhcmVkLCBzaW5jZSBpdCdzIHRoZQo+IGRybSBj
aGFyZGV2LiBCdXQgc2luY2UgdGhhdCdzIHBlci1kZXZpY2Ugd2UgZG9uJ3QgaGF2ZSBhIHByb2Js
ZW0gaW4KPiBwcmFjdGljZSB3aXRoIGRpZmZlcmVudCB2bV9vcHMsIHNpbmNlIHRob3NlIGFyZSBh
bHNvIHBlci1kZXZpY2UuIEJ1dAo+IHllYWggd2UgY291bGQgZmlzaCBvdXQgc29tZSBlbnRpcmVs
eSBoaWRkZW4gcGVyLW9iamVjdCBzdHJ1Y3QgZmlsZSBpZgo+IHRoYXQncyByZXF1aXJlZCBmb3Ig
c29tZSBtbSBpbnRlcm5hbCByZWFzb25zLgoKSHVpPyBPayB0aGF0IGlzIGp1c3QgdGhlIGhhbmRs
aW5nIGluIGk5MTUsIGlzbid0IGl0PwoKQXMgZmFyIGFzIEkga25vdyB3ZSBjcmVhdGUgYW4gdW5p
cXVlIHN0cnVjdCBmaWxlIGZvciBlYWNoIERNQS1idWYuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgoK
PiAtRGFuaWVsCj4KPj4+PiBIZW5jZSB3aHkgd2UnZCBsaWtlIHRvIGJlIGFibGUgdG8gZm9yd2Fy
ZCBhbGlhc2luZyBtYXBwaW5ncyBhbmQgYWRqdXN0IHRoZQo+Pj4+IGZpbGUgYW5kIHBnb2ZmLCB3
aGlsZSBob3BlZnVsbHkgZXZlcnl0aGluZyBrZWVwcyB3b3JraW5nLiBJIHRob3VnaHQgdGhpcwo+
Pj4+IHdvdWxkIHdvcmssIGJ1dCBDaHJpc3RpYW4gbm90aWNlZCBpdCBkb2Vzbid0IHJlYWxseS4K
Pj4+IEl0IHNlZW1zIHJlYXNvbmFibGUgdG8gbWUgdGhhdCB0aGUgZG1hIGJ1ZiBzaG91bGQgYmUg
dGhlIG93bmVyIG9mIHRoZQo+Pj4gVk1BLCBvdGhlcndpc2UgbGlrZSB5b3Ugc2F5LCB0aGVyZSBp
cyBhIGJpZyBtZXNzIGF0dGFjaGluZyB0aGUgY3VzdG9tCj4+PiB2bWEgb3BzIGFuZCB3aGF0IG5v
dCB0byB0aGUgcHJvcGVyIGRtYSBidWYuCj4+Pgo+Pj4gSSBkb24ndCBzZWUgYW55dGhpbmcgb2J2
aW91c2x5IGFnYWluc3QgdGhpcyBpbiBtbWFwX3JlZ2lvbigpIC0gd2h5IGRpZAo+Pj4gQ2hyaXRp
YW4gbm90aWNlIGl0IGRvZXNuJ3QgcmVhbGx5IHdvcms/Cj4+IFRvIGNsYXJpZnkgSSB0aGluayB0
aGlzIG1pZ2h0IHdvcmsuCj4+Cj4+IEkganVzdCBoYWQgdGhlIHNhbWUgIklzIHRoYXQgbGVnYWw/
IiwgIldoYXQgYWJvdXQgc2VjdXJpdHk/IiwgZXRjLi4KPj4gcXVlc3Rpb25zIHlvdSByYWlzZWQg
YXMgd2VsbC4KPj4KPj4gSXQgc2VlbXMgbGlrZSBhIHNvdXJjZSBvZiB0cm91YmxlIHNvIEkgdGhv
dWdodCBiZXR0ZXIgYXNrIHNvbWVib2R5IG1vcmUKPj4gZmFtaWxpYXIgd2l0aCB0aGF0Lgo+Pgo+
PiBDaHJpc3RpYW4uCj4+Cj4+PiBKYXNvbgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
