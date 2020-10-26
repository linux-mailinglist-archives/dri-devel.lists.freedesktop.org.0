Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29F29A644
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB3E6EB26;
	Tue, 27 Oct 2020 08:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A05F6EA5C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 19:45:01 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id v22so5217836ply.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UvmyfAS3FNKDIUlMjXBNYKBYoK/vtIij8n9c082Mubc=;
 b=Z12aKn10RT7C+3vv+Dd1Qd3nDVfwmXeae7+m3xHAdCx85aOB2Ws7HE+ACqBhBXrMGV
 NehOiNBdl5lbTfi1yIOBt80NUA5Po4VsqhAyaAOC51MuHbfbmvuV709wMQ6aBx/IGyUm
 3henAzzU6ESqHqwQmAGqRvS3m7nsVrOozE3NPK7k28PGVWxMoWzGfImr1yTV7feWcRvA
 t+prlzoIShFvDMMoupo9RG21asc7kOD82jAGaZhwMF2V/nf9yPC/fU6weKMXF1kVLV0q
 6eeylUw0wdGM+y680r9NV7ySMUaHEz1uVz1BHfbcAwTyqkRcCeq0ZIgxkviZFdzsdXc5
 pIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvmyfAS3FNKDIUlMjXBNYKBYoK/vtIij8n9c082Mubc=;
 b=ORAh8BR0CvVXPws4FQeVyyYc24jmQKeVYvZYtNesgyJRnku8Xq42/LbyedUqFyXfdZ
 M0jWscBx5PtF6XhVF2IDThqtlO/AuUY5q89fJ/T3Sr9gQK404anJyBiz++082PJY6e51
 F4Y0mKL282NoVSfIDBqFqiZmLGlktOqY+Bm/naTcaC15hLYvF43N+/7SGifZPednAuLi
 AP87Cgt3/EW1Dfs+psT/L3F83RRPLJ8U532gAUTSfgO6onXFgKDTLNOhicVuxIY7RP3r
 fgLUzijm1TuWeD06d3QjcQr4tsEsgwJZu8TNEzfpQwwvErpTWipjKsF3JQR6CT/Y/To8
 DP5Q==
X-Gm-Message-State: AOAM530ddRCaq0O3FZnxDjPdcFzv1qpB4O4juzCfa6Y1YgtvIrWdNUdB
 ggunppIkIuHs8B0ug3sV8sf2bG4FgWVqRqxZg+GZ0A==
X-Google-Smtp-Source: ABdhPJzo8W8E/m1R7rra7IFPqewUOrGPxKXu7J09tIasrTWLM5xWrumM7TFDDFkiXzDRs8Myt1FX1umkbCmB5lyZAZI=
X-Received: by 2002:a17:90a:740a:: with SMTP id
 a10mr18182181pjg.32.1603741500883; 
 Mon, 26 Oct 2020 12:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201026194110.3817470-1-arnd@kernel.org>
 <20201026194110.3817470-2-arnd@kernel.org>
In-Reply-To: <20201026194110.3817470-2-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 26 Oct 2020 12:44:49 -0700
Message-ID: <CAKwvOdnb+nC+5SHjqU0gqwD2kaEptE6EjGtxxgmr36Ts19rNTQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/imx: tve remove extraneous type qualifier
To: Arnd Bergmann <arnd@kernel.org>
X-Mailman-Approved-At: Tue, 27 Oct 2020 08:12:06 +0000
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
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 12:41 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang warns about functions returning a 'const int' result:
>
> drivers/gpu/drm/imx/imx-tve.c:487:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
>
> Remove the extraneous 'const' qualifier here. I would guess that the
> function was intended to be marked __attribute__((const)) instead,
> but that would also be wrong since it call other functions without
> that attribute.
>
> Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/imx/imx-tve.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
> index ef3c25d87d87..2a8d2e32e7b4 100644
> --- a/drivers/gpu/drm/imx/imx-tve.c
> +++ b/drivers/gpu/drm/imx/imx-tve.c
> @@ -484,7 +484,7 @@ static const char * const imx_tve_modes[] = {
>         [TVE_MODE_VGA] = "vga",
>  };
>
> -static const int of_get_tve_mode(struct device_node *np)
> +static int of_get_tve_mode(struct device_node *np)
>  {
>         const char *bm;
>         int ret, i;
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
