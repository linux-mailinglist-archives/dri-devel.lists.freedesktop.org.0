Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FFA1B6479
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 21:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778E86E9B9;
	Thu, 23 Apr 2020 19:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8576E096;
 Thu, 23 Apr 2020 19:31:15 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so7746653wmb.4;
 Thu, 23 Apr 2020 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fgAZVOCSIveiuqGce1ll+R4dfIKogGqfZA6esAftSZo=;
 b=knNPV9b5pYpSRUOTLC+KLsUlCy9+s8M/aHaNwAEEc+coAm0Zro7GGhhs0Mf18UjMCk
 Jy3Kt7savdetdbXCxj3EuD0rloEFKCjOo35vvYb6xP/E59wRwRRjFHwuna3XNXp4CoXc
 /nrSqm2IgnEsTlOOXi7K87G+2ccTLb0x2Vt+GnzLU8eRdKLrLtssOb9jyLLol5JzKz3j
 5HogzgY3hb85+VCO8EuFrXJdw+E30xtlAudgmmM/r9dJ8C3lBzojgYhs6mZT61ZGk7Lt
 upjp+TdAjLC9w/XqRZ1a1qKeIG4q/YDKILPqf0VnI6/TP64WAXOcy+hqvijN0zeNHD9k
 Q+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgAZVOCSIveiuqGce1ll+R4dfIKogGqfZA6esAftSZo=;
 b=YclBX2undpnZ6gcBW1V+HV7rFrXj0EnerEsrVfD14UtUAcSpVoObkwIqY1fHEawxOz
 sRfsSOgpWrT1kQTPDETr2/7lZe6bAxNRnBLtQEA6roU6YPJHIp1ADUFi2GTfcb/6QsFE
 PZbTDgWjJqmDajNH0aTQzUnZ4GdJdhsZSq+wSimuc1Wr21POMs+OIfZnr6ZFublfdRu2
 YPXKVGGgx4k92lolNs5R6gP5byKI022sUVqykLJlcONhSQ2JPcKxIiwOguj83B06xbR4
 zgmzTekqZQfIBi6itkkuGjJ9dmeYB6zXD+VQOBt4zjTyzEEOGiDAr13Tna2/v4lpyuWQ
 nA4w==
X-Gm-Message-State: AGi0PuYeQwjVmqRf/PZjMh7Rlxucj/KEAbuF4OcPKslCHf0iZzfYzZYj
 DqchZTBRcNiDkabOOPgQOm1Szcyi9XeDUuZaotI=
X-Google-Smtp-Source: APiQypJ6GT/p5QCtXDyj6Nc/UccKUVDP9vSEuI76TETHj+tm3Tp7yVKfb2mtdWEzWQCVuoW/zENlmPdp16iR0w6s3pw=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr5917826wmb.56.1587670274438; 
 Thu, 23 Apr 2020 12:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200423141728.19949-1-colin.king@canonical.com>
In-Reply-To: <20200423141728.19949-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Apr 2020 15:31:02 -0400
Message-ID: <CADnq5_NWZaUeBz8ZyWF_+LFc3=NXiQYJqbj4cMsyBReASCbcEQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: remove redundant assignment to
 variable ret
To: Colin King <colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 Wenjing Liu <wenjing.liu@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 10:18 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index d5b306384d79..9ef9e50a34fa 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -4231,7 +4231,7 @@ void dpcd_set_source_specific_data(struct dc_link *link)
>  {
>         const uint32_t post_oui_delay = 30; // 30ms
>         uint8_t dspc = 0;
> -       enum dc_status ret = DC_ERROR_UNEXPECTED;
> +       enum dc_status ret;
>
>         ret = core_link_read_dpcd(link, DP_DOWN_STREAM_PORT_COUNT, &dspc,
>                                   sizeof(dspc));
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
