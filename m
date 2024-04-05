Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B089A415
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 20:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6C10E607;
	Fri,  5 Apr 2024 18:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nShvkqtz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F199110E607
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 18:20:05 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc742543119so2499411276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712341205; x=1712946005; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kpDzGRrClkUxxd0wNBawM8cLr5mKpKI36/KDGXm6I7I=;
 b=nShvkqtz7cFsNeIyTZZQoWOuzzKY7c7sGhGQkamr9tLgHCJqIUejTDyDmgK7VuRqXv
 rhnHUpXxctUXimCgxj4lv8e1N2QChuAzS8eohVHHKonPygQ5zI5ZXxsPipkvUrI7amRf
 tUVt4UgFiFTqrWA8Ypm+t57l/9LumB/Qu+hiX5ekbLK5mh/616cNqKT4RCQ4wE4+rk2q
 nfRf5M+e/SsvnSPLFIxBvNp1oK4mjnqOgU0xE0Ml1S/db6U0kyjImhLsX3cLJdqICLVz
 aVCPKj3Hk6F1M7bXc6h6vx2OFVQBma+5WnCtVAxUukV8e8J3Md8jpLrj55dMzST5Dthl
 fHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712341205; x=1712946005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kpDzGRrClkUxxd0wNBawM8cLr5mKpKI36/KDGXm6I7I=;
 b=Df6xzU6jz+Rpu3nxc/YINR92LgRxTpfWDN2adNdRO50eIkYmHUSR0GdTAlc8/3t1c4
 nCmMVefuqYb+FQlBMqdT3/Z9onx1kpAPq6YhprDWCz4RXXFDNwlRdw1YqkWNPPvdJW8p
 vubIhoCAJwZdNFQ8q3+GOxHdITK6zM1/FgrGrzrCWb/bYmprExMRpaIwrcCzsUY5lR6R
 WpR9BP8RxsmnCSsUGfWfkekaf+c3pRnV4YCy7wq0s6k2pzosiEeLlnIs8Ch1xsSxyds9
 BsOPkpIURYLnpFtCr4Il9fXPDqm6atvAWx7lG6Vy5UUsHKNhb4VgdZbPLqjpEqqLXEg0
 bTYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHjSiz28XCdUFb5uznMV9MV/8eMEGtAtDy83UKQY6mF5Vo9MhJ9FOXwRHrqG4uy90Tfy0QaYez7YwW98LnnE2hgL0cb57dH/6jAotHJOx/
X-Gm-Message-State: AOJu0YzBniPNkyignz0kbHr4CpVVyGOLqeDYmzDqH7P+8wK+jreq1BC9
 USzmcIpp62Yi4/ljd7AxV9Da51O3tM1A8FsV7PAoQYejtOtDnqlnLqgc2JxYDea/Q9Cl1a7KqmS
 5D9bX4iDmLlsqcXDDBX7TlE+fUZRTrlAMSwI5NA==
X-Google-Smtp-Source: AGHT+IEmS3F4yd2lSXcfoF8T5aDOGQm50r0FnJ0IB21W480Br+HatBoZliUU6wHsBQ2BYSCNyXyrl0Pj9i762weS68s=
X-Received: by 2002:a25:69c2:0:b0:dcb:e82c:f7d with SMTP id
 e185-20020a2569c2000000b00dcbe82c0f7dmr2213889ybc.41.1712341204840; Fri, 05
 Apr 2024 11:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
 <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com>
 <CAA8EJppbETLONx8pEdT1kT1Hp1i405m-4PfgumvvOa9N2mh6CA@mail.gmail.com>
 <363efce2-5540-b81a-31be-b5919635b586@quicinc.com>
In-Reply-To: <363efce2-5540-b81a-31be-b5919635b586@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 21:19:54 +0300
Message-ID: <CAA8EJpoPbK6rEKG9mh2pfo1tp8Rrn7oqXt50j0q2O5v50A8Zjg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

On Fri, 5 Apr 2024 at 21:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/5/2024 11:16 AM, Dmitry Baryshkov wrote:
> > On Fri, 5 Apr 2024 at 20:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> >>> All the bridges that are being used with the MSM DSI hosts have been
> >>> converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
> >>> code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
> >>> downstream bridges.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
> >>>    1 file changed, 11 insertions(+), 25 deletions(-)
> >>>
> >>
> >> There are the bridges I checked by looking at the dts:
> >>
> >> 1) lontium,lt9611
> >> 2) lontium,lt9611uxc
> >> 3) adi,adv7533
> >> 4) ti,sn65dsi86
> >>
> >> Are there any more?
> >>
> >> If not, this LGTM
> >>
> >> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >
> >  From your message it looks more like Tested-by rather than just Reviewed-by
> >
>
> No, I only cross-checked the dts.
>
> So, its only Reviewed-by :)
>
> But I wanted to list down all the bridges

Then I'd also nominate the panel bridge to the list of bridges for
cross-checking. It is created automatically when we request a bridge,
but DT has only a panel.

-- 
With best wishes
Dmitry
