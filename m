Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689326A0B2D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD00F10E4ED;
	Thu, 23 Feb 2023 13:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8693A10EB89
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:49:39 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id be35so12601621oib.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 05:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EWQTfJ5YqMEb0/gtO5TDI9wfdh4CmPiWsPEKemNGlJk=;
 b=eURITKW8QYP9z92PoD7ZmDI2nN6q/tVUjqh4DU5g7kqwgmH0DJ+idqfmNyhvv7lQbp
 3eb+abJHt14JfyhHmXB/0dVfm/Oeh2xwUhZLk07+xIGuT1JaRLV1oQL/hHr6MVCyfH2K
 lByNBEJIJvIwi7fkOz7kDE0UXCEE732PJ4tL3dIETG+Wy/hOv5dX1tvsCL3resXFYrZw
 Nc3i4/NnPFah7Md9ZtOEMjfFs7d/GX4Czek8Yljmkt4OMuiSQmjeKxCHhRBOiYqt18mG
 n4cwyY89NB9RQZ5M/tBamhcXxVA4YE0p+rwps38LTEZN8c7+Kf2IHyXAiu3bv5eLWLxN
 5GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EWQTfJ5YqMEb0/gtO5TDI9wfdh4CmPiWsPEKemNGlJk=;
 b=vyLScNOATQ76UP13FyWnFmI02zL2gI9Ogc0oedu7rhK2AwnisLGzrZbJ9AZgf2yu1+
 ciWlXtUQCVPJcScZzCr5s/3CxMA1ccPbR/shtz3C283gsXoZ2vl8RVLqMavlK6q4ofAi
 Thj4uHMOoplWy23mpyg/BIu8wXG/Zzxovm4lbon963yaMIB+IVKFCzrn6cqG44VBl2SN
 ZVMjYThheIKNq9o44xiD+Nkg7BejFUH7yLi/IDDpSgaGPcLh7KU9Ff4VJEePLzoul8Qe
 uOLGyZNKgNBLLZzpdPga3prF9wzyLuzBnaDTHlHyFA2CtjFMmLeZ6JEvE7N0bN+6wIvk
 7FBA==
X-Gm-Message-State: AO0yUKXaU7RUxCWrPj6M719erW5wokR6kHgFrBdpW5b20iwtoPuMa0zx
 GMljfDM8zgaVh4kMPsPT/rfi0ox49BEAEeDhNKk=
X-Google-Smtp-Source: AK7set/2aMgF/LtaBUGb/KDdK5anSKBLMsRG6+EGNVCXpx0Q67zEslFcgOl1UjgJDQPL36+f5p7Oyzpjr86cKjsh3PE=
X-Received: by 2002:a05:6808:1690:b0:35b:d93f:cbc4 with SMTP id
 bb16-20020a056808169000b0035bd93fcbc4mr1087264oib.96.1677160178686; Thu, 23
 Feb 2023 05:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20230221034445.60034-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230221034445.60034-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Feb 2023 08:49:27 -0500
Message-ID: <CADnq5_OnEHV4QzicX5zTu=QP3KjH0b1piweEhzkegSn0qXbvNw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: dri-devel@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wrong subject line?  Should be drm/gma500?

Alex

On Mon, Feb 20, 2023 at 10:45 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/gma500/cdv_device.c:218 cdv_errata() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4126
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/gma500/cdv_device.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
> index 3e83299113e3..765f359365b9 100644
> --- a/drivers/gpu/drm/gma500/cdv_device.c
> +++ b/drivers/gpu/drm/gma500/cdv_device.c
> @@ -78,7 +78,8 @@ static u32 cdv_get_max_backlight(struct drm_device *dev)
>         if (max == 0) {
>                 DRM_DEBUG_KMS("LVDS Panel PWM value is 0!\n");
>                 /* i915 does this, I believe which means that we should not
> -                * smash PWM control as firmware will take control of it. */
> +                * smash PWM control as firmware will take control of it.
> +                */
>                 return 1;
>         }
>
> @@ -149,6 +150,7 @@ static inline u32 CDV_MSG_READ32(int domain, uint port, uint offset)
>         int mcr = (0x10<<24) | (port << 16) | (offset << 8);
>         uint32_t ret_val = 0;
>         struct pci_dev *pci_root = pci_get_domain_bus_and_slot(domain, 0, 0);
> +
>         pci_write_config_dword(pci_root, 0xD0, mcr);
>         pci_read_config_dword(pci_root, 0xD4, &ret_val);
>         pci_dev_put(pci_root);
> @@ -160,6 +162,7 @@ static inline void CDV_MSG_WRITE32(int domain, uint port, uint offset,
>  {
>         int mcr = (0x11<<24) | (port << 16) | (offset << 8) | 0xF0;
>         struct pci_dev *pci_root = pci_get_domain_bus_and_slot(domain, 0, 0);
> +
>         pci_write_config_dword(pci_root, 0xD4, value);
>         pci_write_config_dword(pci_root, 0xD0, mcr);
>         pci_dev_put(pci_root);
> @@ -180,10 +183,8 @@ static void cdv_init_pm(struct drm_device *dev)
>         int domain = pci_domain_nr(pdev->bus);
>         int i;
>
> -       dev_priv->apm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT,
> -                                                       PSB_APMBA) & 0xFFFF;
> -       dev_priv->ospm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT,
> -                                                       PSB_OSPMBA) & 0xFFFF;
> +       dev_priv->apm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT, PSB_APMBA) & 0xFFFF;
> +       dev_priv->ospm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT, PSB_OSPMBA) & 0xFFFF;
>
>         /* Power status */
>         pwr_cnt = inl(dev_priv->apm_base + PSB_APM_CMD);
> @@ -196,6 +197,7 @@ static void cdv_init_pm(struct drm_device *dev)
>         /* Wait for the GPU power */
>         for (i = 0; i < 5; i++) {
>                 u32 pwr_sts = inl(dev_priv->apm_base + PSB_APM_STS);
> +
>                 if ((pwr_sts & PSB_PWRGT_GFX_MASK) == 0)
>                         return;
>                 udelay(10);
> @@ -215,7 +217,7 @@ static void cdv_errata(struct drm_device *dev)
>          *      Bonus Launch to work around the issue, by degrading
>          *      performance.
>          */
> -        CDV_MSG_WRITE32(pci_domain_nr(pdev->bus), 3, 0x30, 0x08027108);
> +       CDV_MSG_WRITE32(pci_domain_nr(pdev->bus), 3, 0x30, 0x08027108);
>  }
>
>  /**
> @@ -401,20 +403,21 @@ static int cdv_power_up(struct drm_device *dev)
>
>  static void cdv_hotplug_work_func(struct work_struct *work)
>  {
> -        struct drm_psb_private *dev_priv = container_of(work, struct drm_psb_private,
> +       struct drm_psb_private *dev_priv = container_of(work, struct drm_psb_private,
>                                                         hotplug_work);
>         struct drm_device *dev = &dev_priv->dev;
>
> -        /* Just fire off a uevent and let userspace tell us what to do */
> -        drm_helper_hpd_irq_event(dev);
> +       /* Just fire off a uevent and let userspace tell us what to do */
> +       drm_helper_hpd_irq_event(dev);
>  }
>
>  /* The core driver has received a hotplug IRQ. We are in IRQ context
> -   so extract the needed information and kick off queued processing */
> -
> + * so extract the needed information and kick off queued processing
> + */
>  static int cdv_hotplug_event(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +
>         schedule_work(&dev_priv->hotplug_work);
>         REG_WRITE(PORT_HOTPLUG_STAT, REG_READ(PORT_HOTPLUG_STAT));
>         return 1;
> @@ -424,6 +427,7 @@ static void cdv_hotplug_enable(struct drm_device *dev, bool on)
>  {
>         if (on) {
>                 u32 hotplug = REG_READ(PORT_HOTPLUG_EN);
> +
>                 hotplug |= HDMIB_HOTPLUG_INT_EN | HDMIC_HOTPLUG_INT_EN |
>                            HDMID_HOTPLUG_INT_EN | CRT_HOTPLUG_INT_EN;
>                 REG_WRITE(PORT_HOTPLUG_EN, hotplug);
> @@ -549,6 +553,7 @@ static const struct psb_offset cdv_regmap[2] = {
>  static int cdv_chip_setup(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +
>         INIT_WORK(&dev_priv->hotplug_work, cdv_hotplug_work_func);
>
>         dev_priv->use_msi = true;
> --
> 2.20.1.7.g153144c
>
