Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD49854F8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 23:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58186E6B1;
	Wed,  7 Aug 2019 21:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE2889A62
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 21:11:52 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so87894179edq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 14:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=SrcvGHIWjR3UMpKaSZ1PlaWITL+0CA5WgkaZwfXKnCk=;
 b=lmrxt2umbMz0BLhpU1Ja+45ig8+PMGSW19Kn+TmMeUnaAv08Dzf++2x5efoE1qpK4+
 rxGEY+QsCQZ+dErsGgTCyCjjpGrI03gp89u+k3YC8bY4ZMts3E+PIxchAXm8LOFYUSYb
 UOzqtcoGyoxvI7etr5YJ/iDb42yJflUkW6KtyQ8NkvQEuhZRHGORT+IsjZYYqS+AEYir
 f7E/cnqpy7Sr302kLBRI1a1FPGsM0sKQgGpdFvW6bvUH0PAAaZvSiwPi49RJLIApcH8S
 BlkYNw+NibmiwrkwXN+rg0JX/usbXHEvtEqcINWSr30Q9Zc5Ppm5CqzouH5l8mSGnjmV
 eliA==
X-Gm-Message-State: APjAAAUwUjQKIbu1GRxpwbZp5AlC51NJz5d8L9QsK5jJBcSToU6rJS4W
 LSM49WvbV2YSXxOU/tnsuWwFfQ==
X-Google-Smtp-Source: APXvYqwIVP89EwQJCiRFSNbzl6EOWLP2I1EfqtqZreHaxUGQAzuSQ4sgcohuF7//kz8bNQIt1yFIVA==
X-Received: by 2002:a17:906:d78d:: with SMTP id
 pj13mr10075645ejb.301.1565212311417; 
 Wed, 07 Aug 2019 14:11:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id h10sm21627534edh.64.2019.08.07.14.11.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 14:11:50 -0700 (PDT)
Date: Wed, 7 Aug 2019 23:11:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] dma-buf: make dma_fence structure a bit
 smaller
Message-ID: <20190807211148.GI7444@phenom.ffwll.local>
References: <20190807135405.2036-1-christian.koenig@amd.com>
 <156518651926.6198.3556429609794523741@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156518651926.6198.3556429609794523741@skylake-alporthouse-com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=SrcvGHIWjR3UMpKaSZ1PlaWITL+0CA5WgkaZwfXKnCk=;
 b=NbYoxBq2jT+mMfV+ZZqmHIqvU8Z4mUtldIh1dCJnUK1/EFyXIkCBpiKlrJuYv47fxH
 oMcqQPd7Agsm57v2Rlj5ikWQuZINz69XxiGIYA+suQ8tgGm98smBPLyDREN3lDI8+dNg
 ZfKxpf1i4YgnATbA2aOIT5wHO1okmEEATy2ik=
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
Cc: linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDM6MDE6NTlQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgQ2hyaXN0aWFuIEvDtm5pZyAoMjAxOS0wOC0wNyAxNDo1NDowNSkKPiA+
IFRoZSBydWMgYW5kIGNiX2xpc3QgYXJlIG5ldmVyIHVzZWQgYXQgdGhlIHNhbWUgdGltZS4KPiA+
IFRoaXMgc21hbCBjaGFuZ2UgaXMgYWN0dWFsbHkgbWFraW5nIHRoZSBzdHJ1Y3R1cmUgMTYlIHNt
YWxsZXIuCj4gKFRyaXZpYWwgcGFpciBvZiB0eXBvcykKPiAKPiBZZXMuIFdlIGNsZWFyIHRoZSBj
YWxsYmFjayBsaXN0IG9uIGtyZWZfcHV0IHNvIHRoYXQgYnkgdGhlIHRpbWUgd2UKPiByZWxlYXNl
IHRoZSBmZW5jZSBpdCBpcyB1bnVzZWQuIE5vIG9uZSBzaG91bGQgYmUgYWRkaW5nIHRvIHRoZSBj
Yl9saXN0Cj4gdGhhdCB0aGV5IGRvbid0IHRoZW1zZWx2ZXMgaG9sZCBhIHJlZmVyZW5jZSBmb3Is
IHRoaXMgb25seSBub3cgbWFrZXMgZm9yCj4gYSBtdWNoIG1vcmUgc3BlY3RhY3VsYXIgdXNlLWFm
dGVyLWZyZWUuIDopCgpeXiBzdHVmZiB0aGUgYWJvdmUgYXMgYW4gaW5saW5lIGtlcm5lbGRvYyBj
b21tZW50IGludG8gdGhlIHBhdGNoPyBBbmQgaW50bwp0aGUgY29tbWl0IG1lc3NhZ2UgdG9vIHBs
cy4gV2UgbmVlZCBiZXR0ZXIgZG9jcyBmb3IgYWxsIHRoaXMgc2NvcmNlcnkgOi0pCgpUaGFua3Ms
IERhbmllbAoKPiAKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Cj4gLUNocmlzCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0Cj4gSW50ZWwtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ2Z4CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
