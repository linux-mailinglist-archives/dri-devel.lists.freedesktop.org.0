Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B41E83E9B4
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 03:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9379A112183;
	Sat, 27 Jan 2024 02:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC2E112183
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 02:27:50 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc64926af85so859893276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706322406; x=1706927206; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PmD0X57CBkOq/PnKV2CMVVT58JH+EItJHOHqPK4CG34=;
 b=X/gt/1iHvl2Jwpkf11297wY7pLe4SIUUD9kvjSwdpmVl+aTtNDZRCFBoMrEbsAY3as
 8CbuArydnfkjdmPnC/6SAXJM5jDAu+vRNXlHM3D7fWvolMKYDfoZnzhsjZg3wApl19/+
 SNPlGQZVpKlzJPZjCS6qkkDZxPnmj1ZcS9ImRERb+WbN4hmXa7UbwCPnxybL1lP+Th7M
 2OZ3xo3H1xkm3oaoJFrQ+Q2Co1E1ydRiyTh2BHaIOZoJEYQwB+PDgclI8U4rId49sCe1
 iuqyuqfLmaCBpMU6brmLftWuRei+CcwowWQxUe+4c0C+ML8JwEVEtA9OTsaZ7osBHqfw
 ba1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706322406; x=1706927206;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PmD0X57CBkOq/PnKV2CMVVT58JH+EItJHOHqPK4CG34=;
 b=jrKCSPFf2h8zQqZSTZYLtWLdXu02aN+afbaNx2UYCf/zipxzd5ybEEfs4WG2d+VK72
 G8aB+vU70D1Z1f3AeqhttsvD7gTF+UTzOjXg4Lpc2dRE9YZ5f4qWRZ/e+OC6ZkV+QFHp
 nzAGJdBRcw+AUkO39Wbk7oW5OGgk/roQ9pDSFjHYsRyY0af2bsoQgHrHT41Ki+kAOcyJ
 460VlSUVkE/M+5dlHg47ce7frakKfK+NiKditXY8QhDR3as/H7Rfo0R5BoEy7+ek4WQO
 z/17aLnLMjxCPbjzvmZpaimjfszFvB+lKK7MKr+XG61Jnmp4rY1CYzSb9Sn4jcIwnr3Q
 n+GA==
X-Gm-Message-State: AOJu0YydoLvLqngwTI9ZMTaK5QiLtVjgtwxIci5lr5LJfqf3pOb2SGVp
 cOBjLKox9hvFRd/INjEiUK5ZkBylmTChzuMvV7BJIyUmyaXRc1KvfHh3FV4YXbraXuGPEH8yLQA
 ivqBdLak5bUAmw73Q1ULWxlPyZKK6EKHX96DmUQ==
X-Google-Smtp-Source: AGHT+IFCsLON6Jdu5eEiLpsO0NWcRtQO8eIKqPlmdt4XTl7lsF7Hd1eYuqT5luTIzXi5AQLRYtYd/PSi7R+VWs8Gn+w=
X-Received: by 2002:a81:b60c:0:b0:5f6:d2ee:2686 with SMTP id
 u12-20020a81b60c000000b005f6d2ee2686mr853287ywh.2.1706322406174; Fri, 26 Jan
 2024 18:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-3-quic_parellan@quicinc.com>
 <53356805-21f4-4329-bff0-82d266ab9399@linaro.org>
 <674c5e5c-29e9-ef4a-5c5d-a24bdab27059@quicinc.com>
In-Reply-To: <674c5e5c-29e9-ef4a-5c5d-a24bdab27059@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jan 2024 04:26:34 +0200
Message-ID: <CAA8EJpo+AB3q+TRYMXDJqfk3p=L-EQEdS5mjkWOw9Mfcn5kFpQ@mail.gmail.com>
Subject: Re: [PATCH 02/17] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm
 to dpu_encoder
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 27 Jan 2024 at 02:44, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:16 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Move dpu_encoder_helper_phys_setup_cdm to dpu_encoder in preparation for
> >> implementing CDM compatibility for DP.
> >
> > Nit: s/CDM compatibility/YUV support/. It might make sense to spell it
> > out that YUV over DP requires CDM.
> Ack
> >
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 78 +++++++++++++++++
> >>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  9 ++
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 84 -------------------
> >>   3 files changed, 87 insertions(+), 84 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 83380bc92a00a..6cef98f046ea6 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -2114,6 +2114,84 @@ void dpu_encoder_helper_phys_cleanup(struct
> >> dpu_encoder_phys *phys_enc)
> >>       ctl->ops.clear_pending_flush(ctl);
> >>   }
> >>   +void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys
> >> *phys_enc,
> >> +                       const struct dpu_format *dpu_fmt,
> >> +                       u32 output_type)
> >
> > My email client suggests that the parameters are not idented properly
> > anymore.
> On my editor it appears to be aligned correctly. Running checkpatch.pl
> doesn't give any warnings either. So perhaps it's the email client.

Checked, you are correct here.

> >

[skipped]

> >>    * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic
> >> states
> >>    * @phys_enc:    Pointer to physical encoder
> >> @@ -399,7 +316,6 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>       return
> >> drm_atomic_helper_check_wb_connector_state(conn_state->connector,
> >> conn_state->state);
> >>   }
> >>   -
> >
> > irrelevant, please drop.
> Ack

With this fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> >
> >>   /**
> >>    * _dpu_encoder_phys_wb_update_flush - flush hardware update
> >>    * @phys_enc:    Pointer to physical encoder
> >



-- 
With best wishes
Dmitry
