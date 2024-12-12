Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4289EFFD8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 00:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963A410E195;
	Thu, 12 Dec 2024 23:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vPqPAdF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951BB10E195
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 23:09:15 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-6ef7f8d4f30so10626477b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 15:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734044955; x=1734649755; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M2mAuDdfqzmhuIxLZhpZDU5e13JDY/yUDIGNA64wKaQ=;
 b=vPqPAdF3l3yDaio5ur1eXlcuwPLKSHMVILiXwqz3CBSwOjlidrP37OSFzjXVhDq3fG
 Q6CLfsI/XkeiE2mxullzh//Enp+DUA+BNwVtY26VslmaChd7AkzVdJNxr0fUaX3iO/34
 44ITgqyIizp44Pz8mqOJljA/ckkibR7HDkR9vHOtnm6CSjhdhvedeNbXQS9efhRchsE6
 m7+mtqy890qxteLcvWzeNvMjl4uckgyIX3PF7uOCSAZwaqqJ6Zx94yu3lxCGZ0Qjsd6F
 JMiRRulnk1ziBhkxQ+mpr/U1OJFDIMVOcsoTmGpPQbJugRJlfm2k9oWBAz9RMhqw+3SS
 7jKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734044955; x=1734649755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M2mAuDdfqzmhuIxLZhpZDU5e13JDY/yUDIGNA64wKaQ=;
 b=AVJv62DnZcvUAm8blFCNKVvl9hvVAeSV2M6eHUBfOructyYDNa7TlT0rPTDJ+zyxDM
 qoyd3duKP0hWANtfe1uiOIotxUQQiD0f2IysVj+gM39mHT0p313h7kJUW1XxKz1p3Jcf
 vYd1vNozKHhu75qiPVP2NLvJ+KQrXlKwEJuGDANazoLhMJn/2ABJLlXy1PCne6SItn8P
 R9NcvrhqlxfFy2jMBWPr5Iz2p2NMgE5CxkQ/q0O707K+Ilgh4i2zROXWoGYsZdK77vki
 SE4QlatcG4xRD9+qWjauR/3NI2BD2Tuq6628KFteHl0taDM4/rGNROFBq+vrP6vNPtoQ
 +JeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV75Afx0wn79y/ssWHV7tevVlwKpFt3ZW1IPegylIlljPoMLiDCu3EEBw9JkU7KTMlmvciDvdMljxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSOinQiNmWdjSZ5uCgH8ul6ZIUU9V2QIH5/mS62wqVvvggzGSR
 vOPSPq4VF5NpsP4R56FJvdEvtIu3nylV7q/nVeSs4dB83+3Sl0jOszXfJdbkNUXSnibhRmt1MDK
 wppZuP3ZpMZ3SqQlg6RgfPTXeV7liuUYQkUgY0A==
X-Gm-Gg: ASbGncsHeDzv1Wy4+rQ+KkUdr+NcUMtlS89/POruPrSHMX/I963rEo1mxV/IAu2XeBP
 jNA8sk9fVhhFCS92bN5/Buk82pwXiXJlhU+Rt7A==
X-Google-Smtp-Source: AGHT+IFKUAXxa88JQH4JGbekPkCmlZeZiyClOGnz/LKQS8V8q+s7v0QnjiNirPoM726x+yvYkFyKFBjTEjqFdm6cVIg=
X-Received: by 2002:a05:690c:6303:b0:6ef:4a57:fc98 with SMTP id
 00721157ae682-6f279b018b3mr4806717b3.16.1734044954669; Thu, 12 Dec 2024
 15:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-4-0b1c65e7dba3@linaro.org>
 <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
 <CAA8EJppOjAjFVUFSEXJMbJ4aV_MvzpeTuKDkL7P+t_Mw47YECw@mail.gmail.com>
 <5cb7b1b1-5596-4704-bd01-beaadf8bba51@quicinc.com>
In-Reply-To: <5cb7b1b1-5596-4704-bd01-beaadf8bba51@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 01:09:07 +0200
Message-ID: <CAA8EJppyNceC+t-2MKqq1QhCj2cYb+jprc++cFEen8Cqhhbo0w@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 12 Dec 2024 at 21:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/12/2024 12:52 AM, Dmitry Baryshkov wrote:
> > On Thu, 12 Dec 2024 at 04:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> >>> Having I/O regions inside a msm_dp_catalog_private() results in extra
> >>> layers of one-line wrappers for accessing the data. Move I/O region base
> >>> and size to the globally visible struct msm_dp_catalog.
> >>>
> >>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 457 +++++++++++++++---------------------
> >>>    drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
> >>>    2 files changed, 197 insertions(+), 272 deletions(-)
> >>>
> >>
> >>
> >> Fundamentally, the whole point of catalog was that it needs to be the
> >> only place where we want to access the registers. Thats how this really
> >> started.
> >>
> >> This pre-dates my time with the DP driver but as I understand thats what
> >> it was for.
> >>
> >> Basically separating out the logical abstraction vs actual register writes .
> >>
> >> If there are hardware sequence differences within the controller reset
> >> OR any other register offsets which moved around, catalog should have
> >> been able to absorb it without that spilling over to all the layers.
> >>
> >> So for example, if we call dp_ctrl_reset() --> ctrl->catalog->reset_ctrl()
> >>
> >> Then the reset_ctrl op of the catalog should manage any controller
> >> version differences within the reset sequence.
> >
> > The problem is that the register-level writes are usually not the best
> > abstraction. So, instead of designing the code around dp_catalog I'd
> > prefer to see actual hw / programming changes first.
> >
>
> So thats the issue here. If we did end up with registers and sequences
> different for controller versions, the ctrl layer was expected to just
> call a reset() op for example similar to the DPU example you gave. And
> as you rightly noted, the dpu_hw_xxx files only expose the ops based on
> version and the upper layers were supposed to just call into the ops
> without knowing the register level details. Thats pretty much what
> dp_ctrl tried to do here. We did not want to expose all the register
> defines in those layers. This series is doing exactly opposite of that.

We don't have the issue up to now, even though we support DP
controllers since SDM845 up to SM8650 and X1E80100. The SDE driver has
v200 vs v420 catalog files for PHY programming, the rest of the
functions are common. So, for me it looks like a preparation for the
imaginary case that didn't come to existence up to now.
So, yes. I want to get rid of extra useless indirection and I want to
expose register sequences in those layers.

>
> >>
> >> We do not use or have catalog ops today so it looks redundant as we just
> >> call the dp_catalog APIs directly but that was really the intention.
> >>
> >> Another reason which was behind this split but not applicable to current
> >> upstream driver is that the AUX is part of the PHY driver in upstream
> >> but in downstream, that remains a part of catalog and as we know the AUX
> >> component keeps changing with chipsets especially the settings. That was
> >> the reason of keeping catalog separate and the only place which should
> >> deal with registers and not the entire DP driver.
> >>
> >> The second point seems not applicable to this driver but first point
> >> still is. I do admit there is re-direction like ctrl->catalog
> >> instead of just writing it within dp_ctrl itself but the redirection was
> >> only because ctrl layers were not really meant to deal with the register
> >> programming. So for example, now with patch 7 of this series every
> >> register being written to i exposed in dp_ctrl.c and likewise for other
> >> files. That seems unnecessary. Because if we do end up with some
> >> variants which need separate registers written, then we will now have to
> >> end up touching every file as opposed to only touching dp_catalog.
> >
> > Yes. I think that it's a bonus, not a problem. We end up touching the
> > files that are actually changed, so we see what is happening. Quite
> > frequently register changes are paired with the functionality changes.
> >
>
> Not exactly. Why should dp_ctrl really know that some register offset or
> some block shift happened for example. It only needs to know when to
> reset the hardware and not how. Thats the separation getting broken with
> this.

Yes. And I'm removing that separation very intentionally. If one is
looking for AUX programming, they should be looking into dp_aux only,
not dp_aux & dp_catalog. Likewise all audio code should be in
dp_audio. By using dp_catalog we ended up with a very very very bad
abstraction of msm_dp_catalog_audio_get_header() /
msm_dp_catalog_audio_set_header() / enum
msm_dp_catalog_audio_sdp_type. Just because reads & writes should go
through the catalog.
For dp_panel likewise there is no need to look into some other source
file to follow the register sequences. It can all be contained within
dp_panel.c, helping one to understand the code.

Last, but not least. Code complexity. dp_catalog.c consists of 1340
lines, covering different submodules. It is hard to follow it in this
way.

>
> > For example (a very simple and dumb one), when designing code around
> > dp_catalog you ended up adding separate _p1 handlers.
> > Doing that from the data source point of view demands adding a stream_id param.
> >
>
> I have not checked your comment on that series here but if your concern

This is really a bad cadence. I have provided most of the feedback
almost a week ago.

> is stream_id should not be stored in the catalog but just passed, thats
> fine, we can change it. stream_id as a param is needed anyway because
> the register programming layer needs to know which offset to use. This
> series is not mitigating that fact.

No, my concern was that you have been adding separate _p1() functions
which are a duplicate of _p0() counterparts. When one looks at the
dp_catalog.c it is logical: there are two different register areas, so
there are two distinct sets of functions. If one starts looking from
the dp_panel point of view, it's obvious that there should be a single
msm_dp_write_stream() function which accepts stream_id and then
multiplexes it to go to p0 or p1.

>
> > In the DPU driver we also have version-related conditionals in the HW
> > modules rather than pushing all data access to dpu_hw_catalog.c &
> > counterparts.
>
> The dpu_hw_catalog.c and the dp_catalog.c are not the right files to
> compare with each other. dp_catalog.c should be compared with
> dpu_hw_xxx.c and as you noted, DPU version dependencies are handled in
> those files only and not all over the files like what this series is doing.

Not really. dpu_encoder_phys_cmd_init() checks for the core_major_ver.
Let me see if other files check for the version under the hood.

Also as you wrote, there are multiple dpu_hw_xxx.c files, each
handling register issues on its own. We don't have a single file which
keeps all such differences in one place.

Last, but not least, in the DPU driver there are actual differences
between generations, which require different code paths. In the DP
driver there are none.

>
> > I think it's better to make DP driver reflect DPU rather than keeping
> > a separate wrapper for no particular reason (note, DPU has hardware
> > abstractions, but on a block level, not on a register level).
> >
>
> Thats the issue here. DPU hardware blocks are arranged according to the
> sub-blocks both in the software interface document and hence the code
> matches it file-by-file. DP registers are grouped by clock domains and
> the file separation we have today does not match that anyway. Hence
> grouping link registers writes or pixel clock register writes into
> dp_ctrl is also not correct that way. Let catalog handle that separation
> internally which it already does.

I'd say, dp_panel, dp_audio and dp_link are already pretty
self-contained. I was hoping to look at dp_display vs dp_drm later on,
once the HPD issue gets resolved. Only dp_ctrl is not that logical
from my point of view.

-- 
With best wishes
Dmitry
