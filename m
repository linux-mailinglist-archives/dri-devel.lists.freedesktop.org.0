Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13653BD053
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 19:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786486EAB5;
	Tue, 24 Sep 2019 17:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5475A6EAD5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 17:10:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y19so2805842wrd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 10:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzsvNzVxxGu66TV9JBcohv4aSCVQ9N+CrimQFbBQgd8=;
 b=QBbDVVLVjbL43IUjiWtz3bFH465GQKArPZnhM9rObptcUIUOfe/J/ph7GTXXaVyaOS
 vUzAnXtUz79xYutFAfpaabkeuVszVLXivOOvTxy6bh2ku9BdDij6fgXfZDWJ1E8UzQLE
 ckW8GfOZ5iVLqho0fZhvq/X/CHY9ui5dmnMDIFSXfi0Z+8GAFdFBh1LxOBcy4EPZQ2BJ
 6J9KG6vOizW5lnsimJ0J5nHm4PBCF7BvdM+TUbma5qXjSvmyB0Yx1gVQWxvhFqyaAVQW
 umIatE0WFcgpU8EL4Cfk5+8mUuFoPhwqhNUfw8KL5HwNatFunSFN/ZylqKsLlFRBiZCy
 JBXw==
X-Gm-Message-State: APjAAAW6qQ3ir6aGEjgVNPnuEDPipeKUvMAlxYLDMGGudVfxcozfc95m
 dFd+fQEDRRh4OB4alfB0BIgozr6zNC3hIqULkqDRKA==
X-Google-Smtp-Source: APXvYqxqVk/Ef7tRuRa5yYg7CGYD5fX+26kMjdKG9iupv2TCNz/LcROsTFdXtBcLmdx5qsHKQ5/RBLYryihpfqE75YU=
X-Received: by 2002:adf:d08b:: with SMTP id y11mr3579300wrh.50.1569345013696; 
 Tue, 24 Sep 2019 10:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190906184712.91980-2-john.stultz@linaro.org>
 <20190923220807.zuqxthydxybjgoog@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190923220807.zuqxthydxybjgoog@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 24 Sep 2019 10:10:00 -0700
Message-ID: <CALAqxLVmG+wP5KQLY5hnxaYBXdET0Ub4t-hLP54pFhOGLi69KQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 1/5] dma-buf: Add dma-buf heaps framework
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yzsvNzVxxGu66TV9JBcohv4aSCVQ9N+CrimQFbBQgd8=;
 b=q8jLYFvKk4f66UxCLZ8A63C0NiKhzpoKOMGfymSB0xnyU0frpoyznW6vLlXZspsNrz
 woNKByYLsgCno0jpUtp+oOINXF4B5sXpYsOx2K9OD8tOB3lX6dCKdnKd3KowRg4SYS7I
 hfaKWF4yQcP3yeX/e1NOqxR5mUe22hfqufrmnnNn8xnXq3vkjFs6Wg4yOPAPOA/Iarig
 m0tFswFbm6eKTo8I9pMfy/n25vyHvgVoLU5X9FhdlCUs+a9lpq4qAajMbOV09Z/26rjq
 OxgErw3/cO6SB/VvrBmGItIyNuj9g+s0R3tZh2Z4jKC7/R4rke+1OnXq4DA7QMYzNI80
 9D2w==
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
Cc: nd <nd@arm.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMzowOCBQTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFy
a2V5QGFybS5jb20+IHdyb3RlOgo+IE9uZSBtaW5pc2N1bGUgbml0IGZyb20gbWUgYmVsb3csIGJ1
dCB3aGV0aGVyIHlvdSBjaGFuZ2UgaXQgb3Igbm90LCB5b3UKPiBjYW4gYWRkIG15IHItYjoKPgo+
IFJldmlld2VkLWJ5OiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+Cj4KPiBU
aGFua3MgZm9yIHB1c2hpbmcgdGhpcyB0aHJvdWdoIQoKVGhhbmtzIGFnYWluIGZvciB0aGUgcmV2
aWV3ISBJJ2xsIGFkZHJlc3MgeW91ciBpc3N1ZXMgYW5kIHJlc3VibWl0LgoKdGhhbmtzCi1qb2hu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
