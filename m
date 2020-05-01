Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9544A1C1C9A
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 20:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A016ED1F;
	Fri,  1 May 2020 18:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0126ED1F;
 Fri,  1 May 2020 18:07:29 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id pg17so8137003ejb.9;
 Fri, 01 May 2020 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u7uWdnXzReMILuWMuJCMVWJ56cZtnobswX6oBH/1+LI=;
 b=vekpM1d56g5fDbCG1IleQHXSiKBdPaYjvbDBn8cEraD0huZTUU0MxRbSdEavQx1Cw6
 EfJ1ajFUGwUjFXkD1gx6qod2jw0GuCJt+K/gaLGFmOmikqEmXlXKAIVA9vZcK0mFbTh8
 yFZyTENfGNSgrpjh0/iLYg3NfLkd7DC/BlT9PotgkO9H6qyhIIgAA3O/vj7dr3oFpyP9
 /GG4sdRG/BtNvbeZokPrWxkUFJF0xSXcU/KH2ys2+PjRGFIgS9gY2wPSXDEIewMNPHFh
 Eg0rDnSqahbXmyU0i/FwPAdU4WNkffDNX0IugVwNMGQhQn/RXBLXvpDHafy6WGRTwWT6
 k2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u7uWdnXzReMILuWMuJCMVWJ56cZtnobswX6oBH/1+LI=;
 b=iBa1edxPI7ZKZBnsB2Pm4421ZaWe4rEVen+PI2n90oqtrfqljN543/8PUiUEMBGJ5+
 mTIokZTsFnaJKQ72BFKZCNCgI5B0bRACFqUj4H9nFeJWqdMYKvw2FaZcJki2Y7dE6nHg
 OusurIpsgal+V06hgf5dKxiDOikOkCKS10enG2UQU+ZndmBny1YSg8RRdEOrzFqmLsfM
 0S91j6L34Kg2A7hasCIbAmuMN57O+DDUyrBaotstHmIvNhRtanUEXb689/iIeJN1NUPT
 0KtIWT3WMV10H6w62U6JjJdoVMQx03yxUrgsu+U4IJ1rBucmeFs9IiLp0Qh4PqFpZ9EZ
 Yp6Q==
X-Gm-Message-State: AGi0PuZNERcibm1GPyJ5UA4KzYn2k07XfvCsTfOloWSQGQjjEIkAb7C+
 3FXbngzVOLDPs7WMGWHn27R41sgjXl7Q32nqJ4g=
X-Google-Smtp-Source: APiQypKGvYoGXVQMOaMMGuLG6ZVr8NMMUDLLVypjF+0BH0k/Zjptcxe8gMGO+JVPHbaw6NNSXzHRZRexKuHsnVIIv94=
X-Received: by 2002:a17:906:970e:: with SMTP id
 k14mr4444610ejx.202.1588356447735; 
 Fri, 01 May 2020 11:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200430192427.4104899-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200430192427.4104899-1-bjorn.andersson@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 1 May 2020 11:07:32 -0700
Message-ID: <CAF6AEGsq8RPX7ttqdMh1rXFUqCmVKWNVfez12sV+5PRaz2X8Uw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix undefined "rd_full" link error
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 12:25 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> rd_full should be defined outside the CONFIG_DEBUG_FS region, in order
> to be able to link the msm driver even when CONFIG_DEBUG_FS is disabled.
>
> Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

thanks,

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_rd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index 732f65df5c4f..fea30e7aa9e8 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -29,8 +29,6 @@
>   * or shader programs (if not emitted inline in cmdstream).
>   */
>
> -#ifdef CONFIG_DEBUG_FS
> -
>  #include <linux/circ_buf.h>
>  #include <linux/debugfs.h>
>  #include <linux/kfifo.h>
> @@ -47,6 +45,8 @@ bool rd_full = false;
>  MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
>  module_param_named(rd_full, rd_full, bool, 0600);
>
> +#ifdef CONFIG_DEBUG_FS
> +
>  enum rd_sect_type {
>         RD_NONE,
>         RD_TEST,       /* ascii text */
> --
> 2.24.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
