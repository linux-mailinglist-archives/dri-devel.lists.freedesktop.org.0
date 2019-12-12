Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677911D5CB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 19:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1FC6E0C5;
	Thu, 12 Dec 2019 18:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574066E0C5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 18:37:20 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id p8so2983665oth.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 10:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a1B/UNGsCwmC1+pJqLAouyE9mmdM7pF8h5qlTzJmepM=;
 b=maPM2tZhprhWJ8fGdLXGtuduyJLqtv8jHVXpR8MsjrvKfxln57l9tx7SQBE0x79WXG
 JTTEeWbwxB40FLQVnC8JWIRLHuRqBkbx+UEO2xiqTJMkqRR43jmWo8/ijA29BMgKxZzF
 pRbaLfVYKjiHG0ZlFXtVu0qJq+wygH/7GfYO2SGZ8flL9t/eDADFMUi8Tbuq2J7dT5XP
 t8KPom5Ai4JBxCwMBA0q5PnOVTN8bnhiFxJrwqdyDmqIJ7DeSRDbzMAmctnec3w8pnzY
 vr4TRtD9EiMW/XRBKaPZ+f32Ro1YFQwuefNhpQg2gHZJWlrOK5MLFhE3Cj0NeKqyMkIA
 npbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a1B/UNGsCwmC1+pJqLAouyE9mmdM7pF8h5qlTzJmepM=;
 b=ci22cdVCT/fnbdyN70cz/CqKTnEZR2Re6zPzGZ+1kr9p2dqa+ZekBGajmuk45a19kU
 3tdsjVDBDGCwfriU2dxl75/QiCM8cBiu7M9FH269d1HLbIBf4yHKeOiVwpE7dwHNNFFN
 M0eQB8meJt4tcIDV47qJYyEhTyJnBbG52ODo1RM/d85z5zZt4cpjNZRSCPQLPCxifdFm
 bmVskfGrfoYnv67KGqlgHl0hur275f8q25C3WoEWz5wKqqP8PbbzOVQ34kQe/IdSUrSU
 mCV2XnSTUnesg9QBW3fHod8zRS1YxYZ8BHFdHVevAVzjsukweOVkxw8MrBKgEh2ZAV94
 66KQ==
X-Gm-Message-State: APjAAAVOWWuaA4ijLL+MfihYTBT6wf3vbBMMbAFTNsGG5a7nW0m8YPWc
 WrHWGPGuxbgZMsnzCE+deGoxroi3m48dWTteQSdTAw==
X-Google-Smtp-Source: APXvYqzGXtxFv/xAOdG4yuw4XMjJzisV/2WrZaI4CvisC/5ifMvFJFK7rjYngU/ZzkzTFlSG0bYUjpSWRdFRyc4eJlM=
X-Received: by 2002:a05:6830:1097:: with SMTP id
 y23mr9517020oto.332.1576175839578; 
 Thu, 12 Dec 2019 10:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20191203172641.66642-1-john.stultz@linaro.org>
 <20191203172641.66642-4-john.stultz@linaro.org>
 <59d42752-e5b1-a1e0-0978-dff0824e2ebd@ti.com>
In-Reply-To: <59d42752-e5b1-a1e0-0978-dff0824e2ebd@ti.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 12 Dec 2019 10:37:08 -0800
Message-ID: <CALAqxLXir0sLSP_94GeoQzw1aD8tGzt1Boc0jrKvcJYZKAQ8pQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH v16 3/5] dma-buf: heaps: Add system heap to dmabuf
 heaps
To: "Andrew F. Davis" <afd@ti.com>
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 12, 2019 at 8:20 AM Andrew F. Davis <afd@ti.com> wrote:
> On 12/3/19 12:26 PM, John Stultz wrote:
> > +static int system_heap_create(void)
> > +{
> > +     struct dma_heap_export_info exp_info;
> > +     int ret = 0;
> > +
> > +     exp_info.name = "system_heap";
>
>
> nit: Would prefer the name just be "system", the heap part is redundant
> given it will be in a "heaps" directory, other heaps don't have that. As
> the heap will be accessed by users using this name:
> (/sys/dma_heap/system_heap) we need to think of it like an ABI and get
> it right the first time. The directory name should probably also be
> plural "heaps" as it is a collection of heaps..

Wish this thought had come up earlier. Again, not bad suggestions,
just a bit late as the patches have been queued in drm-misc-next.

Can you submit a tack-on patch to address this, and we can see about
pulling it in so it lands before the code heads to Linus?

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
