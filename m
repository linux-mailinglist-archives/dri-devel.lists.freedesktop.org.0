Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E751A678D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 16:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF90A89C1C;
	Mon, 13 Apr 2020 14:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C83989C1C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 14:08:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i10so10239958wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EOjjtmiSBry9sWf71C/iCFNq7MksgHVjzrQLc6ngrDY=;
 b=aN6LfMf7c1/78sc1j3yHc6/q7n/6Gr9qwFHzOGxLMZK3tsVvoc0+7N4KxTmQoj9KSp
 IgdnQtO1kg3PAyn1GxvUnr9nqBFlbVyqvydryKf0GppHMi9yv2tOg40Lzfajv6OUdIeV
 FGGsVz5LkXKgjcM0ngQjnUlsUfCyx9idTaWLB980gM9nN6K/f2+QTwPWoPy/vYViyyIM
 Zp3G1fgo63UFYBImjby3R3SFUebQCexOpUAXGxy/N8k3g22R4NF4vfH/cA/7CuzrnEEp
 jHk9pbuGCNG3npJBuKzHesUPvu+caEZJmD1vpyQkjJZ/HQQV++9zONklY1HEEqWn6kiK
 5dLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EOjjtmiSBry9sWf71C/iCFNq7MksgHVjzrQLc6ngrDY=;
 b=rGkS5XaRONXzJYJHNVZgCf/x1SXAsnhKeRYBd41B7WMVXLTMVHbD7paSluRQHcZQxX
 Ic29UT+6VTE9rRRrQMy3nYZVFWrYfSMw7UlZfOqlQKBvTdUU8vXyAnk6dmIsZ2EiVam9
 Pq4drMXiVbjZYnk88IwFVLa3MaI2Q6aQhXZZMBhWaJm3pWSLPDz7z3pzg3hMJEsvp2/U
 fUXoYbz4hHdaQmp3xSxEQVtBL0B9nvkHWfJlbt7NuJxR1lJsOclkyW4FET0Pp4TEjm5F
 J0lvo6N9TdZqcGO2ncGNubIY4cNO6U8CLmgLw3IjehgduR97DM03A6KhPZcXZubxvCJH
 Amig==
X-Gm-Message-State: AGi0PuZxAAr+uE57ZOPQ+0CHXokgqHM1BUtQUyq9gXDrAolX0fDmxPnu
 BpuSTILk2voF/OkEPo2l/jYa2xt8rzY9S5KYwNw=
X-Google-Smtp-Source: APiQypL79byYSl0+g7iFCftAmFHwg4Q6R884B+OgwhqBafAtbxh6J/bmKWXIfY0ohGdvGPFMgV1tWUBwq2uk3W+XxFI=
X-Received: by 2002:adf:f844:: with SMTP id d4mr282394wrq.362.1586786929901;
 Mon, 13 Apr 2020 07:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200411141740.14584-1-tangbin@cmss.chinamobile.com>
In-Reply-To: <20200411141740.14584-1-tangbin@cmss.chinamobile.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 10:08:38 -0400
Message-ID: <CADnq5_MD6LkOEJC-hKKQSAmFAHY7LMZ2WU_ER-ttNrP20AxoQA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp_mst: Fix drm_dp_mst_topology.c selftest
 compilation warning
To: Tang Bin <tangbin@cmss.chinamobile.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 5:29 AM Tang Bin <tangbin@cmss.chinamobile.com> wrote:
>
> The struct drm_dp_desc contains struct drm_dp_dpcd_ident, and the struct
> drm_dp_dpcd_ident contains the array, so zero-initialization requires a
> more couple of braces. In the ARM compiler environment, the compile
> warning pointing it out:
>     drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_dp_mst_dsc_aux_for_port':
>     drivers/gpu/drm/drm_dp_mst_topology.c:5494:9: warning: missing braces around initializer [-Wmissing-braces]
>       struct drm_dp_desc desc = { 0 };
>

This seems to vary based on compilers.  Maybe a memset would be better.

Alex

> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 70c4b7a..4d8d1fd 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -5494,7 +5494,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>  {
>         struct drm_dp_mst_port *immediate_upstream_port;
>         struct drm_dp_mst_port *fec_port;
> -       struct drm_dp_desc desc = { 0 };
> +       struct drm_dp_desc desc = { { { 0 } } };
>         u8 endpoint_fec;
>         u8 endpoint_dsc;
>
> --
> 2.7.4
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
