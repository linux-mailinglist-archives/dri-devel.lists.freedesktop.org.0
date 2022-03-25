Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ECB4E7A8A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 20:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06EB10E712;
	Fri, 25 Mar 2022 19:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21C910E518;
 Fri, 25 Mar 2022 19:57:33 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id v75so9337695oie.1;
 Fri, 25 Mar 2022 12:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b3WA3uEzU6evsa9NtvKVO86NocKNUHHXu3Zd9/cIBo0=;
 b=N0Z1nffsPkCsDW8eucybePw7nIKmxEn2RQyj+8YGGusGgCI74EUSK6lic+GTjL+AMM
 h47o9i1mNItfS19TuAoAd+64zE1Bdz0V67O4xY+/pyomOSw47HYhKRYT60uCzDKF4wXW
 hAS4d2dEraDZJZLYAJKsVObaxbBm5B4VNFysZ8jG6+vt/2me5u0gRXTRtfBi/j8uIH7z
 Ovrcxp2kQbiW9fytcMTz7nJw78c9p75dw7uK94i0PGnI1fBKyZKPBA6/jYOWZOGyfcUw
 jQbbcRB1NgzYq04XoxE2zLlcl25a+D8HLRI8e7ddGWxsAjQ/dprKa1QkW9njZvA4OELM
 D0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b3WA3uEzU6evsa9NtvKVO86NocKNUHHXu3Zd9/cIBo0=;
 b=EIUyVhtMOb5TgAVsEoioLVmy9dgXTDuXWoSXiaZVzKqyf6Zy30tH2VT7X57Meh+w4R
 96EIyAp4gASs8j4b9yCIJszCrJjGNySdBFuxqkZ06AZfjblkqn1VkJMhY46COwlI1ccx
 y1XNr1Qrwu/ldu6dQcJiu530jOKoITj7WvQJrYesaJZ/g1yv5SJTl9tlJdu9kLG+ub/x
 ISJ+xVuFdypfdpKOxx4HdJgpj5cgOv3Z93spkLPLiFfo9G2xVHSli5hhQx0KA5HD9T/x
 IFw/WnuL6/roHnF6KjZRC8uZsUh42Axd2BIBEE7PvVQrIBcaOfKzXJgiXBAidRUyuYF+
 ltHw==
X-Gm-Message-State: AOAM531YMz1y/v7RgtIwNlzAqQsqcbOTQf1qXptmCm6usc79xa5NxFVP
 HHpxNctZbQziKAcs4ls5ZGIvbdKK/lan0QnuKUM=
X-Google-Smtp-Source: ABdhPJzXavjKXnhlCmjz6tN8Imhv9mBlkcg+2I2nbRoGFnQEQbHu+R1p+2A65WzONNlqdDzXnuos46sQdGiZvzhj/Q8=
X-Received: by 2002:aca:d04:0:b0:2ef:8b45:d235 with SMTP id
 4-20020aca0d04000000b002ef8b45d235mr6347662oin.253.1648238253170; Fri, 25 Mar
 2022 12:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <1648115162-5008-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1648115162-5008-1-git-send-email-baihaowen@meizu.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Mar 2022 15:57:22 -0400
Message-ID: <CADnq5_NyMsQ_NikyA4r=FULB4MwsjroENZGPgGo-tcAQhhxceQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pointer dereferenced before checking
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied both patches.  Thanks!

Alex

On Thu, Mar 24, 2022 at 9:46 AM Haowen Bai <baihaowen@meizu.com> wrote:
>
> The value actual_pix_clk_100Hz is dereferencing pointer pix_clk_params
> before pix_clk_params is being null checked. Fix this by assigning
> pix_clk_params->requested_pix_clk_100hz to actual_pix_clk_100Hz only if
> pix_clk_params is not NULL, otherwise just NULL.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> index 2c7eb98..4db45bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
> @@ -1162,7 +1162,7 @@ static uint32_t dcn3_get_pix_clk_dividers(
>                 struct pixel_clk_params *pix_clk_params,
>                 struct pll_settings *pll_settings)
>  {
> -       unsigned long long actual_pix_clk_100Hz = pix_clk_params->requested_pix_clk_100hz;
> +       unsigned long long actual_pix_clk_100Hz = pix_clk_params ? pix_clk_params->requested_pix_clk_100hz : 0;
>         struct dce110_clk_src *clk_src;
>
>         clk_src = TO_DCE110_CLK_SRC(cs);
> --
> 2.7.4
>
