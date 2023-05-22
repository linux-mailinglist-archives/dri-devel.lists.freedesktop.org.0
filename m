Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4851170BF05
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7657D10E30F;
	Mon, 22 May 2023 13:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F27010E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:02:33 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-562108900acso53564467b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684760552; x=1687352552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y3TaDGc6UXdBjXXUtkfSo09wA01+Q0Bb6oG2mEWLoBY=;
 b=a3q9I6ts05CGT64isT+VAGu13MrUb94QEknKnCkNCrNZT9XINRxdaOJ5zX/9KZM3Nm
 dWkmaVgrgzNj+uKJcIOORFHDcL5q5tn7fR8v0OOXuITVRHgHp2aXXvyHzkYomcBV1cQm
 FIMKvuy1K+SdV73Lxlw7ONkrGejYngLk3PECXA/S37pIRZLBvEHwWMYxTDQqBbM7S13h
 VP9Dol047gDeJmw26Pr+bAZ3+h6z4ElzhIsoPByCzn1fY3wD/EahA1RL/y7FEiJOdu7P
 tXPeoVlkfJfl9/g0e2cg96jPWWgZS+H+phjmFSRksMFjJY/yZ3ldmbHgnRSzGHBvsxY1
 DALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684760552; x=1687352552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y3TaDGc6UXdBjXXUtkfSo09wA01+Q0Bb6oG2mEWLoBY=;
 b=FIDKsB0GvXhFhWGd6p0p2jrQB+6k/gHgXtB/QVImyVhAsH41fzhFiseZCbbLVCymbk
 n1TdjCxQj7DDRRDZCQe45kXYxgRUeGGxv5gJvdyZW4/XutjZjoCuMJrxTSXVJwcV5nus
 wUm7zuPbm8omxlX783iJdAKIfVJ3aNO6xyHSXjaIG/IC3Ow61IXgOoCtZwf7m8iB7Pgo
 D7GH6oZ8kmDBmYSvGqVvnZ3lh4ngI4K+FWZe2Q6X+3MqxKfPcu5h9inu7kquYvTepdcL
 gile/+X30UlF7pxKSglfkeLaQzb5zuP+4y2jyhp8D0XJ8k2EH0G5oE+y3rdqEJw8iFxv
 zlXg==
X-Gm-Message-State: AC+VfDzpTPNlnY/1kURio/9SANCZRUj0a3EAD1sz/eVMqBsUcczZGmpK
 Xg9feFRbXL1ZvANULi8OhkqibPDDSxRr8Wk68PVhjQ==
X-Google-Smtp-Source: ACHHUZ6xF8+yKnUQDlQX7TXAUwQ8uC6kK3HwVT1ocx55TFzO8Yb1WnEXK2/2ib6EIQI+S7jGcPE6z/35OsxRNvqqKpc=
X-Received: by 2002:a81:494e:0:b0:561:e67d:8a35 with SMTP id
 w75-20020a81494e000000b00561e67d8a35mr12130944ywa.35.1684760552308; Mon, 22
 May 2023 06:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
 <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
In-Reply-To: <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 May 2023 16:02:21 +0300
Message-ID: <CAA8EJpo+9M7SgaNk7qd-Z1_e_WBVFRLLr9hGk5n0hLjRpyA4yw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: signedness bug in
 dpu_encoder_phys_cmd_tearcheck_config()
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023 at 11:47, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-22 10:48:01, Dan Carpenter wrote:
> > The "vsync_hz" variable is used to store negative error codes so it
> > needs to be signed for the error checking to work correctly.
>
> Nicely spotted, but it it looks like we have more to fix then.  The type
> returned by dpu_kms_get_clk_rate() is u64:
>
> - Perhaps the int used in this patch is too small (though 19.2MHz vsync
>   clock ought to fit);
> - That function should also return a signed number as part of this
>   contract.

Please also include freedreno@ to the cc list when sending v2.

>
> - Marijn
>
> >
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 74470d068622..b29e6d1ba7f6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -320,7 +320,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> >       struct dpu_hw_tear_check tc_cfg = { 0 };
> >       struct drm_display_mode *mode;
> >       bool tc_enable = true;
> > -     u32 vsync_hz;
> > +     int vsync_hz;
> >       struct dpu_kms *dpu_kms;
> >
> >       if (!phys_enc->hw_pp) {
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
