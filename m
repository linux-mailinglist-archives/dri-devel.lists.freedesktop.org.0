Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27D52266A
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 23:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AA810E5FE;
	Tue, 10 May 2022 21:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F0310E5FE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 21:42:06 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y21so373138edo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 14:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P8qY51W8vgfgv1roBIBZtJ5APPVjv9LiCcViJn43/9k=;
 b=d9vybpfNPpkMOvcwKAuJOUBxBBYwKmkD5XmA6D69UyUqJSc2pr1poiFTUGhgnBb1b7
 XdFNC6gf8eS7v91hV/9EE6QzIwRzYyU30UTywTBJpfcxxhoN71XmuvmgIrSV2rvYYpQ/
 oa9Sx9bgfoznP7XpN2l0xmIiHQotsJgg3v1fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8qY51W8vgfgv1roBIBZtJ5APPVjv9LiCcViJn43/9k=;
 b=z1viS+mb1HI81gfJ/0J2DCownxT2is1pzKIYKTd7/WTimlIA+G5pcf3pmB9uBoMudh
 9QDLyPJZfk4HVvqN3WxwSl3IhBa6TOBrBXF7k/KkcisLH6aK8bbGJZvR/FDNhzoS7BiL
 RzpqsgOibDmBzOu60sJBGIRoesQIt37EAOgwEpQM9FFcFMtZTzn7nrAE5Z3I9+W4whgL
 DWlc+jTkXUHzsG99//iPdJ1RYKBp9T8GFlXYaqPA0zZqjy00vBIKl+d7LSojASC+gRbf
 OdL/FvZn7IHsz4EGME9eAt8CEit6B2MQV/8Go5u+dLjD/1Ltyq4n4cphDSOX/cvT7rGx
 jiSw==
X-Gm-Message-State: AOAM530Xe7Cdfa8yNFI3xoIs7Nrs1dNIAkrbEj6xY92qesqtfaeGyIyb
 MxlCIGywYNH/rk9CoNn8R4/1R11DjL7zS8M3uso=
X-Google-Smtp-Source: ABdhPJxnYaMmkfBs6p23XQIPqVY9aSfSiktSAMV5mt+kHcwNrU5Q1J+JtGLFkhG6LHHrYgyMYZpCvw==
X-Received: by 2002:a50:ed13:0:b0:426:4939:45a9 with SMTP id
 j19-20020a50ed13000000b00426493945a9mr25759242eds.303.1652218924138; 
 Tue, 10 May 2022 14:42:04 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 ot8-20020a170906ccc800b006f3ef214e37sm169002ejb.157.2022.05.10.14.42.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 14:42:03 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id d5so385675wrb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 14:42:02 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr20361092wrx.422.1652218922331; Tue, 10
 May 2022 14:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
 <874k22lxmh.fsf@intel.com> <8ea03441-b835-f5db-5cc3-85e5330dfe3f@quicinc.com>
 <CAD=FV=UBTEAQD+49xwFM4UdzD2dqQ7WkpNYtO=JRTJwfRWo1Yg@mail.gmail.com>
 <685a547b-175e-68db-a5f6-0e85dacd075a@quicinc.com>
In-Reply-To: <685a547b-175e-68db-a5f6-0e85dacd075a@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 May 2022 14:41:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaY=x8ije6FOsTXBYgOU6j5cCAdZX-pkbAJLYMfhrDqQ@mail.gmail.com>
Message-ID: <CAD=FV=WaY=x8ije6FOsTXBYgOU6j5cCAdZX-pkbAJLYMfhrDqQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 10, 2022 at 2:33 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> On 5/10/2022 1:53 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 6, 2022 at 9:33 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> Hi Jani
> >>
> >> On 5/6/2022 4:16 AM, Jani Nikula wrote:
> >>> On Thu, 05 May 2022, Doug Anderson <dianders@chromium.org> wrote:
> >>>> Ville,
> >>>>
> >>>> On Tue, Apr 26, 2022 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
> >>>>>
> >>>>> If we're unable to read the EDID for a display because it's corrupt /
> >>>>> bogus / invalid then we'll add a set of standard modes for the
> >>>>> display. When userspace looks at these modes it doesn't really have a
> >>>>> good concept for which mode to pick and it'll likely pick the highest
> >>>>> resolution one by default. That's probably not ideal because the modes
> >>>>> were purely guesses on the part of the Linux kernel.
> >>>>>
> >>>>> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
> >>>>>
> >>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>> ---
> >>>>>
> >>>>>    drivers/gpu/drm/drm_edid.c | 9 +++++++++
> >>>>>    1 file changed, 9 insertions(+)
> >>>>
> >>>> Someone suggested that you might have an opinion on this patch and
> >>>> another one I posted recently [1]. Do you have any thoughts on it?
> >>>> Just to be clear: I'm hoping to land _both_ this patch and [1]. If you
> >>>> don't have an opinion, that's OK too.
> >>>>
> >>>> [1] https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid
> >>>
> >>> There are a number of drivers with combos:
> >>>
> >>>        drm_add_modes_noedid()
> >>>        drm_set_preferred_mode()
> >>>
> >>> which I think would be affected by the change. Perhaps you should just
> >>> call drm_set_preferred_mode() in your referenced patch?
> >
> > I'm going to do that and I think it works out pretty well. Patch is at:
> >
> > https://lore.kernel.org/r/20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid
> >
> >
> >> So it seems like many drivers handle the !edid case within their
> >> respective get_modes() call which probably is because they know the max
> >> capability of their connector and because they know which mode should be
> >> set as preferred. But at the same time, perhaps the code below which
> >> handles the count == 0 case should be changed like below to make sure we
> >> are within the max_width/height of the connector (to handle the first
> >> condition)?
> >>
> >> diff --git a/drivers/gpu/drm/drm_probe_helper.c
> >> b/drivers/gpu/drm/drm_probe_helper.c
> >> index 682359512996..6eb89d90777b 100644
> >> --- a/drivers/gpu/drm/drm_probe_helper.c
> >> +++ b/drivers/gpu/drm/drm_probe_helper.c
> >> @@ -517,7 +517,8 @@ int drm_helper_probe_single_connector_modes(struct
> >> drm_connector *connector,
> >>
> >>           if (count == 0 && (connector->status ==
> >> connector_status_connected ||
> >>                              connector->status == connector_status_unknown))
> >> -               count = drm_add_modes_noedid(connector, 1024, 768);
> >> +               count = drm_add_modes_noedid(connector,
> >> connector->dev->mode_config.max_width,
> >> +                               connector->dev->mode_config.max_height);
> >>           count += drm_helper_probe_add_cmdline_mode(connector);
> >>           if (count == 0)
> >>                   goto prune;
> >>
> >>
> >>> Alternatively, perhaps drm_set_preferred_mode() should erase the
> >>> previous preferred mode(s) if it finds a matching new preferred mode.
> >>>
> >>
> >> But still yes, even if we change it like above perhaps for other non-DP
> >> cases its still better to allow individual drivers to pick their
> >> preferred modes.
> >>
> >> If we call drm_set_preferred_mode() in the referenced patch, it will not
> >> address the no EDID cases because the patch comes into picture when
> >> there was a EDID with some modes but not with 640x480.
> >
> > I'm not sure I understand the above paragraph. I think the "there's an
> > EDID but no 640x480" is handled by my other patch [1]. Here we're only
> > worried about the "no EDID" case, right?
> >
> Yes, there are two fixes which have been done (OR have to be done).
>
> 1) Case when EDID read failed and count of modes was 0.
>
> Here the DRM framework was already adding 640x480@60fps. The fix we had
> to make was making 640x480@60fps as the preferred mode. Which is what
> your current patch aims at addressing.
>
> https://lore.kernel.org/all/20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid/
>
> So I thought the suggestion which Jani was giving was to call
> drm_set_preferred_mode() on the referenced patch which was:
>
> https://lore.kernel.org/all/20220510131309.v2.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid/
>
> So that would not have fixed this case.
>
> Perhaps, I misunderstood the patch which was being referenced?

Ah! I couldn't quite understand what the "referenced patch" meant. I
assumed that Jani was meaning that we add a call to
drm_set_preferred_mode() to whatever was calling
drm_add_modes_noedid().


> 2) Case where there were other modes, which got filtered out and in the
> end no modes were left and we had to end up adding 640x480.
>
> No need to set the preferred mode in this case as this would have been
> the only mode in the list ( so becomes preferred by default ).
>
> Thats this change
>
> https://lore.kernel.org/all/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid/
>
> I agree with combination of these 2 it should work.

OK, cool. So just to be clear: you're good with both "v2" patches that
I sent out today and they should fix both use cases, right? ;-)

-Doug
