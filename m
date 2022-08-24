Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7459F544
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 10:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311DB112B73;
	Wed, 24 Aug 2022 08:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A83112B73
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 08:30:03 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id p5so10801104qvz.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lXgnOAXBrxxj2w0yjUYGD9COtuXV48cnV56Vy6CXruk=;
 b=lvy293hWDNSAVPaTOH/yzVsEQSE22DilCvXvLbCQnDkosmtLJqQArIO9n2dYW7W//4
 jJLj40wpAbMhwMAcIWaJe0YKnXGdc+yWJHlW4I/yHiw1als3KbdbgLeZuguyDGYIqQLt
 ggk8a0oAtpkrBg6QmeM5+6Qxmn5qBVYPp0q/6yaVR9fy7fAK769JIP6h3LOodnkj00BW
 d6oBX/oIJoShEHiVZjoAMlvumbW/3su/Kw0FfAHVp5gCi3MYOAY3uL3Xz7GDGoJZsRbo
 RY+vmXP8mLjxShC50WTXRS0D743S2qa+N/6narY4Di2reXCj9aQnZKin5dr6/lN97NKs
 4A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lXgnOAXBrxxj2w0yjUYGD9COtuXV48cnV56Vy6CXruk=;
 b=rxfvgFViDYXba5uZbvBPA6CvJez23eJHDoNFWMuZz9gtKVpShtRBwH6KRsTildWN2j
 la/TTFl1up3eWellVbsuesA42HGbhk1wAC5PI/BzG+OU2hWNmUiUpnotbTv+0A5tGnxc
 l0FGoctOytXL7r3mSPkJ0rCotnZebsE1/M+AM20cvlYacPlGiWdaBQn1etkvdh0N5zw8
 PhbBua3HSTxaNUbdX4Cb35QUia9KVZsGpbgG4iYBDskt/JPtCMvoTjWIe3oaBBrHTkMR
 pte657CBAVathTXoPox/OYeHwMZrP69AUUYJ40bIzsLzxMJOmgJQyOaCAI+wtHBTLRAs
 bjAA==
X-Gm-Message-State: ACgBeo1Z08ZnSMt4oU6CtineB3GCBkYcUl/3PoUUksAN3v5+QT22rTo7
 GyKvKVo2zmAU4mmaeMoMVFDVLoFjBP7yamZ8d3E9bA==
X-Google-Smtp-Source: AA6agR4PFGlUmWrSndGaFBPWCzCuLvo3D0eA+iwqu92YSadl6GsFrlujyHWIhnsAWDk7vIoq4xgSDGc+CpmWiAxS1+I=
X-Received: by 2002:a0c:a907:0:b0:496:cf4f:2426 with SMTP id
 y7-20020a0ca907000000b00496cf4f2426mr15597412qva.119.1661329802772; Wed, 24
 Aug 2022 01:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-2-dmitry.baryshkov@linaro.org>
 <251f0ce1-05cd-548e-9253-82adbc1038ce@quicinc.com>
In-Reply-To: <251f0ce1-05cd-548e-9253-82adbc1038ce@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Aug 2022 11:29:51 +0300
Message-ID: <CAA8EJpogK9BbrSzgJp+Rb_Op2+JBFsTdQHxpTFz28c2biE8AUw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] drm/msm/mdp5: stop overriding drvdata
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Aug 2022 at 04:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
> > The rest of the code expects that master's device drvdata is the
> > struct msm_drm_private instance. Do not override the mdp5's drvdata.
> >
> > Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Is this just for consistency across mdp5/dpu drivers?
>
> What issue was seen if mdp5's platform data is overwritten?

I think there was a crash in mdp5_destroy, but I did not capture the
log at the moment.

As you can see, the mdp5_destroy() expects to get mdp5_kms pointer
from the drvdata. However the msm_drv_probe sets the drvdata to
msm_drm_private instance. Boom.

>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 19 +++++++++----------
> >   1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index c668a4b27cc6..daf5b5ca7233 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms *kms,
> >                                                         slave_encoder);
> >   }
> >
> > -static void mdp5_destroy(struct platform_device *pdev);
> > +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
> >
> >   static void mdp5_kms_destroy(struct msm_kms *kms)
> >   {
> > @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
> >       }
> >
> >       mdp_kms_destroy(&mdp5_kms->base);
> > -     mdp5_destroy(mdp5_kms->pdev);
> > +     mdp5_destroy(mdp5_kms);
> >   }
> >
> >   #ifdef CONFIG_DEBUG_FS
> > @@ -651,9 +651,8 @@ static int mdp5_kms_init(struct drm_device *dev)
> >       return ret;
> >   }
> >
> > -static void mdp5_destroy(struct platform_device *pdev)
> > +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
> >   {
> > -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> >       int i;
> >
> >       if (mdp5_kms->ctlm)
> > @@ -667,7 +666,7 @@ static void mdp5_destroy(struct platform_device *pdev)
> >               kfree(mdp5_kms->intfs[i]);
> >
> >       if (mdp5_kms->rpm_enabled)
> > -             pm_runtime_disable(&pdev->dev);
> > +             pm_runtime_disable(&mdp5_kms->pdev->dev);
> >
> >       drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
> >       drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
> > @@ -816,8 +815,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
> >               goto fail;
> >       }
> >
> > -     platform_set_drvdata(pdev, mdp5_kms);
> > -
> >       spin_lock_init(&mdp5_kms->resource_lock);
> >
> >       mdp5_kms->dev = dev;
> > @@ -915,7 +912,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
> >       return 0;
> >   fail:
> >       if (mdp5_kms)
> > -             mdp5_destroy(pdev);
> > +             mdp5_destroy(mdp5_kms);
> >       return ret;
> >   }
> >
> > @@ -975,7 +972,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
> >   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
> >   {
> >       struct platform_device *pdev = to_platform_device(dev);
> > -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> > +     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> > +     struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> >
> >       DBG("");
> >
> > @@ -985,7 +983,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
> >   static __maybe_unused int mdp5_runtime_resume(struct device *dev)
> >   {
> >       struct platform_device *pdev = to_platform_device(dev);
> > -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> > +     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> > +     struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> >
> >       DBG("");
> >



-- 
With best wishes
Dmitry
