Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F67943C2D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7386D10E831;
	Thu,  1 Aug 2024 00:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tvtgMDT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684BB10E831
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 00:34:58 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-65f880c56b1so49609977b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 17:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722472497; x=1723077297; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M/CELQaNvMQTBTPJnHhuNUlt/nKrqYgz+WkyNAnHqFw=;
 b=tvtgMDT9WWCD+EUdiUGJJz9EWIL4HHA5d9XRbgsOEteWGzP5CBqfrpBc3gx+rfAdHC
 qLyJxWdY+n8MMhGbD8/iIz/S/moKcsxx0FX0UBBWm8WZTenoe7le6Z9YzRoGsMbTvBOY
 zwnHTzQJBbtOqZ+zwZOhwBvwQ6cq3LprYol1CzQvo93MoWFZOJ97BjLUgIfpyLCDT2LV
 8gEelrM02se5qsEKNv/lBs1W5eO4Kqxk9wTM0Aq7KwqY1brkDlhvTbfcjOCgEb5Z6C6h
 HLndTDapgyoNRy64zwxGnX0smBbmOGa9fxNG786BMqSGTifW7fSFGLVUudbmYRwIEkum
 h5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722472497; x=1723077297;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M/CELQaNvMQTBTPJnHhuNUlt/nKrqYgz+WkyNAnHqFw=;
 b=OGK2ZLyPRoEnZqEzeYKnqQMDkr0wc3YRclQfgfzYiV5gRPGkmf5Mjum9KuDW9YOk9R
 6D4CBNV+GI/t87JHcfKbFL6a/HXgFlEzYv41Fbqh5zKhy1YB9eYpnLwP4XuDfKDqJp3C
 NDe3iQWoYaJlNC1bIS9ROzszzfXHDiCU+VuLM4KOrFIU+wiSOTtYemigreJsUyl2Sl/W
 JkOLfbdts1pJp+e3NSMPfdNGzRDRZMadMtrXlhNdWD7/xSK449FGD6pWCatLpl66WQwA
 dYbcupNFBBpDyMVLb38Yb6xhC1mewleHPLSO8ZbnS027+VeRSHp827fanQ8a+DTlw08u
 EJGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHY8JAX/jp4Y29Q06WSVEMi48NqZ7Lb2aRrPK8zQzOw9CKllzT45pfu4gG0j+kfRIUjg/jWZ4hMhB4fn52xhzCpKTMzwu8K9WeIvi/Ifag
X-Gm-Message-State: AOJu0Yw05zbnwiLCrl7m44QSjNW7A45+8hi7aKiBegCDhgyutnchNjQe
 LKqPAXqwIq2FIhX1g9fsI+rZ/DHiKCxCn5mjRLl7VQdXZbnx8bpcGBvIvnHCA1z2UsDbNKSSevH
 sBefQJNiOcWIJPYBpzRBSybkN+FO/5vZrOBsubA==
X-Google-Smtp-Source: AGHT+IGaBGM1AayDPzuZZA1cyOtTi6oJv13xWErQOdKjC4oVXJkICQP5cLrmmu5xwR7QC6Y4C3u8Iwj/z6IN0YJq5QE=
X-Received: by 2002:a0d:f3c6:0:b0:650:a1cb:b122 with SMTP id
 00721157ae682-6874bc631bcmr9370347b3.27.1722472497251; Wed, 31 Jul 2024
 17:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-2-5efb90cbb8be@linaro.org>
 <b2cceeb8-fe81-4212-9b07-b70cad8d3b9b@quicinc.com>
In-Reply-To: <b2cceeb8-fe81-4212-9b07-b70cad8d3b9b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Aug 2024 03:34:46 +0300
Message-ID: <CAA8EJpp2pg1FyrE8ftxGduHUnX=nsu=Zg_mwCrkcdqJqMJZjDw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] drm/msm/dpu: relax YUV requirements
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Jul 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/26/2024 2:45 PM, Dmitry Baryshkov wrote:
> > YUV formats require only CSC to be enabled. Even decimated formats
> > should not require scaler. Relax the requirement and don't check for the
> > scaler block while checking if YUV format can be enabled.
> >
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 1c3a2657450c..148bd79bdcef 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -743,10 +743,9 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >       min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
> >
> >       if (MSM_FORMAT_IS_YUV(fmt) &&
> > -         (!pipe->sspp->cap->sblk->scaler_blk.len ||
> > -          !pipe->sspp->cap->sblk->csc_blk.len)) {
> > +         !pipe->sspp->cap->sblk->csc_blk.len) {
> >               DPU_DEBUG_PLANE(pdpu,
> > -                             "plane doesn't have scaler/csc for yuv\n");
> > +                             "plane doesn't have csc for yuv\n");
> >               return -EINVAL;
> >       }
> >
>
> Change seems fine, but one question, is there a chipset in the catalog
> with a Vig SSPP which has only csc but not scaler? Even qcm2290 has
> neither scaler nor csc
>
> So was this just a code-walkthrough fix or was there any issue hit due
> to this?

Just a code walkthrough.



-- 
With best wishes
Dmitry
