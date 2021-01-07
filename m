Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 346882EE8C5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 23:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587176E563;
	Thu,  7 Jan 2021 22:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2D66E55E;
 Thu,  7 Jan 2021 22:34:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g25so5696408wmh.1;
 Thu, 07 Jan 2021 14:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5h5f4k/7Y5BLMbqGtHy+4oMGbAtdYGA2ZXVid79BVKY=;
 b=HUpwWq10RcjyHZqCnGb/EYqKvCcD1qS3cbr4FJNM0745wJxF6syd2xwl6YfqaWqQWs
 voCVfb4ixVXzxDBgiRqv2BdrPH7mTqu/fR09+0njGyp65jh610zIVR4yhLddFGRg6kFc
 /Ff0akoVNdCi2B8xb+IWYW3OvrkW3t7Aocy7u3hE8rds4Cn/uj8xo3qFpHAqBgdFFEIp
 qIc9NT6J9W5ZM8S6WwtaB4USBKj8DFxFLIcbmggGoSAtxpHm6CjTnK8FW6Zr1jDA+f+w
 Hy3ctJCapL6ich5EJwaZMR1LHs+6xCDZ4Bla73V2qtyLzb63vUy6p5lWMXYkL22za69i
 XI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5h5f4k/7Y5BLMbqGtHy+4oMGbAtdYGA2ZXVid79BVKY=;
 b=dtz56Mx06aFkfLbiJY4ZpaZn8T9aDgM0jTiCatS3c83zeU9dMf59BT5u0Yqrxkoq7H
 oK7oDLedo5Zr72jzSEOfYM50EW2eA0eOTaoJFzRcpCq5Sh/QMru9WazckLhBCO4PEYUG
 UtSINqrzsZK4Ax9A5fFrPBATf3jpYeWR4sSOMtdacbMEOSQfHp5QlztPyqVfbsWGJQiS
 f2w5Kb4An3EW8kxFJWZR8QuAVbyc9ou7F8niE/We/qcOqYhzBSJ5qux+nXmPof3s5Fsw
 x5rvlg3JwtXNm8Bd/NCOUYZmEiAzE4dq4AVD/KkuJO6H2xVdIIXu58H77n0/4W97MyUm
 QpYw==
X-Gm-Message-State: AOAM5332CJivgM6Lj9+YgoJIcrj+AQS6L4Bjrm1ymmauRoW8E2kJxLbk
 KYB8zskGYciXIXX7BfxxErgo1wtdrgcYwjMdfvo=
X-Google-Smtp-Source: ABdhPJzwN3w3vxCtrqqaHbyIihZjgDGzLQJ1TNyS3Ov2G46nAQoIMjcS8+RXA6CBbUmFUz24Egqu/WF+rdrw1SslT4E=
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr537631wmd.49.1610058860895; 
 Thu, 07 Jan 2021 14:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
 <CAF6AEGt868msEPdZwJTB3YQppwNLaavSsDm1mGznCu1jsSPxCQ@mail.gmail.com>
In-Reply-To: <CAF6AEGt868msEPdZwJTB3YQppwNLaavSsDm1mGznCu1jsSPxCQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 7 Jan 2021 14:36:39 -0800
Message-ID: <CAF6AEGvoG4DUSrsEBpsZV-gc42XnhvgqPWXvwa1SMMk1JoF15w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To: Iskren Chernev <iskren.chernev@gmail.com>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 7, 2021 at 9:20 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Sat, Jan 2, 2021 at 12:26 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:
> >
> > The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
> > != NULL, because aspace is NULL when using vram carveout.
> >
> > Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")
> >
> > Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index c5e61cb3356df..c1953fb079133 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
> >                 struct drm_file *file, struct drm_gem_object *obj,
> >                 uint64_t *iova)
> >  {
> > +       struct msm_drm_private *priv = dev->dev_private;
> >         struct msm_file_private *ctx = file->driver_priv;
> >
> > -       if (!ctx->aspace)
> > +       if (!priv->gpu)
> >                 return -EINVAL;
>
> Does this actually work?  It seems like you would hit a null ptr deref
> in msm_gem_init_vma().. and in general I think a lot of code paths
> would be surprised by a null address space, so this seems like a risky
> idea.

oh, actually, I suppose it is ok, since in the vram carveout case we
create the vma up front when the gem obj is created..

(still, it does seem a bit fragile.. and easy for folks testing on
devices not using vram carvout to break.. hmm..)

BR,
-R

> Maybe instead we should be creating an address space for the vram carveout?
>
> BR,
> -R
>
>
> >         /*
> > --
> > 2.29.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
