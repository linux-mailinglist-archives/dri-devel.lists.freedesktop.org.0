Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35B234BAB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 21:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577BA6EB46;
	Fri, 31 Jul 2020 19:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E336EB46
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 19:38:19 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id u63so15939155oie.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cp3GygB7F0b136lUhJrRkyNW4lR2kBcOJ00svd2oGS0=;
 b=hRQTBt285hvDUY6CCaz910g2/xt+HvaTmkAFVvlGGkdmkHiPE1mWrZ6J9b98CS3oFF
 4rerhbQBqnGLLScHR+8hvSGAJGGP7HVCGfBf5URhTql94iKw/HXcIx853Ij74GkbeYQu
 z72JXvTJ0rU8caEPLxCkBL4MRokdEX1NcN2rLbiWAK6JWMBWavJM9B38gI1PeAnyws1H
 gt651BF1uJrsSvrDpQlZU+1dw83n7w3F0xuRWk1v5cWG4C7mhK2LPwtt5jkz94BhBR3d
 L5Rbx5xMULzWXTOBpbK36qGb/u4/6bb7abBJrfUfRNub9BusEMQLIXoFn0BNqa57XgUE
 OCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cp3GygB7F0b136lUhJrRkyNW4lR2kBcOJ00svd2oGS0=;
 b=ZBU6i6GI5GH4uWFelw6tj2X/l/AELZ2dqFZTeFvw0Ur9ThJn72Kxr1WtJAvd0o9zaX
 xDoPLJfbY8Y2DlwKc6E9MkYR8szuB76HyoOkXwK0vD5q541Q/wkPRBM25snJDN11FW8Q
 5OWHNy+GWyeD1GDcPEr5PNpJS7ENoDLNfZWvNMJsgvapmUgMJq1SBsUA9eIr9Zg/OXul
 6gd2VBCCS66sy9Cknj4prqFg9sPaW5ueIZIuV46yDG+ZHzEhNSMo+z8xqmadUijDFzJf
 8ysNFwrSOd+GeLj7Bigc5pTyqErEDCjIQvfHAhnMu5IHp29/BMpxcHmmP1FNObDcR82F
 +NEA==
X-Gm-Message-State: AOAM533iPTyHDBfkcTO0a2SERhdfk7DFwTJEmTWN6gwgQT4ahuLcT1o9
 pbTwBfvEHavgevz9rrlPaxvzPT+fDCy50FFjm43eFQ==
X-Google-Smtp-Source: ABdhPJxRdmWM2JVXS+XJYjkXLwgmye2vV//B6mH9jWnOac/U12I6qldoTC6vypuWGHyySsNeb29bO+jhRX9xVpW97f0=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr4344099oif.10.1596224299067; 
 Fri, 31 Jul 2020 12:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
 <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
 <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com>
In-Reply-To: <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 31 Jul 2020 12:38:07 -0700
Message-ID: <CALAqxLVzUnc5CH_pA7h3ygXFPRz05KtNZx+_M3eAXXrm7hhGBQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for
 non-default CMA heap
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 2:32 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
> On 2020/07/29 4:17, John Stultz wrote:
> > Do you have a upstream driver that you plan to make use this new call?
>
> Unfortunately I don't have an upstream driver using this call.
>
> This call is called from dma-buf heaps "importer" or "customer",
> and I only made an example (do nothing) importer driver
> to test the call.
>
> > We want to have in-tree users of code added.
>
> I think this is a generic way to use non-default CMA heaps, however,
> we need in-tree "importer" drivers to want to use non-default CMA heaps.
> I don't find it from now.
>

Yea, I and again, I do agree this is functionality that will be
needed. But we'll need to wait for a user (camera driver, etc which
would utilize the reserved cma region) before we can merge it
upstream. :(  Do let me know if you have an out of tree driver that
would make use of it, and we can see what can be done to help upstream
things.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
