Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FAF4256B4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 17:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404666E848;
	Thu,  7 Oct 2021 15:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCF26E841;
 Thu,  7 Oct 2021 15:35:22 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id n63so9495538oif.7;
 Thu, 07 Oct 2021 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RarZC0DyhhLg13GOrYFDr8NcXK9FIufYOOLFZU9wHfQ=;
 b=ZJ2AS0ZVbS9jA+Hqwj82ytWYWsaLS1Ns4HObbEH4BVgIpMa8Kwlefv3KZCRKKzZwR7
 MylpjwRAC1Td5bO19GNTMwBAzaoDNWIOWCCUhpVTwMCLU6etTo1UdZt5oJn60YhF1J7m
 kKfTdESIEWTIVwtYcTa47J3ZwXkaTcH1upbAIwkCytGR111jwfC5Pp6U6A2mRdWZZTz2
 g+xDHiRWtHFT3y4v5sCIslqZC12fMQsZFdjfPdispfmg5XP7NwzFk99iJtcr6g4WIkMN
 gyau5vmetfTUpR2IWyMuwdqK8nScwXIA8tmesfF4Q53s7G+8Q+Tyk1BgqWWSeo1QWbyG
 Dwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RarZC0DyhhLg13GOrYFDr8NcXK9FIufYOOLFZU9wHfQ=;
 b=lqR/2KVIIbPcpYeZfz1HNttu8ozPjnzvaU8WZQH+9dOvtnNWPqE+kVsDC8nzlekUEK
 23+cM1ygIvzpTWHlHecRlwqRzpqHDfoT00IWSAlzwH1asZAeMZaHplQFYQF20X+jf78j
 AiYoZyS7SNmoESTFs1brSqS3SmdFSm/0SLQJxSW8dctJwAN5R9mR90udqazOxBWoMFR6
 YWe1M5wprLjDAB/JDloUNHjQLUXKf8x+9uoOZReC6Oq1xyGwfJoglo+UpFX0BvPsBQxr
 dpjrlQ0dsuxTJFvhF8gXOruaHEaw4HMDkcqO8WZjBpLEmbB/Iv5bm1XpEFiT1F3tms28
 +Cxw==
X-Gm-Message-State: AOAM533MyNJRREGWrZGvgpUVkZ/Ob8QSjb/CP/cNXSLJa1IG1z6dKpX/
 s7/mud/34FtkfVzvxBGTCeXFJJuNST8bM1ZDh9E=
X-Google-Smtp-Source: ABdhPJzm23B4aJ7u+6jK/b6qYYLaIYoEve1Wt62fj0JIjH1+3WpkM+TdDRftw8V9bE4WpO40YcaOYdCD+KQKLlnZMVE=
X-Received: by 2002:a05:6808:1141:: with SMTP id
 u1mr3640714oiu.123.1633620921765; 
 Thu, 07 Oct 2021 08:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211007120637.14459-1-colin.king@canonical.com>
In-Reply-To: <20211007120637.14459-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Oct 2021 11:35:10 -0400
Message-ID: <CADnq5_P2ZC5oaDZYPZixxH6BLoPZfvwWQqiGM2msQAcA3ebL8Q@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Remove redundant initialization of
 variable result
To: Colin King <colin.king@canonical.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Oct 7, 2021 at 8:06 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable result is being initialized with a value that is never
> read, it is being updated immediately afterwards in both branches
> of an if statement. The assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
> index 6936b9d549e5..8387767ec1b3 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
> @@ -774,7 +774,7 @@ static enum link_training_result dpia_training_eq_phase(struct dc_link *link,
>                 struct link_training_settings *lt_settings,
>                 uint32_t hop)
>  {
> -       enum link_training_result result = LINK_TRAINING_EQ_FAIL_EQ;
> +       enum link_training_result result;
>
>         if (link->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT)
>                 result = dpia_training_eq_non_transparent(link, lt_settings, hop);
> --
> 2.32.0
>
