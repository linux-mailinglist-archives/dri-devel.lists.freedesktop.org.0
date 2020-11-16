Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420B82B3ABA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 01:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E51C897B5;
	Mon, 16 Nov 2020 00:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BDF897B5;
 Mon, 16 Nov 2020 00:24:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l1so16881585wrb.9;
 Sun, 15 Nov 2020 16:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tbtYPRVwe91AzaVofnak3fBr/OUB5Tnq78kbe0HEPE=;
 b=oWDXG90b/E+THuTqnGX5t11UZnv3ESw8yGkloNnBAkooHieEFgcEzcOulq9Nwn7Adj
 tMd/8Kf2G+iQSx3Jlle4sCtpdQEzpe9un7BSI+Qd4oGUytykNV8GUkHF0kPqxVqdZFg9
 lXS4cwNY6sqb/HrAdTm9O4dUD29Krs3tvgJBizvgH0LumHoFMq/muzX6w44sPYtgX/4o
 g9WUHwmWSSkqEKPR1IWhfF+HQuWa1T/DqDCmrvg4NRtU3PXXMM6pUOsMXeY+t946a6uS
 Mw/C675Ll+aizQwI2EsSxj3TYxgCPh8gt0su9FQ25SJ3uFrQD1jZjuG9F0DbkNmXF7+K
 qcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tbtYPRVwe91AzaVofnak3fBr/OUB5Tnq78kbe0HEPE=;
 b=bwh8RHnbRPFSeMR0bL0YVYpb4cFmKGy26FfFjb7TeYj7qqYtgXDe2UAUkah+wQEwCn
 EiU9xSIq6CGjePUppi/1hQSKIQ/3zV5yabFDUCveJOpN03s90HuPj/XI999fpTcFgRxW
 5qpA2NxL3zMyQI6WV2zhl74TzBV4EB/YsaBvqLy/jrMAu9/H//7oDM+pDQ6v1Rl98vhp
 mBtI4RuwnOuGKjoUAunWvuyJPMZbBAjlsRqptiMUEf5r8/RnsoMtvxMj8outVMQDmFOT
 5qiuJYwOCZ7ee/vqRT62HcQyqAMgHpdW6Iur15aEsoA+k2e24vWA8u5MRlq9ipy50CGE
 Xcdw==
X-Gm-Message-State: AOAM530JyWom5jY+X7d0vnscLSqlMHgUeg0uQ7hg9GreHQgc72TDb8KH
 Fvy2X6qND5c87U/3V1OUhrL9d0QxGTAb17cIqFaHpQRelSk=
X-Google-Smtp-Source: ABdhPJxCYH6jk4uoBN5NncU4HGs8yqTWDEzIsx88wTGAnERsBDJRBw9IqbpdqnDv7Hc7M8BUfOm5aWm1KYHWSNzBNcE=
X-Received: by 2002:adf:eacb:: with SMTP id o11mr16377652wrn.208.1605486272652; 
 Sun, 15 Nov 2020 16:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20200919100850.1639111-1-liushixin2@huawei.com>
 <CAKGbVbuVo3a=Qs3PThrYszh9++D_D+dLVWhpAYOwpVd9_jDnUw@mail.gmail.com>
In-Reply-To: <CAKGbVbuVo3a=Qs3PThrYszh9++D_D+dLVWhpAYOwpVd9_jDnUw@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 16 Nov 2020 08:24:21 +0800
Message-ID: <CAKGbVbv4q7iwNe6g708_NXRGQ5zkQurR6AC82QrNL3eFPihqSQ@mail.gmail.com>
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

Applied to drm-misc-next.

On Sat, Sep 19, 2020 at 6:43 PM Qiang Yu <yuq825@gmail.com> wrote:
>
> Looks good for me, patch is:
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> Regards,
> Qiang
>
> On Sat, Sep 19, 2020 at 5:47 PM Liu Shixin <liushixin2@huawei.com> wrote:
> >
> > Simplify the return expression.
> >
> > Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> > ---
> >  drivers/gpu/drm/lima/lima_devfreq.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> > index bbe02817721b..5914442936ed 100644
> > --- a/drivers/gpu/drm/lima/lima_devfreq.c
> > +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> > @@ -35,18 +35,13 @@ static int lima_devfreq_target(struct device *dev, unsigned long *freq,
> >                                u32 flags)
> >  {
> >         struct dev_pm_opp *opp;
> > -       int err;
> >
> >         opp = devfreq_recommended_opp(dev, freq, flags);
> >         if (IS_ERR(opp))
> >                 return PTR_ERR(opp);
> >         dev_pm_opp_put(opp);
> >
> > -       err = dev_pm_opp_set_rate(dev, *freq);
> > -       if (err)
> > -               return err;
> > -
> > -       return 0;
> > +       return dev_pm_opp_set_rate(dev, *freq);
> >  }
> >
> >  static void lima_devfreq_reset(struct lima_devfreq *devfreq)
> > --
> > 2.25.1
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
