Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D32694C9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 20:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440DB6E53C;
	Mon, 14 Sep 2020 18:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B3E6E544
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 18:26:51 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id z22so1331034ejl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rRCccI3O7Q3cBqCSADJ9p4p+tEsMBm/uVKtxbUUahJg=;
 b=AHU/AtiFLbe3+YZTSiSO41xN3EYAURxPkCRh+hyV2jBoPZbsqwzbhpl0akYfJBMPh2
 GdoV/jU0y46ZvoaNtPW5sVRWLONy7foziuLCeS1APrEX8izp6/it+zrdWHvQUOjPECV8
 kB7W1+i3+4RQmCjcYSgt8GmVX60YbKXvrYQ935YbMGmcC+Y3RrmejwX9MuUqN/4gxW+w
 p9wyDOyjmoAnidi0YOCj7SvrMJ4axu2Wgsuk7CwANUckz/Frkghi87fW2cv/ABBYL0YV
 xb4eWMau1U5Byo4YNt3vlVYn6A8mZH4KW40UkwdZmk/fyI2XhIUesHolLHBTj+uM0sjB
 W+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=rRCccI3O7Q3cBqCSADJ9p4p+tEsMBm/uVKtxbUUahJg=;
 b=Dp95lhVHxGrwMS28vfdlPdf5em01/9HOSQAK91VIKadx3Yt02TuPGgcyZqPV9pFnLH
 CMQ0OZaMPS4OOL7ZQ4gFmrDVxj/CfMdWj2fPyQx7zZBEqnp4PY/URcGBh/rbNuQiF1mE
 6px6dpunYXlyqQLW6ctZTxCuExPwyW3+WBNl2bZEupGooLC+oZXPKNKBIlhkNDSAI/Fk
 nMQo/VlKeJT7rLV7qQpuiChHIUHMO+0qsVKuxjJW4sQzqGpxAwdPkhk/z7vS5+ftWcxU
 eLbJs4/TGhdTWpsYHozBn2iAe62sYB7mZzNYkFPIj8A3GFIw3x0jW4XspB1EcIO6GR5B
 DnkQ==
X-Gm-Message-State: AOAM531bdM1FG1RH9Wjk//XX58M52qNF6NRx2t31xF6k0+Nm2HBMfarP
 zHWVvzum0HH5aLILXMROqxxm6efr3/WFOQ==
X-Google-Smtp-Source: ABdhPJz2+wxT5cFNCOXfBWV9IOT32aJMuEc+G7OyK+aP3oDWfuWU/cXhqKfbYJVkKAeo1FWAagaPJg==
X-Received: by 2002:a17:906:a101:: with SMTP id
 t1mr15720702ejy.203.1600108009977; 
 Mon, 14 Sep 2020 11:26:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b6sm9871930eds.46.2020.09.14.11.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 11:26:49 -0700 (PDT)
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
Date: Mon, 14 Sep 2020 20:26:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914140632.GD1221970@ziepe.ca>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDkuMjAgdW0gMTY6MDYgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gTW9uLCBT
ZXAgMTQsIDIwMjAgYXQgMDM6MzA6NDdQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMTQuMDkuMjAgdW0gMTU6Mjkgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gSGkg
QW5kcmV3LAo+Pj4KPj4+IEknbSB0aGUgbmV3IERNQS1idWYgbWFpbnRhaW5lciBhbmQgRGFuaWVs
IGFuZCBvdGhlcnMgY2FtZSB1cCB3aXRoCj4+PiBwYXRjaGVzIGV4dGVuZGluZyB0aGUgdXNlIG9m
IHRoZSBkbWFfYnVmX21tYXAoKSBmdW5jdGlvbi4KPj4+Cj4+PiBOb3cgdGhpcyBmdW5jdGlvbiBp
cyBkb2luZyBzb21ldGhpbmcgYSBiaXQgb2RkIGJ5IGNoYW5naW5nIHRoZQo+Pj4gdm1hLT52bV9m
aWxlIHdoaWxlIGluc3RhbGxpbmcgYSBWTUEgaW4gdGhlIG1tYXAoKSBzeXN0ZW0gY2FsbAo+IEl0
IGRvZXNuJ3QgbG9vayBvYnZpb3VzbHkgc2FmZSBhcyBtbWFwX3JlZ2lvbigpIGhhcyBhbiBpbnRl
cmVzdGluZyBtaXgKPiBvZiBmaWxlIGFuZCB2bWEtPmZpbGUKPgo+IEVnIGl0IGNhbGxzIG1hcHBp
bmdfdW5tYXBfd3JpdGFibGUoKSB1c2luZyBib3RoIHJvdXRlcwoKVGhhbmtzIGZvciB0aGUgaGlu
dCwgZ29pbmcgdG8gdGFrZSBhIGxvb2sgYXQgdGhhdCBjb2RlIHRvbW9ycm93LgoKPiBXaGF0IGFi
b3V0IHNlY3VyaXR5PyBJcyBpdCBPSyB0aGF0IHNvbWUgb3RoZXIgcmFuZG9tIGZpbGUsIG1heWJl
IGluCj4gYW5vdGhlciBwcm9jZXNzLCBpcyBiZWluZyBsaW5rZWQgdG8gdGhpcyBtbWFwPwoKR29v
ZCBxdWVzdGlvbiwgSSBoYXZlIG5vIGlkZWEuIFRoYXQncyB3aHkgSSBzZW5kIG91dCB0aGlzIG1h
aWwuCgo+Pj4gVGhlIGJhY2tncm91bmQgaGVyZSBpcyB0aGF0IERNQS1idWYgYWxsb3dzIGRldmlj
ZSBkcml2ZXJzIHRvCj4+PiBleHBvcnQgYnVmZmVyIHdoaWNoIGFyZSB0aGVuIGltcG9ydGVkIGlu
dG8gYW5vdGhlciBkZXZpY2UKPj4+IGRyaXZlci4gVGhlIG1tYXAoKSBoYW5kbGVyIG9mIHRoZSBp
bXBvcnRpbmcgZGV2aWNlIGRyaXZlciB0aGVuCj4+PiBmaW5kIHRoYXQgdGhlIHBnb2ZmIGJlbG9u
Z3MgdG8gdGhlIGV4cG9ydGluZyBkZXZpY2UgYW5kIHNvCj4+PiByZWRpcmVjdHMgdGhlIG1tYXAo
KSBjYWxsIHRoZXJlLgo+IFNvIHRoZSBwZ29mZiBpcyBzb21lIHZpcnR1YWxpemVkIHRoaW5nPwoK
WWVzLCBhYnNvbHV0ZWx5LgoKQ2hyaXN0aWFuLgoKPgo+IEphc29uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
