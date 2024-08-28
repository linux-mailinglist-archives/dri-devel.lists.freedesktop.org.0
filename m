Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF196331B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 22:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD61C10E5E7;
	Wed, 28 Aug 2024 20:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bkekw5Jc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C66510E5E6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 20:56:11 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7142a30e3bdso830136b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724878571; x=1725483371; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HTBxWJ9wyPByAunmw2nMzBk9ACw5+Pc6tm8AO9OHjfY=;
 b=Bkekw5JcdprazHjQ83crOgcCDdoroJgKoUnawog2xZvIdFP+JEsr+BQ4pR2UGq3/Mn
 7OZKcVwzIPX5BCiDfPciYvGk3G0KQTI+tgg9+sjNUO1GObU6mFIJoMr4Jco6s/i7W8uy
 f0AGighvQT+wsMywowuhSkoGDxAn/NpMVBFFy0HrMvz21mrSh0y8CWVhYaufp39YlYj/
 11mpcP/RVNm0MS5aVCCtO2qPPRbH2qC9EOKbGRyTcdJxWFu9Ri65ke3YURCDAoyq4CuF
 X+okBULXU7rNqfSud9TxM9jVXEfKwjAz+CufYapiLtbshBLQ4jqxwH+hlKhgdYozuXSG
 Njuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724878571; x=1725483371;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HTBxWJ9wyPByAunmw2nMzBk9ACw5+Pc6tm8AO9OHjfY=;
 b=pTauH3VrqYBwoWi7sndOb0BP+nKND7mJw/Qgf69At1brz6Q3tYs5rpihsh+epy1xkP
 fPZfGUnzevzq7TcY6gELIDRDKc0Q1TYH9/GEvSVK+tMnzqzqrOev6xL5tQXDezG/Jn+r
 gEhQCUvCOUG69sfjshcyxv3ecVd8CKMkys2xi+4VPzrjrsn7Z32MJ5UiUdXtRcd2SuyE
 F+BRdV6iFKOqcWLvCCKh7klgs9ki0DnPQ2DQtMtOYwzDqP+k3ELhACPGBB33KnESBC28
 pPDinzD6qmzO0E0qYVdGnCe1ar4xw8HuBJbv3kDJgGUS4Bjnz1u3Mp3Byv56OpVjl3+E
 QZgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU41Zy6g9JKlSjAwPrbLOhDUeOJiHXZQdynm569203y0Tzs2sV1qdFWWfA2bYYDe+ibGT07O5vYPlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx94kEcBAZ/u2H/L3Me8MSYTTM1OhzuWa7XSUIy5ezQGRstx/4+
 00u/puGpTvyX4n670zBcNp+Pks1iHpu6TQWFnQxyj8pJMm+ksMI7Tsodbs8Wy7rla1E+cGVzCSs
 ClKSJGP+NEDcR1nt9lyJa7HUbqI/ZeOS5V5VP9Q==
X-Google-Smtp-Source: AGHT+IEz2rPhLvv7n23E6bzDV4iFmPIxFnrezQOlNwUK6zlcWpRR3csAoLfs4O3Xg+lVb6jAr5o5pCLeaKqNmgyCv14=
X-Received: by 2002:a05:6a20:2594:b0:1c4:8694:6be8 with SMTP id
 adf61e73a8af0-1cce15f7ea3mr602404637.3.1724878570814; Wed, 28 Aug 2024
 13:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-9-5efb90cbb8be@linaro.org>
 <1bb90821-bc6f-4828-b947-d3123a035c60@quicinc.com>
In-Reply-To: <1bb90821-bc6f-4828-b947-d3123a035c60@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Aug 2024 23:55:58 +0300
Message-ID: <CAA8EJpocScDmfSpSctOYiMiOLKpcWOP8x4qjGkdx0sieUsnvzA@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] drm/msm/dpu: move rot90 checking to
 dpu_plane_atomic_check_pipe()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 28 Aug 2024 at 22:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/26/2024 2:46 PM, Dmitry Baryshkov wrote:
> > Move a call to dpu_plane_check_inline_rotation() to the
> > dpu_plane_atomic_check_pipe() function, so that the rot90 constraints
> > are checked for both pipes. Also move rotation field from struct
> > dpu_plane_state to struct dpu_sw_pipe_cfg.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++++++--------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 --
> >   3 files changed, 31 insertions(+), 28 deletions(-)
> >
>
> Change LGTM and addresses one of the questions I had in the prev patch.
>
> One question though, till patch 11 which adds support for 2 different
> SSPPs for the plane this change is not necessary right? Because till
> that change we assign the same SSPP OR two rectangles of the same SSPP
> so we dont need a per pipe_cfg check till then because both the
> pipe_cfgs point to the same SSPP.
>
> What is your thought on squashing this with patch 11 because from a
> logical split PoV, this change is meaningful only after that.

I'd say patch 11 is complicated enough. I'll check if I can change the
order of patches 09 and 10 to make it more obvious.


-- 
With best wishes
Dmitry
