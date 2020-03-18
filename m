Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1DA189FE8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43408930F;
	Wed, 18 Mar 2020 15:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611D8892BB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:46:30 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 39so10572295otu.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=id6fBYRzTbPVezHvRzigBUZtyyZNpNKX7bIyeQ3xLJM=;
 b=ZqY5AWHXrV9Z2i8Ua3vsaXc3to2MTtBlwtEXOAVw9RupFkSH1bX6L0cTqQDlwqErWb
 eomul9v2lD950rkiS2a3jZwWiAsWjYXZrR8M08zA59FVXYUq2pYVkUxqdViqpwow6hhW
 FoMJAtslfTAk3nhnW2Vn9bjp2QrldSTw0/1RUEf+XHEPlzHVg8d2h67gK9F5UPDdogwi
 F3cRlXyOuE51QSLJaSnfl8ECEjYS9ZWxtkwcx/YH/PTOxO/A1sk9G67aTh5bQqmoJa5V
 1enPYeqqN2ThSayKVcx8K7gywVPMjaaRznUF+j7FWO5+TRBcx8VpnA4b0TZLaBDDXVe4
 UfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=id6fBYRzTbPVezHvRzigBUZtyyZNpNKX7bIyeQ3xLJM=;
 b=o8QttxJCpb/J7DvZbShVzPSX1n3liG52PF+aI8ILtjo7rVmzVCa+aZlvUAGR+vUWhO
 4NfAxa3goVj+HLBwYxzrPOT7W4LwWYoEC6xdvriX8R6NHaqH0Cpf0F3N9HnPE8t7eGTH
 uwyEMKT376Ak+p87Sj5WtoJdwnI4JjJLzz01Bp/Ln3N6afk/ANAR2K2qspZr0lbx1GKD
 6IvSXs/1ZfmALmMe4o4HjZ0bVs15rtu2Tn7NKo4yXAeYfxZl/yC0dN2Oc76Kn8Ig+uzp
 bHSte0TBvbqJ/wLWf7mrEofmSb6pFaa3h8JmMkhUNq4p75mrNrIGP1HwXwYKPQqIoVB7
 aisw==
X-Gm-Message-State: ANhLgQ15WCRwrDykRyJ53VXEAeh9VXZwjytH5KmVn6tMgRnQzPMelnfR
 Jyht2M5EhQbjEnnYoP+LxxqP+lDfhF7LWuidiKIe+A==
X-Google-Smtp-Source: ADFU+vvX20CIlM83oLPc+apgYzRAvWB4Y3fF6uDgiS0UN5JGeqEbtOLb0rxc9QNhm7ohNQlk5lyNBFi0+55SbHMyakg=
X-Received: by 2002:a05:6830:193:: with SMTP id
 q19mr4286283ota.164.1584546389617; 
 Wed, 18 Mar 2020 08:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200317205643.1028398-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200317205643.1028398-1-daniel.vetter@ffwll.ch>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 18 Mar 2020 21:16:17 +0530
Message-ID: <CAO_48GH1YkA4mvjyQ=88VRrDPc4Kh8fiFsm-MOaNFfWhhaxfbw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Better regex for dma_buf|fence|resv
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, Joe Perches <joe@perches.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

Thanks for the patch.

On Wed, 18 Mar 2020 at 02:26, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> We're getting some random other stuff that we're not really interested
> in, so match only word boundaries. Also avoid the capture group while
> at it.
>
> Suggested by Joe Perches.
>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Joe Perches <joe@perches.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> ---
> v2: No single quotes in MAINTAINERS (Joe)
> v3: Fix typo in commit message (Sam)
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3005be638c2c..ed6088a01bfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5025,7 +5025,7 @@ F:        include/linux/dma-buf*
>  F:     include/linux/reservation.h
>  F:     include/linux/*fence.h
>  F:     Documentation/driver-api/dma-buf.rst
> -K:     dma_(buf|fence|resv)
> +K:     \bdma_(?:buf|fence|resv)\b
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>
>  DMA-BUF HEAPS FRAMEWORK
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
