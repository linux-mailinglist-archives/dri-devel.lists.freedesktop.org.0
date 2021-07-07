Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0633BF052
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 21:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7AF6E104;
	Wed,  7 Jul 2021 19:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D30A6E104
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 19:35:36 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u18so7027591lff.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8r2Sihww/r2eDq532jyXn6fdk4Gdh3BwgDNIfLgaV/E=;
 b=MszDYgh+2NKqhOHbW6T5LEDSW9GergXNfLJILyRlimCcLRDhvW35rAjdXYDUOohkVo
 wHdpvCXENIyxge/RR1xi+LcJozdm2KYSM6ty7uAy2OpcI06vVjK12HCKxqbEndRHk9Cb
 TyANaMtKc4b6zf+KsQEe8ku5flehh9j9ipk0jUaKUQeixBjw+ghFN2nGBgUAoSXGVVb2
 CAoq/zr7DNXYTeimJi4DXHo1zfyu3X1Kk3MwEbq+p+GDEsObLp2GImtWTJWiuPHkHTgo
 cU34/ShPKF6Rem9Fo1O4//yhd3uepwZYFdVbHvlE2UK2DWipfOsqxfPEw9toHb8HxW6H
 0kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8r2Sihww/r2eDq532jyXn6fdk4Gdh3BwgDNIfLgaV/E=;
 b=F7DLcqQtd+FnUm5ipPu5z6zPGK71b2Hhy7I/LztVLttczqx89LGod/q+P1HIuyAz9Q
 rn6JDKaDK++lPrxJ/OMBbPptUiP6LBcrIM2ofmXvpoOfYhaMX9uoO5+8S//u4xtMuJ12
 WTWCwZ66RdI0HcRL/cw8Vyk7lHwwAiUleUg0HSFRxfEP6wonJDGQ8C+IeVff7YMyIzCI
 OFybG/yhGaZRyJRqRFYKq6pmYl5OBkZEbt1ZKY+vvY/95aJE3rAX5TztoQiACcx1zBOh
 tPyruHcPzVC6XHIWh0ik/yWoy7b+A3azVxlmJF56fl3v04RtOA2vT0gXN5T1aIsrweCp
 t/1g==
X-Gm-Message-State: AOAM532nE/bzbmJZafd2NdT7xlyFGn0SGClTTZkpAC3rgPHgGzPUBa/d
 a8FMgQK6L07Nbxa2bvV3w+DQbNS7+qhwKSrDwO9M+A==
X-Google-Smtp-Source: ABdhPJzq0vYBbcbRJcpJ1wm18X49R0cZKa1F2pwLnWsMpB+SU+peQArLpyP1JAM9LeGI4+7Rz1ZU9cgjkoNN3RCUOQg=
X-Received: by 2002:a05:6512:2246:: with SMTP id
 i6mr11859231lfu.7.1625686534805; 
 Wed, 07 Jul 2021 12:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <YOVL1f4m+8ly9fyM@infradead.org>
In-Reply-To: <YOVL1f4m+8ly9fyM@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 7 Jul 2021 12:35:23 -0700
Message-ID: <CALAqxLUubzuLkFxmWjfPQHaFU8EkWuGo7nDhfkgi4wPGHnBoVw@mail.gmail.com>
Subject: Re: page pools, was Re: [PATCH v9 1/5] drm: Add a sharable drm
 page-pool implementation
To: Christoph Hellwig <hch@infradead.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, linux-mm <linux-mm@kvack.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christian Koenig <christian.koenig@amd.com>,
 Mel Gorman <mgorman@suse.de>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>, ??rjan Eide <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 6, 2021 at 11:38 PM Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Jun 30, 2021 at 01:34:17AM +0000, John Stultz wrote:
> > This adds a shrinker controlled page pool, extracted
> > out of the ttm_pool logic, and abstracted out a bit
> > so it can be used by other non-ttm drivers.
>
> Can you explain in detail why you need a differnt page pool over the one
> maintained by the page allocator?  Fragmenting the memory into all kinds
> of pools has lots of downsides, so the upsides need to be explained in
> detail.

So, as Christian mentioned, on the TTM side it's useful, as they are
trying to avoid TLB flushes when changing caching attributes.

For the dmabuf system heap purposes, the main benefit is moving the
page zeroing to the free path, rather than the allocation path. This
on its own doesn't save much, but allows us to defer frees (and thus
the zeroing) to the background, which can get that work out of the hot
path.

thanks
-john
