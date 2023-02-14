Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1251696BDA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A010210E231;
	Tue, 14 Feb 2023 17:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAD310E0ED;
 Tue, 14 Feb 2023 17:39:37 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id bx13so13573426oib.13;
 Tue, 14 Feb 2023 09:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFFMcODzFR4+yM9tm6tOX9VuK4ZVp3Utj5wx4NaZaMk=;
 b=gw44pMMxp5ODEfpnpMhTBLzOxZtOLSvvGmUBADdGBmV6tRdYzHqjzcsZdbPGS/87Hk
 NDB0KKheYwF5xNDenpMuw2mER6AEu7keGMgJEWto2C19I30AJ+eLsoRQqRL2iaC/91rL
 kxmOY0CR7ORBNhi/kuan6+7WtJXMAVcS/zH5QypHSDMTdAHP+aUkUwnsCBszkaStOlwW
 5yfUDIuhrneQkHGsLxiiI308Vwi6xiVfb7l5fMeaPVFZVaoKdIyOcB6RQbP4XOc4MxJe
 RRoPRg5EwZFjN25Zs055SbA/fJAHgfAPPd+duu04W3KxhFKo9bY8XACY+3B3IDQdvoSS
 YbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZFFMcODzFR4+yM9tm6tOX9VuK4ZVp3Utj5wx4NaZaMk=;
 b=P6bK3+Pa4JLMX3EvIk2FanBmHxSCZI4yFmHh3FWPaGc4cQHhYYNzDAxVH6VEZD0Ya4
 Sqp1igkIHXII41wBPuwR/gBTTJd8ZeYr/RJype6hEGaBYDakvrUFi3GBuSUsb5GT/tVF
 0DS52ABoTPPgiHMyaiTUzzrd0HXLe6zxCclZMh52yG8JaPhdn+OnMA71XxS6bqwXjS0G
 3rD0O462AKrXZ/ayulyVKck2CXS/gdUiIMfUXL26cmrEHzx9nvP2/tUayd1l8ki1/2Nb
 eH/4x+m33Ql/4kiiUzmU3cfD0ygWtwVS2q6YwgU9tArmaYR4mLbet2c2+N9AFx8TAFkr
 3NJQ==
X-Gm-Message-State: AO0yUKXn0Umlb72oqkc3eZq+HD5uXsAE13lHzxBDpBdQC4xWr2Ryjvaw
 0+7KVB8vaEk8aHHABKOAMxUMrsxzC0NFFNzmA2Q=
X-Google-Smtp-Source: AK7set8/rNX6eScQImS8fwmDlfo6Tfrkdl4BoyhCpYhTswk4X3g0BwPsoY9iZXQUreI88xhvgFBNiFcRbTCC7dMrqFc=
X-Received: by 2002:a05:6808:a10:b0:35b:d93f:cbc4 with SMTP id
 n16-20020a0568080a1000b0035bd93fcbc4mr23447oij.96.1676396376636; Tue, 14 Feb
 2023 09:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
 <20230213204923.111948-2-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-2-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Feb 2023 12:39:25 -0500
Message-ID: <CADnq5_MNyA9HF-YKUqRO8W9GFJh8KFWt0v=TGA1T++93PMcE1Q@mail.gmail.com>
Subject: Re: [PATCH 01/10] drm/amd/display: Turn global functions into static
To: Arthur Grillo <arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 3:49 PM Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> Turn global functions that are only used locally into static ones. This
> reduces the number of -Wmissing-prototypes warnings.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

The first hunk was already fixed, but I applied the second hunk.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> index 8c368bcc8e7e..a737782b2840 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
> @@ -87,7 +87,7 @@ static int dcn315_get_active_display_cnt_wa(
>         return display_count;
>  }
>
> -bool should_disable_otg(struct pipe_ctx *pipe)
> +static bool should_disable_otg(struct pipe_ctx *pipe)
>  {
>         bool ret = true;
>
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> index 27dc8c9955f4..3c7cb3dc046b 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> @@ -37,7 +37,7 @@
>  #include "soc15_hw_ip.h"
>  #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
>
> -enum dc_irq_source to_dal_irq_source_dcn201(
> +static enum dc_irq_source to_dal_irq_source_dcn201(
>                 struct irq_service *irq_service,
>                 uint32_t src_id,
>                 uint32_t ext_id)
> --
> 2.39.1
>
