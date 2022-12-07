Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54322645D2B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 16:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAD210E3C6;
	Wed,  7 Dec 2022 15:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2106B10E3C5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 15:02:17 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id l11so25285374edb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 07:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rkW+R4a4Tse6+MACAktrvnQJHvMvBdaXyWKhbIEKa4Y=;
 b=fkHTwS2xda8lXWPwC/vh6Sh3dsVuHW6pI5EwaLzpeW2PTehU5ETuWBv7ToCAGRlohi
 8PA0gxeF/NHGRup1QG2jbLwskMNCfUY7Y/w2tc3n2CcTY0CgV6VOsnSRlehtDRv0l4ho
 6OmIIbqIKTUeZu0L5HPuVvlFENu1fsb4bC/UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rkW+R4a4Tse6+MACAktrvnQJHvMvBdaXyWKhbIEKa4Y=;
 b=jT9sxuYvou2M3f3mPnhj869yuJwCyedWmMko15mfgDJ1kosPdIVadK+Lc1zmwUJ81T
 FYJKmOKIvcNHMBES/2BIa7dSMMYA86hlG+RbJzVOlwx7Mgh2TPNQIZ3Si44JJd7zW5OS
 LEx+2RADkCJHcpDsIelSnRc7TqfiPvqPLdODpyMjmMcRo30AiLsORRThyq7F8+z+qu92
 VJq62/QAdWeykFH1KxqaxDQ+fPZ0Ix/knmIpoaneLwvHwVedDAlOec7ZbHFP3DxYoBiU
 bM3Jw1J6HZNUm/LRaddu+fKXpOlsZBgSOM/fIIiXg3sGFVOCbfBFz9Wzf95uR/VRTY0H
 xF1g==
X-Gm-Message-State: ANoB5pkQ9ga2+97LGUK8V+P3Vz7+V5x0PhbbJsgJYkHoNTw6OsPsbDxh
 uKYfMs1Rc1V+KtqJ2rrIX4Ws3yxTi5jhasC1QiU=
X-Google-Smtp-Source: AA0mqf4EImze7vcmRnsHfq/4UqNScFs50i5RFq2QY0zcyc82wNrYQlTmNFKq5BGxnwgTz7dMKpvzWw==
X-Received: by 2002:a05:6402:3648:b0:462:9baa:7507 with SMTP id
 em8-20020a056402364800b004629baa7507mr626873edb.8.1670425335385; 
 Wed, 07 Dec 2022 07:02:15 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 ee9-20020a056402290900b004619f024864sm2292822edb.81.2022.12.07.07.02.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 07:02:15 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id bg10so13842749wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 07:02:14 -0800 (PST)
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id
 ay18-20020a05600c1e1200b003cf9ad3a20emr57361645wmb.151.1670425332189; Wed, 07
 Dec 2022 07:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20221207065922.2086368-1-linmq006@gmail.com>
In-Reply-To: <20221207065922.2086368-1-linmq006@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Dec 2022 07:01:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VDQZu_-kDOQVLoz1SNPda_78aQ+NMa163mXDmnmXrRSg@mail.gmail.com>
Message-ID: <CAD=FV=VDQZu_-kDOQVLoz1SNPda_78aQ+NMa163mXDmnmXrRSg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix memory leak in
 msm_mdss_parse_data_bus_icc_path
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 6, 2022 at 10:59 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_icc_get() alloc resources for path1, we should release it when not
> need anymore. Early return when IS_ERR_OR_NULL(path0) may leak path1.
> Defer getting path1 to fix this.
>
> Fixes: b9364eed9232 ("drm/msm/dpu: Move min BW request and full BW disable back to mdss")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> changes in v2:
> - move getting path1 after error check for path0.
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
