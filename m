Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6569127451E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 17:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD39989DA4;
	Tue, 22 Sep 2020 15:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B349E89DA4;
 Tue, 22 Sep 2020 15:19:24 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e17so3765996wme.0;
 Tue, 22 Sep 2020 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=scqHhJ8H2F1OwqEQAUQOLL4YJrrUXBZObQzVzFZayBI=;
 b=ud7Z8q5Iaz3v0wMl9sijNgJWLoh+EObUkH3gLhvAfMqP9C5Z7tRIQ534KlkbFRgfv9
 z2DD3DE+h2jOvVD1DMpp7Y1TfCNZXb3e/BrPf6Sr0zloAVm3KaDh44i4BK5S/tHMPCRi
 Gw7bHVM0QAeBLqrCtD5cMYMkstDteJjuR0xOcOaTA7uku4h3iXT/0tP6e3rKoXGO+R2c
 V3A+DvvT8joCtcYJNKXIkwxk0jU3BDgnl0RHgDv4fPFby36cZsLUZC0jF+NADyZz2uqf
 ln8jFfTgv5P6BUOuXaEbGATW1CrKZT3e5d6Zw+PgRFlmgq/XViIJ6Sy3RNrGNnp8eOa9
 Rokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=scqHhJ8H2F1OwqEQAUQOLL4YJrrUXBZObQzVzFZayBI=;
 b=Nqe7P9Lhhyfz6OpLgYxEzcQ4O2PQ8mR4CJ/yl11G7WdTedZiU1h27pO82QEOlo6087
 BCzXH5/6YkMVY3qoHss1WBAnY7/TwX71E25noflqAZwOIew72khcNVwxnes5eAlCTIYn
 ogRUjFqyfq/Ki3p/5DaWhhYdcSTB4nqICyCsHiN8RBxm8tuEIjK7bLHr62wHi51vKGce
 bJHX4aOJ9p9oSGvG7/wb3PcQgmmq9ksjuJtZa1qj2h+2P6Ec0aitoIeaio44S+lnpbHF
 4Essx72RI3oQIYhtUwGRcJ2MD7CoB2OUYG0HKaKy87qDMkjrrW5bj8tGxptBVGCAfePE
 IHiQ==
X-Gm-Message-State: AOAM533CTTwEgKKC3MG/hkVMflKDDQr9UvXHKJrThEUyytG3tX8DFG4O
 aAGDnXWA9ylW0xfLNQLRo/H05c5Xb/RKTKZaTMilASoh
X-Google-Smtp-Source: ABdhPJwSuNJ2YKBapkwBsT/onLn/HzjF5NQVk8AzJyU5PzUKmm9KvtKj4eIV23ATNS6J6xa0M1JW8/GaRgVLmlXy73E=
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr1562936wmc.73.1600787963365; 
 Tue, 22 Sep 2020 08:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200922054743.2422929-1-natechancellor@gmail.com>
In-Reply-To: <20200922054743.2422929-1-natechancellor@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Sep 2020 11:19:12 -0400
Message-ID: <CADnq5_MP85Qqv9N6VYnyRYAACU82G+e1oXyESUYoqp=QMYEbYg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Simplify condition in try_disable_dsc
To: Nathan Chancellor <natechancellor@gmail.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 3:47 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:637:8:
> warning: logical not is only applied to the left hand side of this
> comparison [-Wlogical-not-parentheses]
>                                 && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
>                                    ^                             ~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:637:8:
> note: add parentheses after the '!' to evaluate the comparison first
>                                 && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
>                                    ^
>                                     (
> )
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:637:8:
> note: add parentheses around left hand side expression to silence this
> warning
>                                 && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
>                                    ^
>                                    (                            )
> 1 warning generated.
>
> The expression "!a == 0" can be more simply written as "a", which makes
> it easier to reason about the logic and prevents the warning.
>
> Fixes: 0749ddeb7d6c ("drm/amd/display: Add DSC force disable to dsc_clock_en debugfs entry")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1158
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

@Wentland, Harry or @Leo (Sunpeng) Li  can you provide some guidance
on what the logic is supposed to be here?

Thanks,

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 9d7333a36fac..0852a24ee392 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -634,7 +634,7 @@ static void try_disable_dsc(struct drm_atomic_state *state,
>         for (i = 0; i < count; i++) {
>                 if (vars[i].dsc_enabled
>                                 && vars[i].bpp_x16 == params[i].bw_range.max_target_bpp_x16
> -                               && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
> +                               && params[i].clock_force_enable) {
>                         kbps_increase[i] = params[i].bw_range.stream_kbps - params[i].bw_range.max_kbps;
>                         tried[i] = false;
>                         remaining_to_try += 1;
>
> base-commit: 6651cdf3bfeeaeb499db11668313666bf756579a
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
