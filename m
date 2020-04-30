Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B761BEED0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 05:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370C96E125;
	Thu, 30 Apr 2020 03:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D165F6E125;
 Thu, 30 Apr 2020 03:59:50 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id t18so2483258ybp.2;
 Wed, 29 Apr 2020 20:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UVqognKQgntjVBKfSDEux+9/gcTYWUYxOHYZrNrsat0=;
 b=rkZ25Oks3o/VpyiWfkX3rZpnI3vPGF94ioT0xhki2b45X5ITlx6+yeuOIhWuYqUXxZ
 7L6+p/dLdoG2j3g5Ai9sAitGD169VlugxcSxdNL505Sh4Uu5USTkRTIF7nbkxTd+Xi7k
 uBnlT3HVPTH2Kh2Pn0N1NK2TES9rq4eF8T6HCxpsYK8DpRTuPJ/5dFoXDr9KKEDa4b4J
 YWTfwZ88NBLqN6jnhffMLn6OpZpK0mSm4DMIfFiojx7JDO7wN+SqbAEGdiAZGoXzn8mB
 bjs0HcoC++cwG3g+ZF/IdDpcTk9PE8S8HP85HoaUeMJTwXNrK6BoxOX3bcTXSYPyi4LZ
 RmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UVqognKQgntjVBKfSDEux+9/gcTYWUYxOHYZrNrsat0=;
 b=tkXpA5DZnuiCXiHkkAmbikLB/nBA7lkLLUwkfvG0QnI1M9fAgDhNSUHkO5j8pdZ9DU
 NokeLrmaUALM/g7NIx9/hDDWLXpO9tgiPYWrocUNH/DEkKjCr/AElYOCfJVJQN1M4y+B
 dfMzZJSN//ijdQDGI+s2UOk/MHPtAqdpBytkOG2XSb02r+I6OEuS5HXACI4NcS7F1IsG
 jQ+8qtHEhhL8+UWCNCfcMua18wlaegRygGx97R+KgWMZMm5qhtThmcPIu4Bzl8//FUcm
 c7GWskqZzGTAzsH21g7CcZw44oA3GdvFefXaijePZToAPd/TWWQjDbsqW1QfdmR6Ayfq
 Xbmw==
X-Gm-Message-State: AGi0PuZL93zQs5Zku6897fTSFn/rhf7o/zVPM3qgGB33thbtsgJ2JG14
 t5YvEKn1OMxZwrt8PPZrsezos505BoqcP9Q2piw=
X-Google-Smtp-Source: APiQypKveNXxdXNF772LwVNMcSObYZ5pPt8kLYm89iTMNGQ5UrY0MiR1zMFeudwvyX0KOQuRHTxlUcanm+VQVwRvkeA=
X-Received: by 2002:a25:bccb:: with SMTP id l11mr2366341ybm.435.1588219190036; 
 Wed, 29 Apr 2020 20:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200423062358.1810-1-kai.heng.feng@canonical.com>
In-Reply-To: <20200423062358.1810-1-kai.heng.feng@canonical.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 30 Apr 2020 13:59:39 +1000
Message-ID: <CACAvsv6XmvsnRz7=Brd0dMBfh7FqGA0X_6rz=tTt9M_ess9Lvw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/nouveau: Use generic helper to check _PR3 presence
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks!

On Thu, 23 Apr 2020 at 17:37, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>
> Replace nouveau_pr3_present() in favor of a more generic one,
> pci_pr3_present().
>
> Also the presence of upstream bridge _PR3 doesn't need to go hand in
> hand with device's _DSM, so check _PR3 before _DSM.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_acpi.c | 44 ++++++--------------------
>  1 file changed, 10 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> index fe3a10255c36..b84dff1b0f28 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -212,37 +212,6 @@ static const struct vga_switcheroo_handler nouveau_dsm_handler = {
>         .get_client_id = nouveau_dsm_get_client_id,
>  };
>
> -/*
> - * Firmware supporting Windows 8 or later do not use _DSM to put the device into
> - * D3cold, they instead rely on disabling power resources on the parent.
> - */
> -static bool nouveau_pr3_present(struct pci_dev *pdev)
> -{
> -       struct pci_dev *parent_pdev = pci_upstream_bridge(pdev);
> -       struct acpi_device *parent_adev;
> -
> -       if (!parent_pdev)
> -               return false;
> -
> -       if (!parent_pdev->bridge_d3) {
> -               /*
> -                * Parent PCI bridge is currently not power managed.
> -                * Since userspace can change these afterwards to be on
> -                * the safe side we stick with _DSM and prevent usage of
> -                * _PR3 from the bridge.
> -                */
> -               pci_d3cold_disable(pdev);
> -               return false;
> -       }
> -
> -       parent_adev = ACPI_COMPANION(&parent_pdev->dev);
> -       if (!parent_adev)
> -               return false;
> -
> -       return parent_adev->power.flags.power_resources &&
> -               acpi_has_method(parent_adev->handle, "_PR3");
> -}
> -
>  static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out,
>                                   bool *has_mux, bool *has_opt,
>                                   bool *has_opt_flags, bool *has_pr3)
> @@ -250,6 +219,16 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
>         acpi_handle dhandle;
>         bool supports_mux;
>         int optimus_funcs;
> +       struct pci_dev *parent_pdev;
> +
> +       *has_pr3 = false;
> +       parent_pdev = pci_upstream_bridge(pdev);
> +       if (parent_pdev) {
> +               if (parent_pdev->bridge_d3)
> +                       *has_pr3 = pci_pr3_present(parent_pdev);
> +               else
> +                       pci_d3cold_disable(pdev);
> +       }
>
>         dhandle = ACPI_HANDLE(&pdev->dev);
>         if (!dhandle)
> @@ -270,7 +249,6 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
>         *has_mux = supports_mux;
>         *has_opt = !!optimus_funcs;
>         *has_opt_flags = optimus_funcs & (1 << NOUVEAU_DSM_OPTIMUS_FLAGS);
> -       *has_pr3 = false;
>
>         if (optimus_funcs) {
>                 uint32_t result;
> @@ -280,8 +258,6 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
>                          (result & OPTIMUS_ENABLED) ? "enabled" : "disabled",
>                          (result & OPTIMUS_DYNAMIC_PWR_CAP) ? "dynamic power, " : "",
>                          (result & OPTIMUS_HDA_CODEC_MASK) ? "hda bios codec supported" : "");
> -
> -               *has_pr3 = nouveau_pr3_present(pdev);
>         }
>  }
>
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
