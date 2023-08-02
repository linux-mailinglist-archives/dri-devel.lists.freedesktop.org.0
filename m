Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3E76CF47
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 15:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE17110E1F9;
	Wed,  2 Aug 2023 13:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AED10E1A2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 13:55:24 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-c4cb4919bb9so7016201276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690984523; x=1691589323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0l+1x6y6SlbQz0ZIE/2173DpY2Qrcda4Hwn59iq0PMo=;
 b=dXkIeO7gkVyF62wsdR0cMYk0zBzmZhu7GagBplHzhXKz01U92E8gxeSuJJamWAuYCX
 mk2UFZ5zWthSjQPualn7CwT8qrwki4yTyO1u5JE3WZJUxXJp5N7qfycCcuPxbwGFMRYM
 dfJbaGCREHAMnAfmX/eFDyWp1AlID4gpyY+FPgtl8D8iz5yFtsQCNyeTbRzsZpXIJonv
 A3y37/fYeDpM9hdpxEPv3XmozuLkJ168iGm/Cgi2gQOyg3nLKOK4KLCQD5h+k3PSs4nb
 WgLfwgk9b/doZaaFFyMxLkN13iRboV9j0J7K2mavIKPAsdEuXwaK/7ot2jPpqfA4j5D+
 mwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690984523; x=1691589323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0l+1x6y6SlbQz0ZIE/2173DpY2Qrcda4Hwn59iq0PMo=;
 b=NHAkggxs5HT+uYgViaLGQ7NtOa9Q9/fOlKAh2j819tm4hqxAbMkmhglFy441RpmVwP
 c7vRNXw1yeEJziY6ltwZgJBZWLar7CppWuEU10Qdcc5RAgr3wIc//4kGAXRQDF5xDlFk
 W00k0P8HhFrGZ2Nusr08mtelwKqBGV9h3iAabFgiFKyHToqgYYeqQt0f1yVRvvAVFDHu
 KDnUE0HR7DBrBJQQ2NTBEbRKku3D3kB1cg7CChwB0lwBFia+xgpEiuPyXhwAl/pViBGE
 mGtCU3n6QSVUcbLvNJL/pzL96KJAOnidrNxqi3RDB0apZUILeI6ydrLJKqrJXHcFZhug
 uDYQ==
X-Gm-Message-State: ABy/qLaBb9zsd4SZPqEF/k2qbixVB0vyEs2qp9mB3TFOfXxAdJpOhhhN
 nXrgQF0Vhs5L4BkQP1vwqLJI/XggveMsDZAaNv7hiQ==
X-Google-Smtp-Source: APBJJlHy3baV7qerO928qPmdbPqm5oivM1YoS7WHoTdeQ2XpwejyhZi1QTTp65m9Jfs0ry5oerZeSO5HesVrAlx0qXM=
X-Received: by 2002:a25:d84a:0:b0:d11:c89:4256 with SMTP id
 p71-20020a25d84a000000b00d110c894256mr14190350ybg.31.1690984523733; Wed, 02
 Aug 2023 06:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230802134900.30435-1-jonathan@marek.ca>
In-Reply-To: <20230802134900.30435-1-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Aug 2023 16:55:12 +0300
Message-ID: <CAA8EJpoKj0UNbuv_vGBLsv9JK9qR7rD+OTSC1ujhsR53N9jOBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: increase memtype count to 16 for sm8550
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 16:51, Jonathan Marek <jonathan@marek.ca> wrote:
>
> sm8550 has 16 vbif clients.
>
> This fixes the extra 2 clients (DMA4/DMA5) not having their memtype
> initialized. This fixes DMA4/DMA5 planes not displaying correctly.
>
> Fixes: efcd0107 ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Thanks!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 ++--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
