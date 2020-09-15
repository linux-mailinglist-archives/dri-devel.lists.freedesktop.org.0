Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0726A34A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 12:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8008489CB3;
	Tue, 15 Sep 2020 10:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9FC89CB3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 10:39:51 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id o6so2776279ota.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ulpeSnyY5/ewevGEpTqNXhDdyzWhPxYuGEnSEK0qUFE=;
 b=ig5tEx0h7bfKi5EybZqA+C68o6gYUIfa+RfL190q/C/6enFMceUUZeuDygc7lBryyo
 Y39LD8nxmbQQ2ZpJi/7Bu1MrZHh+9AmFkAC82cd1/Ss7084QYOZc1Q6UWRtMFDibGKuJ
 Yhfx18xPVi60zG4gPhH/H78zP9lEy3I29XQis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ulpeSnyY5/ewevGEpTqNXhDdyzWhPxYuGEnSEK0qUFE=;
 b=L14kslbDlgRqh2E1e1heQ+m6l5OwtepvIPuNCdEL3iC+kkGwKYsVrQdnbqMFL3ew/I
 PfkHWcr11Bk07PyaESHix8b40hTOMOdS0BDGWCDOyEtx+XlOKkIlerdAQPqQ1kk6iJvs
 i4CWcs7rG9M+AagRJXLppMZfiEfPhg8m6Twn+Km8+yZGWRShP0KBvCoUXkPVOCAcMach
 tTjZMjaIaI7OfNaMw8RAUF2w5BUQR/RphP/tZ+Wlh61d0Dq4rhsWtOabZoqNOXphAlrK
 06/yn3nKlaGHZpjPvqR1exguAzfR8bl5qAZg5DUI9j/4PVBhgDq6cZSmA3T1eT8HmL2P
 6vrA==
X-Gm-Message-State: AOAM532B24dOcF3C5+LH43v+t9uiHXzL+RDxc7WuotZr6paNsbFJT7At
 PNnFYEl5qfgUzJwQLlVsrrtQ8ddNDQ6cUgvMo5GD8Q==
X-Google-Smtp-Source: ABdhPJzbKPKIRS8EfyunRCEi31t2CsfncQrKriVKuMZ+LvqfMKqrLvYa64Bhcsp3AhwdlFX/YDNiySv4RihZaKzNLEU=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr11974578otj.303.1600166390649; 
 Tue, 15 Sep 2020 03:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <20200914132920.59183-2-christian.koenig@amd.com>
In-Reply-To: <20200914132920.59183-2-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 15 Sep 2020 12:39:39 +0200
Message-ID: <CAKMK7uHnZgCBUBQ-5D7gCj1v3Z4wKkeO91tefAoJE1B49JFtww@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem-helpers: revert "Redirect mmap for imported
 dma-buf"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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

T24gTW9uLCBTZXAgMTQsIDIwMjAgYXQgMzoyOSBQTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHJldmVydHMgY29tbWl0
IDI2ZDNhYzNjYjA0ZDE3MWE4NjE5NTJlODkzMjRlMzQ3NTk4YTM0N2YuCj4KPiBXZSBuZWVkIHRv
IGZpZ3VyZSBvdXQgaWYgZG1hX2J1Zl9tbWFwKCkgaXMgdmFsaWQgb3Igbm90IGZpcnN0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgoKVGhlIHRyb3VibGUgaXMgdGhhdCBkb2luZyBkbWEtYnVmIG1tYXAgYnkgbG9va2luZyBhdCB0
aGUgc3RydWN0IHBhZ2VzCmJlaGluZCB0aGUgc2cgbGlzdCBhbmQganVzdCBpbnNlcnRpbmcgdGhv
c2UgaW50byB1c2Vyc3BhY2UgZG9lc24ndApyZWFsbHkgd29yayBhbnkgYmV0dGVyLiBZb3Ugc3Rp
bGwgd29uJ3QgZ2V0IHRoZSB1bm1hcF9tYXBwaW5nX3JhbmdlCmFuZCBoZW5jZSBwdGUgc2hvb3Qt
ZG93bi4gU28gbWF5YmUgZG1hX2J1Zl9tbWFwIGZvcndhcmRpbmcgZG9lc24ndAp3b3JrLCBidXQg
dGhpcyBkb2Vzbid0IG1ha2UgaXQgYW55IGJldHRlci4KCkFsc28gY29tbWl0IG1lc3NhZ2Ugc2hv
dWxkIHByb2JhYmx5IGV4cGxhaW4gYSBiaXQgdGhlIGNvbnRleHQgaGVyZSwKbm90IGEgbG90IG9m
IHBlb3BsZSBoYXZlIGJlZW4gaW4gb3VyIHByaXZhdGUgZGlzY3Vzc2lvbiBvbiB0aGlzLgotRGFu
aWVsCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyB8IDMg
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fc2htZW1faGVscGVyLmMKPiBpbmRleCAwYTk1MmYyN2MxODQuLmNkNzI3MzQzZjcyYiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCj4gQEAgLTU5NCw5ICs1
OTQsNiBAQCBpbnQgZHJtX2dlbV9zaG1lbV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgICAgICAgIC8qIFJlbW92ZSB0aGUgZmFr
ZSBvZmZzZXQgKi8KPiAgICAgICAgIHZtYS0+dm1fcGdvZmYgLT0gZHJtX3ZtYV9ub2RlX3N0YXJ0
KCZvYmotPnZtYV9ub2RlKTsKPgo+IC0gICAgICAgaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkKPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIGRtYV9idWZfbW1hcChvYmotPmRtYV9idWYsIHZtYSwgMCk7
Cj4gLQo+ICAgICAgICAgc2htZW0gPSB0b19kcm1fZ2VtX3NobWVtX29iaihvYmopOwo+Cj4gICAg
ICAgICByZXQgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlcyhzaG1lbSk7Cj4gLS0KPiAyLjE3LjEK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
