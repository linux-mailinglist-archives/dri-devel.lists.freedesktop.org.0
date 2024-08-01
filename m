Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4F945349
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 21:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744F110E929;
	Thu,  1 Aug 2024 19:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uQoXtMaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD19410E929
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 19:23:11 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso11238731e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722540190; x=1723144990; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LK2JaRxlZJvvWZ7XmVupWlUeuB4UTfLIDaiuYK2XiJI=;
 b=uQoXtMaInsvpyKhpnD3nSQrLL+7iLpDOQI1vV/YfH1OCshxGOqY+LRTyJghSLxexxW
 TshJ0KzNQG0LLFpm2G8/fQP695BTV2xCBQhq+uWDD7qYaI+NdeWduIdTxf83/vgP0YDm
 lcaBVzaZMSRHbBfFGIIOhfWJgkBSW158E9UqSs0WAOGOfvJVDEgohiNZxW882NtdX4s5
 jQfMvoxv0/CYwB7odu4xLYqElb91EW7K54dKbIGtiT2pDUW3IzBDATPKitUBLD3plJhR
 TRDxWj6u//PzNnYMe6H7HZpIlHpYaEdjONdLHKOiUlJcSdjwatKLmjlpE5Xj8h1GN3i9
 fhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722540190; x=1723144990;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LK2JaRxlZJvvWZ7XmVupWlUeuB4UTfLIDaiuYK2XiJI=;
 b=Mis8p/wvkFWdlibsQo3LF6zE835vLCK5u0sMObyHt8Py/JMWaVZTtaOT5Mv433Ltdh
 NAUvcTUn/LVKIXZFjpTgB9tkwBeTVzBpEXfTMkmofd0GBXnC1j8qZ2NzMpJLUIBlXRlQ
 WsnCtP+Ykx0bKRqTcCxK3suGQ2yRkJKBSJqubmO6zGlcyHYX2DVRytO4pKnDlzlbv2mH
 4D1ggInzf7koMP7pOqiBKBIlkYV+qHi3GrWtDjRcF1J4YPBSr2J1iqQS+yoKdTyY9ECN
 K3V2VpqGTDOHMNSELnCTycoRjJmDNeUU19b1F2j3aIuwykfWTiNfKiSUFQEuDBzYXpSc
 3VyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsCpz3GlBZZRutP59+daAElWbMOj86w3beykK88uAF+bV0gQ4+fF5wv0xQAfsZwGUUsLAOSN4eJDPLUDbr88RWGMeT6DCwbLCGaj14qfSE
X-Gm-Message-State: AOJu0YyQqJioIvxI6SNdW74RyU17jkfERkIKjdl3EiIHI3Hb5wVDU4Zu
 Ybwbg/eW5CvTgTTmJw2+DvPeISKouMV5uRtnK+y291RVktagEoY8ILtiafY6D4U=
X-Google-Smtp-Source: AGHT+IEmCOTve/tmT4aAkKKsiEMlQ1kFkOvvakPslX+G+PfidoXuchkcJVQ6kX/awfiCwkIF1/SZ/g==
X-Received: by 2002:a05:6512:3a8e:b0:530:aa09:b6bf with SMTP id
 2adb3069b0e04-530bb36c421mr668017e87.24.1722540189501; 
 Thu, 01 Aug 2024 12:23:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba35252sm33123e87.196.2024.08.01.12.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 12:23:08 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:23:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
Message-ID: <bg47c2noh3kcfl5tvmryfhxb7gdzql3i5wdhgd7d6xv3ctcmdg@xprfrdwhxs7w>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <874E8EE9-6BE5-4801-AB2E-536B6A160AF8@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874E8EE9-6BE5-4801-AB2E-536B6A160AF8@mainlining.org>
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

On Thu, Aug 01, 2024 at 06:45:03PM GMT, Barnabás Czémán wrote:
> Should i resend this patch set?

No. It was the merge window.

> 
> On June 28, 2024 4:39:38 PM GMT+02:00, "Barnabás Czémán" <barnabas.czeman@mainlining.org> wrote:
> >This patch series add dpu support for MSM8996/MSM8953 devices.
> >
> >Note, by default these platforms are still handled by the MDP5 driver
> >unless the `msm.prefer_mdp5=false' parameter is provided.
> >
> >Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> >---
> >Dmitry Baryshkov (1):
> >      drm/msm/dpu: add support for MSM8953
> >
> >Konrad Dybcio (1):
> >      drm/msm/dpu: Add MSM8996 support
> >
> > .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
> > .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 +++++++++++++++++++++
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
> > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
> > drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
> > drivers/gpu/drm/msm/msm_drv.c                      |   2 +
> > 6 files changed, 678 insertions(+)
> >---
> >base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
> >change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
> >
> >Best regards,

-- 
With best wishes
Dmitry
