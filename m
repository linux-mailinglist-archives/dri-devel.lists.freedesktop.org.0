Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFD70E550
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 21:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF4710E012;
	Tue, 23 May 2023 19:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD7B10E012
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:23:33 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-561b7729a12so75742607b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684869812; x=1687461812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=73sPqfTcyZtojDKaauDzGux/K4lPFkochPRB3T3m4c4=;
 b=MXT5Wwc/r/cnG0/CzuMwe4xv9aci8F88e2rKxFLTGkYWKktW0bdDwChp7bUCzk++lP
 ggCeYEb32k4bsoEtzhINii8b8ZyhxpcqFEOi9G1NZzNXl2afTlZjqcIXOTcvc0GS3PLZ
 aPsa74up78M27jV/ousMs5AUlcKk1ERVaaimXsZCeydng9GYVnUskQ5yMbu+X5tMNfWk
 2YK+L2uDOP9LEFgumXBIYI855r0xAb1PUwgnPKATRKZi2pH2zdrUsCdUg7zS1PJNwVxZ
 TshwsnQUpE/LTAR4LFYxBiexENHOntw5LKu7oZ4NaGNcY5tVmDjQL1bH5h+ChVJdtcl3
 1Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684869812; x=1687461812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73sPqfTcyZtojDKaauDzGux/K4lPFkochPRB3T3m4c4=;
 b=aBFrAunDDEVsRfxThncKnBW5jGy1W4jIa8cA49CeHdY/EBqtgf2qpTxI+9MPBDBJhb
 4mvfybLaOKoz6XmLoGJ4QHDzs74V43p1EQzP4KywSDD8sFRGtQkJPsu9IYI1iFOPCMRp
 fL5ixTFADAUGiECyTid4a0GxmwwZGabmB/2OBOsAcF1Q3WbQ9KoZIc37CSXcnxwNKnKv
 fCdJXzSOzZVtOExNSWYGt5E64gwVlMAdqs2htGngG4C7mAWAjqcKWd9sjwZzMuNyPWNI
 jTs7CHfr9YqzEUKbpaaGibflFKr4e61s35OEr/BVmPpjD4PyQG64em5iY1hIz9uP5xQy
 xqfQ==
X-Gm-Message-State: AC+VfDxdlO6XaMH0KKFdtXsSaPvVyBF8H6B2cJery6SpfzVC5ZIlpADX
 iAxqUbwPkmZEYtPG1Td8qI0PEtCyHFn2WG2OGgmsoQ==
X-Google-Smtp-Source: ACHHUZ53NFcpER0X5ytxRDrWS9Je0b0e9mlg/Nh8HnDOBA1RvHbCTT3Vsi7IL3Bnv05mGvV9/LP+l+vZ/ddFRnwdoQI=
X-Received: by 2002:a81:48cc:0:b0:55a:416d:5202 with SMTP id
 v195-20020a8148cc000000b0055a416d5202mr15375329ywa.26.1684869812171; Tue, 23
 May 2023 12:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
 <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
 <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
 <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org>
 <b0be5965-0dc9-c33c-9cba-21bfa82c4faf@linaro.org>
 <249baf98-5264-b2cb-4213-5bcd00a670c9@quicinc.com>
In-Reply-To: <249baf98-5264-b2cb-4213-5bcd00a670c9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 May 2023 22:23:21 +0300
Message-ID: <CAA8EJpp4m85ubkfs7erLVxydHi_S7Xp7neNjh22z=tMnvrWsQA@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 22:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/23/2023 7:36 AM, Dmitry Baryshkov wrote:
> > On 23/05/2023 10:31, Neil Armstrong wrote:
> >> On 23/05/2023 09:20, Dmitry Baryshkov wrote:
> >>> On Tue, 23 May 2023 at 04:58, Abhinav Kumar
> >>> <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
> >>>>> Rework dpu_encoder initialization code, simplifying calling sequences
> >>>>> and separating common init parts.
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Withdrawn two pathes for a later consideration
> >>>>> - Changed dpu_encoder_phys_init() to return void (Abhinav)
> >>>>> - Added small simplifications of dpu_encoder_phys_cmd_init() and
> >>>>>     dpu_encoder_phys_wb_init()
> >>>>>
> >>>>
> >>>> I had previously given these comments on the cover letter of v1, so
> >>>> giving it again.
> >>>>
> >>>> Please mention that your series was made on top of
> >>>> https://patchwork.freedesktop.org/series/116530/.
> >>>>
> >>>> Figured it out when I tried to apply it to my branch to test.
> >>>>
> >>>> I had tested v1, and between v1 and v2 i only see very trivial change,
> >>>> so i think its okay to retain:
> >>>>
> >>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
> >>>
> >>> Unfortunately patchwork ignores tags sent in the cover letter thread.
> >>
> >> But b4 does with -t option to b4 shazam or b4 am
> >
> > Yes. But b4 doesn't append Patchwork headers.
> >
>
> If thats the case, either the author can add them to the patches
> manually like we do sometimes for R-b tags OR I will go ahead and add it
> one by one for every patch now.

I'd prefer either to have a single T-B on the latest patch on the
series, or a pile of replies with T-B tags. Thank you (for the testing
and for providing the feedback).
If we ever switch from git-pw to b4, this requirement will be lifted.

>
> Let me know what you prefer.
>
> >>
> >> Neil
> >>
> >>>
> >>>>
> >>>>> Dmitry Baryshkov (7):
> >>>>>     drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
> >>>>>     drm/msm/dpu: separate common function to init physical encoder
> >>>>>     drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
> >>>>>     drm/msm/dpu: inline dpu_encoder_get_wb()
> >>>>>     drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
> >>>>>     drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
> >>>>>     drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
> >>>>>
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178
> >>>>> ++++++++----------
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
> >>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
> >>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
> >>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
> >>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
> >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
> >>>>>    7 files changed, 140 insertions(+), 243 deletions(-)
> >>>>>
> >>>
> >>>
> >>>
> >>
> >



-- 
With best wishes
Dmitry
