Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132D1B783C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 16:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296AF6E069;
	Fri, 24 Apr 2020 14:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F5B6E053;
 Fri, 24 Apr 2020 14:22:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i10so11045339wrv.10;
 Fri, 24 Apr 2020 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P42ksOlVF/AdmvKPsOuYxhpgfKkeJHhYzXzUH8TEKYo=;
 b=RkZKXWojYgferx/UFn3wqIaV79UGDDSZqOrwzdw9IHGFm7l0weOYBhCmmwwSvlHkLj
 kU6gF8Dk8HA23Oi2gld3VpUdUisrwLGjo/rqjhtgQUCqwiAO6FDHMe4COyCATjWwZchU
 ZZEsN1V1cwmzkDLWOmQaW4zspyCQ548/BugXGLRp08CI7MNsAnC7Iol4+5CI6DF7TuOq
 Apl6adE9NKHH419sEN8v2HTquualX/4hTw9CkKLGy+lsMBUkxhIVDAzMMhwd60/WCflz
 WQ01F3qb6x9/zgSB73A6xupsAmBajt2q5AAML1r/SPdEn7yC2QPmVhiFWVsKwwoT4RjD
 onDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P42ksOlVF/AdmvKPsOuYxhpgfKkeJHhYzXzUH8TEKYo=;
 b=aG2L4VOgVjG46PenkQruAQDd9uFwB0l3yuLfKf2FWtH2A3K9ihaNO7Kg/Zy57BUNvA
 hCgdzLl/m/CRH3IgYyv6qc9cQPFFhdE5Xw+CpjschjHMzvqYwienHbYNNlvLWF9XTGFe
 2rl6QKozO8rLMY0M1pMQbCjz0m2xhODQ4HgyHL+BK+ehxfjePCxfv/xzO/nSnWLQVSmj
 UBqzGMffQ/eIDfLpYwYHy8JNF9Y4nKY4EV/OZMrf82jiQUBd0wN4vo6MkOHJucXfCYHC
 0CCzuoW6hRDP4N7V7+9Uh4RtxnxM/PWQ40BlYclnSbCaXr5ePpKv/gyGKs/w0IQT4u+d
 a5Fw==
X-Gm-Message-State: AGi0PuabAXEkKqNWTcTNT5gOoDhfOA11MgLU81YYoyOK8Uj2Gfk4aKqZ
 fRT41qjXMhqMBjY+BuEN9u42C5tHRFrvhQAXQt8=
X-Google-Smtp-Source: APiQypJJ0vGexcoNVu6n5gVmRGV7DqLLurzwRE2ERIyibjQ6iAJM4ySCD/yDHkJDU7tOoJXeG2AM97nay1AkBBxdGDE=
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr12059598wrj.419.1587738118671; 
 Fri, 24 Apr 2020 07:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200424111226.11796-1-colin.king@canonical.com>
In-Reply-To: <20200424111226.11796-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Apr 2020 10:21:47 -0400
Message-ID: <CADnq5_NcPBfRTgVTAb8D+x+_HB6dJ1wE8_PLUup+iR3nP+2NuQ@mail.gmail.com>
Subject: Re: [PATCH] amdgpu/dc: remove redundant assignment to variable
 'option'
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
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 7:12 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable option is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
> index 4245e1f818a3..e096d2b95ef9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
> @@ -679,8 +679,7 @@ void dce110_opp_v_set_csc_default(
>         if (default_adjust->force_hw_default == false) {
>                 const struct out_csc_color_matrix *elm;
>                 /* currently parameter not in use */
> -               enum grph_color_adjust_option option =
> -                       GRPH_COLOR_MATRIX_HW_DEFAULT;
> +               enum grph_color_adjust_option option;
>                 uint32_t i;
>                 /*
>                  * HW default false we program locally defined matrix
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
