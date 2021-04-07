Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6153565FD
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B7689829;
	Wed,  7 Apr 2021 08:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF5189829
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 08:03:25 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso871087pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ysz6P9xATvW1FQeoAOxq6tV62TCAmsjSNij/bztrdn4=;
 b=o/5LMQjagAvllv1FW0C6iohuW9mW4dBaVhOXr1Pk7pWDq/KE9mX65b5nA1Bzzanwag
 +RFpkpi0XGmLVFT91DQDCvQKT4tET0B5Z7Hi76NP/5DKkaCqlC4MKNWASCjUUaKetbNd
 BQOHpOmEoY21qIanN+h5LV1NofcYVG7xEZ2yWxxEsAZMtcGcVrZZvxHf1K4Q2IQFd/48
 t7o5UpDN8V1e9BYOJK95cVEfQCVHkyivPxGu7I7FCEDWORgOHDTupcNJdSQx/4JbEXYc
 Fqvbp3dZWYyPqm/TSlCHOMZCXKzbyG0gazYDS9Xie6FUMDuQ8wAmnXab8OUYrXPU8HXd
 xMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ysz6P9xATvW1FQeoAOxq6tV62TCAmsjSNij/bztrdn4=;
 b=OrNhbzwgO/ycmHELu24a7+aNo/stExo9rFPoy4DEISPaLLP3AEu3pcdI5syUWwgB8b
 sVFB7CLUXLpmrpHDOOcK0aIWuN7lMDtI+XlPZxIdr/Z2nd/h2752/kggQGRwSaRMs6FP
 Ns3RI6C5OqFplbVwJykhrm/KnviMNLRHJqxUDkFTjmV8TsCFTzCw4vyd+6K9hj9lBytV
 elKyjPn8q2kqboUwbBe+rLZySLgBtm+yRNH1Oi51fMdHOPLIanTWLda1L0y49tJYKoSE
 W8edYhWH30IIHFCsBm7m4hJxWtgODPD8aEigSAlMi0vMfmOYXLMtK56cgYrglOZPJM1H
 V+dA==
X-Gm-Message-State: AOAM531arnjtuep3h5W9/OllLPOAKFVlE9TPdx09hNQA2q+Di6SpITjm
 KT0hNaWhLMLwPUVI/ec+XAY9iewpmZdjSJ+KPS+Umw==
X-Google-Smtp-Source: ABdhPJzF+g42/bKDLTlY9qetsSZrUD78KLNgSN+3VIfx1JGyGKvSj7fv3RYuv3ijxVh8hTfZTwZjsRTHMV6cgV2emXY=
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr2168432pjh.19.1617782604872; 
 Wed, 07 Apr 2021 01:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210406090733.169989-1-zhangjianhua18@huawei.com>
 <CAG3jFyvC6ozPxQ=TPdPgLAugKky5AhOZGJSiw0Dc3Kn5Pba0cA@mail.gmail.com>
 <d9bd5abf-0293-6155-dee0-20199fed1fc0@huawei.com>
In-Reply-To: <d9bd5abf-0293-6155-dee0-20199fed1fc0@huawei.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 7 Apr 2021 10:03:13 +0200
Message-ID: <CAG3jFyu6YY5pr5bdvqAbzZu0GG0z=PWP+JHL59G26cg0P=563w@mail.gmail.com>
Subject: Re: [PATCH -next] drm/bridge: lt8912b: DRM_LONTIUM_LT8912B select
 GPIOLIB
To: "zhangjianhua (E)" <zhangjianhua18@huawei.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, johnny.chenyi@huawei.com,
 heying24@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Yes, you are right, there are many files reference
> gpiod_set_value_cansleep() and
>
> devm_gpiod_get_optional(). How about add config dependencies for all
> releated

I think this is the way to go and roughly half of the drm bridge
drivers seem to need this change.

Do you mind submitting a series of patches adding this fix for all of
the relevant bridge drivers?

>
> configs or only add config dependencies for the top level config?
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
