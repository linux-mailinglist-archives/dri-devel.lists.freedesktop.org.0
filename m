Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464B60612C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8375710EF19;
	Thu, 20 Oct 2022 13:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C4110ECBB;
 Thu, 20 Oct 2022 13:11:50 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 r8-20020a056830120800b00661a0a236efso11362872otp.4; 
 Thu, 20 Oct 2022 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u0+uDTLiSxgXk5TNHxXL03uQzfakDOtS8Qg9Ra2ST6U=;
 b=bIHISWEu+A1kb4nsc5ajKrDMtLpPAo/s4FYHDz95KD8eeK1s4R8ES/qAXqx05A8Xwh
 PhGN3980e9ybQtn8YsabSGIkUnaePSfiMS09+WT4rxBGMtjDH29j0mKT3/aIie156yN9
 Wc3htvRPUI97m3x5HhiSZrJA4Ch2aBqUY/BVO27eKUWSTqkyxiMKvbn/JjXHCPaFxtWc
 Hv3ntlc8EKRbb2Yn8ULdtpdlHU9ZmF08DOSZbBr02QH+k42U6cfu9G3cyZk/p1qbIWD8
 1272n1itRVgwXnayL1g9XPJw0L+Prv0GaoCcZRR5vjLssAyeDQrgmBbtlp7TNvGNmhJX
 9seA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0+uDTLiSxgXk5TNHxXL03uQzfakDOtS8Qg9Ra2ST6U=;
 b=l1xdoxtenNX/k7IIgEN8oRoFNnXMwOdvfs7D1eNkAlMXqP/FMcZjZoxlOtRwsAnDqK
 3kycnwhuHjdrlXn3bh2BHkqxOG023nUqtyB4tOeI+gsy+2fXj9V19EvGglUe+hvPStZQ
 Qauxu+i36iHK31wkprr6ZNJ4JNqko+TGhfH8PGOCG7nR7BCLfp1Ok0L3QpQPAhNexZ8N
 cls99ibanIDhCz3rC8rUcHoW/5xq+Tx5s3+VMM0MSq099cAnqqiuAxdB8mFWNRIFSo6j
 iJbvWD2WqrE+10NcCYisnQ7Nci6Wgm1rz9apPILvp0u/K6JmnjqEQjBVVn9t8NQRTthT
 jq6A==
X-Gm-Message-State: ACrzQf1u362trLUWZMCYHxEhtu13UprEQ1ailsuJWEuhG2P3D9fzLAVf
 whzCyr4cgsqt7U7D4Kqkuwu9XdE8p1a9BMe4nc0=
X-Google-Smtp-Source: AMsMyM6842vpHVdqDrFoBPGHYpKmR0VIvXOGeO6/O+xzMcfkIdqXt3vuft4DKch3kwVV7F4YQ6X47YLJQXnAzVLuCHU=
X-Received: by 2002:a9d:6645:0:b0:661:b778:41b8 with SMTP id
 q5-20020a9d6645000000b00661b77841b8mr6967997otm.233.1666271510132; Thu, 20
 Oct 2022 06:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221019063115.3757510-1-ruanjinjie@huawei.com>
 <faaae681-65b7-0cc5-d413-b8995978d2c5@amd.com>
In-Reply-To: <faaae681-65b7-0cc5-d413-b8995978d2c5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Oct 2022 09:11:38 -0400
Message-ID: <CADnq5_MX4irT51Th6OaQNONohxO85wyf5g5YLX73jOxTyJVetw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: make dcn32_mmhubbub_funcs static
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: jiapeng.chong@linux.alibaba.com, sunpeng.li@amd.com,
 ruanjinjie <ruanjinjie@huawei.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 isabbasso@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Oct 19, 2022 at 9:27 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
>
>
> On 2022-10-19 02:31, ruanjinjie wrote:
> > The symbol is not used outside of the file, so mark it static.
> >
> > Fixes the following warning:
> >
> > drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mmhubbub.c:214:28:
> > warning: symbol 'dcn32_mmhubbub_funcs' was
> > not declared. Should it be static?
> >
> > Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
> > index 41b0baf8e183..c3b089ba511a 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
> > @@ -211,7 +211,7 @@ static void mmhubbub32_config_mcif_arb(struct mcif_wb *mcif_wb,
> >       REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE,  params->arbitration_slice);
> >  }
> >
> > -const struct mcif_wb_funcs dcn32_mmhubbub_funcs = {
> > +static const struct mcif_wb_funcs dcn32_mmhubbub_funcs = {
> >       .warmup_mcif            = mmhubbub32_warmup_mcif,
> >       .enable_mcif            = mmhubbub2_enable_mcif,
> >       .disable_mcif           = mmhubbub2_disable_mcif,
>
