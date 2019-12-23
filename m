Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A449512A22C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEACD6E33C;
	Tue, 24 Dec 2019 14:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB616E02A;
 Mon, 23 Dec 2019 13:58:43 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c16so12645706ioo.8;
 Mon, 23 Dec 2019 05:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3PKfJo7e/F8iYmHNlUC4kcHL5CKe5kHebcIO1c7mfek=;
 b=dDAyIimizk4oR9NYXHcsKtFz27JZds8feHchTbuhSFGETI/pNbAsciKDI4kkOO1IfW
 nd1fJJu8DGsZTzaO48gK39ip/2Y7RXR64/zH5QtItx5EMlpR/syeXSe2R4uiULrRrwOF
 DGIaEEckCcWI0jeY0KKBgvwVAilBeRgkNhrBI9GEFTr+z77vSDBRAysEiLX9O5JQ+sl8
 89Bv2ne5VAOHZasFhbr5n/1sqBzJ+m2+PDv7/foH36JVYk+2N6zc0oY2wVDAx/ELxRVJ
 9/Hjh8GLcGbiqL84jnvkKy46ND/X9Enf9+4wn4alAT5qQoGvuaru7lZB96gaBN10o4jB
 T7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PKfJo7e/F8iYmHNlUC4kcHL5CKe5kHebcIO1c7mfek=;
 b=APgjbPDWmlMh7IeJLEeRDam6nF+83r8rvBjrzcx3bYWg4+fi/H9c+WlY369YsmorXi
 oWm4su1qWnAptCzL0FPor8ixofttXBLcvMOtUNZMSEjnJlZp2Bj9PmYby2SVT8kw+nJ+
 pFT+wMxKpwjOF0FsOiPyUgUIuZHVoCazXCzUnsPOqAqPlImmlpUYZIJ7LBfKrA/hMRnY
 jZ6Q9nOeUz+laUCqTN4w3tffA6qFjKhBL6N0ExmJU2Qp9QpwMCydeoS1UOhKMyexWjUt
 SGnC4aXgz7mPZ3t4zmcqEbG3MSj64GbekjY+/7jh3Fi3WB1sDoiV+pGAUiFhE2dOv/sB
 bwCQ==
X-Gm-Message-State: APjAAAXfCkjkhrZr1sPI79h1HpRcOMbfK8QQmrpx1u7XGO4utZ80PmOW
 vgWL/QssDAxo9N80rSQl1rlyVcEhZsQxUkHpD5E=
X-Google-Smtp-Source: APXvYqzUM8YJ6tRj448hYxFlxEOEtyUsp/J3wkALdJo8nymUv20lta/KuUBHcl5Mm/Nxt1SgHLy1Br5zccJrGGPCy8E=
X-Received: by 2002:a02:ca56:: with SMTP id i22mr22510644jal.140.1577109523001; 
 Mon, 23 Dec 2019 05:58:43 -0800 (PST)
MIME-Version: 1.0
References: <1577096361-8381-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1577096361-8381-1-git-send-email-harigovi@codeaurora.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 23 Dec 2019 06:58:32 -0700
Message-ID: <CAOCk7NoDsjGWV=ddZO2yVG_n2N-mhdhfeaNML=kTTr2Mg88q0Q@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm: update LANE_CTRL register value from
 default value
To: Harigovindan P <harigovi@codeaurora.org>
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 23, 2019 at 3:19 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Updating REG_DSI_LANE_CTRL register value by reading default
> register value and writing it back using bitwise OR with
> DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST. This works for all panels.

Why?
You explain what the code does, which I can tell from reading the
code.  The commit text should tell me why this change is necessary.
Why would I care if this change is in my tree or not?  What feature
does it provide or what issue does it fix?

>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e6289a3..d3c5233 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -816,7 +816,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>         u32 flags = msm_host->mode_flags;
>         enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
>         const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> -       u32 data = 0;
> +       u32 data = 0, lane_ctrl = 0;
>
>         if (!enable) {
>                 dsi_write(msm_host, REG_DSI_CTRL, 0);
> @@ -904,9 +904,11 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>         dsi_write(msm_host, REG_DSI_LANE_SWAP_CTRL,
>                   DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL(msm_host->dlane_swap));
>
> -       if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
> +       if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
> +               lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
>                 dsi_write(msm_host, REG_DSI_LANE_CTRL,
> -                       DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
> +                       lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
> +       }
>
>         data |= DSI_CTRL_ENABLE;
>
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
