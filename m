Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE74D2F29
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B1D10E843;
	Wed,  9 Mar 2022 12:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ABA10E8BC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:39:36 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id q19so1844891pgm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WESkvE76RvvUixdvsGaxsNSlfocf93aoUlbvnUrP/3w=;
 b=LCxMYDWgDlEuFKdClsB7iVa0L1wsrGHbTBdtC+BGeFRhY24YokktRg4ls6jiDYLrzW
 14YHm7RlmHiRfiTKdBsAbmxHaQJQ2ZEnfK+q7EAqIdERbcisut/d/nATv1WS4OHX9cr8
 Pq83ihOkp0uiIo0yEE6nijobZGIRuLhtr3pFep2O02z3oyAo6h77cR/7DDDKHRvV37yL
 iTsnVemGFv7I00c4SHcVa6Ge/Ar+pfKBlPQSQ9w33k9BT3G0NQJIk8Rj2FqQKQybsFLk
 ah+9zAPvoyexEEZX6XRLV/vIZCAKpfX0JtQiKsmCXYFc2A109tTMlFnEPme1nSyDCsrf
 grnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WESkvE76RvvUixdvsGaxsNSlfocf93aoUlbvnUrP/3w=;
 b=WN4IQejCUQDBXaVYQO86KRZoS76VW1DXRNJnnFA5qr6nUsZOuelYVZUoY6mDMNYD8w
 /J9n7k4PLsELmMXc+XZ6tmf894xg/j2D5sCDnrvmdy8krQ1wX3vu+UUrWkInjAwVpeBb
 g+C8mJo8tLO3IiZCbGmmEFFoAKI5HuHBX6JAaokmIwelneCvRBTJyaHjNF5ANsta9mLU
 uOzSopzAK7NV7zqKqmUq1y6UOCjiFTM3qGG4n1sL1XWREzjeuEShM+8nlL1yaqFDZbnc
 FFo4GPXHksX3cKUigP3bZ75lSUNPVghH+YbDPTmQ7E9sNb4iU/x7kmVE/7KyVPYpKQwK
 O5zw==
X-Gm-Message-State: AOAM533siiyMSmUo/zTEfcmM6K8dqj95wwe1cGDwRC6FWlCaGpST8/fI
 /BMlCrhsXp5qNSy3CZlE4jagTgHbzv5z/dCeifE=
X-Google-Smtp-Source: ABdhPJxbT86GAY/Ne4q6cybuhlIHdWYhwaMGdm5kXBNt0v1TksC9BAaKkKp4Lrrk1NYwht/Fs3RSSQMReqjllobR3Xs=
X-Received: by 2002:aa7:88c4:0:b0:4f6:fed2:a855 with SMTP id
 k4-20020aa788c4000000b004f6fed2a855mr15896626pff.17.1646829576524; Wed, 09
 Mar 2022 04:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20220308195222.13471-1-tzimmermann@suse.de>
 <20220308195222.13471-12-tzimmermann@suse.de>
In-Reply-To: <20220308195222.13471-12-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 9 Mar 2022 13:39:24 +0100
Message-ID: <CAMeQTsa2Ez0SAkniCehu7Dt8-pAWkyvsKdDYcfT+4Rfq46Gm2g@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] drm/gma500: Move GTT enable and disable code
 into helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 8:52 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Move the code for enabling and disabling the GTT into helpers and call
> the functions in psb_gtt_init(), psb_gtt_fini() and psb_gtt_resume().
> Removes code duplication.

That makes it much more readable. Thanks.

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gtt.c | 81 ++++++++++++++++++++----------------
>  1 file changed, 46 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> index b03feec64f01..83d9a9f7c73c 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -125,17 +125,44 @@ void psb_gtt_remove_pages(struct drm_psb_private *pdev, const struct resource *r
>         mutex_unlock(&pdev->gtt_mutex);
>  }
>
> -void psb_gtt_fini(struct drm_device *dev)
> +static int psb_gtt_enable(struct drm_psb_private *dev_priv)
>  {
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       struct drm_device *dev = &dev_priv->dev;
>         struct pci_dev *pdev = to_pci_dev(dev->dev);
> +       int ret;
>
> -       iounmap(dev_priv->gtt_map);
> +       ret = pci_read_config_word(pdev, PSB_GMCH_CTRL, &dev_priv->gmch_ctrl);
> +       if (ret)
> +               return pcibios_err_to_errno(ret);
> +       ret = pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl | _PSB_GMCH_ENABLED);
> +       if (ret)
> +               return pcibios_err_to_errno(ret);
> +
> +       dev_priv->pge_ctl = PSB_RVDC32(PSB_PGETBL_CTL);
> +       PSB_WVDC32(dev_priv->pge_ctl | _PSB_PGETBL_ENABLED, PSB_PGETBL_CTL);
> +
> +       (void)PSB_RVDC32(PSB_PGETBL_CTL);
> +
> +       return 0;
> +}
> +
> +static void psb_gtt_disable(struct drm_psb_private *dev_priv)
> +{
> +       struct drm_device *dev = &dev_priv->dev;
> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
>
>         pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
>         PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
> +
>         (void)PSB_RVDC32(PSB_PGETBL_CTL);
> +}
>
> +void psb_gtt_fini(struct drm_device *dev)
> +{
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +
> +       iounmap(dev_priv->gtt_map);
> +       psb_gtt_disable(dev_priv);
>         mutex_destroy(&dev_priv->gtt_mutex);
>  }
>
> @@ -159,22 +186,15 @@ int psb_gtt_init(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>         struct pci_dev *pdev = to_pci_dev(dev->dev);
> +       struct psb_gtt *pg = &dev_priv->gtt;
>         unsigned gtt_pages;
> -       struct psb_gtt *pg;
> -       int ret = 0;
> +       int ret;
>
>         mutex_init(&dev_priv->gtt_mutex);
>
> -       pg = &dev_priv->gtt;
> -
> -       /* Enable the GTT */
> -       pci_read_config_word(pdev, PSB_GMCH_CTRL, &dev_priv->gmch_ctrl);
> -       pci_write_config_word(pdev, PSB_GMCH_CTRL,
> -                             dev_priv->gmch_ctrl | _PSB_GMCH_ENABLED);
> -
> -       dev_priv->pge_ctl = PSB_RVDC32(PSB_PGETBL_CTL);
> -       PSB_WVDC32(dev_priv->pge_ctl | _PSB_PGETBL_ENABLED, PSB_PGETBL_CTL);
> -       (void) PSB_RVDC32(PSB_PGETBL_CTL);
> +       ret = psb_gtt_enable(dev_priv);
> +       if (ret)
> +               goto err_mutex_destroy;
>
>         /* The root resource we allocate address space from */
>         pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
> @@ -227,17 +247,16 @@ int psb_gtt_init(struct drm_device *dev)
>         if (!dev_priv->gtt_map) {
>                 dev_err(dev->dev, "Failure to map gtt.\n");
>                 ret = -ENOMEM;
> -               goto err_gtt_disable;
> +               goto err_psb_gtt_disable;
>         }
>
>         psb_gtt_clear(dev_priv);
>
>         return 0;
>
> -err_gtt_disable:
> -       pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
> -       PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
> -       (void)PSB_RVDC32(PSB_PGETBL_CTL);
> +err_psb_gtt_disable:
> +       psb_gtt_disable(dev_priv);
> +err_mutex_destroy:
>         mutex_destroy(&dev_priv->gtt_mutex);
>         return ret;
>  }
> @@ -246,20 +265,14 @@ int psb_gtt_resume(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>         struct pci_dev *pdev = to_pci_dev(dev->dev);
> +       struct psb_gtt *pg = &dev_priv->gtt;
>         unsigned int gtt_pages;
> -       struct psb_gtt *pg;
>         int ret;
>
> -       pg = &dev_priv->gtt;
> -
>         /* Enable the GTT */
> -       pci_read_config_word(pdev, PSB_GMCH_CTRL, &dev_priv->gmch_ctrl);
> -       pci_write_config_word(pdev, PSB_GMCH_CTRL,
> -                             dev_priv->gmch_ctrl | _PSB_GMCH_ENABLED);
> -
> -       dev_priv->pge_ctl = PSB_RVDC32(PSB_PGETBL_CTL);
> -       PSB_WVDC32(dev_priv->pge_ctl | _PSB_PGETBL_ENABLED, PSB_PGETBL_CTL);
> -       (void) PSB_RVDC32(PSB_PGETBL_CTL);
> +       ret = psb_gtt_enable(dev_priv);
> +       if (ret)
> +               return ret;
>
>         /* The root resource we allocate address space from */
>         pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
> @@ -311,16 +324,14 @@ int psb_gtt_resume(struct drm_device *dev)
>         if (gtt_pages != pg->gtt_pages) {
>                 dev_err(dev->dev, "GTT resume error.\n");
>                 ret = -EINVAL;
> -               goto err_gtt_disable;
> +               goto err_psb_gtt_disable;
>         }
>
>         pg->gtt_pages = gtt_pages;
>
>         psb_gtt_clear(dev_priv);
>
> -err_gtt_disable:
> -       pci_write_config_word(pdev, PSB_GMCH_CTRL, dev_priv->gmch_ctrl);
> -       PSB_WVDC32(dev_priv->pge_ctl, PSB_PGETBL_CTL);
> -       (void)PSB_RVDC32(PSB_PGETBL_CTL);
> +err_psb_gtt_disable:
> +       psb_gtt_disable(dev_priv);
>         return ret;
>  }
> --
> 2.35.1
>
