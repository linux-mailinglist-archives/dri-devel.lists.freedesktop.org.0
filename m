Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE9803E5E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 20:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3273910E337;
	Mon,  4 Dec 2023 19:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1110E237
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 19:27:15 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-db8892a5f96so1884237276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701718034; x=1702322834; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UF8RbcFRVKtyYFhAN8G8o+Q8uKVHcH8Bwv/QadBueXY=;
 b=cXGqDn1Kl56KCueXEG95ir7YYrwD5UgTSJumd3u9zi0205hHYQJE7EDv3U61WTTAkr
 rCjb1g5V0eJ9NR7X2Bx8Veh9JvMLKkPqejx11lC3u4PFGoYTTOoYhpI6xipQS35rOrbm
 3q+BIM1tSRCVrazTQtMQ2q/46Z8zhbp871h58f4u3T7xxQusb2+6qGQEqTejB1vJ0gaq
 yo5LcK/KXGbSoMEwyxQBRLToJk0B/kPY7io9cUZS0tzMAzqiSSVkUlktNkSIbM/66pYr
 +WPHI8S2sQ6SPPrAhHvpbI18oQt4dNuOCT0tURqCLmoCBel24MLZYEYXn9FZA3mcz+A/
 hCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701718034; x=1702322834;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UF8RbcFRVKtyYFhAN8G8o+Q8uKVHcH8Bwv/QadBueXY=;
 b=ddRrLu7vT/YPAy2FXeT67GiwUneq9nMOp+H7HrwJ6GHlojeQsgQ7fUwkDq9RA4b8ry
 7z5sTuX/lOIgAghspnJWsJvT5gAuj21lZ6fPJKEgVqJncJgJf9rpppLfrViQoeJe+Kg3
 TC9aD8/v+cZ3GaqNtrsW6TmTzmlTk9jqZFm7pTrFXIHy7M1FAMEYpkq2Zp5isxXLRNbe
 qyHgBVR7Z7cyo+TGVuA3m117bG1xTPF1pMpMaEgzdgwXeGOE4B2ypoe0XGFLwL46pJ5H
 IC5ArkH4JScUrcWUUH4K+PHJmWiJJjOOQW8fm3MqtklknGQAsnMU7e8SuqmssZw3Hrps
 2Djg==
X-Gm-Message-State: AOJu0YyZDyeWk3aMR595WsBhGvkp23i/HSsyLrpMLc8dd+1Jlir5KW68
 NmJjyH51rYhmlSnUd1lKcBf5U7JBQRY7QHATPDu7MA==
X-Google-Smtp-Source: AGHT+IFoS9lomMmrh7QB8FJlwDVYrAZR+sV2AF3ZiBtQnFSGI4Cd7vfNSSh1Odm+EvCiVHdtf49u0rl6x9sTO4+Vl14=
X-Received: by 2002:a5b:6c4:0:b0:da1:5a1a:e79c with SMTP id
 r4-20020a5b06c4000000b00da15a1ae79cmr28151716ybq.50.1701718034319; Mon, 04
 Dec 2023 11:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
 <5ae4729d-3a06-ef77-be9f-d93e91caa06c@quicinc.com>
In-Reply-To: <5ae4729d-3a06-ef77-be9f-d93e91caa06c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 21:27:03 +0200
Message-ID: <CAA8EJpr7ot-JLD3J7NY2AVQSE6UKhRmZErckwwa+6Wk+8cvwfA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop MSM_ENC_VBLANK support
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 at 20:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 10/3/2023 8:19 PM, Dmitry Baryshkov wrote:
> > There are no in-kernel users of MSM_ENC_VBLANK wait type. Drop it
> > together with the corresponding wait_for_vblank callback.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 --
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  1 -
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 -------------------
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  9 +++---
> >   drivers/gpu/drm/msm/msm_drv.h                 |  2 --
> >   5 files changed, 4 insertions(+), 39 deletions(-)
> >
>
> No users today but will need to be added back when features such as
> autorefresh get added. But, as usual, we go by what in the driver today
> so I am aware that this will be a lost argument.

Hmm, what is the difference between autorefresh and the PSR / self-refresh?

>
> Hence,
>
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
