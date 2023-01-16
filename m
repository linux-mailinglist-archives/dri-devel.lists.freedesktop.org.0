Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2BB66CE1A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 18:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA93810E47D;
	Mon, 16 Jan 2023 17:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC93E10E47A;
 Mon, 16 Jan 2023 17:57:27 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id d188so12824721oia.3;
 Mon, 16 Jan 2023 09:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n5OkHX/Az8Mry0UKCOlHqO4EM33fiMoag3d66F0Eejk=;
 b=Rg4+a73abcdpBd7XsB2vRpplYYdmV6iqGARh7CQiaUgMxWvIa6FGDtkhjgLjghUsHa
 P7ECrLgFof/sqwJuhBdQFUbSCMdNKTi2uPkRRUkSBBeznLpZwlXN3G3iRa5HTG8J7H5R
 l8isod3hoEH2DzBeYtuPcuOd0RcBJ2B0J+rejWzokA0rWnL6IWULCkfNJP4qQVMuYgYA
 y8K4WUmu/e6tS1rDRGKmT3dTk+0KG7TAap/vIAIrOb441oSeU8Hm4P+RTIXm/jOL7pjJ
 sW+00I/LkJVhzwWsrVIfhXuGR9BrH9pJH9Wd/R7u/51hcYq460jzDmUP6QAx2pQu/bg0
 nDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n5OkHX/Az8Mry0UKCOlHqO4EM33fiMoag3d66F0Eejk=;
 b=p+uZFIvTknFMhwH6QPc3gCq1DACshQu0Oo2zg99cu8zkOxPVsla25mgKwOMKS/gl/A
 6Mf7Pk07WJiffQN1GXSLQqT0UOBXg69pALbrZ4NVcwmb8Y3kCEJxpmq9zbnhSwIRniWW
 NZIAKqReCHnQOMAx6fkcRhm5zuMmStiiw0PPKTlwOOw4E3roJiz+DnEP9VUKiUT16jb8
 5EZKRaKJvDcxdDZZl4KK0PT9ev7wCQrGpy50fVv8JEMnAH5uNCSIfWfOxYKAwS6f32eZ
 0RUjvMbWm9Yi7Uw1yirY7hcGnB9u+0sq1YqDgz3RXKErAeXsJd/3rfcMhhxqSXzYF8Uw
 f4dQ==
X-Gm-Message-State: AFqh2kqBlaF6/pqpeEBMAF7CblkhUIEplxsTI9dVbjqL+YTqvdHAbJX4
 3Klg+CALs2hiFKESEhWYpaefdE9mbw8TntKdZIM=
X-Google-Smtp-Source: AMrXdXvOkWc2rL8rHfWhUdEhHY8Dl8h0BCl4hvpl0NJmh4GENZy24NQOJn6EpWg7UL7gEpJOCkrHr4MDKELVJafTjtM=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr8864oix.46.1673891846851; Mon, 16 Jan
 2023 09:57:26 -0800 (PST)
MIME-Version: 1.0
References: <Y8PGts5Nku8OSlRN@ubun2204.myguest.virtualbox.org>
In-Reply-To: <Y8PGts5Nku8OSlRN@ubun2204.myguest.virtualbox.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 12:57:15 -0500
Message-ID: <CADnq5_NyK_O=CypSz+WrAbM2MpsP_7D2RjB6JAu_qmyEnAVc6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: use swap() helper macro in bios_parser
To: Deepak R Varma <drv@mailo.com>
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Jan 15, 2023 at 4:26 AM Deepak R Varma <drv@mailo.com> wrote:
>
> Use swap() helper macro instead of open coded swap instructions. The
> change also facilitates code cleanup and realignment for improved
> readability.  Issue identified using swap.cocci Coccinelle semantic
> patch script.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 074e70a5c458..7b5894adbf51 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -2929,7 +2929,6 @@ static enum bp_result construct_integrated_info(
>         struct atom_common_table_header *header;
>         struct atom_data_revision revision;
>
> -       struct clock_voltage_caps temp = {0, 0};
>         uint32_t i;
>         uint32_t j;
>
> @@ -3032,14 +3031,8 @@ static enum bp_result construct_integrated_info(
>         for (i = 1; i < NUMBER_OF_DISP_CLK_VOLTAGE; ++i) {
>                 for (j = i; j > 0; --j) {
>                         if (info->disp_clk_voltage[j].max_supported_clk <
> -                               info->disp_clk_voltage[j-1].max_supported_clk
> -                               ) {
> -                               /* swap j and j - 1*/
> -                               temp = info->disp_clk_voltage[j-1];
> -                               info->disp_clk_voltage[j-1] =
> -                                       info->disp_clk_voltage[j];
> -                               info->disp_clk_voltage[j] = temp;
> -                       }
> +                           info->disp_clk_voltage[j-1].max_supported_clk)
> +                               swap(info->disp_clk_voltage[j-1], info->disp_clk_voltage[j]);
>                 }
>         }
>
> --
> 2.34.1
>
>
>
