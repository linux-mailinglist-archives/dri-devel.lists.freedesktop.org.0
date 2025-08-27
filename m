Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1BB38127
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA0B10E7BE;
	Wed, 27 Aug 2025 11:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J3qESHHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB1E10E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:36:08 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e931cad1fd8so5648548276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756294567; x=1756899367; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0lax/yZLDW+BMNpUyGj5bqEEnYweAdIf1ksQkW3Vvxs=;
 b=J3qESHHFZ1JEKtr2IDzkFoEPAWy3uD0m9bhGfkrvHR4oCa08+X3YtSgyRqT2Br7E9m
 MT45UNQ0rVcfoUvR2ltyPG5xUP7q31Pm7NmUUT3iZRyt2Io6SsBH9TG3GFS7crvICJgu
 k1ZVkDznjwyPVJIAV98aSBbfAmJRjEptqrJyCsvzA1sKIqFTJXdha5mAGIbErwmGfwtq
 DWysGkeMZUt1JPfKpdxMI/Gi3WTsQ4wOsbqTOcONmlKvZiXvTZH/lNdW9dZvhQeCuRjD
 PLXlq3Z4Tu7Oot8E3p3nXdPTxixva4ClfpibBuJfprI9t0J/czCh9XBOe0Y/uqJMG2kx
 hncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756294567; x=1756899367;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0lax/yZLDW+BMNpUyGj5bqEEnYweAdIf1ksQkW3Vvxs=;
 b=bcj/4osw+IEkCMA4KjQD0Ali2IUkuuc58JfWfV/htlyUsSpUXEOcS9JEH6GkyaD2IO
 Ru6wmInQP0E9bwMNS4Fin4czyO9nauqA/eBQE4bbRGUeUAlUTV3ADF2X7tXXQk2bPXZB
 QG7l0zchaq7up7dvhRN5BuyiJPV1n0sCFsxur9HdvYs5gGSJojKeMaUVqtpME2pFzyTi
 TzAZI/L8G/mIJodvF6wX1R6UJdtS+aTwssOsTV6DEaTgOs6n4pGguiA1ZM4/2Vv6oREw
 tH4Gm8yyKGjwruVCLAQ+8Weq1L1rWDYTcotRSkTPhiOVi63BwGbVu8/DQgVCzZ9jf4M5
 uEjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbFw6MrV/+lgeMZvhXZmhp2t0p7Qx2ywnjWpChX71jMsT1DPgrhYTDnzn4ZEJzGfoTSD5HTIEXz3Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhEy/+I7qLBT/OM0B4PxtB3SK+Q0v6K3mhiZHFkZGsJQut3N9V
 BDtVZdzgtF8CmMWhlZrTuyDjbt/lWro/TpDAFGBgFiyacry4nm2TT7xBfAZv3NfiCXeOj2sQJs2
 42sAlPZfCc3ibIZajJ5eNrfVPRqdg+TkpWkU5+3ySYA==
X-Gm-Gg: ASbGnctTrXrMvkXqHSvXTyYoumklia1wtJNeUcjGf5wpu17RzDL5M3E5xPI5umg7s61
 qRorx0YhF4WPWWkPx3oQKvsIrrNvYez6pZNbzBgo0xJt/uNv6+GGiJ5mruL5uAZ1zI635Qns4Rj
 EzPdDqNzzevRMY2sAv6ebaR/On0VcnZdgje7XSIjIgyWDv06YKISyiVJ1Qd7Ak56b6pmciI6Efb
 BYCqVI=
X-Google-Smtp-Source: AGHT+IFngIUqyOrHPr1frhrJCq9eI3gBMm8y0Ik/Lf1DCEOhEB6QJoo4I7kdvXAvQYDz4lY+wIAEL2786J7bjWZOaCM=
X-Received: by 2002:a05:690c:9b0a:b0:71b:f712:2a2b with SMTP id
 00721157ae682-71fdc40b326mr235001117b3.36.1756294566868; Wed, 27 Aug 2025
 04:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100804.926672-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250827100804.926672-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Aug 2025 13:35:31 +0200
X-Gm-Features: Ac12FXw9ifzNvvhtGWnIdShprfJ4vFejZRmHaL0F5QXMJQLyCmkChpqg3eMOhko
Message-ID: <CAPDyKFpRF_sQ8P8M16cTkBXmOjP6NkvpKxHgCm=1cY73qoZ7uw@mail.gmail.com>
Subject: Re: [PATCH] drm: display: Drop dev_pm_domain_detach() call
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, claudiu.beznea.uj@bp.renesas.com, 
 saravanak@google.com, treding@nvidia.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 27 Aug 2025 at 12:08, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Starting with commit f99508074e78 ("PM: domains: Detach on
> device_unbind_cleanup()"), there is no longer a need to call
> dev_pm_domain_detach() in the bus remove function. The
> device_unbind_cleanup() function now handles this to avoid
> invoking devres cleanup handlers while the PM domain is
> powered off, which could otherwise lead to failures as
> described in the above-mentioned commit.
>
> Drop the explicit dev_pm_domain_detach() call and rely instead
> on the flags passed to dev_pm_domain_attach() to power off the
> domain.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> index 2d279e82922f..191664900ac7 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -58,13 +58,14 @@ static int dp_aux_ep_probe(struct device *dev)
>                 container_of(aux_ep, struct dp_aux_ep_device_with_data, aux_ep);
>         int ret;
>
> -       ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
> +       ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON |
> +                                       PD_FLAG_DETACH_POWER_OFF);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to attach to PM Domain\n");
>
>         ret = aux_ep_drv->probe(aux_ep);
>         if (ret)
> -               goto err_attached;
> +               return ret;
>
>         if (aux_ep_with_data->done_probing) {
>                 ret = aux_ep_with_data->done_probing(aux_ep->aux);
> @@ -88,8 +89,6 @@ static int dp_aux_ep_probe(struct device *dev)
>  err_probed:
>         if (aux_ep_drv->remove)
>                 aux_ep_drv->remove(aux_ep);
> -err_attached:
> -       dev_pm_domain_detach(dev, true);
>
>         return ret;
>  }
> @@ -107,7 +106,6 @@ static void dp_aux_ep_remove(struct device *dev)
>
>         if (aux_ep_drv->remove)
>                 aux_ep_drv->remove(aux_ep);
> -       dev_pm_domain_detach(dev, true);
>  }
>
>  /**
> --
> 2.43.0
>
