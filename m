Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B845E723
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 16:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C68489E1A;
	Wed,  3 Jul 2019 14:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F029389E1A;
 Wed,  3 Jul 2019 14:51:41 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id r21so2179527otq.6;
 Wed, 03 Jul 2019 07:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axZycKZSZcyIStzOoQyD2ojPY5/riu2hGuM4hesq81Q=;
 b=Jzmk/dxQmKcjCiAY8YgxY+qjvotHyEAvxQm3aV604iBrBXr3gsZucaiM5jkqHkcoGC
 gt4GAIu/pSdlEqLUDa5fKAPhwFSKV7ebVQKkH3wSyV6ze2YIYwwkmGGRptHEl2v88P5E
 0IASZjF3sPSgioiuVcwMCp8QBKSRR15hSQRv+RcSLeULUSZz8dCwnC4/C++cuZb4C3NT
 WJoH+uniUehsWnzdMON7AZlkE9SX2lxgRMwXVxGN0yPPXlCOSgcZfY6rebP9x8Txd9Tq
 UcfySeMrW4BqphMl+XlXjXee8++z8JYen/CQo81hPHBUqhLsoL9JHJCGr9VRxzUA9jIw
 6wkQ==
X-Gm-Message-State: APjAAAUcpgi20Xz2uOoceuUh9j5BXq5L64EAChLV+Wv5CydDK9qWiUZS
 vLM8MMAgdQHczEpf8nMQAR9h+/fxnksB+TL3b3Q=
X-Google-Smtp-Source: APXvYqwYOVEmJCFa7xVvuzB+7mncK391n1cGPo/bTrVlecLX5hdNaT9gKXJ4vigIUtFB6Ge6aUUqEUe9s9ItFaqbGFc=
X-Received: by 2002:a05:6830:8a:: with SMTP id
 a10mr11745736oto.167.1562165501129; 
 Wed, 03 Jul 2019 07:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <744310ce-4546-4406-ad8d-49af0f06cd49@email.android.com>
In-Reply-To: <744310ce-4546-4406-ad8d-49af0f06cd49@email.android.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Jul 2019 15:51:51 +0100
Message-ID: <CACvgo53TPuEVsyfeA5MfWdNEvVm=36+0dmqtYtWgM8Cc6q8Tcg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: introduce DRIVER_FORCE_AUTH
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=axZycKZSZcyIStzOoQyD2ojPY5/riu2hGuM4hesq81Q=;
 b=kzXyczgKiEeVeN3L6CDY53qJnG7E8ceEA16cN1eqJgkBo04q9xYE0QqBoPzt+zfiWK
 4jv36InnscDdqhnTNBMso/X3EHNDheD7r56vaJgbHLSqaTxY0CPSiciUZDHWCPutrQai
 Xu4xxehqw1eYn3B/maKgLsyX+BLWB5ULj+dUPg2hZG0aF+5i1dqvWS4RB2Q2mElJdF1Q
 5lAIKHcByQnxoWpq6p9KNRdCSnXxPMIUl90cxIwb7m9lG5LWfJmTOxl15SbWgF1SrYew
 l+EaOycfy/wLARZliBZOfwjHLfK+uNqsGy125sGyTLVULYtw71esavnKztQni8sncQWU
 IXJQ==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAzIEp1bCAyMDE5IGF0IDE1OjMzLCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiBBbSAwMy4wNy4yMDE5IDE2OjAwIHNjaHJpZWIgRW1p
bCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Ogo+Cj4gT24gV2VkLCAzIEp1bCAy
MDE5IGF0IDE0OjQ4LCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
PiB3cm90ZToKPiA+Cj4gPiBXZWxsIHRoaXMgaXMgc3RpbGwgYSBOQUsuCj4gPgo+ID4gQXMgc3Rh
dGVkIHByZXZpb3VzbHkgcGxlYXNlIGp1c3QgZG9uJ3QgcmVtb3ZlIERSTV9BVVRIIGFuZCBrZWVw
IHRoZSBmdW5jdGlvbmFsaXR5IGFzIGl0IGlzLgo+ID4KPiBBRkFJQ1Qgbm9ib2R5IHdhcyBpbiBm
YXZvdXIgb2YgeW91ciBzdWdnZXN0aW9uIHRvIHJlbW92ZSBEUk1fQVVUSCBmcm9tCj4gdGhlIGhh
bmRsZSB0by9mcm9tIGZkIGlvY2x0cy4KPiBUaHVzIHRoaXMgc2VlbXMgbGlrZSB0aGUgc2Vjb25k
IGJlc3Qgb3B0aW9uLgo+Cj4KPiBXZWxsIGp1c3Qga2VlcCBpdC4gQXMgSSBzYWlkIHBsZWFzZSBk
b24ndCBjaGFuZ2UgYW55dGhpbmcgaGVyZS4KPgo+IERyb3BwaW5nIERSTV9BVVRIIGZyb20gdGhl
IGRyaXZlciBJT0NUTHMgd2FzIHN1ZmZpY2llbnQgdG8gd29yayBhcm91bmQgdGhlIHByb2JsZW1z
IGF0IGhhbmQgZmFyIGFzIEkga25vdy4KPgpXZSBhbHNvIG5lZWQgdGhlIERSTV9BVVRIIGZvciBo
YW5kbGUgdG8vZnJvbSBmZCBvbmVzLiBNZXNhIGRyaXZlcnMgdXNlCnRob3NlIGlvY3Rscy4KCi1F
bWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
