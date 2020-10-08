Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4008286DDF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 07:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4DF6EA22;
	Thu,  8 Oct 2020 05:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0AC6EA22
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 05:03:57 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id q21so4401380ota.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 22:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y4J6xZLLT7X+F7OLOzqqVjMYajEePxtfk9UzEIVuZt0=;
 b=kPUNcT6En9JIRrz2QtGnFe3Selq9hqXUXprs+7y6un8lFV/TiArK5U3JSZO6nA0HXc
 EU4OZInvsC8NfhGrNcJXbKRwIFPmMl52gGu1MbN1wkmVtqNJXZnkisUPsHD1g8cpTvTP
 /vYBDakKhR3/pdkBfiqsry4OoWqlMvulH6vI0ZzHJz2wwj3Xt3EF7CsCwU6oleYGE1xW
 Mn+9FWxvPmlHuAGmHkToJ27FQbxcncnyjXun8PnvmbTdM9TevYBPVs8KoHB/UKiPru74
 oGLab6xbAPZlonR8LD/jDVDjWC/ksf7nTNlNEazWJtI7qa74TS+7TctEknxblIXbVaAW
 cXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y4J6xZLLT7X+F7OLOzqqVjMYajEePxtfk9UzEIVuZt0=;
 b=kLm4y97QQoipijA0nCotvVB4uBYSjRBshjRwkr8augFoQkfiFlYjn8EfJhAmaQIiPk
 7EZY4Y0fTvfPod81mzHivnggX1NQiFLoJnhpP2mvdKSqy9YPTwfRpk34beAxb/+9D6uw
 ov0VVU91pULfRPslwEKB8aFWw6cSbaH7vEfMnxjCWATMotXRf+F0yHvP7fT5LFC19WTL
 ziWAcDutgoPZndfl4x7VSI44RtEjtSBsOLcRy32FrLBtB+d7diINvRpr1hn4Wlaf0LPX
 C66T1/nssQ995FE5dcfPFBRe26uPADkH2xfEdSZpBZQ8fq3VUtjXwGw3R3SO4qu5HKb0
 Gm1A==
X-Gm-Message-State: AOAM532Eqgoq8CSXBhjvFb33ugofWtz8NCxRoPe8NxfcVZjVbAokZhHD
 p/y7xqyL3NzlBe3Rj7x6P3tKat2oNK3Xeg1o7zdGDQ==
X-Google-Smtp-Source: ABdhPJz3Gy6/xfKW2fu6IJ5k2Afzci///E5IEtsLrgMBtd+osJAFKkvJwdqpsc7KPM9P0mBGYQzaZrz31q723RwT+C0=
X-Received: by 2002:a05:6830:196:: with SMTP id
 q22mr3771201ota.221.1602133436666; 
 Wed, 07 Oct 2020 22:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org>
 <20201005134528.GA11644@infradead.org>
In-Reply-To: <20201005134528.GA11644@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 7 Oct 2020 22:03:43 -0700
Message-ID: <CALAqxLWSq3szE40hC_m-qpOOH1193jYLOT1_ZZh-eW9U0gnG8w@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>, ??rjan Eide <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 6:45 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> How is this going to deal with VIVT caches?

Hrm. That's a good question.   I'm not sure I totally have my head
around it but, I guess we could make sure to call
invalidate_kernel_vmap_range() in begin_cpu_access()  and
flush_kernel_vmap_range() in end_cpu_access() rather then exiting out
early as we do now?

Unless you have better guidance?

Worse case we could check CONFIG_CPU_CACHE_VIVT and not register the
system-uncached heap.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
