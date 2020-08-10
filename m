Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6362411D9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 22:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C9689F61;
	Mon, 10 Aug 2020 20:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B35389F61;
 Mon, 10 Aug 2020 20:41:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so9424258wrh.3;
 Mon, 10 Aug 2020 13:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j5EMGvKq/QSX5Nimp/54WIo9VIgueJVLDNTbT/YFCVY=;
 b=HNAmfy/Sdw56Fk4HXbA5HK6MYGqBTOc2AiPdgnLx5JtcUuh68tZ6Tx1iKnBrXpZh6G
 5qiF697ztbHxs49Rlt7PhputKn0uB+xYoVhJqP5n/uiaPEUWURIiCNlyt6xQqllxW8bD
 xlzXLHwtGbs3iuwy4MIoIMpDPfmNYfYFQP/r3DAVGUVS4Mcwp1Eir7Rxg9ZlYxYO3hcF
 K7UY+xDks8E04zhwdP4KHcLSvFq75GqOZdSb/nWg1H6TuAlHUKHMgk4h8S8dRELbBisv
 kQZdyXeOm0uKHhGUmLymXvT3NrgY3FY3HrkXlNO9yc6qYWcD5mcKi4jhEy5ajNvmeTwQ
 f65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j5EMGvKq/QSX5Nimp/54WIo9VIgueJVLDNTbT/YFCVY=;
 b=iIHxEPMwAwOWnVpjcFn8A4+Jq6yQxn3NcCY5BTTAyYkE8Hdv8AOfRZKWXWE/Ja1Eym
 nphqm8CeXWdx6lxm9ZPrhdjxX9Reeo16TtvC3DGRudro2A0m0mMzaIM3dpzvTx1nhvBb
 IMy1HJtjX+XkuyaPHXSuLxATT7XYEPnZllj3byXQVJAR1hpxcSiJsB3gO/AitcqrSujE
 hu8B45Qq6fKh9Gxf2LJ05jqmrWw/LMWZfRcXzqEdLwJq2mQqhX+z5rddPALhuy2vZ/Sn
 JE5u798RY3QPd3Re/J3vGkd+R77LEqwJMXk3faefw7oPXTU7w/T0fsZPtbFYKjGAoyAc
 C4TA==
X-Gm-Message-State: AOAM531hESrmDTJLImUpcCOrU7y3GReU3NlMM2JGXFbPNYXS0AIrF0T/
 c0NGNeACo41SR8UsoaEaq+YwDSRrUy1Nk4ihjlk=
X-Google-Smtp-Source: ABdhPJzOmgYQCKeWOO9uF9gzi1K9AZ4CcZsAsbDF7u1GYgArYAoq9f8y7HNIy/6aGB8LTYBu9CAicrnWnsBweA0NmWs=
X-Received: by 2002:a5d:618e:: with SMTP id j14mr27138572wru.374.1597092070897; 
 Mon, 10 Aug 2020 13:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200810125919.185312-1-miaoqinglang@huawei.com>
In-Reply-To: <20200810125919.185312-1-miaoqinglang@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Aug 2020 16:40:59 -0400
Message-ID: <CADnq5_PunHA1VHHj7VtEHG6o2Z_Z1WS325y_R9xO+gsV_JCOXw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: convert to use le16_add_cpu()
To: Qinglang Miao <miaoqinglang@huawei.com>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Aug 10, 2020 at 9:05 AM Qinglang Miao <miaoqinglang@huawei.com> wrote:
>
> Convert cpu_to_le16(le16_to_cpu(E1) + E2) to use le16_add_cpu().
>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/command_table.c  | 4 +---
>  drivers/gpu/drm/amd/display/dc/bios/command_table2.c | 5 +----
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> index 5815983ca..070459e3e 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
> @@ -1877,9 +1877,7 @@ static enum bp_result set_crtc_using_dtd_timing_v3(
>                          * but it is 4 either from Edid data (spec CEA 861)
>                          * or CEA timing table.
>                          */
> -                       params.usV_SyncOffset =
> -                                       cpu_to_le16(le16_to_cpu(params.usV_SyncOffset) + 1);
> -
> +                       le16_add_cpu(&params.usV_SyncOffset, 1);
>                 }
>         }
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
> index bed91572f..e8f52eb8e 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
> @@ -569,10 +569,7 @@ static enum bp_result set_crtc_using_dtd_timing_v3(
>                          * but it is 4 either from Edid data (spec CEA 861)
>                          * or CEA timing table.
>                          */
> -                       params.v_syncoffset =
> -                               cpu_to_le16(le16_to_cpu(params.v_syncoffset) +
> -                                               1);
> -
> +                       le16_add_cpu(&params.v_syncoffset, 1);
>                 }
>         }
>
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
