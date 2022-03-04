Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A04E4CE01A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 23:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC92113C61;
	Fri,  4 Mar 2022 22:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58811113C60
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 22:11:54 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id b12so7710714qvk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 14:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZpECLvSl44j2lTbE8E9msNQR2sv3DK1If11NairmYgY=;
 b=n524EVp7JhvhjiQcC0KPccT6B+21Myz5C6rhKlQCvUxLApOJNTkNX2jvN9SMHSknEY
 LGzgt12qV/i2gzMAP905UsfCWQ07SJmhiq4E5+E2ZsGGTcHyxYedDJGfxLtOO1tuNusU
 9/BHgQHR+nZzWifNdwr5zou3iNTbPvdxrX1uNoF9+mVJ8KichXNR08Dque8S2SqohPwl
 +vVSfv6g1sFI8mlv+xC8S2Z8gA5ftGncprUG8lUEb2NvJUyBC4jQzWmVOb7QGGIMo59y
 kGzutbZjpvWlqKhasm1fSaP3uff2zRayC7jYR5OR7xv6QehkuSWogoMiiTe0U5teAdNN
 ed+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZpECLvSl44j2lTbE8E9msNQR2sv3DK1If11NairmYgY=;
 b=mxocIkUPdXyyrb7xiiyEFvTRR4b4bQCzSUUSM9aRced1SAFc4NKb7+yAgdo1Qj6dCe
 UL+w+eiFXwrBzNdQyXkpD2MQx0H4o7mgy/aZuGHhZuzDQWCJQwK/wJEsX0B+CROpbXHN
 VuqVPYoBr+3ReUBVLXTnQDUHaBcl0yNYWpR80KYkgCE8z7u0oTvnzKAIaBj5LC1UcNRu
 tc+W/4KM6xlMMHBT3pW2OqHrqXz17yloPELFfr82HwDd8z4GRzdwwccxP0lIRn0AAUwc
 KbikyquzRDdnKCKdOa/kvfKJrenxt5+Qmfnm2kDGhQPfYuNookPCvO46r2DdE+8almue
 sSwA==
X-Gm-Message-State: AOAM531CLU8FJBDJUr90vICOVTt3Kobc0hbaJmNoK4CAy5ZmVcP4El3n
 eFfZ0Ms9c8yTyOywUMuP5sgHh2qJsZ16HY23ubzjXg==
X-Google-Smtp-Source: ABdhPJyBR7yFv773x72US6WY2rvvU2xrJkgFRl/bJYCCmFs9dSCw47WZHC433ew93Xki2xBOL9Vrsqz71qrpIPH/CKs=
X-Received: by 2002:ad4:5769:0:b0:435:41db:9bca with SMTP id
 r9-20020ad45769000000b0043541db9bcamr451095qvx.73.1646431913351; Fri, 04 Mar
 2022 14:11:53 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
 <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
 <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
 <CAD=FV=WZUSuNa0Ei_0ByjHRdsJ7smhD+uVghs28NzNGvGp0LwQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WZUSuNa0Ei_0ByjHRdsJ7smhD+uVghs28NzNGvGp0LwQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 5 Mar 2022 01:11:42 +0300
Message-ID: <CAA8EJpq7XEy2C5=80HMHcy3wvB2CJetyQhcjQRcTtEafauy91g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To: Doug Anderson <dianders@chromium.org>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 5 Mar 2022 at 00:49, Doug Anderson <dianders@chromium.org> wrote:
> On Thu, Mar 3, 2022 at 4:16 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, 4 Mar 2022 at 02:56, Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2022-03-03 15:50:50)
> > > > On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
> > > > >
> > > > > Kernel clock driver assumes that initial rate is the
> > > > > max rate for that clock and was not allowing it to scale
> > > > > beyond the assigned clock value.
> > > > >
> > > > > Drop the assigned clock rate property and vote on the mdp clock as per
> > > > > calculated value during the usecase.
> > > > >
> > > > > Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> > > >
> > > > Please remove the Fixes tags from all commits. Otherwise the patches
> > > > might be picked up into earlier kernels, which do not have a patch
> > > > adding a vote on the MDP clock.
> > >
> > > What patch is that? The Fixes tag could point to that commit.
> >
> > Please correct me if I'm wrong.
> > Currently the dtsi enforces bumping the MDP clock when the mdss device
> > is being probed and when the dpu device is being probed.
> > Later during the DPU lifetime the core_perf would change the clock's
> > rate as it sees fit according to the CRTC requirements.
>
> "Currently" means _before_ ${SUBJECT} patch lands, right? Since
> ${SUBJECT} patch is removing the bump to max.

Yes. 'Before this patch'.

>
>
> > However it would happen only when the during the
> > dpu_crtc_atomic_flush(), before we call this function, the MDP clock
> > is left in the undetermined state. The power rails controlled by the
> > opp table are left in the undetermined state.
> >
> > I suppose that during the dpu_bind we should bump the clock to the max
> > possible freq and let dpu_core_perf handle it afterwards.
>
> Definitely feels like seeing the clock to something predictable during
> the initial probe makes sense. If it's just for the initial probe then
> setting it to max (based on the opp table) seems fine.

Vinod, could you please implement it?

> I think an
> earlier version of this series set it to max every time we did runtime
> resume. We'd have to have a good reason to do that.

Yes, this is correct. Based on the comments I had the impression that
there was a suggestion that the place for the calls was wrong. Most
probably I was instead projecting my own thoughts.

-- 
With best wishes
Dmitry
