Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507843BF06A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 21:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800436E1CD;
	Wed,  7 Jul 2021 19:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC4E6E1CD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 19:42:52 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a18so7049620lfs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 12:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LRtFQfyk5rkHzCvBDJ7m/53ib3pszFLVwjo8wznH6UE=;
 b=yFcO6aCHT5Wp8XcHLs3x7QjI1v+tekgMJbmj6pPFaNrWmUZ3yjUxexHb2wvivrLnvk
 wpPtu8QUxvDBn0Z7SDU7DAa/e8ONb2256TAahLeb4MKewzgad9koVgCZx/tc9KSYH8Nk
 MkMQmMz/XSiGUA513D3Y2WGA7AY6rnls41T6Neg+NDC2MyS5DPdVLd+letBRoFYEz5Vy
 XFdsxz/8jbYQwq88kH3vktlGJdUyOxN5GUjfgp9sXS9tdux2jP8qSeBbCa+7nhGIfXzW
 xW3bjO1Su9ioQZNguLLj3A4OlCZGjhI9jOoxP0iPSTjeO0IWgWxPafFneFHgMuxtuEMJ
 nsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LRtFQfyk5rkHzCvBDJ7m/53ib3pszFLVwjo8wznH6UE=;
 b=CJE2r8RNOXAg2NVlmrszR+xAh2lE2ZnWYz35hHU6MAOi1vq/3YBrrHYerKh75Q12BC
 U4WGZJac/vFpqzDAQOlimhQWfusn15SOaCe9w6G7aqoxxu7uPBi5zSlJikvJ/8KQL0JN
 eTpeDkfoVgSRRKo9l3zFZPCGWg1meYPTRQ0hr5bW1eLsBVGR+dhght03pmpj7edgepEg
 2eZk6s+KYreXw9IqakOFBKUZ7GpM2yEwbG3pYDLKjjzEM0A+2kqcQ2+XL8m3bhABZWCA
 pc1veglqeiLearO+34LW4bl8OEfaH93C6O6czmx3ECbpCGjTFyW6tc05VxYiBSPkSQUp
 z3pA==
X-Gm-Message-State: AOAM532XsaFxHFx9vv08JgAIutVnP1ABJafqDdilNSi7RunliPUIG1g4
 kriMBwsgJKlpEqVyp/jz4JwDo0OurFrtQ3UiPZZz+Q==
X-Google-Smtp-Source: ABdhPJwxhl4aUAm4oVA+H8xrPvcXq5kElGbA8grQFD3N2KD69Hh/pYn0WdVnS32vEA1aPDwawe5JdRzQHP5s+cnOh2Y=
X-Received: by 2002:a05:651c:102c:: with SMTP id
 w12mr10051224ljm.170.1625686971167; 
 Wed, 07 Jul 2021 12:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <YOVL1f4m+8ly9fyM@infradead.org>
 <afea8c13-ef8d-7eb1-c362-8d6d1649751d@amd.com>
 <YOVUX1ZmZ3YZpjic@infradead.org>
In-Reply-To: <YOVUX1ZmZ3YZpjic@infradead.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 7 Jul 2021 12:42:40 -0700
Message-ID: <CALAqxLXEcRufetNJo6ZETs4OyFWdWE3uU7_zOzVVcRtkkhYiyA@mail.gmail.com>
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
 Liam Mark <lmark@codeaurora.org>, Christian K??nig <christian.koenig@amd.com>,
 Mel Gorman <mgorman@suse.de>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>, ??rjan Eide <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 7, 2021 at 12:15 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Jul 07, 2021 at 09:10:26AM +0200, Christian K??nig wrote:
> > Well, the original code all this is based on already had the comment that
> > this really belong into the page allocator.
> >
> > The key point is traditionally only GPUs used uncached and write-combined
> > memory in such large quantities that having a pool for them makes sense.
> >
> > Because of this we had this separately to reduce the complexity in the page
> > allocator to handle another set of complexity of allocation types.
> >
> > For the upside, for those use cases it means huge performance improvements
> > for those drivers. See the numbers John provided in the cover letter.
> >
> > But essentially at least I would be totally fine moving this into the page
> > allocator, but moving it outside of TTM already helps with this goal. So
> > this patch set is certainly a step into the right direction.
>
> Unless I'm badly misreading the patch and this series there is nothing
> about cache attributes in this code.  It just allocates pages, zeroes
> them, eventually hands them out to a consumer and registers a shrinker
> for its freelist.
>
> If OTOH it actually dealt with cachability that should be documented
> in the commit log and probably also the naming of the implementation.

So the cache attributes are still managed in the tmm_pool code. This
series just pulls the pool/shrinker management out into common code so
we can use it in the dmabuf heap code without duplicating things.

thanks
-john
