Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7E131491
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6DD6E47E;
	Mon,  6 Jan 2020 15:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C991E6E47E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 15:16:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j42so49974336wrj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2020 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/CJxLJTTE67cSb9UBo3ZFD95LjaLiRSOcg0ArwHPus=;
 b=ba1lGHHwIabst7HHLYJGJVxySW/EuQvbW527GyRGoYS1AZiPaPyxcGOvuTla37d9tS
 acJCSvPshJ0LGZ1mlBH7hqA4NiwCiLYoHwNlhvj/SfeysTSapKAg3eVqgKARnbpijC9R
 /SJV6RJE+BJRZu/6Ot65NKI9NHqntPIjZrZF71FjX0WX5gGEqjRVwo5FE2Hc+cC7CIAx
 CAHAfoiPz43iXjNJ5YxsbZcHgSkNO+x6M+sAW6mdgJSpDH3wE1v/7JTt90Dfso+f8/OT
 zeeNuEqtOADDadflzuxN0/+RK9MLJXHhaKQPQX+1GfBeoFR+CmMFEuqfs2VYvBTPlnlB
 eCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/CJxLJTTE67cSb9UBo3ZFD95LjaLiRSOcg0ArwHPus=;
 b=JsdxMKvzJiEdH9kJ5dMMUrtgmNAl5iAsgVEquX3dt6TDdQRpdxL545wIp5b64qbuRE
 2B/fNdb+rlg2z83xc4tZchwjynzK6eR8kBJZC+W0fT1fRySyd/lov0pn8KOkwR7PZoMj
 B7E+trTNeqbornKv5peOab7U4pyOhOeailzpuli+SpzIITLjc4AeBF+vO+haY+T3yJq7
 TuMJyv5wPkEVa+im3L2tMLw7fxnoyd2sfP+L/O+XYQkzAUTgcWD0fBbKAc0twTtcyEjm
 l4y3RDrvYVyPwrHfaPg5vhtbHGdlrMDJ2G3MHQTVyc5U1fW75zvL5Bl+6CwINgzd64kV
 fDWg==
X-Gm-Message-State: APjAAAXD27wXzB4TyrVU3022a7Wr6Qz1WG+IB6ONvz6xk1H9ZzHOwFCe
 rIISOtfoTKBJcgOL0Ycg38PXZp2IBNcnNtaqcOw=
X-Google-Smtp-Source: APXvYqwVMJgtUSgfyhC1QRA18CxZaokHXqCfmdveqq1pH+LA5z/cDyUUSMA0PVxn4VJ/gjZ98t9Vyfy4DDwrlf1sDjw=
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr102825311wrs.11.1578323786527; 
 Mon, 06 Jan 2020 07:16:26 -0800 (PST)
MIME-Version: 1.0
References: <20200106141016.9562-1-tzimmermann@suse.de>
In-Reply-To: <20200106141016.9562-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Jan 2020 10:16:15 -0500
Message-ID: <CADnq5_O_tRecF1Zf9==0A1N3fLUxA79qhfZk5_+u4o13JrTfjg@mail.gmail.com>
Subject: Re: [PATCH] drm/udl: Make udl driver depend on CONFIG_USB
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 6, 2020 at 9:10 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The udl driver for DisplayLink devices depends on support for host-side
> USB controllers, which is enabled with CONFIG_USB. Plain USB support as
> given by CONFIG_USB_SUPPORT not sufficient.
>
> This patch changes dependencies for udl to depend on CONFIG_USB, instead
> of CONFIG_USB_SUPPORT. Users will have to enable CONFIG_USB and select a
> USB host controller. With this change udl dependencies work the same way
> as dependencies for PCI drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/udl/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/Kconfig b/drivers/gpu/drm/udl/Kconfig
> index 065974bf010e..1f497d8f1ae5 100644
> --- a/drivers/gpu/drm/udl/Kconfig
> +++ b/drivers/gpu/drm/udl/Kconfig
> @@ -2,9 +2,8 @@
>  config DRM_UDL
>         tristate "DisplayLink"
>         depends on DRM
> -       depends on USB_SUPPORT
> +       depends on USB
>         depends on USB_ARCH_HAS_HCD
> -       select USB
>         select DRM_GEM_SHMEM_HELPER
>         select DRM_KMS_HELPER
>         help
> --
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
