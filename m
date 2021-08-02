Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83903DDD69
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 18:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780FA6E0CA;
	Mon,  2 Aug 2021 16:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7100B6E0CA;
 Mon,  2 Aug 2021 16:18:53 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id cg4so4094769qvb.5;
 Mon, 02 Aug 2021 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZqSi2DWJQSHFbeSWRi1dH74yVKtdTqQrPRmLEYWYlbs=;
 b=h/XQdhlILCw/+Q5AVlBwggYYgCsNnJTRn3Z6tqiQg/srd2PFd/5P0LfwY976zgfamt
 Eld7Ds6h/30s7hTfGfyHfhPfU76xhHXb13bScDcPC+XiV1tBNZQaWaRdeX3qiYaWMxQ3
 FmpoEwvQv4H3xkX/sbCP3CVkpVKZdsuP95PtxR4hCh3PuAYTg0bOi1oHP/T3s4qJ1iQh
 y0Hb7Q3hrOymsnDY2hgUm2CmUEOPshqEl/unsvM2yQeaGaYGFn8uNnBe607LszrJoyK0
 LKYHiKhZkHNYeuWo4OJR4+0R3gErVUk1M6pp2VyyE60cmsod8V/CYSdZC7/N8mZJDgjF
 9Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZqSi2DWJQSHFbeSWRi1dH74yVKtdTqQrPRmLEYWYlbs=;
 b=lsyuxPUV2BC8KGX+pTWH1suWwSso7+7y1shjohyrA1DlWFYsmLPzLY1d3Pj8IRgq89
 IN1j/wQ8gE6z/wGNch5fXhRU3XbGldjem3kyRmMcTU9SsL6EAvgWTi6710C1YfENBO7D
 JuICFu7ycsgJQKDT040Jt8WyXP2iGuBP8QT8TimjcoZG1+FhZDxHCeSBpSLQAPXKw09F
 WhhTiVRPC/werNU2yprTMjsfeEqdsGUPUYYTUC+Bsvc7Tv6rIF9GskmSSr0kH82i+x29
 R/TmTnph1YMJ7egagg6VBXl08dk8D/Ei0sP2Bhd0Y9wo6qW4Hur+fcbI4yeK9Op1pSDZ
 DQwA==
X-Gm-Message-State: AOAM531yOc03NzvgsMZnFn/wZ79Ac+/lphW7+JLDqQx73F85KY3hHy7u
 TRTrfmq9W33phO4HOgwg7lrHR98sQ+aL9HqT8dW3jkuF
X-Google-Smtp-Source: ABdhPJwjeKX8dVL7c74Sv+rQlQ8wjBu7odGyPJrq3rHoCjO43yM5Gdqt+HyaXoJwAC2tNgSMrlEBo5d0qlYc/sl1Y10=
X-Received: by 2002:a05:6214:1bcf:: with SMTP id
 m15mr8334112qvc.62.1627921132550; 
 Mon, 02 Aug 2021 09:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210731214211.657280-1-jim.cromie@gmail.com>
 <20210731214211.657280-3-jim.cromie@gmail.com>
In-Reply-To: <20210731214211.657280-3-jim.cromie@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Aug 2021 17:18:41 +0100
Message-ID: <CACvgo50DDp3p=-2mzY8jvzuLo_4_1L+b8=x6ZRERtcVJUHcomQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] moduleparam: add data member to struct kernel_param
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jason Baron <jbaron@akamai.com>, Ashley Thomas <Ashley.Thomas2@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, 
 Wyatt Wood <Wyatt.Wood@amd.com>, Jessica Yu <jeyu@kernel.org>,
 Johan Hovold <johan@kernel.org>, 
 Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
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

Hi Jim,

On Sat, 31 Jul 2021 at 22:42, Jim Cromie <jim.cromie@gmail.com> wrote:

> Use of this new data member will be rare, it might be worth redoing
> this as a separate/sub-type to keep the base case.
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  include/linux/moduleparam.h | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index eed280fae433..e9495b1e794d 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -78,6 +78,7 @@ struct kernel_param {
>                 const struct kparam_string *str;
>                 const struct kparam_array *arr;
>         };
> +       void *data;

Might as well make this "const void *" since it is a compile-time constant?

-Emil
