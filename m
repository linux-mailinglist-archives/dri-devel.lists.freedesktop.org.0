Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE61772C28
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DE610E324;
	Mon,  7 Aug 2023 17:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DB010E324;
 Mon,  7 Aug 2023 17:11:36 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-56cc461f34fso2815045eaf.0; 
 Mon, 07 Aug 2023 10:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428295; x=1692033095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cb719TiPSFcf9uKZA1yFMTUpQqmltNXq0TvmhepyQ0=;
 b=iZPqUxsoLXrPzqwuobnTpx/R9Sgwl9x0cdvCVM9Ne1AdS7BMX+OcpQlLyA9Whfray6
 fyq3f66qtgIZIbEh55XMI4dTChcsaqdiAeeprULuVuhouJ0hX4I9JEGxd6pb/q3WNQSV
 RRFznkugFVEmfoIQ4F3IYFnlo0t9u/fK0syCFU92gvm1iQ3HkOHydOhlADPajgl748aC
 YRYIOkLYCUDVZhJdEgkA7ww+Odmj6zFXVerp21sL+cjfuCPab9zi554KuiDHwmnAS3df
 klyPA48fAd3uIA0rqyxXa/C3QLbAGWsSWoaJFsL/Jx1l0F8Loo1p4ejJ7lvrVvV6y/jS
 ln6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428295; x=1692033095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cb719TiPSFcf9uKZA1yFMTUpQqmltNXq0TvmhepyQ0=;
 b=Q9Wcf0fTSYqRP/owIQWOSdf2O2S7oHIe2J9zZBzZakX1Kr973ca6KLvoIzn5pUvGd3
 KMhXSxIeutqJTHPZx8KQSG2Kpke7NKXmjn2A2PfYHXUPLYJ2tgUeEk1FL0pTvAQfDXQd
 NM0zqfXXxXhqWNWFnhIFgXEWFKamhqO68N+CnWfGueDWWdOV1eud3AP8O5ZOW3EyDdKK
 dQ+2UfFGl6mqjzq5ldPnUOaqFlHeAwbxuRIj3rKEz3o0cNIEGQhfFku4Q9m4uzXxuJem
 BOfnwbpM0wuZIMp4PXpQlejB0l2loN8ZlzzR09YrF5EtyNQveT7lWwr/JJyjBwVUBf9F
 hWvA==
X-Gm-Message-State: AOJu0YytuyNHjBHH4EUMR8VLpeNCT0WhivV/LN4qpuAJAQot9+tAsDaU
 LwAzHJPJuS4exzRVWBZwUxWCc5xR79kHjgenCiU=
X-Google-Smtp-Source: AGHT+IFUJnFHo3CrequPs1Hcxl1cl53hPeVVld+cCrZ+J+VseiFurZ9BnY7NzcqbAfK/hR5QJ2sFjOC6SCbHU+UB3mI=
X-Received: by 2002:a05:6870:350f:b0:1b4:685d:55e4 with SMTP id
 k15-20020a056870350f00b001b4685d55e4mr11879096oah.39.1691428295449; Mon, 07
 Aug 2023 10:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230802030111.10658-1-sunran001@208suo.com>
In-Reply-To: <20230802030111.10658-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:11:24 -0400
Message-ID: <CADnq5_OZnaYnTkz7zNEDjsHxrRMXoS3HwXbtT3tuj8gL7fmzfw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in dcn316_clk_mgr.c
To: Ran Sun <sunran001@208suo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 11:01=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c  | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr=
.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
> index 0349631991b8..09151cc56ce4 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
> @@ -45,13 +45,11 @@
>  #define MAX_INSTANCE                                        7
>  #define MAX_SEGMENT                                         6
>
> -struct IP_BASE_INSTANCE
> -{
> +struct IP_BASE_INSTANCE {
>      unsigned int segment[MAX_SEGMENT];
>  };
>
> -struct IP_BASE
> -{
> +struct IP_BASE {
>      struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
>  };
>
> --
> 2.17.1
>
