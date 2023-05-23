Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B7270D4C9
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65FB10E3D6;
	Tue, 23 May 2023 07:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380CA10E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:20:13 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-55db055b412so65092497b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684826412; x=1687418412;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ms2Z+39mDMVo35dL1mx9T/boJmFobIlJgfkKwKncnys=;
 b=DS1T6leVnIRLikXL4zCbd0GhmmcuSC4fDJJ0eZBApkEzBPC+fMOUS/WE5w9+UZj6JW
 +qjbSE9CDqdfhUMwIBrvrwzEOUOkYYUrwJ+jyummdkBBiGuFUgNK7hDY/QXa9H+vTX79
 XYxfHoC668JBQvb7RXu9kc342ihnygBj1bHI4CMGU2GgqoAd1sDTWZ+05aU/92mtMfpK
 /AVpXziqW+bKvZ8dT0+ahO1uBdmadXYqSp0hrLemJJBnFuQ+B5XLWjZKVm11roeFeEjy
 YiPGMulbh+pgsTaBuzJqBQ3a/r2X1yLqxJ84ENvk+xDntYbiJKEw6WZl/JoU3zBII5dQ
 gZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684826412; x=1687418412;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ms2Z+39mDMVo35dL1mx9T/boJmFobIlJgfkKwKncnys=;
 b=Qs49/xK0SWHDyufVmFHPxAsYNktlv3ulq0BRsqvDHid5grQGEi2+5D6mCQcdBw9RYk
 WWyFGCgHpU8A/oyMNSgHUwBN4XjRRZOkh6IpTZDdRVP1yX9y75SJB7hiwM0mbunHmSvA
 p/FerT5HEE6CjokLDOJmm/Jeq7TS+M2FSDXGzZTIQBM1OKh0S1+79wVzpw+dChtGrZnk
 58vyvY1dxv7R7exd7VBoPrOzFMVbFfUvIjHNY+IQnQu17hLC0TtgUJ2Ujwwf6mG+E+Hk
 fd4RnCXZQiocdhFx3SepYoAjckJCNynzTby/SivKRenmiwm/Pm816vRV+fIK56neMODO
 QD8w==
X-Gm-Message-State: AC+VfDwbXY4CV1dSrjoTbg9vy/XfM0bpr4PiANVuQ6wHQIID6VDvNomH
 3yT/QyS1AgL45cVvyWFHa3WM9dVU+kBgs6OWouviPA==
X-Google-Smtp-Source: ACHHUZ4dVDuvZbgczwrU9xuM2MLuDG609rhoPRz3LEihgVs/v2KsXLh237BeTMSa0tknVxyLC8UQ4A0t8g58et1DB1U=
X-Received: by 2002:a81:788f:0:b0:55d:9f32:f6c with SMTP id
 t137-20020a81788f000000b0055d9f320f6cmr13731962ywc.15.1684826411847; Tue, 23
 May 2023 00:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
 <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
In-Reply-To: <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 May 2023 10:20:00 +0300
Message-ID: <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 04:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
> > Rework dpu_encoder initialization code, simplifying calling sequences
> > and separating common init parts.
> >
> > Changes since v1:
> > - Withdrawn two pathes for a later consideration
> > - Changed dpu_encoder_phys_init() to return void (Abhinav)
> > - Added small simplifications of dpu_encoder_phys_cmd_init() and
> >    dpu_encoder_phys_wb_init()
> >
>
> I had previously given these comments on the cover letter of v1, so
> giving it again.
>
> Please mention that your series was made on top of
> https://patchwork.freedesktop.org/series/116530/.
>
> Figured it out when I tried to apply it to my branch to test.
>
> I had tested v1, and between v1 and v2 i only see very trivial change,
> so i think its okay to retain:
>
> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

Unfortunately patchwork ignores tags sent in the cover letter thread.

>
> > Dmitry Baryshkov (7):
> >    drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
> >    drm/msm/dpu: separate common function to init physical encoder
> >    drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
> >    drm/msm/dpu: inline dpu_encoder_get_wb()
> >    drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
> >    drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
> >    drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
> >
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 ++++++++----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
> >   7 files changed, 140 insertions(+), 243 deletions(-)
> >



-- 
With best wishes
Dmitry
