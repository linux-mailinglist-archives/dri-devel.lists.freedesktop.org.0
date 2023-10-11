Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C413D7C5488
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B8610E7DC;
	Wed, 11 Oct 2023 12:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDFD10E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 12:55:56 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5a7ad24b3aaso31181577b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 05:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697028955; x=1697633755; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EMpanbuMcLckus9ZARSZ53Uwja0e50NWNJtv+xhA5TM=;
 b=KaYUuZqZeN4wjd5zioAWpKmCiLrX6Igmv+wwEfMpy3qdYBeywJj+z/8l5UYkF+AYW5
 Q0aW2pSkBW6re4WYbROHlzvhbXXslRD59GEAqdqSKqxzXMCKBuP/Suds6bVaztMpLgbn
 fY0QuldVM7tjL0/fBcq/AHnZxG5Szaidxi9gENyWEpFLhJJqIM634y9htjmLEg6eD+pJ
 IX/9agYBDV8Z9V3g1auDyB1xXo1psGuuR4dP+z/otBPys+hQ4dC463HXblet9ZZ97+zJ
 dDYM8rOB3jbUsPH1TYHeWXUln3vFVxrWrO5KumvMBWJjqby8Y8iDO9goBvr5ZVAWFPEr
 LWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697028955; x=1697633755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EMpanbuMcLckus9ZARSZ53Uwja0e50NWNJtv+xhA5TM=;
 b=r79bHIhnxIEMRznPp1jPMy1tyy8Qkpa+JVonsx1wbwVmegs4oMpDCB+ntnoMDZ7pTa
 pnsy9mNyVqmXRhZpw5bsihGJrb5I2aBHEVlLqQUTFaxB47CtANR7blTGXr8OENIg9HCA
 IZEAgEaaKr/7HmxTKhniKUYT7TLHmx97700yQHZXQ4fyrUR9umvqohMgACTo/sFUy9Ad
 ChwYDvdKbnTIyqes0MDXNWt6wrkL9VxfjEeQG6AMyFkR5YZOnpjMr/jIKltiq5YqYuRF
 YdkYUQ8oHhf13mW5qIM0LnC7eyRv/dnnyySc1mg2MViQiVwgmEel0ptEV8t1PbnF+M1K
 Jwhg==
X-Gm-Message-State: AOJu0Yy4Nbe9BtKkPDaQE+NMYxaJ7iaHUUBE4u3zs1tKLfZZ0QwNygnO
 q+BJdgqBsp6l30w3x1szLCkP/VjYIvKCD4194MI8WQ==
X-Google-Smtp-Source: AGHT+IEIo1rpWm9ozb2LC8BBsWDuwXIWlIvdWVu7bjYXOoAjwOwLrnyyqhLenYE18qjjRDtzEBTv1V0bMC53GjFv++k=
X-Received: by 2002:a81:9149:0:b0:5a7:b782:6dd9 with SMTP id
 i70-20020a819149000000b005a7b7826dd9mr6553527ywg.26.1697028955491; Wed, 11
 Oct 2023 05:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
 <20231011-topic-sm8550-graphics-sspp-split-clk-v2-4-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-4-b219c945df53@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Oct 2023 15:55:44 +0300
Message-ID: <CAA8EJpq_DnKseY_CGJ36V1v_vc2dsCS4UCiEYWnbfz4Cp5vtfQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: sm8550: remove unused VIG and DMA
 clock controls entries
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023 at 14:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The SM8550 has the SSPP clk_ctrl in the SSPP registers, remove the
> duplicate clock controls from the MDP top.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
