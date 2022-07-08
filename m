Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323856C16B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F70410EB2C;
	Fri,  8 Jul 2022 20:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE84B10EB33
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:59:03 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id o26so9584256qkl.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGl9x6k8v5djYyGKx5MXjpUaSuYQZtgM2PHdebhPLrI=;
 b=YHn+dY/1CDbJhtHksr0WeaOZtcVsTgWN8nKsKQX257vSBDXJG9EJmiFhC8I3V6+R6v
 hgKR98YDa7L5Aa2THh/5998SSzmcZ3wh36NhXb9Qc/kA6gAS8V274yGocQVC9oPD3v4K
 rQb/R7X5B+K4i+2eUBFLMFwPWVurbq2LXgbTxrAymvG18LutUVSbYul4//UGzb9zxGUR
 4EVSS7O1KymuzP3uvh/GmfDbjBVYhiNnsj2SCtvzuzFEjYAw3lC3IYafZjEROuGANY8u
 F6u0AbNhLdNtz/FvhwD+LvZ2caCAyDvbmZXc5hflWX7+kKbXAFTGhm56//HbQWE58SxT
 mv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGl9x6k8v5djYyGKx5MXjpUaSuYQZtgM2PHdebhPLrI=;
 b=MY2UC4wKMI2Sb7Eh9VEKE+mScuNiauo1BQX5ca4GO4djyZLKrun4siF+t5MudXO/LC
 GuWol40Vsh1gaOdjy4gGEhkVbumwB8VNuvo9CssXZDZfW8O56exMQtG+1NinbX2thaj1
 jGBQs4/obx183tuVyGEjXrafn40Bo93UALRo8G/d4oJ2CchzOQryGJ9VRt5uNTexHAmt
 rmiZZsTkBQK6ECW8bYiYOo1JePc5U1FSOOKHfBZmI6cIZfbgjTpuQk9G6AUbeoSf020E
 ZRayyMDvBBLiSyeTUHGCyqQCYVGd5OwiSaxzWF3E4w2gHlq4/6LTrqnXE35wN7HYuMIc
 j0Vg==
X-Gm-Message-State: AJIora96IjOsk+BuwIIJQ6PP58/ffA9p6Gw15tdSaRGeDrcdMelEOhUv
 FEyfqLB9vMRFNV+kmR7Cs7mMo4omLcb6gUBdwAqYPQ==
X-Google-Smtp-Source: AGRyM1ujmsVxb4yca/Yn9DPXvNZf7Hft+9m3xnJmwXIsLCcS7mcLswtUHojB5b8j9AbZ/z3C7lZVtVOGDTv+FHFiiR0=
X-Received: by 2002:a05:620a:d5b:b0:6b5:660b:2939 with SMTP id
 o27-20020a05620a0d5b00b006b5660b2939mr3029175qkl.30.1657313942992; Fri, 08
 Jul 2022 13:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
 <60252405-81f2-2465-bc20-5f91a9072031@quicinc.com>
 <ffad2e39-f775-00de-3119-f9b0ca3fe4f7@quicinc.com>
In-Reply-To: <ffad2e39-f775-00de-3119-f9b0ca3fe4f7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Jul 2022 23:58:51 +0300
Message-ID: <CAA8EJpo-CS9ZUzA7wDZ05W+Wcz9P_1fXHYPaZACEhMOjnJv_Yg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
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
Cc: Doug Anderson <dianders@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patches@lists.linux.dev,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Jul 2022 at 22:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/8/2022 9:00 AM, Abhinav Kumar wrote:
> >
> >
> > On 7/8/2022 8:25 AM, Doug Anderson wrote:
> >> Hi,
> >>
> >> On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >>>
> >>> Set the panel orientation in drm when the panel is directly connected,
> >>> i.e. we're not using an external bridge. The external bridge case is
> >>> already handled by the panel bridge code, so we only update the path we
> >>> take when the panel is directly connected/internal. This silences a
> >>> warning splat coming from __drm_mode_object_add() on Wormdingler boards.
> >>>
> >>> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> >>> Cc: Douglas Anderson <dianders@chromium.org>
> >>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >>> ---
> >>>
> >>> This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> >>> to set orientation from panel") which is in drm-misc
> >>>
> >>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >>
> >> I don't personally have objections to this, but (to my understanding)
> >> "the future" is that everyone should use panel_bridge. If we made the
> >> move to panel_bridge today then we wouldn't need to do this. In
> >> general I think panel_bridge would end up letting us delete a bunch of
> >> code...
> >>
> >> See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
> >> panel-bridge") for when this was done by ti-sn65dsi86.
> >>
> >> Then again, I spent a small amount of time looking into this and it's
> >> definitely non-trivial. Still likely worthwhile, but not worth
> >> blocking a tiny fix like this. It also should be fairly obvious that
> >> we should delete this when we switch to panel_bridge.
> >
> > Right, from what I saw on IRC, panel_bridge is the way forward and
> > dmitry did push a change to do that
> >
> > https://patchwork.freedesktop.org/patch/492585/
> >
> > But I think we can go ahead with this change because its simple enough.
> >
> > Regarding the panel_bridge migration, I am going to start reviewing that
> > as well.
> >
>
> I did some more digging up on the panel_bridge migration.
>
> Dmitry has posted this towards december last year
>
> https://patches.linaro.org/project/dri-devel/patch/20211207222901.988484-3-dmitry.baryshkov@linaro.org/
>
>
> and I had given my R-b on this already in Jan.
>
> I am not sure why this change was dropped OR was not part of msm-next
> already.
>
> Dmitry, any reason this change was left out so long and why the R-b was
> not retained and this was reposted?
>
>  From what i can see the change looks identical.

I don't remember if it is identical or not. Basically it was postponed
to allow DSC to flow in. We used drm_panel to pass DSC pps data. And
if we use panel-bridge, we don't get a handle of the panel.
Later on I have posted the series moving DSC pps pointer from
drm_panel to mipi_dsi_device (which is logical anyway, since it's not
only the panel, who can provide the DSC pps info, some bridges can
process DSC-compressed data). But since that time it received no
feedback.


-- 
With best wishes
Dmitry
