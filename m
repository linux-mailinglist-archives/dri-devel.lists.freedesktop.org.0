Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC432528D4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BBD6EA3A;
	Wed, 26 Aug 2020 08:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134816E88C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 08:32:09 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d16so490615lfs.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 01:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8VBcmM6sRKWlq0/anJb0wKs91ISNtH5ktL2MLmE99og=;
 b=X9RY+o6sC9Ppm0S92JcWuGapwVP6vGdg7BjmyO+bVW0rj1WTbhhQsV4pHkqkwAjjaN
 8H/JJC5//XVna28iO68xRVOv9wU5x6YXvvotlGw4lLejKAMz/7Q00mTo0f967W4aMtUw
 fPiG3HQHt/fd2KN89nN8sEf0oVh56pcOds4wS0HQdO+5Lb+PNySRcvEGwgy4lHZefIy5
 rpPA57c8RiRxZCxSfGlU1duSCLz3LMQ8/pSg+8uvHvNSWoz0nBeDuyncKVeR1U7EwtMq
 czWKRkH2JC3rN+Vs1JuY98vwSztqYkw2+2QSwv4wCzy/Zrvk0+76s1xbiZ0f2HRzJS2N
 lsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8VBcmM6sRKWlq0/anJb0wKs91ISNtH5ktL2MLmE99og=;
 b=GK+fJa8nBvko+LevwqBZGvslTo+xjbbymctR2MX71g0SZyP9hOhNr31sUslH+e4plD
 STL6xWn8zA8vrm0Q8GjoOAM+x14ZQobgsPpv4ZhxI2E2TbNF0xA/hbH4TVvZVk7qEWdl
 x3aLSTw2F6pJJgoi+vmCFLreOiymwubvq3x4NCUXySmmrVJXNqoXua0AOyCfVWg8RW/g
 QXLk3cqdut7RRyHBguNu+5rELwWDk3wbT6jLV2Pb8QfffD6W9NvY2KSpr56VlbXdL2yZ
 YYmwOXnZ3mzA504+2pylgARsyGItF1/uc0O3fqTVt0Bf8KD2KOZulLXfwsR63G/vjMDt
 VKrQ==
X-Gm-Message-State: AOAM53346Bo4iybzd4b1ur4LSa4pxIZ9VcZKJxzQvCxv1CKze0IfZ1k/
 LARIj+h5AfZeOe3YNkTjnbEjNw==
X-Google-Smtp-Source: ABdhPJyvP5CCC/9K1+399P66A5Xf4E5azNewtsF/LKST22V5Yw1PmUGF53lGY/lu2kWSsQNejxGZUA==
X-Received: by 2002:ac2:4570:: with SMTP id k16mr4396381lfm.60.1598344327410; 
 Tue, 25 Aug 2020 01:32:07 -0700 (PDT)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
 by smtp.gmail.com with ESMTPSA id f14sm2666979ljp.138.2020.08.25.01.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 01:32:06 -0700 (PDT)
Date: Tue, 25 Aug 2020 10:32:04 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3] tee: convert convert get_user_pages() -->
 pin_user_pages()
Message-ID: <20200825083204.GA2068961@jade>
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
 <20200824211125.1867329-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824211125.1867329-1-jhubbard@nvidia.com>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tee-dev@lists.linaro.org, soc@kernel.org,
 arm@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 02:11:25PM -0700, John Hubbard wrote:
> This code was using get_user_pages*(), in a "Case 2" scenario
> (DMA/RDMA), using the categorization from [1]. That means that it's
> time to convert the get_user_pages*() + put_page() calls to
> pin_user_pages*() + unpin_user_pages() calls.
> 
> Factor out a new, small release_registered_pages() function, in
> order to consolidate the logic for discerning between
> TEE_SHM_USER_MAPPED and TEE_SHM_KERNEL_MAPPED pages. This also
> absorbs the kfree() call that is also required there.
> 
> There is some helpful background in [2]: basically, this is a small
> part of fixing a long-standing disconnect between pinning pages, and
> file systems' use of those pages.
> 
> [1] Documentation/core-api/pin_user_pages.rst
> 
> [2] "Explicit pinning of user-space pages":
>     https://lwn.net/Articles/807108/
> 
> Cc: Jens Wiklander <jens.wiklander@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: tee-dev@lists.linaro.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> OK, one more try, this time actually handling the _USER_MAPPED vs.
> _KERNEL_MAPPED pages!
> 
> thanks,
> John Hubbard
> NVIDIA

Looks good and it works too! :-) I've tested it on my Hikey board with
the OP-TEE test suite.
I'm picking this up.

Thanks,
Jens
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
