Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A16800479
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 08:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401C910E7F9;
	Fri,  1 Dec 2023 07:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9FE10E7F7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 07:14:25 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5d3aafa1342so12020467b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 23:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701414865; x=1702019665; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fwEyNpMfW1Ufx9odV3bnrhN7pz+UIxPRZV5Xveszz0A=;
 b=dOM1YBz4fGYOVFCUx8F8IpIxa03E6KwPyPFMGgVKz1/UY7oY9kDm2zzf87Hu0AaQTU
 bu0tw6rGPZz7k+zmr2aAahcZK66Mwrs8PUQQZ3hx1CknaYHOLtv9sovfGnKIHXOTKOtl
 dfF4WJtCaAuw+zXhPOaV/R+MbwhRgcppcZlkmTtyGZQz9sUf/auUBa21CbeQSMDs1Nps
 FL/P6kIqSi65CJ4nUiM7qZ5EFIb4Om7s9++HBF75cvSdGiQInMOSj3+M1gZ9iGtsyIIA
 Q0tYFrhl2QJrK07uUDFcLOCampI0GvtLeX0wgFGN4dsj8AQWH1OjhLXBoBa95cWAZLcd
 R1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701414865; x=1702019665;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fwEyNpMfW1Ufx9odV3bnrhN7pz+UIxPRZV5Xveszz0A=;
 b=IHHdeICmXKhv8WDmIIB3de1G0aA0iWPzcA8FZM7bytDC66r6RvQHC+JqFWO6bZ5SKe
 jSlazm55iNfPJkGH/3cBLQZ0gkW2UFWQm2IJXrHcxs7JWFm5mLiO+iMCu7R8e4G1TXxa
 spyS79KqPnewi2FdqocPqnCPqC4W+sFHYs78oGZ0rsai18XlaSTE3dCxjSkpPJ5akc2m
 Pw7Z5aEpvdWxPOlRB4FNFnpB9nG9vFN+nKDDprJwVqMSZdFh/MHc8qJN60Ct4cUn4s3W
 WE8MxPmEMwQUV9LxaE1VrxZUu9y6kzJQwRFex52Nd+pFFWPfy1iIVPOl6cND9Z7yaDY/
 MQtg==
X-Gm-Message-State: AOJu0Yy+D6bpLzY2oDTUPfrz54ZMG6088uTpiUKOJXbNolHt765VdHZh
 1mWVUdWe6c7V50oWDPA/oMpB5Jzd7r64B5mtga77rg==
X-Google-Smtp-Source: AGHT+IH1zrA0sedjaTZM9ZUB1Xj3rWiOnVGBxUse/78AVWt2GLivnKjlJLa6tr6P49ZKi6Z6HiLTYSJNGyzwhMUczKg=
X-Received: by 2002:a0d:fa05:0:b0:5d0:55c:382c with SMTP id
 k5-20020a0dfa05000000b005d0055c382cmr16611927ywf.10.1701414865131; Thu, 30
 Nov 2023 23:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-15-quic_abhinavk@quicinc.com>
 <CAA8EJprZma-e=zbtDuGKfcHK7zTaSykACt+=rh7W92iEpif=Ug@mail.gmail.com>
 <6ed0c636-c222-36b3-aae9-eb822e088a2c@quicinc.com>
In-Reply-To: <6ed0c636-c222-36b3-aae9-eb822e088a2c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 09:14:14 +0200
Message-ID: <CAA8EJpp4XNCwRzF=Lo4_oV7Gj1yDDcEQn5YJ5vXEx=HiJvByWA@mail.gmail.com>
Subject: Re: [PATCH 14/16] drm/msm/dpu: do not allow YUV formats if no CDM
 block is present
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
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 02:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 8/30/2023 5:24 PM, Dmitry Baryshkov wrote:
> > On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> On chipsets where CDM block is not available OR where support has
> >> not been added yet do not allow YUV formats for writeback block.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> index 7fc174b33ae2..d8edca9bc964 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> @@ -406,6 +406,12 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>                  return ret;
> >>          }
> >>
> >> +       if (DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))) &&
> >> +           !phys_enc->dpu_kms->catalog->cdm) {
> >> +               DPU_ERROR("cannot support YUV formats without CDM block\n");
> >> +               return -EINVAL;
> >> +       }
> >
> > Can we have YUV formats in wb_formats if we do not support CDM? That
> > would be an error.
>
> I can drop this one once i address the comments on the next patch.
>
> Yeah the reason for this change was we had one formats array for wb and
> were using that for all chipsets. We can have two arrays : one only rgb
> and the other rgb+yuv to address this.

Yes, this sounds fine to me.



-- 
With best wishes
Dmitry
