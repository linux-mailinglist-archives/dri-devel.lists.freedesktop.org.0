Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14ED196895
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 19:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26FA6E14E;
	Sat, 28 Mar 2020 18:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983A16E14E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 18:36:54 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t6so8314949ilj.8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 11:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0HI24KR/yCjlJFsLLO6kOQCApuZY67HrR4f/HELwj00=;
 b=Bjn3/ZMSjI5MgkcB5gKK6N4zFjMVoFTSxcltL3PA99UZvBgXDgAOataat0yBdZVoqE
 NH/0OggUWvfgrio+/Usro0z9coMiVVo64z+Ln5aQgcxfw4feFgn+HtkwH7mrWJCnPGE2
 HKqmsQoZGerQe6AjWMGTP1n8+SNzk6IVEChHV39pY8GLRUYnLiJwMUAZxqCourq0RyLY
 pCPSDwMaFYSKYZfU+gkFh+BeUED8m5CfdGuTbfJazHFg5insTKlELMAZGfCPaPk0Aqk9
 NYm6bxxNZc3SqBkQRE300iLkiF0BDCxKz1y/Kd2Stf2b1/BQQJeA1JOGYlS/PLRrlncv
 0qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0HI24KR/yCjlJFsLLO6kOQCApuZY67HrR4f/HELwj00=;
 b=hHfX+ZwErxeJPaxCW5bfc/2/WEFgZ713e7mbUXlcmb/LLjhfvbeKRbZm+JDmiUvPDQ
 Zd9M+Z5DuJNKpQ7vT4AdcMdZjHcrgDk87aVN+HZpNFqD8ODGVYH8YGqL3mq+uXlT4q4b
 HZI2G6ZV3YpGSMcV7Bl/gWQ39y0Kqu2SopbqWOUcyW/nuLRYTHNy8B3BWT0jJ8KLspVQ
 8eSIjw+mM41dU48zbXuZoMzABoFUBR6GsKVrZv4XBv1j5cSYp3YsR9WbYm2YetbAUswZ
 gy5ZIJDqL3QtfrXI+qeHg7MLCLVEu9KIJVaQMkG6JtOwVbfC/HumBZdSMUFhDZAOvzh4
 rW2w==
X-Gm-Message-State: ANhLgQ2uHjiRx+TPnK5BcI7fEDhMA8z4u4nqYIyTP0C5kvC3WDrJMxzO
 woJd6UkeVfXidnzJz2OA/e+DHOGnOOj5FTZ0aAM=
X-Google-Smtp-Source: ADFU+vvj7xBW8YgzYefpKHgpnS8IasnPvFs7tQ1xw3iG07/FjIZop9WE6ytmhD+MGsO5JAtYB+aIgp90MlIPv8WqjKo=
X-Received: by 2002:a92:cb49:: with SMTP id f9mr4613117ilq.193.1585420613730; 
 Sat, 28 Mar 2020 11:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200327162330eucas1p1b0413e0e9887aa76d3048f86d2166dcd@eucas1p1.samsung.com>
 <20200327162126.29705-1-m.szyprowski@samsung.com>
 <14063C7AD467DE4B82DEDB5C278E8663FFFBFCE1@fmsmsx107.amr.corp.intel.com>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663FFFBFCE1@fmsmsx107.amr.corp.intel.com>
From: Shane Francis <bigbeeshane@gmail.com>
Date: Sat, 28 Mar 2020 18:36:42 +0000
Message-ID: <CABnpCuBLkk2RQovNmcx1U9+oou18cmrd71eQ8=O=ELOM_NcjSA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/prime: fix extracting of the DMA addresses from a
 scatterlist
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 6:31 PM Ruhl, Michael J
<michael.j.ruhl@intel.com> wrote:
> Is there an example of what the scatterlist would look like in this case?
>
> Does each SG entry always have the page and dma info? or could you have
> entries that have page information only, and entries that have dma info only?
>
> If the same entry has different size info (page_len = PAGE_SIZE,
> dma_len = 4 * PAGE_SIZE?), are we guaranteed that the arrays (page and addrs) have
> been sized correctly?
>
> Just trying to get my head wrapped around this.
>
> Thanks,
>
> Mike
>

My understanding is that page_len and dma_len in this case could have
different values (looking at iommu_dma_map_sg within dma-iommu.c),
this seems to add some padding calculated by using the device iova
domain to s_length but sg_dma_len is set to the original length

The scatterlists table can also get reduced down within
"__finalise_sg" possibly causing (if reduced) the dma_len of the last
table elements to be 0 (page_len would not be 0 in this case).

Documentation around looping & accessing scatterlists in DMA-API.txt
states that  sg_dma_address() and sg_dma_len() should be used when
accessing addr and len rather than sg->address and sg->length.

Maybe it would be worth splitting this out into 2 functions to avoid
potential issues with the above use case ?

Regards,

Shane Francis
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
