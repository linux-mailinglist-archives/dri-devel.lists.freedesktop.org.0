Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7639AAC1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 21:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D465A6F4E7;
	Thu,  3 Jun 2021 19:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB876F4E7;
 Thu,  3 Jun 2021 19:14:51 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id h9so7371051oih.4;
 Thu, 03 Jun 2021 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTcdojc8mwwtA9K2NJaczioq6lgh4tCtax6VLDoB3+8=;
 b=N1b8Xb6JaD/REB3WoovSCN50+jBsEIUw/t0OZgaPSIKlWS16XgazPhYR+e8T3vIIKb
 mGjKhYltbPgSyDrPi2qXpjrpNDsrXi58HUBcgrTnhpOOIT0bWt9DZKcYgHJEDeyHjXV6
 cfq6PqOILEN1tukJd7DKWDW4xcEvAlNI6pyOFEQdx4miovIeAFARR0FpctDoJJZmWVeC
 9R0oE8g3zYmpxmqJSs3xdHwZJ0e6P2Ku+AisTA9Sh9LmPzDAKZS6y7X0Jp+KIvxcnqJw
 kLBfpdS3Gh0utaUCTUhRUkT4Z41XOdep7AYj/Ht00C8YHJ9RgowpWHMZ5vNYrI9aQgKT
 L1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTcdojc8mwwtA9K2NJaczioq6lgh4tCtax6VLDoB3+8=;
 b=UKa/wcLcj4gT2hhkRVAqgm8kXvetYvb34RvgP8YVYTxkaH7DM4fZT0ZvvqhVoPLu/A
 vt2hlYHO1yoh1mPzqMJSQP/kNe5AwQHkKIQDBg7NAPsNH8BN6rvradutJjNrPvs/FkYu
 wNU13Kyd4qZN3j1TEJnIPcHopmG9dmjIdsQ94moSc1ClbO8ujhP1GVK8RNx/8+DyxvH/
 GvVlIPObau1TOBS+GpxksEWdGWujMCC6BOR1rgeumgHdstzzNO/zkR4QSPdJaYNrYFXy
 xpVI8fw+KIRY0z22kR3QjW6eA3+j3D6vsDCXoay3hELMTtufP0TjdpU0U+mjKQ8YCCxz
 6K6w==
X-Gm-Message-State: AOAM531T7I471pqMe4ggN1k3ly3K/6mifCCYNZ6haPPtdDZEz9HY9mAS
 znbsMCnNtwl2FIe5NRV+oPdX4p/VyM3tb+p+Ybs=
X-Google-Smtp-Source: ABdhPJy4rqfYmdV0F0ZL0gFISzpsTevYCr4Bh7iAwUynNZmpWVh2h7yvF0xMDmi1+b17doVVsQ57vnkZBY1xBj4z2l0=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr476649oiw.123.1622747691117; 
 Thu, 03 Jun 2021 12:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210603124231.84230-1-colin.king@canonical.com>
In-Reply-To: <20210603124231.84230-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Jun 2021 15:14:40 -0400
Message-ID: <CADnq5_P2yPtw1XmXrS8+SxHDMfq_FnVLt-XMDVqz_58YCb3Wog@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove variable active_disp
To: Colin King <colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jun 3, 2021 at 8:42 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable active_disp is being initialized with a value that
> is never read, it is being re-assigned immediately afterwards.
> Clean up the code by removing the need for variable active_disp.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
> index 53d7513b5083..adc710fe4a45 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
> @@ -82,9 +82,6 @@ void bios_set_scratch_critical_state(
>  uint32_t bios_get_vga_enabled_displays(
>         struct dc_bios *bios)
>  {
> -       uint32_t active_disp = 1;
> -
> -       active_disp = REG_READ(BIOS_SCRATCH_3) & 0XFFFF;
> -       return active_disp;
> +       return REG_READ(BIOS_SCRATCH_3) & 0XFFFF;
>  }
>
> --
> 2.31.1
>
