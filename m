Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5819EFFDD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 00:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A1910EEB5;
	Thu, 12 Dec 2024 23:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QTqQRyzC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B36B10EE9F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 23:10:00 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e3990bbe22cso915640276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 15:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734044999; x=1734649799; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WaleLzibxZUfAGDbUadGTT7PEq5jpDmCmSJXElnaBv8=;
 b=QTqQRyzCmefDlhtq/KhWaBgxJADyNeC9X4C3g/4bd0vFsS+Gw6KybuppJLhrqoieo5
 XUs03pKuFaPIv/vsE+3l2uk3WjwMJ47290u+00XbTmiFOGHMftEp7aoD0mn6iUN5dRRi
 AeZPIPECWFAd6H9sLum6EF++fvmcLi8hrNqrfxwJeGcp4xsoJWFMFRj5h99hrCx5gTxF
 WtT7udtXGMWXZ4605/naNFM0YUl2KV24ul7OZib/Em6QVAT6yVAmY6BWm2FloIqAYg2E
 EKqmuCtcfoqOqQJ1NnsiGPdELYINr9pYEp4ecChZlb6Q3GJTVL3SfRyEC16k0BzAVg6N
 21LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734044999; x=1734649799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WaleLzibxZUfAGDbUadGTT7PEq5jpDmCmSJXElnaBv8=;
 b=bAScR6FW9cmOcKbtAs5DJBhlzWxCp8K2rPoTtwpCvgZeJvv7aLEQH9JwRdfQUNvt7+
 6+nvYfRr9CiAPCyw7uIW6y1/dzYdT2tFrehrFvYivZ9TPeLIIhZIyoptc6wUf/ms+3J4
 dbzzM5egERkF39bKvz4/e46TFSdZ84v8tqAWojSx/YUDXNbQ1Uasmw2bL5VbbOss438W
 Iab0i35J521aWaEcrM1VU0lRjIgrCKr60+2RxuBq+v2Gs0AgYL7nUalT9PdCObKhhHup
 NA3wtIq+Y91QjmLelRtRzK+DiY8PvsOAwxbjMNuORrCtWUCGkhsZXT0AQwbW5vSopvd4
 j7cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ObuUh81wakRDFSSpcJ4nOrwPJzniW+KORjLnZd0VWc9Y4L2ccLycxkZoK214ytl/1lnHsqCrMRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXCz6VCNMjiHPAzfyKnVDxJurrm5y25Fm0UxM6eoyZDH0QqSnZ
 kcx0XOsbVC3Xc0jIA0Pvwaib2fTpUfxGBpVEOy2NkEl2d6w/H5RQkB8Q/sxskGYoFxvrhM+21wS
 NZwV/XdXZYTPl4IqvFy8ijmtcYfSd0hu2qEOs7A==
X-Gm-Gg: ASbGncuvXdDJNS+uBgQd0gppK/N6ehpYJz1hZUbHu4pqPjAvcmJ4VeKMGDcIpvV/7qK
 2cxCrLEHCx2cmyVKD6xwEDJwTD28CABjA9aBgzg==
X-Google-Smtp-Source: AGHT+IF/V/ux6X1mO6hXRsOgpRG5i2WaZY0ezUfxfN+Hfmp4+xxlK9dJwbtdQzgy6yG4fyhaFVSrL2l4czjoSGhEs5I=
X-Received: by 2002:a05:690c:6510:b0:6ef:6c57:ddae with SMTP id
 00721157ae682-6f279b960admr5713247b3.34.1734044999382; Thu, 12 Dec 2024
 15:09:59 -0800 (PST)
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org>
 <01f84965-8a11-4d6d-99a6-b0e37240d4cb@quicinc.com>
 <iugoc25pnh5zzzr5mamutycqohj2z2255omgh3ztyoqgyjkg23@c7axf3mg5wy5>
 <49d330b8-86fe-40a6-864b-cbb28dc2f555@quicinc.com>
 <ab2e0099-3970-4bc8-8a33-db53609838bc@quicinc.com>
In-Reply-To: <ab2e0099-3970-4bc8-8a33-db53609838bc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 01:09:51 +0200
Message-ID: <CAA8EJppefip48dAMZLLML2zoPZzVFD=29d5Nu-E1mGQpUtDvAw@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] drm/msm/dp: set safe_to_exit_level before
 printing it
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
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

On Thu, 12 Dec 2024 at 20:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/12/2024 10:31 AM, Abhinav Kumar wrote:
> >
> >
> > On 12/12/2024 12:58 AM, Dmitry Baryshkov wrote:
> >> On Wed, Dec 11, 2024 at 05:14:18PM -0800, Abhinav Kumar wrote:
> >>>
> >>>
> >>> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> >>>> Rather than printing random garbage from stack and pretending that
> >>>> it is
> >>>> the default safe_to_exit_level, set the variable beforehand.
> >>>>
> >>>> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port
> >>>> on MSM")
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>> Closes:
> >>>> https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
> >>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_audio.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>>> index
> >>>> 74e01a5dd4195d5e0e04250663886f1116f25711..5cbb11986460d1e4ed1890bdf66d0913e013083c 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>>> @@ -329,10 +329,10 @@ static void
> >>>> msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
> >>>>            safe_to_exit_level = 5;
> >>>>            break;
> >>>>        default:
> >>>> +        safe_to_exit_level = 14;
> >>>>            drm_dbg_dp(audio->drm_dev,
> >>>>                    "setting the default safe_to_exit_level = %u\n",
> >>>>                    safe_to_exit_level);
> >>>> -        safe_to_exit_level = 14;
> >>>>            break;
> >>>>        }
> >>>>
> >>>
> >>> This was already picked up in -fixes, so no need to include
> >>
> >> I have been rebasing on linux-next. Please make sure that your -fixes
> >> branch is a part of linux-next.
> >>
> >
> > Its merged to msm-fixes not just my fixes branch. I am pretty sure
> > msm-fixes is part of linux-next.
>
>
> Actually, I noticed just now that msm-fixes is not part of linux-next.
> So pls ignore my comment. drm-fixes is part of linux-next. We should be
> sending out our PR pretty soon. So you will be able to drop this after that.

Ack. Let's get it to linux-next then.

-- 
With best wishes
Dmitry
