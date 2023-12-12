Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250A780F9E5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 23:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B2310E6C6;
	Tue, 12 Dec 2023 22:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B736310E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 22:04:09 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5d3644ca426so61204027b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 14:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702418649; x=1703023449; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RJY8C1DWpCBLWloqWzk5/jPg3401/emPFTGMZQJWPSo=;
 b=ZuqIVxg49zxwObVW1QpSNkHFv7FOl7f8e5XN7fAyjJsmdV6S7UkSNGvmGbmeJBAdcO
 9vDJWGVEGLnHRl/f7bk1+HeribyAVllaAnSHCMZwoKVTxA7CdK4btlBK+oMMdsZxO8r5
 wAOOtA8P7wTGRr8GgrLir4zKdFRw2vY2PqcF9Rd2wAhFwkYfyKLyQOH6ZY7KTGGNqape
 krNOr5pfnyuFNXuEgChWu86WUoOvJ+AbzhRJqYSKD1zWzkHTC3tFvZYihi2p9tuDcSt0
 bKhUl/rbHrr5zzddMkbK2SDXdK+qU0liqIwx6ZaBHLzeYz7sVmy7K/Dyd+0B+I1nEbZT
 MWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702418649; x=1703023449;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJY8C1DWpCBLWloqWzk5/jPg3401/emPFTGMZQJWPSo=;
 b=mUsUjzzL2J2uApy5Ep8bmxNJZlb5elEs/Vmcw0iJ9MW5bTEEhbX48Ok1oYQWXJDvPb
 jDP37u75/mAU/BQxxlnyrhfMw9t5gY17Q7T/zXiyxrCKhexCgV8Co+9LqUBchj4YF3g0
 Xwe9keg7XqvFdV7LoV0TpfGOnTKpWAEtKbyBuRL4jcDW1bvkGEiVE8y/LbR5yTxAZf0k
 SYnfN8Hvtpr++FkSfG56DFUcO/SuYV8tif6AOixsM7494PAg8BjXGQNSoeXuB1K+nh1I
 82FMMVYGXVNkkz5hk0euTDHLbW1ncIjWwttMNcXJj/FTAlumqFXVbPdT2MGjUXbkn0gD
 DRGQ==
X-Gm-Message-State: AOJu0YzocGCryZKJUIxg+mSL5joRs/x4SKybVegY1f2hXFLM2BFznQyz
 vPkEjyZ355Lrd8gPQgIZ1w6clad4MVI1SHtTvpEmzQ==
X-Google-Smtp-Source: AGHT+IEc9UlLnCrtenTjOxWpVWAwvAo/nKTuRt+2QrFiV7c4g5vWp+h3pcwwc+ssUoUZ+HBsOHFMUA722GrCgvfWqSg=
X-Received: by 2002:a81:52cd:0:b0:5e2:834e:7f76 with SMTP id
 g196-20020a8152cd000000b005e2834e7f76mr441125ywb.41.1702418648867; Tue, 12
 Dec 2023 14:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
 <20231212205254.12422-2-quic_abhinavk@quicinc.com>
 <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
In-Reply-To: <CAA8EJpr4X3RLFPfgfnsA+UpiOkV0eRzw_FnrEFykS908YuV9Aw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 00:03:57 +0200
Message-ID: <CAA8EJpooSO3vR+Kp+XHgwOwQy43CKdUsOJOD3LiQ1LxbyW_39w@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] drm/msm/dpu: add formats check for writeback
 encoder
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 23:30, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 12 Dec 2023 at 22:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > In preparation for adding more formats to dpu writeback add
> > format validation to it to fail any unsupported formats.
> >
> > changes in v4:
> >         - change the failure message of the API
> >           drm_atomic_helper_check_wb_connector_state() to a generic
> >           one in case it checks more errors later and moreoever it
> >           already has debug message to indicate its failure
> >         - change the corresponding DPU_ERROR to DPU_DEBUG in-line with
> >           other atomic_check failure messages
> >
> > changes in v3:
> >         - rebase on top of msm-next
> >         - replace drm_atomic_helper_check_wb_encoder_state() with
> >           drm_atomic_helper_check_wb_connector_state() due to the
> >           rebase
> >
> > changes in v2:
> >         - correct some grammar in the commit text
> >
> > Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > index bb94909caa25..4953d87affa1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
> >  {
> >         struct drm_framebuffer *fb;
> >         const struct drm_display_mode *mode = &crtc_state->mode;
> > +       int ret;
> >
> >         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> >                         phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> > @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
> >                 return -EINVAL;
> >         }
> >
> > +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> > +       if (ret < 0) {
> > +               DPU_DEBUG("wb check connector state failed ret = %d\n", ret);
>
> We already have a debug message in
> drm_atomic_helper_check_wb_connector_state(). Can we please drop this
> one?

If you don't mind, I can just drop it while applying

>
> > +               return ret;
> > +       }
> > +
> >         return 0;
> >  }
> >
> > --
> > 2.40.1
> >
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
