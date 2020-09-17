Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 133AA26E815
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F836E0CF;
	Thu, 17 Sep 2020 22:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6186EC36
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:35:53 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id o16so2379667qkj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4FMmUqw3Ogf5DWfrcaBYE+88tcXzyk3qcn9Gd5hl3YQ=;
 b=j5oYloPvYL7s4CPTt81wv4olgyoI/6IlhT6aI8lDvNqHADWP/JsUZ4WNwSAnarJJVd
 Jdd7y5LK3H4qrJDXIzo4GzxtRtRdSn74TO+sPmBQ+A3UTKrWoV2qqwIgla/t6cN1mEzh
 YgB03e2F1hYq89gJy2In7h5LX8mfdp/lJ8vauS8eQJrPZEuv9vFNxus3W1QS8aEEh2jU
 aNgxQzkQEHZvN34u0lGhLEgUFKJXoYCaI/tF+nC0CovO/q9P121VcOoAOdmqbPSwPlwQ
 9k8ecPtmJZWZCMPSONUM47C13l3uQbZ64/zvk+EFKCwijs/wPUYHVUJBOSzB9UTR274e
 bIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4FMmUqw3Ogf5DWfrcaBYE+88tcXzyk3qcn9Gd5hl3YQ=;
 b=sxeaBPmDwAi2rEItxoYXgTtvcgHa1pR2R9Enr3QYe23J2/ClAai2/Iup1TRY9QFUMm
 zjPFu2EtG/caJjlYFALDUoRDIhu2pWaBWo+Y7pRGg3I4sLHdhgg4K37Ex4pXf5p2L11z
 I1qsiIj+7/obx69puXMrVaGZLRrHf7pG+5KFcZvVQkc5J4uZuA2N4TvigLZNkBSId3mx
 vYr1l3/ElLan2o4klFMYWNfiGxYxignL+XL4KngMm72vIV5Bv6s5YszrP2rBrAD3NB6I
 TtF1n3wCgG2IDtDXXLXbPvPFkyNb/+LIGoKQ+dJVpmuvdK1w3h1p5l51q6X0s4B99STs
 K+/Q==
X-Gm-Message-State: AOAM531B7WgXtSIhojQtwzSt2kzGH/do/oVoC8eqWyTwDasEogd4Fo0z
 yX3ntkYMhz/noGA7oQtmIj8sTg==
X-Google-Smtp-Source: ABdhPJzS5DvFjFRz09F8HD5ZwD/CTVt6TV63hE1mZt++JvtsXfCWDtAegDUHikgXHQCiEAeg2s8xdA==
X-Received: by 2002:a05:620a:15ac:: with SMTP id
 f12mr27633534qkk.19.1600353352699; 
 Thu, 17 Sep 2020 07:35:52 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id m36sm20906770qtd.10.2020.09.17.07.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:35:52 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kIv0p-000VC1-Ed; Thu, 17 Sep 2020 11:35:51 -0300
Date: Thu, 17 Sep 2020 11:35:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917143551.GG8409@ziepe.ca>
References: <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 22:17:03 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMDI6MjQ6MjlQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxNy4wOS4yMCB1bSAxNDoxOCBzY2hyaWViIEphc29uIEd1bnRob3JwZToK
PiA+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDAyOjAzOjQ4UE0gKzAyMDAsIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4gPiA+IEFtIDE3LjA5LjIwIHVtIDEzOjMxIHNjaHJpZWIgSmFzb24gR3Vu
dGhvcnBlOgo+ID4gPiA+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDEwOjA5OjEyQU0gKzAyMDAs
IERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gPiBZZWFoLCBidXQgaXQgZG9l
c24ndCB3b3JrIHdoZW4gZm9yd2FyZGluZyBmcm9tIHRoZSBkcm0gY2hhcmRldiB0byB0aGUKPiA+
ID4gPiA+IGRtYS1idWYgb24gdGhlIGltcG9ydGVyIHNpZGUsIHNpbmNlIHlvdSdkIG5lZWQgYSB0
b24gb2YgZGlmZmVyZW50Cj4gPiA+ID4gPiBhZGRyZXNzIHNwYWNlcy4gQW5kIHlvdSBzdGlsbCBy
ZWx5IG9uIHRoZSBjb3JlIGNvZGUgcGlja2luZyB1cCB5b3VyCj4gPiA+ID4gPiBwZ29mZiBtYW5n
bGluZywgd2hpY2ggZmVlbHMgYWJvdXQgYXMgcmlza3kgdG8gbWUgYXMgdGhlIHZtYSBmaWxlCj4g
PiA+ID4gPiBwb2ludGVyIHdyYW5nbGluZyAtIGlmIGl0J3Mgbm90IGNvbnNpc3RlbnRseSBhcHBs
aWVkIHRoZSByZXZlcnNlIG1hcAo+ID4gPiA+ID4gaXMgdG9hc3QgYW5kIHVubWFwX21hcHBpbmdf
cmFuZ2UgZG9lc24ndCB3b3JrIGNvcnJlY3RseSBmb3Igb3VyIG5lZWRzLgo+ID4gPiA+IEkgd291
bGQgdGhpbmsgdGhlIHBnb2ZmIGhhcyB0byBiZSB0cmFuc2xhdGVkIGF0IHRoZSBzYW1lIHRpbWUg
dGhlCj4gPiA+ID4gdm0tPnZtX2ZpbGUgaXMgY2hhbmdlZD8KPiA+ID4gPiAKPiA+ID4gPiBUaGUg
b3duZXIgb2YgdGhlIGRtYV9idWYgc2hvdWxkIGhhdmUgb25lIHZpcnR1YWwgYWRkcmVzcyBzcGFj
ZSBhbmQgRkQsCj4gPiA+ID4gYWxsIGl0cyBkbWEgYnVmcyBzaG91bGQgYmUgbGlua2VkIHRvIGl0
LCBhbmQgYWxsIHBnb2ZmcyB0cmFuc2xhdGVkIHRvCj4gPiA+ID4gdGhhdCBzcGFjZS4KPiA+ID4g
WWVhaCwgdGhhdCBpcyBleGFjdGx5IGxpa2UgYW1kZ3B1IGlzIGRvaW5nIGl0Lgo+ID4gPiAKPiA+
ID4gR29pbmcgdG8gZG9jdW1lbnQgdGhhdCBzb21laG93IHdoZW4gSSdtIGRvbmUgd2l0aCBUVE0g
Y2xlYW51cHMuCj4gPiBCVFcsIHdoaWxlIHBlb3BsZSBhcmUgbG9va2luZyBhdCB0aGlzLCBpcyB0
aGVyZSBhIHdheSB0byBnbyBmcm9tIGEgVk1BCj4gPiB0byBhIGRtYV9idWYgdGhhdCBvd25zIGl0
Pwo+IAo+IE9ubHkgYSBkcml2ZXIgc3BlY2lmaWMgb25lLgoKU291bmRzIE9LCgo+IEZvciBUVE0g
ZHJpdmVycyB2bWEtPnZtX3ByaXZhdGVfZGF0YSBwb2ludHMgdG8gdGhlIGJ1ZmZlciBvYmplY3Qu
IE5vdCBzdXJlCj4gYWJvdXQgdGhlIGRyaXZlcnMgdXNpbmcgR0VNIG9ubHkuCgpXaHkgYXJlIGRy
aXZlcnMgaW4gY29udHJvbCBvZiB0aGUgdm1hPyBJIHdvdWxkIHRoaW5rIGRtYV9idWYgc2hvdWxk
IGJlCnRoZSB2bWEgb3duZXIuIElJUkMgbW9kdWxlIGxpZmV0aW1lIGNvcnJlY3RuZXNzIGVzc2Vu
dGlhbGx5IGhpbmdzIG9uCnRoZSBtb2R1bGUgb3duZXIgb2YgdGhlIHN0cnVjdCBmaWxlCgo+IFdo
eSBhcmUgeW91IGFza2luZz8KCkknbSB0aGlua2luZyBhYm91dCB1c2luZyBmaW5kX3ZtYSBvbiBz
b21ldGhpbmcgdGhhdCBpcyBub3QKZ2V0X3VzZXJfcGFnZXMoKSdhYmxlIHRvIGdvIHRvIHRoZSB1
bmRlcmx5aW5nIG9iamVjdCwgaW4gdGhpcyBjYXNlIGRtYQpidWYuCgpTbywgdXNlciBWQSAtPiBm
aW5kX3ZtYSAtPiBkbWFfYnVmIG9iamVjdCAtPiBkbWFfYnVmIG9wZXJhdGlvbnMgb24gdGhlCm1l
bW9yeSBpdCByZXByZXNlbnRzCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
