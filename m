Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3E8A0606
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 04:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE6C10ECE8;
	Thu, 11 Apr 2024 02:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lzeaAZ9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F6B10ECF2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 02:38:24 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-ddda842c399so7669288276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 19:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712803103; x=1713407903; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h93OoPo3UL03Kq4q6u54g7RNND5keWjPBsuarAYZLLg=;
 b=lzeaAZ9p1HCJtRWAlQgAgb7n3vyPt8Q1yRwE02B6fYiLhuoT/RUCZp3ufVJbCkb8lz
 KEt1H1o0m0mYZrSv1M7NNNYm3xg1+xqsmunmDxcaQUMHGg8RADAXXJ8O3Pcfrf5nFL/z
 JPP+Vn773LpdeHq3d1sreN9vNLnx0TXgXml3c4MeFXmLf26nRahCdXm/dFcX4uZkkDFB
 wnOOXJ9CmLucG92A2PGeowwrUnIGp3nPVQlS680WWhcOa+jTglFGyfUGf4Up8bfsRQzU
 HLG+3v28NZQz/Ol0Hz5IasP9046B0yHvXu53bDZYJLOh/0NVi41mIXQfsLGACXLl2huD
 M+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712803103; x=1713407903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h93OoPo3UL03Kq4q6u54g7RNND5keWjPBsuarAYZLLg=;
 b=sgu9m4vqEVzhxq79rXRmnZNF5YS611GiJq3IMKBzSjEFRtWca6FlAXgz1I+i2HdSrN
 d9neRFvnGBjXXPHEBfuiQioDWzA5+RUs2oWyzaA/tSO4MHwozhhYYRFUueDsxf1UOe8P
 W6epyu7BUbjQVhm/SBMBK9XtHxaRsXQ79vEQ5kxKlZTlGkmPI1a4yhVDoPQEtpMaLTfr
 EY4AvuqlhIpKxis/mLEB/+oTcdsMYtD/yIisGUS0IlOjQE5pNBBvLQH9WFs19TOuSoEm
 6co7msva0rpKW/RroF/Cm91iNEKDldldpTuKxFpmDr9G7XYcWwEhGtZmqjQdbL7HHyOk
 +x+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO1fR/AlpeePMm6u+r/TtSAvrMIpNIGidcNkJNUsjqSz5huwxTsg+Fa/RBnOJsh6hvm3WS7BbtMxkHTpxIgxJz1KXzczMLmzSsCuFHSmX5
X-Gm-Message-State: AOJu0YxFJMeuT7fO33QHO/nxHu83bEsyfrwF+BCfmoyuqKdNNrvWYXAV
 lenkOrXBipYd4qe4dTqR771opWbBcEwK0vf18QrpUyom8bfMg50B6YnqFwcQQZ3jk0PJHNGL0d+
 dS/7pTiZXfTiyBF6qSxdzmocw0c6GCmo9fQQVIQ==
X-Google-Smtp-Source: AGHT+IGP2sQ+K4ZsCv7qDmaRap/BzFNEjUp/j+e152KeOUhVKcONvxn9nBq+rcTw5Wla3KyabJs1x5aa6IXmpGAfzUw=
X-Received: by 2002:a25:33c1:0:b0:dc6:c2b2:c039 with SMTP id
 z184-20020a2533c1000000b00dc6c2b2c039mr4289918ybz.41.1712803102886; Wed, 10
 Apr 2024 19:38:22 -0700 (PDT)
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
Date: Thu, 11 Apr 2024 05:38:11 +0300
Message-ID: <CAA8EJppmyU246kFE3Xk7SLG9GDgfhfT4ONCu8ZzQg3ssx+njbQ@mail.gmail.com>
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
> Because the term MDP no longer holds true for DPU.
>
> I am even looking for future chipsets. We cannot live with MDP5 names.
> Have to think of generic names for formats.

Another point: MDP_ is still frequently used in the DPU driver. See
dpu_hwio.h, dpu_hw_catalog.h or dpu_hw_interrupts.c

-- 
With best wishes
Dmitry
