Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8017368FE87
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 05:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5629710E8F0;
	Thu,  9 Feb 2023 04:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46EC10E8F0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 04:24:27 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id b9so385548ilh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 20:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X3JCdbvKeiUcH/OkexvFMP8KnMjvRlzLquNMe2eJDPM=;
 b=YbUbDyPLqiPzWst58OZ6HfyZTQdO47nm+/kxW34nvPdgReGLE8CZKTkEAsRznj1YyQ
 Jo+m685SMmEizOIuzU3KvveGYv2W8fURphN+KyHUCLe4XS+I7UPupca2pJiRF0aZ7TYT
 glzF7jMl7nHOvLmU1nRcYvPKovPfoTljGDOPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3JCdbvKeiUcH/OkexvFMP8KnMjvRlzLquNMe2eJDPM=;
 b=KG9SGPWc0/xAh2w3oQ8InEXK552ZUWofgp+DtdD4nYCtGE70HjRm3N8qD6HHTgD5vc
 GVNFwFe95uOq+gXF94YkkqRUidOWDbQ37Ak6Qv1020ElwppRbsdo3TdC7BHgtOcbn3Y1
 XSN6MXAgz+57b+fGyC0LfqgBjY8QnkA163Bs7J2eqhAkjsynWCE71brKTGtC0DISvE18
 G8UgRATMwO0WLpmnn+TV8jCo7+wxqW0og8TnU3QZeD+USi7lxNWY6/JoLmbOqDDE/PMr
 7wi0JJYSFcgrB57Yg7WePEPVjjoKdyy9sjT+raPv+zSsMA0nQXVDRAi78052J9pXxCfS
 Zbpw==
X-Gm-Message-State: AO0yUKUlFIvmHoFQhEF979mnSHuACBdqePJbu0s4ocuavtNwtJqUuux3
 xuhl1txV+nchh2ys5Knru1Gn5Rx/9K/fsoDSjMY=
X-Google-Smtp-Source: AK7set97Z2nmShKJ2GIlSvKvJ+ThNDEQnMF9sBzSN5L+UZ28xc0QfeoC4cLBNt4ZCX9WZBry06zfHg==
X-Received: by 2002:a05:6e02:18cf:b0:313:d1c7:72b8 with SMTP id
 s15-20020a056e0218cf00b00313d1c772b8mr5651202ilu.1.1675916666651; 
 Wed, 08 Feb 2023 20:24:26 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com.
 [209.85.166.176]) by smtp.gmail.com with ESMTPSA id
 m13-20020a02cdcd000000b003afc548c3cdsm95887jap.166.2023.02.08.20.24.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 20:24:24 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id w2so391569ilg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 20:24:24 -0800 (PST)
X-Received: by 2002:a92:b513:0:b0:310:9276:5d29 with SMTP id
 f19-20020a92b513000000b0031092765d29mr5213990ile.76.1675916663704; Wed, 08
 Feb 2023 20:24:23 -0800 (PST)
MIME-Version: 1.0
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
 <BN0PR02MB8142207261497BE76A6EA07096D99@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8142207261497BE76A6EA07096D99@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Feb 2023 20:24:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XVaEzyZybZ3JmFnPQkSZyw-3UfD0Mupt_adnnJcYy_iQ@mail.gmail.com>
Message-ID: <CAD=FV=XVaEzyZybZ3JmFnPQkSZyw-3UfD0Mupt_adnnJcYy_iQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Reserve DSPPs based on user request
To: Kalyan Thota <kalyant@qti.qualcomm.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "robdclark@chromium.org" <robdclark@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 8, 2023 at 8:16 PM Kalyan Thota <kalyant@qti.qualcomm.com> wrote:
>
> Hi Doug,
>
> Have you picked the core change to program dspp's  (below) ? the current series will go on top of it.
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1671542719-12655-1-git-send-email-quic_kalyant@quicinc.com/

I didn't pick v11 of it like you link, but I did pick v12 of the same
patch. In my response I said that I picked 5 patches, this series plus
[1] where [1] is:

[1] https://lore.kernel.org/all/1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com/


> Thanks,
> Kalyan
>
> >-----Original Message-----
> >From: Doug Anderson <dianders@chromium.org>
> >Sent: Wednesday, February 8, 2023 10:44 PM
> >To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>
> >Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> >freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> >kernel@vger.kernel.org; robdclark@chromium.org; swboyd@chromium.org;
> >Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>;
> >dmitry.baryshkov@linaro.org; Abhinav Kumar (QUIC)
> ><quic_abhinavk@quicinc.com>; marijn.suijten@somainline.org
> >Subject: Re: [PATCH v3 0/4] Reserve DSPPs based on user request
> >
> >WARNING: This email originated from outside of Qualcomm. Please be wary of
> >any links or attachments, and do not enable macros.
> >
> >Hi,
> >
> >On Wed, Feb 8, 2023 at 5:42 AM Kalyan Thota <quic_kalyant@quicinc.com>
> >wrote:
> >>
> >> This series will enable color features on sc7280 target which has
> >> primary panel as eDP
> >>
> >> The series removes DSPP allocation based on encoder type and allows
> >> the DSPP reservation based on user request via CTM.
> >>
> >> The series will release/reserve the dpu resources when ever there is a
> >> topology change to suit the new requirements.
> >>
> >> Kalyan Thota (4):
> >>   drm/msm/dpu: clear DSPP reservations in rm release
> >>   drm/msm/dpu: add DSPPs into reservation upon a CTM request
> >>   drm/msm/dpu: avoid unnecessary check in DPU reservations
> >>   drm/msm/dpu: reserve the resources on topology change
> >>
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 58 ++++++++++++++++------
> >-------
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 +
> >>  3 files changed, 37 insertions(+), 25 deletions(-)
> >
> >I tried out your changes, but unfortunately it seems like there's something wrong.
> >:( I did this:
> >
> >1. Picked your 5 patches to the chromeos-5.15 tree (this series plus [1])
> >
> >2. Put them on herobrine villager.
> >
> >3. Booted up with no external display plugged in.
> >
> >4. Tried to enable night light in the ChromeOS UI.
> >
> >5. Night light didn't turn on for the internal display.
> >
> >
> >I also tried applying them to the top of msm-next (had to resolve some small
> >conflicts). Same thing, night light didn't work.
> >
> >
> >I thought maybe this was because the Chrome browser hasn't been updated to
> >properly use atomic_check for testing for night light, so I hacked my herobrine
> >device tree to not mark "mdss_dp" as "okay". Now there's _only_ an eDP display.
> >Same thing, night light didn't work.
> >
> >
> >I could only get night light to work for the internal display if I plugged and
> >unplugged an external display in.
> >
> >
> >Is the above the behavior that's expected right now?
> >
> >
> >[1] https://lore.kernel.org/all/1674814487-2112-1-git-send-email-
> >quic_kalyant@quicinc.com/
