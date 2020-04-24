Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01741B7631
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 15:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB07789DF9;
	Fri, 24 Apr 2020 13:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A3389DBA;
 Fri, 24 Apr 2020 13:06:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x18so10714906wrq.2;
 Fri, 24 Apr 2020 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T6BmV9aU3wHLuwTYR2JnZifhEP1qgDcCF2kLlXx1DlE=;
 b=ajNuCzq9NWAWO6vE7JrSYoIbk71IqcBHP/w9xA2Pu1mIZ/3Dgu0w/225VtnyCZHr/W
 SPYb8uUsjFid1/R+WYWt6zpM/TC1amkAR1H4CNQfSBEnX0kI71KjWQmNdmvVBTVLeqeg
 JhwB1h63Y0XwtoVckTrMlTdeHaq31EQjOI6S3k+3HF3qTco58GjDyxTfs9di1sSjcmbj
 hdrOzih+WsBC8hRW2V1rkCvec4Aqffnq0NvPUtviXCarxJHcve4TPoTjQKjjFWZQVzbD
 I/EFX9q3fMzX/13i6zWgTHcTL9OdIl8GyFsBV5h7rhH3v6NZiYOW+gnJrNK7bWksY6jQ
 Wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T6BmV9aU3wHLuwTYR2JnZifhEP1qgDcCF2kLlXx1DlE=;
 b=Vl5smGSu464CI27Ly1tlSSSdZODZWg7qo9ONuLgVKWeNSPIKewSVB2QPPjCGYwcY/r
 IEm9KYCu6uWWr23MNsx9hJ32Ow6TrGo1tiDALTJ4Rit5vOuHezvOdBxj2YUFDzecfkB5
 97xUFXRuuXxai2L9Dqfy9THjBe9B4WQlcpuiihG3KMTaPKTuKH2Rpim3PwHpAuXFSt56
 TVVe40jKsEm6+Ti5JO6FfOOaPG5pnLPlGRKVzlzxhtVsgaU6T6eervN9WgAN5TwJ36pT
 aHWlCRtbqMIT8mXWUMEgD/aKfQskQQhUamMpgbHVVa17vEApv3cLb2lBmt8n+CMT0BW/
 9RPA==
X-Gm-Message-State: AGi0PuZwuN1+MXmGWAleuiwsm6Syo3tH1NceSPt53yjBbsStiv+fE0+Q
 Jt1G3iwsoUf3R6GUFkZ9QqzCaZbsMXfw1bMGjpM=
X-Google-Smtp-Source: APiQypLbol9hVDMySnHC0dxRszuTvAAshRW9IE7h5Gv5F3PMmuhdkKOcMD9PT/j1uuEdsywKtYErMpxsWKyADp3nOqw=
X-Received: by 2002:a05:6000:8f:: with SMTP id
 m15mr11046714wrx.19.1587733610285; 
 Fri, 24 Apr 2020 06:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <de475904091400ef6c123285f221094654d96d35.1587509150.git.robin.murphy@arm.com>
 <CAKGbVbtGxzpnSu2Hyb9LmN40mN=EQS=N2A1B8=Ac0SX+9z2w9Q@mail.gmail.com>
In-Reply-To: <CAKGbVbtGxzpnSu2Hyb9LmN40mN=EQS=N2A1B8=Ac0SX+9z2w9Q@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 24 Apr 2020 21:06:38 +0800
Message-ID: <CAKGbVbvg-hpTCyA1F=dyEQkQdORY2so2vwZzKV8AZ+HWGfefxQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/lima: Clean up IRQ warnings
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: lima@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

Thanks,
Qiang

On Wed, Apr 22, 2020 at 9:29 AM Qiang Yu <yuq825@gmail.com> wrote:
>
> Looks good for me, patch 1&2 are:
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> Regards,
> Qiang
>
> On Wed, Apr 22, 2020 at 6:51 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > Use the optional form of platform_get_irq() for blocks that legitimately
> > may not be present, to avoid getting an annoying barrage of spurious
> > warnings for non-existent PPs on configurations like Mali-450 MP2.
> >
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> >  drivers/gpu/drm/lima/lima_device.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
> > index 247f51fd40a2..c334d297796a 100644
> > --- a/drivers/gpu/drm/lima/lima_device.c
> > +++ b/drivers/gpu/drm/lima/lima_device.c
> > @@ -171,8 +171,10 @@ static void lima_regulator_fini(struct lima_device *dev)
> >
> >  static int lima_init_ip(struct lima_device *dev, int index)
> >  {
> > +       struct platform_device *pdev = to_platform_device(dev->dev);
> >         struct lima_ip_desc *desc = lima_ip_desc + index;
> >         struct lima_ip *ip = dev->ip + index;
> > +       const char *irq_name = desc->irq_name;
> >         int offset = desc->offset[dev->id];
> >         bool must = desc->must_have[dev->id];
> >         int err;
> > @@ -183,8 +185,9 @@ static int lima_init_ip(struct lima_device *dev, int index)
> >         ip->dev = dev;
> >         ip->id = index;
> >         ip->iomem = dev->iomem + offset;
> > -       if (desc->irq_name) {
> > -               err = platform_get_irq_byname(dev->pdev, desc->irq_name);
> > +       if (irq_name) {
> > +               err = must ? platform_get_irq_byname(pdev, irq_name) :
> > +                            platform_get_irq_byname_optional(pdev, irq_name);
> >                 if (err < 0)
> >                         goto out;
> >                 ip->irq = err;
> > --
> > 2.23.0.dirty
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
