Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E159C588965
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 11:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69537112CB7;
	Wed,  3 Aug 2022 09:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA7F10E60C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 09:27:02 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so1451736pjf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 02:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=MVm6QmzipnyToLLkHlXgCnRVhkMCCP5rnBDdZpKvHUM=;
 b=hXZI8q8EVU8SnP+ORDIvV8YS5W6ThAdvCpal5haO3s3myszY4AIx/2AF1Ciz0Uvnt4
 MWz6E8S9aUtYAkTjZeVAActQYVZvTZ+euyf4zfac9VcpQqud8mphEd6Qns0QJeaBAWjB
 k0skGVtX6/78MF3JZwg+pbKSrOiWobOPOT0Q3z/UWe+eOtU8Ud+ZoNZ5paubDSba/O6B
 zRSKLoOcDWAXAObyrqRjLc35OdCx3pFFxp+0TUgBHOlJx1WWbLeqBYP4iSuXI0GFdEGE
 nx9WFu+ebFE61JPrLtnW0/9pM85bR/13tElWoiLDr5AOUaQcE35HciNACBuurw8zADuN
 DGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MVm6QmzipnyToLLkHlXgCnRVhkMCCP5rnBDdZpKvHUM=;
 b=RnvnaY93Dw9DqI9QMtZTgIjyUahCNf1M2d7fU2WHfr1/7ULH1RxmW1wkqEswyOX4uo
 P8TdalUgwSZLIq8h8wLtuMYdr5uHSwRsyxGfejz6b85sCkptC7pKOyQNw1viNX49Uh0j
 7ghW/Vo8SBgL43aLMUzLlueAGs5WnzYK6YPFXjktWaWHIXzdpYqgzI0ImEbvj5UBmdOP
 DBZUnLq6ft5BF/ChzjDhFasStnl5NmWkehiRyplhGSBcxopRlaUZHfOaeKQvoz03FWx5
 u/LFKHAY07OkBkEzYpogl6rB0r5LPPyb8h3anRTLv2o5MfQhKJkCjupBr9Q7g4TcI1Nc
 VVKg==
X-Gm-Message-State: ACgBeo1cw4a7/LS4791J7ySTYZ2CMd5jAZ/9uATkWNlWDrtRtwolpsVd
 mokLb8bUslVdWrZuvawEZg96GdCTe7/7bnn1Ig==
X-Google-Smtp-Source: AA6agR4HSCjsx3al/Z3BmrIGBn74ROpqAVyeeZ6yN8Okjp5/cBWADFKXP740gHNIx1D+PyNEgo9GHecFLiBpBFcCDwU=
X-Received: by 2002:a17:903:264b:b0:16d:b891:593 with SMTP id
 je11-20020a170903264b00b0016db8910593mr26128519plb.133.1659518822112; Wed, 03
 Aug 2022 02:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhUBjkps_2EAkbCpGuLiWVFObLkLuj=3UqbxcuENUNXMkbS9Q@mail.gmail.com>
 <YudX0t/P94a0LKtr@ls3530>
In-Reply-To: <YudX0t/P94a0LKtr@ls3530>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Wed, 3 Aug 2022 17:26:51 +0800
Message-ID: <CAMhUBjk-nounZeqN3xq1Yp7+YG=iG+L2_3e1JOnWTJasiups-w@mail.gmail.com>
Subject: Re: [BUG] video: fbdev: arkfb: Found a divide-by-zero bug which may
 cause DoS
To: Helge Deller <deller@gmx.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 1, 2022 at 12:35 PM Helge Deller <deller@gmx.de> wrote:
>
> * Zheyu Ma <zheyuma97@gmail.com>:
> > I found a bug in the arkfb driver in the latest kernel, which may cause DoS.
> >
> > The reason for this bug is that the user controls some input to ioctl,
> > making 'mode' 0x7 on line 704, which causes hdiv = 1, hmul = 2, and if
> > the pixclock is controlled to be 1, it will cause a division error in
> > the function ark_set_pixclock().
>
> You are right.
> I see in:
>   drivers/video/fbdev/arkfb.c:784: ark_set_pixclock(info, (hdiv * info->var.pixclock) / hmul);
> with hdiv=1, pixclock=1 and hmul=2 you end up with (1*1)/2 = (int) 0.
> and then in
>   drivers/video/fbdev/arkfb.c:504: rv = dac_set_freq(par->dac, 0, 1000000000 / pixclock);
> you'll get a division-by-zero.
>
> > The easiest patch is to check the value of the argument 'pixclock' in
> > the ark_set_pixclock function, but this is perhaps too late, should we
> > do this check earlier? I'm not sure, so I'll report this bug to you.
>
> Yes, I think it should be done earlier.
>
> Geert always mentioned that an invalid pixclock from userspace should be
> rounded up to the next valid pixclock.
> But since I don't have that hardware, I'm not sure how this can be done
> best for this driver.
>
> Do you have the hardware to test?
> If so, could you check the patch below?

Thanks for your patch, it works for me :)

> It should at least prevent the division-by-zero.
> If it works, I'm happy if you could send a final patch...

I've sent a patch to the mailing list, thanks again for your reminder.

regards,

Zheyu Ma
