Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7CE8A0569
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 03:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9DC10EBFD;
	Thu, 11 Apr 2024 01:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sBXxSJrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DF210EBFD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 01:21:59 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-ddaad2aeab1so6490500276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 18:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712798518; x=1713403318; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=29JTXvl1eeIXizUo3xD7DriQJsmKP+Knw9aK5HMQNoU=;
 b=sBXxSJrRqwH0Gz5wZLsLGLBqqkmp3XysMQYjyO6JTYM03CEO8oiBtSwZ+NY87xl87O
 zjtkNI+xHcJz0SqLjp0pYF4eE6TgMklnjXxqcwA6RUhWxi02r3PZr/eTlmuSgD/3nTcZ
 rkAcUh7H4DrBTkzMn8Q9WAPg0Ti+Op1kmBK6+qTqjI2C5j9S9xDJ2UlSlSIVujz6J2wi
 hkZ5enFiGt2KiA4chVw/ffb02wcZbZIezGtcrZrZqJwg5DDTogEL3dfbJ5vHZgreV1vg
 hm+z+YFcKL4e7PfB19sU63bG4l67c3r3DBJZm/p3KZaBrySPJaX0etMj896gMq6O9h22
 Wu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712798518; x=1713403318;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=29JTXvl1eeIXizUo3xD7DriQJsmKP+Knw9aK5HMQNoU=;
 b=V2oFQt3+habH+9os5jaPcrYLUdghbr3/B9v5ToxGor91GoFKJfgvogeRpPtU4rZlIl
 EDVvG2HtEr5uNNC02GPguo1RDjObNf02m+jCUF+zfibcQmzMVXdNLm+9lFwhAVwpaVfV
 PTXKPXMrhlwFZGle5sogz7CjSyETEhFMgQnqMTX26JGY+iMqtDvbsWu2PGQY0B4LZOjc
 5c9a0iKzvyd+9VasnR+MZGEMmBSXrGutVi0b6dv1r1VLpES7fIbVwLWMwuSTDozVSPCO
 hND+bfiCKPWoDzt9Fpgx8LqYK5ABv7vxg9MqgeXdlMgiLk2Tz0RS96ACD+UyLJ2sb/XK
 wtzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOrgksKv6deIK4yl0xiWA2R01TFh2FsdQtBqeJVlCGYgPUoOdWT4kiwq8pvZ0BaqyjmPFuxBvgQShvsOtAEFSeeMjhXuEwhcxxxgyl3Am7
X-Gm-Message-State: AOJu0Yx7WswwpNhOPmmFNG/QOH907QVBc3zSfDjYOWO1xDXHAM2qdsrO
 SKLgLHFX1hUpH9M1s5rpKGHXIUotbkHpcNmocq03tVsQ3u75OkxwpPQ3euDHewiVNDcjGW61GFV
 lO40AsyGNI7g4iL73pXVrpgA6gIGQ8BCjqhr4bw==
X-Google-Smtp-Source: AGHT+IEt39xqYh+VuBi1zOnldmXuKPcH5dj7N/c8zUF/gfcXX2jQXpI3CXbRm64XnnkdG88YgddWiN60MDbL4hwJaKs=
X-Received: by 2002:a25:9bc7:0:b0:dcc:96db:fc0d with SMTP id
 w7-20020a259bc7000000b00dcc96dbfc0dmr4108725ybo.25.1712798518192; Wed, 10 Apr
 2024 18:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
 <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
 <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>
 <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
 <c0274d67-ae15-8b08-a6af-bd1d77698ab9@quicinc.com>
 <CAA8EJppSX=ccwXb2f2SYi9menXO6LLYwqEY5HaSR9K4dh3FRJg@mail.gmail.com>
In-Reply-To: <CAA8EJppSX=ccwXb2f2SYi9menXO6LLYwqEY5HaSR9K4dh3FRJg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 04:21:47 +0300
Message-ID: <CAA8EJpqHLtnAANkZxh1xJfTpRtoCub1fkz2ny=TVKv1TVw3K6w@mail.gmail.com>
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

On Thu, 11 Apr 2024 at 04:20, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 11 Apr 2024 at 02:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 4/10/2024 2:12 PM, Dmitry Baryshkov wrote:
> > > On Wed, Apr 10, 2024 at 01:18:42PM -0700, Abhinav Kumar wrote:
> > >>
> > >>
> > >> On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
> > >>> On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >>>>
> > >>>>
> > >>>>
> > >>>> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > >>>>> Instead of having DPU-specific defines, switch to the definitions from
> > >>>>> the mdp_common.xml.h file. This is the preparation for merged of DPU and
> > >>>>> MDP format tables.
> > >>>>>
> > >>>>
> > >>>> Adding MDP_***__ usages in DPU driver is quite confusing.
> > >>>>
> > >>>> Can we align to a common naming scheme such as DISP_***?
> > >>>
> > >>> No, it's not something display-generic. It is specific to MDP
> > >>> platforms. In the end DPU is a continuation of the MDP lineup, isn't
> > >>> it?
> > >>>
> > >>
> > >> No some aspects of the hw are completely different as you already know
> > >> between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not seem
> > >> right.
> > >
> > > MDP4 is different, it's true. But there is a lot of common between MDP5
> > > and DPU. Frakly speaking, I don't see an issue with using the constant
> > > that was defined for MDP5 for DPU layer. Especially since we are also
> > > going to use mdp_ functions for format handling.
> > >
> >
> > All the HW naming etc in the doc has migrated to DPU and in fact it only
> > makes sense to start using DPU for MDP5 as we plan to move mdp5 targets
> > to DPU anyway. Not the other way around.
> >
> > MDP4 remains different.
> >
> > How about MSM_DISP then? I dont get why this is MDP platform specific.
>
> I expect MSM_DISP to be applicable to all MSM displays, even if e.g.
> at some point DPU2 switches colour component encoding.
>
> > Because the term MDP no longer holds true for DPU.
>
> The XML is still called mdp_common. And the functions are in the mdp_
> namespace. I don't think we should be changing them just because the
> name has changed.
> Likewise if MDP3 is not compatible with these definitions (to be
> honest, I didn't check) I still don't think we should change these
> names.
>
> > I am even looking for future chipsets. We cannot live with MDP5 names.
> > Have to think of generic names for formats.
>
> Ok, I'm open for suggestions from your side.

My proposal: MDPU? Neither MDP nor DPU.

-- 
With best wishes
Dmitry
