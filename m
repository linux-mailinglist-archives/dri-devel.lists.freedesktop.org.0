Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0717BBD84
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 19:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E117A10E540;
	Fri,  6 Oct 2023 17:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C263A10E540
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 17:15:38 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-59e77e4f707so29480997b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696612538; x=1697217338; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DgysTirqmULG/J429nwx5y0fkZ/uHjK7hUfCCLd/fc0=;
 b=mlLPdzjY/KrxF3IJsuIu9PPd2XVtOI7cx/blK4O2DC5AMw0tINfeIB520fp9zBfMBR
 yQU5mNo/gpsLqkh5tI9zGLxjkT1mc7FnMlgIqcciCqKVBeapFj+1h1O5u99sLFVwsmAW
 sjnW0JH676RKCdulqli+wLD/HChtPzjAIwr6WDn/8P+VMK3dsbZwAt4VpLlgL2muvg45
 zgA4MNvcS2dp2h4BFZko68/IH2mJW9vKnt/img9FDJNbCJAuER/OBrqqIV85q2XK0msP
 m2c85hw5LQxp+U1u4LOzAKI+COk+Sxd6/3N722Ujjbs/PiUvx0s5x6YP2A1WR0nRKl2F
 TSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696612538; x=1697217338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DgysTirqmULG/J429nwx5y0fkZ/uHjK7hUfCCLd/fc0=;
 b=fnvOymvBwIkQvXjMJTFr2aaoel+UxhsEluOfjIKcqpt5iqHxZkqhiHMsvNs+jv/5WY
 7faZdaQRklbWfYIDyzNmJr6+uTizbotIeO+Y6jtohwG4K+GFB9FCrVukTG8/TtrN4gVp
 ltnvgLKec0ljeBb/udtFUXTsXF8UJASqmXN5twLI44+jAkbOG3YrU1Z4ZMifzbyP4wyO
 X5t83kdr9ZYsI4QLGCvjVBV/CClDvv4aDfvLpM3pvkDFUZCZpcMog0jcQuSS3twnJWEf
 IU+EAnbgxyWlkcxs7WaQNuaSJBhYuuSjHLQM1mreAsBD1vcSTStUrnED68KrJR04fPyx
 oU7A==
X-Gm-Message-State: AOJu0YyEU9oFmM+p6b5NnA7+0nKRtvHDXnChWYmOqr0Yf4ODhT/wSq9j
 BbFPoDyQLIo/xvu6y3L8FWu+0EwEUxMfFZiE4LRp9g==
X-Google-Smtp-Source: AGHT+IEKS/WdshJVLzFYtfc+kTkKycORuNFX2eq0C2F534RbLGQrBtGUUIf2RHNfP7s3/ACwciMLZLlk6De/E4lepuc=
X-Received: by 2002:a05:690c:2908:b0:5a5:7ea:5d0e with SMTP id
 eg8-20020a05690c290800b005a507ea5d0emr5903018ywb.2.1696612537776; Fri, 06 Oct
 2023 10:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
 <5711857.DvuYhMxLoT@z3ntu.xyz>
 <019e66c4-8188-4fbb-b169-d2cec165c91b@linaro.org>
 <12295796.O9o76ZdvQC@z3ntu.xyz>
In-Reply-To: <12295796.O9o76ZdvQC@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Oct 2023 20:15:26 +0300
Message-ID: <CAA8EJpq2i+Ha33jPdCdHmi1jBFz+LzCia_bw-cDj8BsyrvSx8A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drm/msm/dpu: add support for MSM8953
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Oct 2023 at 19:26, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On Freitag, 6. Oktober 2023 15:38:51 CEST Dmitry Baryshkov wrote:
> > On 29/09/2023 23:52, Luca Weiss wrote:
> > > On Samstag, 23. September 2023 23:49:10 CEST Dmitry Baryshkov wrote:
> > >> Experimental support for MSM8953, which has MDP5 v1.16. It looks like
> > >> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> > >> etc.
> > >
> > > Hi Dmitry,
> > >
> > > As written on IRC, on sdm632-fairphone-fp3 with this DPU patches the
> > > screen is initializing and displaying stuff :) But there's some errors,
> > > which presumably are the reason that the screen is only updating a few
> > > times per second.
> > >
> > > [   22.774205] [drm:dpu_kms_hw_init:1164] dpu hardware revision:0x10100000
> > > [   23.099806] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:657] [dpu
> > > error]enc31 intf1 ctl start interrupt wait failed [   23.099821]
> > > [drm:dpu_kms_wait_for_commit_done:495] [dpu error]wait for commit done
> > > returned -22
> > >
> > > These messages appear about 13 times per second but as I mentioned, the
> > > screen *is* updating (slowly) there.
> >
> > For my understanding, does it work with the MDP5 driver?
>
> Not perfectly, but it does work. What I mean is that the panel is running at
> 30Hz (shown e.g. with kmscube) instead of the 60Hz it should run at.

Interesting. If you have register dumps, it might be interesting to
compare them.
For DPU you can get them from debugfs/dri/0/kms. For MDP5 it is
necessary to hook snapshotting first. The patch will be appreciated
though ;-)

Also, the CTL timeouts look familiar to what we saw on the FP while
hacking it. I can suppose that it is a generic issue, just manifesting
more visibly on the older platforms.

>
> One of the comments I got is that mdp5 is essentially unmaintained so I should
> try DPU ;)

I'd say, it is mostly in the fixes-only mode.

> Also I can ask someone with a video-mode panel to test, maybe it works better
> there. At least good to have more data points?

Yes, please. Testing video panels would prove that the whole pipeline
is working and we have only CMD-related issues.

>
> Regards
> Luca
>
> >
> > > Also you for sure forgot to add "qcom,msm8953-mdp5" to the
> > > msm_mdp5_dpu_migration list, without this DPU is never even considered for
> > > 8953.


-- 
With best wishes
Dmitry
