Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB23675B9A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003CC10EAA4;
	Fri, 20 Jan 2023 17:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14B710EAA4;
 Fri, 20 Jan 2023 17:32:53 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id s66so5002363oib.7;
 Fri, 20 Jan 2023 09:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=87t+oUf+a0Dntkm1neH5VXJkrRsI/op4lJUax3qjibo=;
 b=C11141WGDsrnqbvFx18+o4BqFM9T5uzgu0a9bCtay8eJiafXb5ICVY922ub5/qLDah
 ksS3XsCN7F9xF6+eDXHHtozZjAq2Q2yg1Br5q4PspU+33c5btcapDYnRoBfGozvMs8xB
 ej/M2h86SQGaj6x+pUobn/yPXfV2EANiLb2MsHJlXMvUoDg8zxRRgClQgAaOVM0nWMiQ
 pMgarJMIeI6mpiNKd35zAGAm9GydqW7tGeAfQDwBJDyNBer2x6N7+5cwXxk6w+4JZxse
 AYPPaewMvXfaeqjXr/zkeCNwTejY8ljAqKBhSYEviFnMpnOVlga5XZBHp8ISiu3e8t5Q
 AeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=87t+oUf+a0Dntkm1neH5VXJkrRsI/op4lJUax3qjibo=;
 b=Y/r2VSLzfgrjF5xBSM38nHXa0dz8ZyiFbXtdVyZTX39Fbn3rkmB84KX5DgBXeh7IjN
 x7aKr/9utFhdicEsfC6qv3tm34cUNUy2QSdqmaBEpoFcnjB/7sqgjc5VxYPFiA4YyrzN
 3ZMwymH+/wj1gxT4PqYB4GLf1CtNixc7gayyFK3lsgHZuR1N7axCqEDM2eSDYAk7hxzs
 sc4ooz7kCsCjwvRP3Y1HnqXRV6LKOde7pGINa71d3IwYYI9iFcpbXoA6/k6LlFTt41+4
 TWmBOdcbGnfIOhg3c+0l40TSVRfLicjVU/N6Yd9Ld/6T0/O9T/uow6hpPsf00n/0CWAj
 1AQQ==
X-Gm-Message-State: AFqh2ko6Uxc7Gz8MgKFzq2oIH8n+mSu7+T2uuX7bC7PE+qxqj8tENmTi
 Vijf+e8TcdUVGl0T7JEGGl2O2JgqpwYwQx9yFUE=
X-Google-Smtp-Source: AMrXdXsOtiPsMwKEFnxgJcl1dP7zHFtGdt88xKMd5HouHyfTb+B956vMHCeiRA78YVCNR81SkmOrLXSdERXCJuRPYQk=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr886518oib.96.1674235972772; Fri, 20 Jan
 2023 09:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20230120173226.98569-1-hamza.mahfooz@amd.com>
In-Reply-To: <20230120173226.98569-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Jan 2023 12:32:40 -0500
Message-ID: <CADnq5_MVRBeduHKqUAcPSRF9ruAU5WVOG0w407edocCKME8nXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: use a more appropriate return value in
 dp_retrieve_lttpr_cap()
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Fri, Jan 20, 2023 at 12:31 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> Not all ASICs support LTTPR, however if they don't it doesn't mean that
> we have encountered unexpected behaviour. So, use DC_NOT_SUPPORTED
> instead of DC_ERROR_UNEXPECTED.
>
> Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
> index e72ad1b8330f..21fd9275ae4c 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
> @@ -1462,7 +1462,7 @@ enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
>         bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
>
>         if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout_support)
> -               return DC_ERROR_UNEXPECTED;
> +               return DC_NOT_SUPPORTED;
>
>         /* By reading LTTPR capability, RX assumes that we will enable
>          * LTTPR extended aux timeout if LTTPR is present.
> --
> 2.39.0
>
