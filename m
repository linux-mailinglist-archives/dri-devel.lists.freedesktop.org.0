Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C80B9CE11B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DF110E2D4;
	Fri, 15 Nov 2024 14:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vriZD1oH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5868610E86A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:18:58 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6e34339d41bso16794027b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731680337; x=1732285137; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rhxBFTVLr9CXs7yVyXnjqOaOGkDhEtwnjzGXMrCkuoY=;
 b=vriZD1oHdHLIDlLBMvW1Hb0xTBiq/WBZijalt5zLAuMMSZ7XKdKv2T6nnMB/LkWqYa
 VunWcXIiRVtaElLJjv5sQAGJe6qXQNaug2DmsaZZ5FTmUpHUU3yrNmIokY9APQFOgRbF
 2ebw/M5VFD+zEyfNpLnP4k5Cv1wDDkRcpU0VK/49JM5KW1as3KHwECdmfALx8LN27Lwl
 7qfWczkXW+naPjdgEDSDk75L5WLEvbkdZHvt+EtMqppGu7D5EiM/7w5AQNPkdETPy1zQ
 BjikYtjoRZY+YtCh6QxfYuQtmlt++sFhl4F+iOYF1a0ljf9JCGUIZkXUtaxWUaCG7yc5
 HpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731680337; x=1732285137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rhxBFTVLr9CXs7yVyXnjqOaOGkDhEtwnjzGXMrCkuoY=;
 b=g+Vnzl/sq0mgLChttDgbNwfjhl8Olf7QZbTl4RW6FJ7V+fN6qbkYpXI7Pm5bH8vJ1X
 /gqD9Ut3QVKjdJTN3nOUj8TwVvwbpd25HZ6uXf9zrjhFAXBxlFHPbl6g4vRp/osufAvZ
 gRdeQc/aJfklhR1CvfatSg5zLEBNZHhggsdWHk788VVax2ozvaBB76XOUE0RuLW89yQQ
 pfnBojok1hSw0xYoWjWr94zZTUXkR/tG9navlJyd80aEhJMJV1K427cenenBp4OkDVzW
 u3xlCohuUK+bOlfUmlwe77MPLViDvWLPd0nc+MaiTvXM3dKHBdO47edzhXrNXXGnLT8N
 9SBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsuoboREPQBOUgCcy+730SyOU+WrhnRydbZsbDuq9HFF//CmwnUGwogK5tEsTbIbM3DBInhxnGnWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtlmAvCRDamaJA1xOp8ho9yQ/mOiODKPzMD6hkq41mcUbodTEG
 toXwQUSGUDT/ArzhuOTqjbzGNhCbQPNBMsVna9MagVaUzj7ZOy07apSap/UkrcRfyInhfqB1Os7
 LKsOxCPgJYkwFCbqBJsx5LnWU5HUAJpZBeb5x7A==
X-Google-Smtp-Source: AGHT+IHAutNFbQIYrWEa7iEgXdJ0MlhAPiCQSjQjzOFudXA+GpwEclomXP7Hjrwzw+jQnjMyfUPPdwlemfoRMd5mMNo=
X-Received: by 2002:a05:690c:7309:b0:6ee:36be:64b0 with SMTP id
 00721157ae682-6ee55bf0725mr36374547b3.16.1731680337418; Fri, 15 Nov 2024
 06:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-2-3b8d39737a9b@linaro.org>
 <sgz4h6rlmekiwypaisjbnej326wv4vaqt3mgspp4fs4tg3mdfx@cwmdqcu6gwbf>
 <63a2b391-8b71-41cb-bed2-3bc7fd2154ab@linaro.org>
In-Reply-To: <63a2b391-8b71-41cb-bed2-3bc7fd2154ab@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 16:18:45 +0200
Message-ID: <CAA8EJpoFm8EjfBq70RTPtwR7Y7Rm24kHO20NukGiLGRYD0p9Tg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/8] drm/msm: adreno: add GMU_BW_VOTE quirk
To: neil.armstrong@linaro.org
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Fri, 15 Nov 2024 at 11:21, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 15/11/2024 08:07, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 04:48:28PM +0100, Neil Armstrong wrote:
> >> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
> >> along the Frequency and Power Domain level, but by default we leave the
> >> OPP core vote for the interconnect ddr path.
> >>
> >> While scaling via the interconnect path was sufficient, newer GPUs
> >> like the A750 requires specific vote paremeters and bandwidth to
> >> achieve full functionality.
> >>
> >> Add a new Quirk enabling DDR Bandwidth vote via GMU.
> >
> > Please describe, why this is defined as a quirk rather than a proper
> > platform-level property. From my experience with 6xx and 7xx, all the
> > platforms need to send some kind of BW data to the GMU.
>
> Well APRIV, CACHED_COHERENT & PREEMPTION are HW features, why this can't be part of this ?
>
> Perhaps the "quirks" bitfield should be features instead ?

Sounds like that.


-- 
With best wishes
Dmitry
