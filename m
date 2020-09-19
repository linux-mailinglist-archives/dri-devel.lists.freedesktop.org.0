Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19164270D25
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 12:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7D6E3EF;
	Sat, 19 Sep 2020 10:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13C16E3EF;
 Sat, 19 Sep 2020 10:43:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c18so7999532wrm.9;
 Sat, 19 Sep 2020 03:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kGmbCRPBREbiuVKFWN0fD+J6+ed58tbBg4isMjD+qM=;
 b=ebqHlK76UnqgjkxZd2BdYuIiQ9Z6kH7xV37jsWwzzILwEma8GIELnfTtc36HP8Wy8j
 sgcaFMqgbGunTKpQWjJHOxHNIx1WzT9vafwatulCs6Pm/+OJntm/siaccKwORgKTn1mr
 PXCLRwTwo9XquHCk3JbBSPoHB2CMLdF+gKYxN2scAVioaS9t81xDCB3bJrM+/aKqm8A3
 dhib8iH/anxadNyn0xHT2jAcVRL4UPpVPmWUaCn88MVfN7O5S72EI70DI9VOdE/qsCut
 btGTZnOLyXftC44W+vqfpCjOqfYI6XfDUNVuQHrz+/UQmqDe05CjqxWq88Cgy//f47WY
 gVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kGmbCRPBREbiuVKFWN0fD+J6+ed58tbBg4isMjD+qM=;
 b=E6NR8lwZ27zqK6it/ov/EAvfrMw9pb/GCOHl4NY5l2thkXTAjXPy8WS4LwoQJAPsyN
 jv9Nd8k5nWCIyXzU30UsPr/RMED0XVrB6bk/B6XfssizqJB6ASG5a85rWhSHdxsdZOKS
 7k/qsXo2yhB0/bazq6QbJaGc+hjCrUzQXW3ibkSPi7itp9jLix3VrviSJ5ElINgp3LNK
 DfTikp3Oi1PJ6PDYS5AmpHvUhUxCmrWTIve2WxFuZ9Gukh6HyYOqhae2/lmH739qo3ep
 tx1W6nh49ZGjtkxRN1z1iW+midgE9dT8s9zNuQETvqhtMYqbzTKtOXKtROREGyJUoihA
 BCuA==
X-Gm-Message-State: AOAM530qIZ2e9jzhsZAo4SMmmqGZ02TmAPhr/smlESHQw5vgVrcVztMn
 UPX5xcHgyo9/E41Xxhy/fZH8+dQEiGBGIFPYa4E=
X-Google-Smtp-Source: ABdhPJz/vZP8XLnKQRDlxWuK+z9Jbl6qgZ368SWPTLjmr2tWnXC05rBMQGN0j4bLmuqNIebOYLz6NJmi7AVwXf1dlSc=
X-Received: by 2002:adf:828f:: with SMTP id 15mr17679406wrc.49.1600512232453; 
 Sat, 19 Sep 2020 03:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200919100850.1639111-1-liushixin2@huawei.com>
In-Reply-To: <20200919100850.1639111-1-liushixin2@huawei.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sat, 19 Sep 2020 18:43:40 +0800
Message-ID: <CAKGbVbuVo3a=Qs3PThrYszh9++D_D+dLVWhpAYOwpVd9_jDnUw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/lima: simplify the return expression of
 lima_devfreq_target
To: Liu Shixin <liushixin2@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good for me, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Sat, Sep 19, 2020 at 5:47 PM Liu Shixin <liushixin2@huawei.com> wrote:
>
> Simplify the return expression.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index bbe02817721b..5914442936ed 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -35,18 +35,13 @@ static int lima_devfreq_target(struct device *dev, unsigned long *freq,
>                                u32 flags)
>  {
>         struct dev_pm_opp *opp;
> -       int err;
>
>         opp = devfreq_recommended_opp(dev, freq, flags);
>         if (IS_ERR(opp))
>                 return PTR_ERR(opp);
>         dev_pm_opp_put(opp);
>
> -       err = dev_pm_opp_set_rate(dev, *freq);
> -       if (err)
> -               return err;
> -
> -       return 0;
> +       return dev_pm_opp_set_rate(dev, *freq);
>  }
>
>  static void lima_devfreq_reset(struct lima_devfreq *devfreq)
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
