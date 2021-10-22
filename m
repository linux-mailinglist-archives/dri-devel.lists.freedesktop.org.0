Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E2437038
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 04:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265CE6E55E;
	Fri, 22 Oct 2021 02:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25436E55E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 02:57:06 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bq11so2133052lfb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 19:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQ7tR0Yp6rf1GJIW4s5NegDfNukJ5qAaGOcznVi/4fI=;
 b=h+Hl0emiqAK+B5ocs80eCdhcXRzi5YMDF968lXPzFxnEUEjZNCV6OZuT38DosVDCnX
 2kd2/6AfNusMc5xZkJ8N/9HOLbumhVHkRiVl+pTu0p8c76KiiCFvZP6csq8e5XzeKi6s
 NKzG9bxPFLEFUUM8MXoHHRBH58n0tfALyHZLNCEXPuZAdHp3IgWsrEtLaIcl/FQ/twrr
 hIQ2l5UiMMeYimNmh9FL25L+JI1EsizIDwRoXofARqjCqxBLfJa5U+iVP1afhGBSql/i
 LQLgTmVowuxTC7rnceq7K+q0QmfkhwHTbf/RdNNeDinD5gd8YVstgSuB3dBRn2olMQi3
 IFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQ7tR0Yp6rf1GJIW4s5NegDfNukJ5qAaGOcznVi/4fI=;
 b=Xbhuimsb2q2OmhW4w7EDhusvUTeFASyVQkna4n8vnp0yhelmGFV+6JCTaztEYZbiuG
 onC68pk4AT74oLT6jzUGFqMaRzAM/kHSoWhwPVqtrgBTrISkncs3HMY8bzZfB0SjQcZ1
 V9XJidjJkQzz8JTrC9Zvn8NMGNqTbYMxpDrU5vCSDVNWQEK5lyAm3Cgax51uqLxIDs7E
 NAhIOU4FM9Z7VjyvOfva4tW1ocyrKbJuYKVSNvuaz0K0w02tsc1NdAYTE13XoH8YWxo7
 TnNyCma/qfyhjH7PY/Jfa/1O4um5D2e8F3iBv+SHjsESc3gyNfNE7itQkFzqVEdCDxZ0
 YYeA==
X-Gm-Message-State: AOAM533dsJsf2fre8TZdaPH4f1KV5gcNTUElPHWHdmLU5yiTa8tHHii+
 iMjWFHsBqPKpyATl5MRJ0f+a+R+zzOuHI+YlSw09Ng==
X-Google-Smtp-Source: ABdhPJxJzM5FMhJLy7C24Ma1EhlhY+qm5a7Z6vGXJYXVhmcGsZqzKAOfVcJhFW3p0QRzG2qT+ZeBiOVY+pqKt+wQAQQ=
X-Received: by 2002:a05:6512:3191:: with SMTP id
 i17mr8670014lfe.485.1634871425112; 
 Thu, 21 Oct 2021 19:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211022014850.22933-1-huangshuosheng@allwinnertech.com>
In-Reply-To: <20211022014850.22933-1-huangshuosheng@allwinnertech.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 21 Oct 2021 19:56:54 -0700
Message-ID: <CALAqxLXNMvaT3OU3Y-aYkH+KJA_g1QSOZNJHqvzt21WPy=6UJw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: heaps: init heaps in subsys_initcall
To: Shuosheng Huang <huangshuosheng@allwinnertech.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 Christian Koenig <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 6:49 PM Shuosheng Huang
<huangshuosheng@allwinnertech.com> wrote:
>
> Some built-in modules will failed to use dma-buf heap to allocate
> memory if the heap drivers are too late to be initialized.
> To fix this issue, move initialization of dma-buf heap drivers in
> subsys_initcall() which is more earlier to be called.

Hey! Thanks so much for sending this out! I appreciate it!

So the change looks pretty straightforward to me, however, the
rationale for it is where we hit problems.

With the upstream kernel, there are not yet any modules that directly
allocate from dmabuf heaps. So in the context of the upstream kernel,
the reasoning doesn't make much sense.

Now, I know folks have their own drivers that want to allocate from
dmabuf heaps, but those haven't been submitted upstream yet.
So maybe can you submit those patches that need this along with this
change so it would make sense as part of a patch series? It would be
trivial to justify including this patch then.

thanks
-john
