Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891412488D4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 17:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195889AA2;
	Tue, 18 Aug 2020 15:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF2189AA2;
 Tue, 18 Aug 2020 15:12:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so18643248wrl.4;
 Tue, 18 Aug 2020 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K7rzgcMuhB59uSbGxt2+obmcC2a75JDzO+8IEBPn/20=;
 b=LBPbIGYQrU0mHziA4nNdl4eE3cXtppYEvfLXZxMFHqUJCC3aPFJcpOX4uJ04qMnssG
 Ag5clvTZ7KaHp05xI+LCkT46W+mumhbi4uMzTEJ0Zgw7EHw2biiG22cGZvWWi8pxSKUn
 b+v8CHE4M/CZIj/ImziP2Zwe6Qr+5YWvKJ7VWieX7JGRgV9arfMDfkxkIL/t2jBZldOQ
 42hgWUG6W+6+Bo9XvCgOGgt9ZRn/D8ze4gVCG8oUASyzK10IQlJx8mGSCfQnykVQkC+J
 UnF7P+cyJAVXZcDJ/N6ANDnOzFaD1Jc+NLZEKQQKLDOnvlSZiA5g2pYB+cNNfwTlgOBN
 eWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K7rzgcMuhB59uSbGxt2+obmcC2a75JDzO+8IEBPn/20=;
 b=pi7beNgYjLhczsCqHqqaJBW/f2KkI0FTV3RJ4vfjg0VhIROzycwDVHc+7uWT2w5x0J
 R1G2yMGLrSoDnFbfjfwCptrqwUfRlCt7GE8x0vddozpRR/ptcj/1vcy6t28+XSh/zhcE
 me9CfURt4fh4kc4TrJs/977J/31pJ093jKpaD0h7LL08j01o4XSELTOAn4zii5+W8C1a
 s6PW1gEfFWGpLTnUt2Ijoe+PVC40Khbm3t48wRRCjOSt4zFs100XPwQFA/OwZ6tcgjlM
 JI8UlcXXJgswyjkFZte1G5ln8c2BwqGc0U8fxxu/x3Ny4B90pSETJH2yqsT0ejr8R8MI
 4DeQ==
X-Gm-Message-State: AOAM532DBcFi0ywk5tcJFhf7nrRMd7bxqkw4OW5Ne+0kaUwWZdIp19o8
 clLJaK4lwoZ/TUhZLv6Lgex6cyzGPdBcmwofK7k=
X-Google-Smtp-Source: ABdhPJwKdzwEohL5E9SDLCVg0q8nhvUN8RMpxHE73jN/E0C6arJhxxGXiKWPU1nLKhzAjKAWQrer6Yss9Q2RQ13N+mU=
X-Received: by 2002:adf:f485:: with SMTP id l5mr19243697wro.147.1597763527343; 
 Tue, 18 Aug 2020 08:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <a3fcad3f97c258043cd4268ef2c99740@codeaurora.org>
In-Reply-To: <a3fcad3f97c258043cd4268ef2c99740@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Aug 2020 08:12:53 -0700
Message-ID: <CAF6AEGvDN2B-xxecOt+0aaweWohGSKekb3tCerX42T1eOte-ig@mail.gmail.com>
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm-owner@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 3:03 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi,
>
> On 2020-06-01 16:33, Krishna Manikandan wrote:
> > Define shutdown callback for display drm driver,
> > so as to disable all the CRTCS when shutdown
> > notification is received by the driver.
> >
> > This change will turn off the timing engine so
> > that no display transactions are requested
> > while mmu translations are getting disabled
> > during reboot sequence.
> >
> > Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> >
> > Changes in v2:
> >       - Remove NULL check from msm_pdev_shutdown (Stephen Boyd)
> >       - Change commit text to reflect when this issue
> >         was uncovered (Sai Prakash Ranjan)
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> > b/drivers/gpu/drm/msm/msm_drv.c
> > index e4b750b..94e3963 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1322,6 +1322,13 @@ static int msm_pdev_remove(struct
> > platform_device *pdev)
> >       return 0;
> >  }
> >
> > +static void msm_pdev_shutdown(struct platform_device *pdev)
> > +{
> > +     struct drm_device *drm = platform_get_drvdata(pdev);
> > +
> > +     drm_atomic_helper_shutdown(drm);
> > +}
> > +
> >  static const struct of_device_id dt_match[] = {
> >       { .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
> >       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> > @@ -1334,6 +1341,7 @@ static int msm_pdev_remove(struct platform_device
> > *pdev)
> >  static struct platform_driver msm_platform_driver = {
> >       .probe      = msm_pdev_probe,
> >       .remove     = msm_pdev_remove,
> > +     .shutdown   = msm_pdev_shutdown,
> >       .driver     = {
> >               .name   = "msm",
> >               .of_match_table = dt_match,
>
> Any more comments on this patch?

sorry, I managed to overlook this earlier.. I've pulled it in to msm-next

BR,
-R

> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
