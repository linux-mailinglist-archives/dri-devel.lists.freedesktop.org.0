Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3570349CECB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AB210E184;
	Wed, 26 Jan 2022 15:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECD910E184
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 15:43:02 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id s1so4959821ilj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 07:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yAKLAxMEs2s6OrJ3pa4cx9PTkR+o5F/ZiccP0DlaJjY=;
 b=U3rXYwAr7EUCDTiIcY4gOCab99RYN1iHfQmfjJicIYZksZtQmg/cChGiZ8WtTbEYMN
 kFoan3HFEAaZI7XDJRVeB9sQwohId0ITWtX9z9laolWmpOE0khd2vvSYZAbtD8Hf/Kjt
 +1p6Q8Y0CvOUr5jcV3Bd1P5fseAkngVdrooBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAKLAxMEs2s6OrJ3pa4cx9PTkR+o5F/ZiccP0DlaJjY=;
 b=kKGnvLgbVIEc31Q8NwdAIR32SW3Tj+6fkrfyAbJ78y2U6VSmQS+ZOt9CLf97+esGw6
 5By2YkGZptdvGaGRC+k4utTn1EBdtQHIUAVk40JpqMccnlK8WqOFX2/1QW2dzVn7EUbQ
 qE16nu7VnhV8SAkQMJJ+9AbmHUf8FChLAvSKEctMmJAabf4kaG4OdbHdmpV2uF3t1r0M
 lV7yuUmlt2ZsneR7iBlBEF43MOgj+ctKTReOHmiWfOD4tVBFWX4tyWBTIuUq/ne90LNy
 Laaj/vFfhwrN8YhEmmavqCWuQxvw4OAwFmdfycSrGDQKTLgekwd/YTDWE544RHvUjKMg
 FB8A==
X-Gm-Message-State: AOAM531QkJqUlVriI3DxLcovsw/lxYcbHICZznNSEXW5z72Jqnlukolj
 bhr7EZwd6JvhgEo/MkZ4h1L0QE/wUA7YtA==
X-Google-Smtp-Source: ABdhPJwkuknkABno7AAsooYEiTzDLdTT41EDZyDHKDKKF2LVsOBKF/BAZwEvvy0J5NSgFYT5CbZOzg==
X-Received: by 2002:a92:ab05:: with SMTP id v5mr15241407ilh.199.1643211781549; 
 Wed, 26 Jan 2022 07:43:01 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id a10sm11769581ilv.44.2022.01.26.07.43.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 07:43:00 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id h7so16098iof.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 07:43:00 -0800 (PST)
X-Received: by 2002:a05:6638:ec8:: with SMTP id
 q8mr8000709jas.44.1643211779964; 
 Wed, 26 Jan 2022 07:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-10-s.hauer@pengutronix.de>
In-Reply-To: <20220126145549.617165-10-s.hauer@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Jan 2022 07:42:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VCWW4c3iqfzezU5=KKVFNP+EhPGTBZ7uZdQ=bSCJHQVA@mail.gmail.com>
Message-ID: <CAD=FV=VCWW4c3iqfzezU5=KKVFNP+EhPGTBZ7uZdQ=bSCJHQVA@mail.gmail.com>
Subject: Re: [PATCH 09/27] drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
To: Sascha Hauer <s.hauer@pengutronix.de>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Yakir Yang <ykk@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 26, 2022 at 6:58 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> From: Douglas Anderson <dianders@chromium.org>
>
> Jitter was improved by lowering the MPLL bandwidth to account for high
> frequency noise in the rk3288 PLL.  In each case MPLL bandwidth was
> lowered only enough to get us a comfortable margin.  We believe that
> lowering the bandwidth like this is safe given sufficient testing.
>
> Changes since v3:
> - new patch
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> (am from https://patchwork.kernel.org/patch/9223301/)

Probably remove the "am from" line? It's not standard in upstream and
that link doesn't seem to go anywhere anymore...


> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index c44eb4d2e2d5..77f82a4fd027 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -176,20 +176,8 @@ static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
>  static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
>         /*      pixelclk    bpp8    bpp10   bpp12 */
>         {
> -               40000000,  { 0x0018, 0x0018, 0x0018 },
> -       }, {
> -               65000000,  { 0x0028, 0x0028, 0x0028 },
> -       }, {
> -               66000000,  { 0x0038, 0x0038, 0x0038 },
> -       }, {
> -               74250000,  { 0x0028, 0x0038, 0x0038 },
> -       }, {
> -               83500000,  { 0x0028, 0x0038, 0x0038 },
> -       }, {
> -               146250000, { 0x0038, 0x0038, 0x0038 },
> -       }, {
> -               148500000, { 0x0000, 0x0038, 0x0038 },
> -       }, {
> +               600000000, { 0x0000, 0x0000, 0x0000 },
> +       },  {

This is what we did for rk3288. I can't personally vouch for the
effects on other SoCs.

-Doug
