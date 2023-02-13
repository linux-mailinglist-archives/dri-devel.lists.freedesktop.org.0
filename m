Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D5694C1E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 17:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A341C10E610;
	Mon, 13 Feb 2023 16:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E6E10E062;
 Mon, 13 Feb 2023 16:13:34 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-16df32f2ffdso5040346fac.1; 
 Mon, 13 Feb 2023 08:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HOydk6f84zeK5t+nIiZ1wDb4AVF47DPeadPPFSHvPJc=;
 b=HC0mIP+w3RPfsCmj0wmS+ImFgNYE3XYFw5PVe53+TRWvZSAjbl9vb9taNnzbmcwhDS
 E8kfabCq1CWjn58/nwd/32SJPsKfMsTNGimZ4rNY/GlTDcIWtcop0Sv9gToNamMaCjUH
 xGkbrGJHMxKP6YGuRNTHdz1IcmHrSROTpmkTDQbyQubc47WJe/TpQ0nBdbdn2sR67obA
 zEuspuxtvx4lcR/6swPWZ/VButDBCRWaUSFSWOZ+zflPgd/kDWXtByjHBf7AzGrIUyCB
 xvQhAjytrT0L7RNKJGk7y9IGq9q5BQWBsBPl55ZOuyw4Cq4sd7u6u6QaYLdmN2Htu8Ag
 Dg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HOydk6f84zeK5t+nIiZ1wDb4AVF47DPeadPPFSHvPJc=;
 b=avKqSAzHgIOBqHDZofOI0zd7OTOBt/dlCeDPV65fmQa+mcUyGW4A4x5Lnucsat1rsD
 NJET6ozOyK6z7xDZwEtLN2+1ELkAPRcTz8bAEdCH2a+9ESUSuNshMdNa2gvzkWUu3oC4
 qP2sAxfDSS4Xj+MC9XcxvwOjhXD7SotqDm2VE7S5jiuvuNEBZAV8ioyfE8m9Oe+A1pDe
 KWUEGV35ZtPvEX/RqJsA4xdHPZn406vC+yfnTy9gke/EnCsRIjHkpOpSpz7tbr9LAMUh
 Xq7sEhWy2YQiqUyU1V1G/pRoxYKO0sFkrRhEDsZqT5STzxq4jWDFdEMwhkinEw7s4KPY
 2iwA==
X-Gm-Message-State: AO0yUKWOVf5Ne4tQ1lKIt+UfRbtr/v7AcefzE2OCpO5cIKh6m6nFAZUL
 1JpaMNqOxN+J27x7AxDFHUl+LRZWAzst57X2RjY=
X-Google-Smtp-Source: AK7set/+1BMz88y4VQ6Euwne6f3OxLMLtGXYlj3boy9L2t2Ld3F0bsO6hDBA9bIjQfHtI3wcFCTsVFD8Uf3x7wTeTiw=
X-Received: by 2002:a05:6870:13d1:b0:163:a303:fe2f with SMTP id
 17-20020a05687013d100b00163a303fe2fmr2647166oat.96.1676304814031; Mon, 13 Feb
 2023 08:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20230210005859.397-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230210005859.397-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Feb 2023 11:13:22 -0500
Message-ID: <CADnq5_OCRemgZTS3R7soFcsnUqgf+sewJ4GM42jkTBDyrKXyLg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Simplify bool conversion
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

On Thu, Feb 9, 2023 at 7:59 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c:1610:68-73: WARNING: conversion to bool not needed here
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4025
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  .../gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index 24d356ebd7a9..cb38afde3fc8 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -1607,7 +1607,7 @@ static bool retrieve_link_cap(struct dc_link *link)
>                         dpcd_data[DP_TRAINING_AUX_RD_INTERVAL];
>
>                 link->dpcd_caps.ext_receiver_cap_field_present =
> -                               aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1 ? true:false;
> +                               aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1;
>
>                 if (aux_rd_interval.bits.EXT_RECEIVER_CAP_FIELD_PRESENT == 1) {
>                         uint8_t ext_cap_data[16];
> --
> 2.20.1.7.g153144c
>
