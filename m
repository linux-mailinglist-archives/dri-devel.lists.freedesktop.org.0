Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E5F50B563
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 12:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB4110E105;
	Fri, 22 Apr 2022 10:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F0E10E16F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:41:26 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id w187so4357476ybe.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 03:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BB+z/sNpdoQmOp+aeDFGtzesrgj54ahnX85kbOB7QMg=;
 b=abNt8UJyo7oWu4YeugczIcw2HKnt573QtuCIX0kpROHHBTfDZ44GLVwSZbHXFcj6ok
 gtW7g3p/up4ectz36iG/SH6o5V/x/RKjenuuTvxPUt8ZzfiqxUXXgzQDg/tz8MKFNcYz
 ildOPGsN/S1GC5l6LWtEmSveqZrZkIT5Tyw2N5OL8fxmP/vannelo27VcTV/eTKh/mUW
 1+Hm9E6rUbWvwUJaqal6SMegDE135493vMaM0OQefuPmkxB0kMPhI3NtgWSfLemUqvna
 DMIOl1ND9xRdijwsZ/jQP5ysxHcGlkfQdhEQH4TXakrqAiUEA7nymqvQyWfDjWQPSIW6
 lZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BB+z/sNpdoQmOp+aeDFGtzesrgj54ahnX85kbOB7QMg=;
 b=Rim0Ro9WFzQgBg8ewww82fHYBspTt4TtoylYLWORieXwjqdrxp5hYGvraFsgatoj4o
 uvhc26h8EebcMK9tUJlvDPfozRZok2qHNg1c6zeawG2IJo0+trbDfI/BGyXRDk6S3Fss
 WIyywdA4Su5x/ZloT9aMYOJql96rPt+PrFNsqxNL8u0QeXYEWDpQtVyIdP/MModfT6y9
 HdjSXHjdbSLQGQN3t/Uxo1Ob4bOmXD6Cm7nRHdB6LrTKyZP7SfAGgem3bRa2vlL4pVGM
 GtGmkz9NK7JgPBYJ4SydkPCnlyZO+mkI/mKmdXYJSgdI27uaZM1YTq+1sq+Fs7uwnVmE
 hakA==
X-Gm-Message-State: AOAM530PQa0m7pm5mivcHxGCTMc3I+8bRvv7yB8rs+MF+TpGzeXWYaJX
 tB19ek4pdeSykBNzv8IIuLEWtYEIC0KleaogoqNhqw==
X-Google-Smtp-Source: ABdhPJywlbGi8Liw+QkSDej3Yl+pGh+CnUP5xw1RQTvw7UzpZloUGNHHQvZWxVNt0MvxBaCcf9gKq0bKcE3NMiK40DY=
X-Received: by 2002:a05:6902:1547:b0:641:fb0b:4830 with SMTP id
 r7-20020a056902154700b00641fb0b4830mr3946865ybu.175.1650624086191; Fri, 22
 Apr 2022 03:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220422032227.2991553-1-yangyingliang@huawei.com>
In-Reply-To: <20220422032227.2991553-1-yangyingliang@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Apr 2022 13:41:15 +0300
Message-ID: <CAA8EJpq2dNaRgEqrKpKTTfAm1p=QRZd2z1ouguiA6wUoxA9QAA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: check return value after calling
 platform_get_resource_byname()
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jilaiw@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 at 06:10, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> It will cause null-ptr-deref if platform_get_resource_byname() returns NULL,
> we need check the return value.
>
> Fixes: c6a57a50ad56 ("drm/msm/hdmi: add hdmi hdcp support (V3)")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index ec324352e862..07e2ad527af9 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -142,6 +142,10 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>         /* HDCP needs physical address of hdmi register */
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>                 config->mmio_name);
> +       if (!res) {
> +               ret = -EINVAL;
> +               goto fail;
> +       }
>         hdmi->mmio_phy_addr = res->start;
>
>         hdmi->qfprom_mmio = msm_ioremap(pdev, config->qfprom_mmio_name);
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
