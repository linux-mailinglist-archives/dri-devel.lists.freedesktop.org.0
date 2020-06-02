Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066EB1EBC0D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 14:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB0C89346;
	Tue,  2 Jun 2020 12:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E44D89346
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 12:49:37 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id o2so1952779vsr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u2UCJQtDiG0eHQBJkG5+CdCw59UdXa7OZsIDHTFqlNI=;
 b=AM+9tD6cynbWf8zZpkOGrVG16SS8ZAJDBrCBcdZsdX5thmEf7Yww4G8MZu09ToM/1f
 6XbT6VaSn2jqfmcI/kfjlRwYBCXWMjFuYdPYNQQhVW6Poo2x/DlaKJCsNDz8ZlFNMU75
 NWK+BU/oTz0eGcPG95ZWQZtaxcwDQANzeV66VzYAwx1KWc5EBruseix8RDYgCx4qiKp/
 rNv2BK2jHuY6cltKUZoo1wtvDgUY55rtvW7lHuXPuYs/6jbJFPSyTkYSArPY5Jd3OuER
 3yEhUBImO1/iwZJDzgV9ii0+8GMHbD+57eEq2ODXwZymjiZDFS1GU2MKoWMzf5jaVrHh
 Xb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u2UCJQtDiG0eHQBJkG5+CdCw59UdXa7OZsIDHTFqlNI=;
 b=Lq6q/18uxqQg3o78/gN1sRSrPOAGQVKtQeUktGZwxTc65AUyik7q9lTKNOPLISkkJN
 WIlK7efwJxhK/maRb/dXCSc4dURstbnKYmOOy3b2YrNzAqjWqIIZX0z/fhjMC+e6QozP
 dMJN5gc4Qci9/Btphnz+XNxt/QGP8C/+DGtlZmDoNmsSInZZqhUcHBjq3EYuz+ScUZlO
 wfb503R4jaqwssT2/9+1fICTRz7Nt9WNNRFo9zKqlkyDeeWbxjgJ5prFxTV8V+WO9WaD
 H42659Nsv9OoMjv6hfbT0aedxrd3UpmJHnv2U7TWDr279nKuFzFX/4q6vm0V7EnwcdfQ
 R2pw==
X-Gm-Message-State: AOAM5339z61Wlb+w+MwfPYvccSdh7AIWzASlR2ZAdT8AIEuMaWGFd6ch
 uT6/RuxPwEz/mOAGEqqPOlI///3AOSebYRCcZZM=
X-Google-Smtp-Source: ABdhPJw/+z7NB2VWRLaqW6glWW9sGgKJepBqz0O7f+2nQCNT4ZvDq0MnedfrItwQYQF9aQ3NnGmW8s5bLIbEp8NUrCU=
X-Received: by 2002:a67:3291:: with SMTP id y139mr5737284vsy.37.1591102176673; 
 Tue, 02 Jun 2020 05:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
In-Reply-To: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 13:46:19 +0100
Message-ID: <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for KOE TX26D202VM0BWA
 panel
To: Liu Ying <victor.liu@nxp.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Jun 2020 at 08:17, Liu Ying <victor.liu@nxp.com> wrote:
>
> This patch adds support for Kaohsiung Opto-Electronics Inc.
> 10.1" TX26D202VM0BWA WUXGA(1920x1200) TFT LCD panel with LVDS interface.
> The panel has dual LVDS channels.
>
> My panel is manufactured by US Micro Products(USMP).  There is a tag at
> the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
> and it's made by KOE in Taiwan.
>
> The panel spec from USMP can be found at:
> https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf
>
> The below panel spec from KOE is basically the same to the one from USMP.
> However, the panel type 'TX26D202VM0BAA' is a little bit different.
> It looks that the two types of panel are compatible with each other.
> http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf
>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b6ecd15..7c222ec 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2200,6 +2200,37 @@ static const struct panel_desc koe_tx14d24vm1bpa = {
>         },
>  };
>
> +static const struct display_timing koe_tx26d202vm0bwa_timing = {
> +       .pixelclock = { 151820000, 156720000, 159780000 },
> +       .hactive = { 1920, 1920, 1920 },
> +       .hfront_porch = { 105, 130, 142 },
> +       .hback_porch = { 45, 70, 82 },
> +       .hsync_len = { 30, 30, 30 },
> +       .vactive = { 1200, 1200, 1200},
> +       .vfront_porch = { 3, 5, 10 },
> +       .vback_porch = { 2, 5, 10 },
> +       .vsync_len = { 5, 5, 5 },
> +};
> +
> +static const struct panel_desc koe_tx26d202vm0bwa = {
> +       .timings = &koe_tx26d202vm0bwa_timing,
> +       .num_timings = 1,
> +       .bpc = 8,
> +       .size = {
> +               .width = 217,
> +               .height = 136,
> +       },
> +       .delay = {
> +               .prepare = 1000,
> +               .enable = 1000,
> +               .unprepare = 1000,
> +               .disable = 1000,
Ouch 1s for each delay is huge. Nevertheless it matches the specs so,
the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Sam, Thierry I assume you'll merge the series. Let me know if I should
pick it up.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
