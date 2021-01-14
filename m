Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9A82F67ED
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2374889BFB;
	Thu, 14 Jan 2021 17:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B457389BB2;
 Thu, 14 Jan 2021 17:41:39 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id b24so5965560otj.0;
 Thu, 14 Jan 2021 09:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yZPtLF2dgwtYAx1TmKj7odMtDrqK/Ohq/q+D+rVa6A4=;
 b=TLIeA3UaMz5+tl+wSOxPwxf3If/iTw7OJUGFbRHXDRypWHQn2d8jJ/JuDYdj8eGneb
 +w6/YwbyFx4iNmi8ociz44tEkr6KTsL4DoiR/Q2ki1QA2pQ8t6MxPSW+J03ZbABdxHnw
 c430B40XM2qOfPYMyGhX8JsGxp9naiwbanbabVJSWEsLApnVuacZQNKOrCTYrS8Zd3kj
 VbGOAfrtMFplYh4tYVOkDxWXsrzMGvXLbpFqujQBUf/8wyjaVJzpf2yf9OfugUHXvgTd
 QP/k0+sB7KpfMUKTObqoexpBd4mPwXGeGjngIjA5uR9T5jhqbHJB/q/ZHiDgV3orsMWs
 9d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yZPtLF2dgwtYAx1TmKj7odMtDrqK/Ohq/q+D+rVa6A4=;
 b=F+g21/6d7L/cVlVRunF0mrZAdqAm1f2FnBUStrJ9n2UTn+P+KJYIXOuJRqjJ6FfOxR
 ZEFOSa8XV/MDC09e5PvVfSKZvNQr5VLLPOMml8o504chat0jd3ZdzPKGHjgNytrgic9Z
 1R1hmb13mRvJHzGQK3zzt4KeJB4+ccRLLQf1WKO/69LmeRm4p8rcTZ1UcV13+aT7elq1
 d2KkrvPlowbkjsjeOWLiWjCjPYIkZMW62FJVPr2TtdVASHQBezeDlN8CnTwa76DnSMqc
 LvzHH3SG5MUsOfxT9z86N58rLiUYUNyuzM3SI1plVzwSDmCZw618D3xhifV4OHdCkia+
 YghA==
X-Gm-Message-State: AOAM531O7BQr3kOvb2lbHOxiaFRy+wW5N9MACB2UvqwXftZKZNVzoI0C
 Yb3HBVrCyK7/9kmZteUDrLIBE+IeqRBrBA24JHSRpi9x
X-Google-Smtp-Source: ABdhPJzsRi4cgwbG4fQaEhSiIMVFgLf/Qc0wTAfEtuD/mGakUOeiO/PqLuEnTVZ7CvoEOt4zKEprnmEBklSM22MhY+Q=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr5369048otl.311.1610646099154; 
 Thu, 14 Jan 2021 09:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20210114074755.45539-1-zhangzhijie@loongson.cn>
In-Reply-To: <20210114074755.45539-1-zhangzhijie@loongson.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:41:28 -0500
Message-ID: <CADnq5_MXq6kRx=RdfH=uko81+VFnqpmzpgOvH2nt-vNj6npCTg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Repeat assignment to max_slave_planes
To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 4:29 AM ZhiJie.Zhang <zhangzhijie@loongson.cn> wrote:
>
> Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> index 3f63822b8e28..9a86d43a6233 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> @@ -1272,7 +1272,6 @@ static bool underlay_create(struct dc_context *ctx, struct resource_pool *pool)
>
>         /* update the public caps to indicate an underlay is available */
>         ctx->dc->caps.max_slave_planes = 1;
> -       ctx->dc->caps.max_slave_planes = 1;
>
>         return true;
>  }
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
