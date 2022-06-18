Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86415505B6
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 17:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A378A11B7F0;
	Sat, 18 Jun 2022 15:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5660011B7F0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 15:26:22 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id p31so10383252qvp.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7yl+xWcwVFLnyuaROrrKb0oLsBtG84Oe2zSLgvQZ6no=;
 b=KqY7UVBX2vSSEpwujLQYovb9gYVHEq3Pi80wL996MKdr6yBXPfcsRJfobcBKcQOyhA
 ul2gc27bawxU+xiOUW6Rhj9/3hTqGJsWnoaB2hqov4VIhdwB6X98r9eY0eepbJmRjbUN
 LcWQizgGEnmxWHUZcETlaNwzJ27PiK0Qqg9MrZakcRn748XrGKCeLSTLIVrsYBULvDD7
 JeNQthnoJ3C9XRLzZLnqSHHeN/pVhfqUSVQh0t8DaO5sKVpdnnevLDDUnRFBp4xJqbwq
 SAyEqPKbCP6eqattCeBk8jxTMCX4R4mc8QMofIJ3yesDF6ijarEQci+9jbd/XxDDEXi5
 XF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7yl+xWcwVFLnyuaROrrKb0oLsBtG84Oe2zSLgvQZ6no=;
 b=V23mmJvm/0AIDc/Iylcyah2oO4yGucSPG3kG9aFY55kr3Ian/r7gVp5767lPkS/aED
 +QfPHQ0ijziJLM53ns4w2xS8IJ16/mVyDy9TtjlSQx1+7M5NO8VIk/I89a8t03pFHwtm
 ehhrKH7XUw6ccD15BxFYrbjm2FNZpX7H5iMpV6OFft/FkfFxfVrM9c6RrX6TfAPzTM8a
 q17nNIw9MxUj1P4k/GSLR99CL+y417Mq65nf51LN5crnYuo9gW/72n+WFm6PVwJJZjmX
 yTm934UUvAUquo7GomvehC2Y9ECk+rU0TdimtU03yXEGB6omXB+a6m2lQqqyCzl2B5Vb
 ZXYQ==
X-Gm-Message-State: AJIora8QIs2jV3b5TYEJbZqScvqwHLFuIq+IK+NYBpw9XZKGbsZagPcE
 mV/woVDbmyUwWMmxogWfrsckR++LHa/H2FWxe+Xlvw==
X-Google-Smtp-Source: AGRyM1sR581qRv4JouVElVM2DI+MmhpNUnbQNeyw6yIKDKnyO1veVGBuLoVpJyWMQ0AVIq/eZxUCftWNW75DgwalseY=
X-Received: by 2002:a05:622a:487:b0:304:fbfc:9933 with SMTP id
 p7-20020a05622a048700b00304fbfc9933mr13291540qtx.682.1655565981300; Sat, 18
 Jun 2022 08:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
 <20220615135935.87381-2-dmitry.baryshkov@linaro.org>
 <11998546.O9o76ZdvQC@g550jk>
In-Reply-To: <11998546.O9o76ZdvQC@g550jk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 18 Jun 2022 18:26:10 +0300
Message-ID: <CAA8EJppqpZzF2o-jQGKvFnf62kAdv-2QTsYmXMfw2k7KccNzBg@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/mdss: enable optional core clock for MDP5 MDSS
To: Luca Weiss <luca@z3ntu.xyz>
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 18 Jun 2022 at 17:24, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Hi Dmitry,
>
> On Mittwoch, 15. Juni 2022 15:59:32 CEST Dmitry Baryshkov wrote:
> > Enable (optional) core (MDP_CLK) clock that allows accessing HW_REV
> > registers during the platform init.
> >
>
> I believe you also need to update Documentation/devicetree/bindings/display/
> msm/mdp5.txt with the new clock.

I'm working on converting it to the yaml format.

>
> Regards
> Luca
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index b41848bfff91..f7b4628986b8 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -288,7 +288,7 @@ static int msm_mdss_reset(struct device *dev)
> >  /*
> >   * MDP5 MDSS uses at most three specified clocks.
> >   */
> > -#define MDP5_MDSS_NUM_CLOCKS 3
> > +#define MDP5_MDSS_NUM_CLOCKS 4
> >  static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct
> > clk_bulk_data **clocks) {
> >       struct clk_bulk_data *bulk;
> > @@ -305,6 +305,7 @@ static int mdp5_mdss_parse_clock(struct platform_device
> > *pdev, struct clk_bulk_d bulk[num_clocks++].id = "iface";
> >       bulk[num_clocks++].id = "bus";
> >       bulk[num_clocks++].id = "vsync";
> > +     bulk[num_clocks++].id = "core"; /* for hw_rev access */
> >
> >       ret = devm_clk_bulk_get_optional(&pdev->dev, num_clocks, bulk);
> >       if (ret)
>
>
>
>


-- 
With best wishes
Dmitry
