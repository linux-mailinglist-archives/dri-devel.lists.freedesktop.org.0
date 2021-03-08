Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 563463319C3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 22:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402FB6E890;
	Mon,  8 Mar 2021 21:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21676E88D;
 Mon,  8 Mar 2021 21:56:26 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id x135so8161831oia.9;
 Mon, 08 Mar 2021 13:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyJ0PeO5KwJeqSfUyZWIUqn/iwMU0KWoLqv+BcNnnbs=;
 b=UQ10zTspdmlb5BBImKzv93z4b8rcgHoxxMXyDAGirJ6ZgQdlU3oCoy3/VlIySTVQ9G
 vKjr/FqjR7o+Yu8UECfsO2tAxBqkl1dd9NRaiC7d+XVJKftt981D7j+5kv4r9JGR6wb/
 djLRjS5HT8gaALDGwT9XPp9wVxCKhh+4Pfex+porGxTetWm7f8cRKHM3jCVTrKFKv6sN
 ii2+saA/94KALMXo3L3S2sp749DJ7nxT9UAcXTSxmDiXrORdg20/aDFnjDEmIvsO73m5
 kBEhlJw7H7aZ+W/xTqkG7te3ufg/mLpWyCpOTQ+BogUV6x80+Xosfo9US/SbB0xMwzHK
 BVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyJ0PeO5KwJeqSfUyZWIUqn/iwMU0KWoLqv+BcNnnbs=;
 b=elWXriS57u+OKyh5J4/hE8n233zc15KzQMuNFZdE43ukzm9iy676IR/hpk3E0SO3td
 8b/zyGNCaVAHpuQHwnfVJYiTj9jJOD9G7c6Ht/sZd0XsH6OhveSSxs7TEznPuhOTF8S2
 xNU2l5g8WxT1p6jiqnwgTzTnaD7hA9dSRzae55wYvDo/hGGVGKAo83CxXMVYjuevZxzD
 P17zABEJMc7Vo5dtvWB+u7KDOAF1lgeLx4oTxTa+z/D1uu79ifEiYjrItp/qDmBIJBnm
 /PVcqhRSQJ5gwArsijUnV9nPkVbsmQUmpkn99uGR5tpy4/Byx+lOmGMThDgdA2/484Fe
 KEsQ==
X-Gm-Message-State: AOAM532At8Vn+fIdZZEogwHCMTIE/A+VFw1CGkzIubao/sZ2rB/JSmGv
 Hqmgjk3TMscVKjbWfPIafwkiPpvGGfZaA1p5Cdbs8gGs
X-Google-Smtp-Source: ABdhPJwvMOnqnL13dlmqm4xKkeu24C2hDW1SuZzKmy+7NNx45hQ5X4pEQJAaSTv0pujQzQGXry/q0jZd1nNyYv+sFf8=
X-Received: by 2002:a05:6808:f15:: with SMTP id
 m21mr696521oiw.123.1615240586175; 
 Mon, 08 Mar 2021 13:56:26 -0800 (PST)
MIME-Version: 1.0
References: <1615172407-4847-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1615172407-4847-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Mar 2021 16:56:15 -0500
Message-ID: <CADnq5_NEybY3puwnBs_OUHPWD_16OvbF-sCQ7Mj5gx9PtCd4+A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unnecessary conversion to bool
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 7, 2021 at 10:00 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c:561:34-39: WARNING:
> conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

This patch was already applied.

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> index ae6484a..42a4177 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
> @@ -558,7 +558,7 @@ bool dal_ddc_service_query_ddc_data(
>                         /* should not set mot (middle of transaction) to 0
>                          * if there are pending read payloads
>                          */
> -                       payload.mot = read_size == 0 ? false : true;
> +                       payload.mot = !(read_size == 0);
>                         payload.length = write_size;
>                         payload.data = write_buf;
>
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
