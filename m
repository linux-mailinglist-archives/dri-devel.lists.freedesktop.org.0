Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991548A0565
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 03:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A59010EBF5;
	Thu, 11 Apr 2024 01:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w4gORsvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C23510EBF5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 01:21:09 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dcc71031680so6881431276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 18:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712798469; x=1713403269; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K78Wb+5lPnl7lDBySF3XIyGuPisCXfXWqPX+4wqyBxE=;
 b=w4gORsvK6XG8GsYOyAz7yTRKj0sSa17l06elYlU88kmhB7JHH927luSWPKnFl464mF
 8hvt3J+jqkb+n8Bjxvf9C2L0DO2Bb52undVJLaAPWpKVpwvPHoHJOMXidoNsAFYe3pQ4
 0BcLQHeg+Gj8Jd7csAXW6dBQEsslSOgmQ7gU6VDoGh4s8gPfw4moOhoEjrJNkx4InLev
 B6ojt/WNc8bPxUBdi9IlMXXHKBrg3/J2hUpToz5v+giNAu9zflp/kdmiQSvXn+dnrNt3
 dka/htq1JGGjD4O2tNknRGuESxIq2ZH4V4vVZP6KrU+kZDHcUatng3/TJRcx7TcofpX0
 pdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712798469; x=1713403269;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K78Wb+5lPnl7lDBySF3XIyGuPisCXfXWqPX+4wqyBxE=;
 b=TTlPpwpjQa2rXBsuOsRgZPkeja6qqx1uNE9QdtJ49O1YIyDIszDdxl662MRew5haVB
 xxOv4Mg7ZwzcFRB2wuM+Osm8r0HuH0eJlEx5sjXwp42F4GycjO2z9SPjqjNWiM9OkOzk
 c/o9eV5RqeDINtpLLGyxwoxekzJ52lhSx24Q6frP4jndruQruIjoH2SrCO9nJbdv1O+i
 3Eqyh4shTwaS3gccMXExRO0FDjZmvOn209jWpadaW27WwUjfjRojyyoJe6F/4N53989p
 Ph260+szC3S+pkRYMsWku9/JlqB5HxXKN5tk4DNObeVmfCm6Dynm83vsQc2h9JF9xsvq
 iypg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAX42KgGcIUjBtd8sW4T8BpMipD6/6CMVBVVmdfKvjcIeTVTQl8MI/MSzxpfTUom7BaTZifUe2/u+yO0G42Oucsb4RWYNY21wUvC6fTw6/
X-Gm-Message-State: AOJu0YyVC8NZQTmidzXNGYrk4Gd1dUFbnsYCp8IciIuuLh8mrpfY7tdi
 0Oty5pems7hd2B6vZ/u9pqBnvX7oCHHDXTUHHAUIdjOc1fVTN97Tz5GX4FtqitTZCUMaNxAdsSz
 F/1I/cDC/jzcDPzPV1o7WJnsq03a08TF4A8uNkQ==
X-Google-Smtp-Source: AGHT+IECYTTuldk0RR57VK+SgkF41GoxYrDnN6w0HIGHHRJBHcFKg9PFCu5uNs9HXTZ79S73AY4eMD3N+bDcYc3xG1I=
X-Received: by 2002:a05:6902:20c1:b0:dc7:4c21:fbd5 with SMTP id
 dj1-20020a05690220c100b00dc74c21fbd5mr5044699ybb.0.1712798468822; Wed, 10 Apr
 2024 18:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
 <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
 <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>
 <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
 <c0274d67-ae15-8b08-a6af-bd1d77698ab9@quicinc.com>
In-Reply-To: <c0274d67-ae15-8b08-a6af-bd1d77698ab9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 04:20:57 +0300
Message-ID: <CAA8EJppSX=ccwXb2f2SYi9menXO6LLYwqEY5HaSR9K4dh3FRJg@mail.gmail.com>
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from
 mdp_common.xml.h
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Thu, 11 Apr 2024 at 02:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/10/2024 2:12 PM, Dmitry Baryshkov wrote:
> > On Wed, Apr 10, 2024 at 01:18:42PM -0700, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
> >>> On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> >>>>> Instead of having DPU-specific defines, switch to the definitions from
> >>>>> the mdp_common.xml.h file. This is the preparation for merged of DPU and
> >>>>> MDP format tables.
> >>>>>
> >>>>
> >>>> Adding MDP_***__ usages in DPU driver is quite confusing.
> >>>>
> >>>> Can we align to a common naming scheme such as DISP_***?
> >>>
> >>> No, it's not something display-generic. It is specific to MDP
> >>> platforms. In the end DPU is a continuation of the MDP lineup, isn't
> >>> it?
> >>>
> >>
> >> No some aspects of the hw are completely different as you already know
> >> between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not seem
> >> right.
> >
> > MDP4 is different, it's true. But there is a lot of common between MDP5
> > and DPU. Frakly speaking, I don't see an issue with using the constant
> > that was defined for MDP5 for DPU layer. Especially since we are also
> > going to use mdp_ functions for format handling.
> >
>
> All the HW naming etc in the doc has migrated to DPU and in fact it only
> makes sense to start using DPU for MDP5 as we plan to move mdp5 targets
> to DPU anyway. Not the other way around.
>
> MDP4 remains different.
>
> How about MSM_DISP then? I dont get why this is MDP platform specific.

I expect MSM_DISP to be applicable to all MSM displays, even if e.g.
at some point DPU2 switches colour component encoding.

> Because the term MDP no longer holds true for DPU.

The XML is still called mdp_common. And the functions are in the mdp_
namespace. I don't think we should be changing them just because the
name has changed.
Likewise if MDP3 is not compatible with these definitions (to be
honest, I didn't check) I still don't think we should change these
names.

> I am even looking for future chipsets. We cannot live with MDP5 names.
> Have to think of generic names for formats.

Ok, I'm open for suggestions from your side.

-- 
With best wishes
Dmitry
