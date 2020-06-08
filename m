Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E234D1F21FC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 00:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C2189E3F;
	Mon,  8 Jun 2020 22:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C31189CCB;
 Mon,  8 Jun 2020 22:53:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g1so14799953edv.6;
 Mon, 08 Jun 2020 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o0dkW7AvLyKn1HRWpsXIOwbF0Y+dLturfn26dWeNBGk=;
 b=oUIUtFODJiEax1cYkKvYmwAdbOx/v8zdOrVZjhTeHg6/0BEdjS1WeDOIvOZ3WMb7/i
 ONJQj9vfW3ieG2L3o2wsqtHBNoMNMe0kdkpPu0rhTZ2QSLOgtlPblqJ264grL9R+WwlL
 7kR8ay5zlNj18Un3z9RIxrNLAzj3b6mRroHeqYtD09xsq62yqPZ7dHPaNSD5vqvJRgB3
 tdCRffLsbtIGDVwc0U62UqtymSVZErg50b+7kgsYm9l8F9rZhjK/gEVBiVT/Vn4nuK/1
 FiocN+z1p5MEN7CyXQV0CRu18kNf1pHA5GgmoLMFu+qoZ9Q5zfrmT5ME7kJeoWR6apjq
 tZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0dkW7AvLyKn1HRWpsXIOwbF0Y+dLturfn26dWeNBGk=;
 b=l0uk8f45cmo6R1tzHR92xX2VFIupOH3FTFczV1F6yu8i1bi8M85voJQERKU+e+gEEj
 yrspEFTwR8efBudcpB5a6ahA+GYiV8EPycFbBRj2TG1tto6WyFYJLkiqZ3y4UsE+O+5k
 FTJ/w5EWNiyQce15Tdv+NRH+Q20FjBVqTqO1fF2de3+2quLACdzMFn1Nvn3VGfnYbO7L
 ZncAmseFgLSX+yXoG8Ud7FqO+WEdq+//lbdsO0rnYzhpP391+wQMc2P2909enF5n3rjJ
 ymFmlpwtcPmbyzhF6oE2X5ooVqT/7oDW48TPAc4mA2QPFcVGtD9wEBELQafBaoPpKRO9
 tlEg==
X-Gm-Message-State: AOAM533dwPFHEKDaxeBrlF3KtU+4prGXKj8ct4CQ2KnLEqFQlb8yAaCy
 rQoV0B/q7PYv/7mDgfEVL2dvtH/WBap6y8XZ9ho=
X-Google-Smtp-Source: ABdhPJwibOfu09ZokvFJB8guqz4Rh/t6R+97kctxbqsoYNwmzeb7qaLLtQeLrCUX3dmQ1Jq2dt20A6x9O/nH7nNQ8Mg=
X-Received: by 2002:a50:9d46:: with SMTP id j6mr24741835edk.362.1591656833950; 
 Mon, 08 Jun 2020 15:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org>
 <CALAqxLViRrga-XW2o1J1JutFdS1d-qmmgOrEP2beNygw3A7H4A@mail.gmail.com>
 <CALAqxLWbhioSH4pFyM348VrGWxRXHQV1s9bdz6HArYguLtAFcw@mail.gmail.com>
In-Reply-To: <CALAqxLWbhioSH4pFyM348VrGWxRXHQV1s9bdz6HArYguLtAFcw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 8 Jun 2020 15:54:19 -0700
Message-ID: <CAF6AEGvGxyen5DbYCoc1x5ZeWiZo0mgvtsNev0k7WJnw+Xgqjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: add support for color processing blocks
 in dpu driver
To: John Stultz <john.stultz@linaro.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 8, 2020 at 3:37 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Jun 8, 2020 at 3:25 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Wed, Mar 25, 2020 at 1:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> > >
> > > This change adds support to configure dspp blocks in
> > > the dpu driver.
> > >
> > > Macro description of the changes coming in this patch.
> > > 1) Add dspp definitions in the hw catalog.
> > > 2) Add capability to reserve dspp blocks in the display data path.
> > > 3) Attach the reserved block to the encoder.
> > >
> > > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> >
> > Hey all,
> >   With this patch now merged upstream, I'm seeing a regression on
> > db845c that I bisected down to it.
> >
> > When I boot up I see:
> > [   40.976737] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> > error]failed to get dspp on lm 0
> > [   40.985600] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> > error]failed to get dspp on lm 0
> > [   40.994587] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> > error]failed to get dspp on lm 0
> > [   41.003492] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> > error]failed to get dspp on lm 0
> > [   41.012283] [drm:_dpu_rm_make_reservation] [dpu error]unable to
> > find appropriate mixers
> > [   41.020369] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
> > resources: -119
> >
> > Over and over, and the display doesn't start up.
> >
> > I suspect we're supposed to catch the following check before the failure:
> >
> > +       if (!reqs->topology.num_dspp)
> > +               return true;
> >
> > I suspect the issue is in dpu_encoder_get_topology() we don't fully
> > initialize the topology structure on the stack before returning it.
> >
> > Does that sound plausible or is there likely some other cause?
>
> This guess is wrong. The topology.num_dspp is 2, but lm_cfg->dspp is
> coming back as zero.
>
> I'll continue digging to see if I can understand better whats going wrong.
>

It looks like no DSPP was added to 845, see sdm845_lm vs sc7180_lm


Kaylan, can this be fixed sanely to make DSPP optional, or should we
revert and try again next time?

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
