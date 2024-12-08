Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B599E8449
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 09:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2655010E24B;
	Sun,  8 Dec 2024 08:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kw0j5VBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3676010E24B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 08:51:39 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so607550e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 00:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733647897; x=1734252697; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uhNcbbr16rCA3/JeSUAsY4Iitw9SPQbHFYkFe1dOMAY=;
 b=Kw0j5VBiXNJXuxMElbwXF4rNYPfjoITShdSkPcW8rvOtx373cU78vMiO235nmmrUmT
 rqnfx3QGvy8Mhk/sWqjK9vMGfWC+4VNjRKPAbbEv1ZX3DXDzjsKrDsYbn4M9v+gI+wDu
 HePSZMLZywnUrMoc/oq3Th7aj5az1g0ziLgCDrFvt8HBrAsIqc2aRSPfM/VI9aSBZCfi
 MF/cGMbyYtHQKajyGllj+c/GIadVHAnO9Hh4ODrLWor2gvUvdY5JhNmf1crC/gubt983
 zm57kiwRDMgJLZ8zF2I6e2c0NsyDKK03BEASIPM1cqcMYbZJYscDfXtdnbLWrz3ong1Z
 A4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733647897; x=1734252697;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhNcbbr16rCA3/JeSUAsY4Iitw9SPQbHFYkFe1dOMAY=;
 b=p1ku+CBpnyeTx5f8fsc79izQNZJucsnGpsETyzMf+sssL/y3EYHMQp5e2dFsnLz1hs
 1Vo4z9rsE3wkcBusG9BoEvlIHlMw+K73dMk6YdYI78mjk/EjLt8sp2ZJ9MJclwC8XVNV
 TaJ23CP99jphc0RrZ2AusKoEXaZGxelM7gTt199dNvSQ7El5lNPFMRrGkc/S9ZZgVjgM
 0GJCtwScSiLD4q7cySmPEDhQmACpZVdxkk4vmFCwOTCrzqrOrLHbKD+WYWmo21ohtnB/
 eTRNrNt8JoRajABEmp66hwryXZfLdnofO4U6svaPJY2z2tUJ4RUW9qP1ZkarBLx5lo7R
 7NgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOSAi74jAkudvX/l6oQZ/DSIXwKA00bbtBvCT1ZK2XZOxJzgljCuvNInG0DNJ6ZHlJhyQyWOGot2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw981kLhyRJWPKVdXLXfK+Hay+hcisxn7RvsEVuOH0ZZkfDIU61
 lgIRaDrC3EOzJwO902si7nBaqIDe+cpmo9lqKdHm2o/+KBYmBqUdNnUI8CjfRak=
X-Gm-Gg: ASbGnctl2owM243oewpbuxM7FPxuHPDgmNN321R2viAHVm5XJIKPNOowiyNpxH68nOs
 xA2LfxrE0+sRnWNqYLNiNeVEB7QO8kpDmIATZtemHaCWrgZJNLAJEMvGoBgqQ2o22IjC7YdoCI5
 tMKlxlWzidM2g3VYnlrATGFOBgao9JHzRUzF6TSXBIElCnjKuPYndD0AXp7v8xwh5S1rpFUORPx
 4TXNFgKVHVTofXyuaYbCy6eDuyyrTm2Wfp59jC3LioTN7cwHws89pN9jFF857ci2MsZmobvaAIV
 0cvQTQ1P5eiaGEGrX1BFZpcdBQk1CA==
X-Google-Smtp-Source: AGHT+IHiwphjww0ZX/ARCaOQWbDtkiMp61r+FZ23Ev0IT+2ZIgkD8Jn/Hmmxto1mAzafzC+0GFmXvg==
X-Received: by 2002:a05:6512:3e15:b0:53e:38df:673d with SMTP id
 2adb3069b0e04-53e38df6949mr2968634e87.43.1733647897072; 
 Sun, 08 Dec 2024 00:51:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ca282sm1033705e87.241.2024.12.08.00.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 00:51:36 -0800 (PST)
Date: Sun, 8 Dec 2024 10:51:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 30/45] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Message-ID: <akhwuvpxxsjmejbbwksf3uty3cs3utian2vsmalrtfxbx6h6r6@pcrlpelx3545>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-30-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-30-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:01PM -0800, Abhinav Kumar wrote:
> Add an API dp_display_get_panel() to initialize and return a DP
> panel to be used by DP MST module. Since some of the fields of
> DP panel are private, dp_display module needs to initialize these
> parts and return the panel back.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  2 files changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
