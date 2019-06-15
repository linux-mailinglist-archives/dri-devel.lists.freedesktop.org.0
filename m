Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7220246D74
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 03:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2B589250;
	Sat, 15 Jun 2019 01:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD491892ED
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 01:14:56 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id m206so3249493oib.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 18:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YXA5bt0DRqq3Y8upnzIrF6REEJIQ3rcT1NgkB5rI0Pk=;
 b=meDoD84PbAXfSPq/KIndxD0QzuY8IjBNFLT40zrUBC3StmbtA0538rWNSb8rBMMPjr
 SjFgTshHLMtEEyXHI04gzteZHfdTz/x1iL2rXu7Bh11FaUWBMb0qp0+PFECOUHUEFUAj
 /sjdE/gSWcEh4jvSgSPeSlHEwLsIXPeiuY3edpRuqyX7PMLw83KIzRxr8tstfPTpKpVZ
 fyeMzGkzuGtYb0gdxniZ39araQ2/VAx7EYsxgflEn/bCVd0fqgNd+TtD/he5SwoVGxB5
 QIAtupOn055dTEqzvIUGKXCWQigae/2JzwO28pPJ4/0GJo9jfmW7WZTbydrJM3zG9Ji8
 MElw==
X-Gm-Message-State: APjAAAV2jElAqj328nGSHiIHo8sBIL6kmi3oKSj77lYkjixuwuLHKUR2
 /czQY6tgIcFij7JbKh9YUq4Fvug9UIYQ8x+1ok1p6Q==
X-Google-Smtp-Source: APXvYqxqBHyqynWE7/sHeR/K8H8EClnUTPV3/T7OxCVIwp/PZVwUGw1nUJBb42vXH0k1fSGr8eACLhIRKFpd++U1+Gw=
X-Received: by 2002:aca:ec82:: with SMTP id k124mr3500913oih.73.1560561295806; 
 Fri, 14 Jun 2019 18:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <20190614061333.GC7246@lst.de>
In-Reply-To: <20190614061333.GC7246@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 14 Jun 2019 18:14:45 -0700
Message-ID: <CAPcyv4jmk6OBpXkuwjMn0Ovtv__2LBNMyEOWx9j5LWvWnr8f_A@mail.gmail.com>
Subject: Re: dev_pagemap related cleanups
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YXA5bt0DRqq3Y8upnzIrF6REEJIQ3rcT1NgkB5rI0Pk=;
 b=tJmg62m5f5wzjStc/29QDsRE/q4PtUR7a07UcT9A+LpofKKbxhtlmCVhtiJ8URAGLA
 9oK9DJH98vQawRs0h37hjqVTMVMJWvmn1NENWEvQcKiDXa/4ypd31CJaKcQrvB78GOhr
 Qbbk6j3mpA6d1cD9ylhgqzPJxlzijRmQqwiLfaMhhoWCiFA/gFjJw+5MiA0tc2pV/9+G
 Sl4Xc+lFQQumGmBwoeyeK0hlQsDN5BV8kkty0G0+AiFUxphY9dfVKR5wzwo5PVFTO/Jr
 4+9iaNMvBJSAm3MKHtVibI6ZPeuLK1e7+r9sLGzVfNA1FoAErnV7xkbqVG7OP5TKANBO
 dkKQ==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6MTQgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6Mjc6MzlBTSAtMDcw
MCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+ID4gSXQgYWxzbyB0dXJucyBvdXQgdGhlIG52ZGltbSB1
bml0IHRlc3RzIGNyYXNoIHdpdGggdGhpcyBzaWduYXR1cmUgb24KPiA+IHRoYXQgYnJhbmNoIHdo
ZXJlIGJhc2UgdjUuMi1yYzMgcGFzc2VzOgo+Cj4gSG93IGRvIHlvdSBydW4gdGhhdCB0ZXN0PwoK
VGhpcyBpcyB0aGUgdW5pdCB0ZXN0IHN1aXRlIHRoYXQgZ2V0cyBraWNrZWQgb2ZmIGJ5IHJ1bm5p
bmcgIm1ha2UKY2hlY2siIGZyb20gdGhlIG5kY3RsIHNvdXJjZSByZXBvc2l0b3J5LiBJbiB0aGlz
IGNhc2UgaXQgcmVxdWlyZXMgdGhlCm5maXRfdGVzdCBzZXQgb2YgbW9kdWxlcyB0byBjcmVhdGUg
YSBmYWtlIG52ZGltbSBlbnZpcm9ubWVudC4KClRoZSBzZXR1cCBpbnN0cnVjdGlvbnMgYXJlIGlu
IHRoZSBSRUFETUUsIGJ1dCBmZWVsIGZyZWUgdG8gc2VuZCBtZQpicmFuY2hlcyBhbmQgSSBjYW4g
a2ljayBvZmYgYSB0ZXN0LiBPbmUgb2YgdGhlc2Ugd2UnbGwgZ2V0IGFyb3VuZCB0bwptYWtpbmcg
aXQgYXV0b21hdGVkIGZvciBwYXRjaCBzdWJtaXNzaW9ucyB0byB0aGUgbGludXgtbnZkaW1tIG1h
aWxpbmcKbGlzdC4KCmh0dHBzOi8vZ2l0aHViLmNvbS9wbWVtL25kY3RsL2Jsb2IvbWFzdGVyL1JF
QURNRS5tZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
