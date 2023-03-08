Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9306B0BEC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 15:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC0F10E5E7;
	Wed,  8 Mar 2023 14:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA15A10E5F0;
 Wed,  8 Mar 2023 14:53:59 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-176e43eb199so8840541fac.7; 
 Wed, 08 Mar 2023 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678287239;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+h1rij6N0lUGO/E7ZKOwHfc3o7H8cFo1VZKk3y0lxN8=;
 b=MS45slAd8KXjvjy9zmeKgZR1lvxKaZA8SpMsisKbRQV7k5MoWAyPqTwia45hGuG8AH
 31fXYtVTxf12SQJFqnUheYQLgpU2kaaVtMGcdoGnWCkkMh9+BQ/c1GOgljZM4VGCZ72O
 WjbiTRB6eR2jY04y/ZdFoz+1p+3ZrGpgGvtpp6AexBNjPERxj4EJlIyBq+zDonPqXllj
 RGdYH99+OJP7V6MFpfmMDowOlohL83FAiW2Q149BDP60iHhVmHGjp0iqnPBonX/yObrT
 iRMnLjwa1rBcMLhGjIEzQu3fWKj48Zo1gKSVq52WvvSmkmyg2ss6LnxOaeppTRCK71lp
 SZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678287239;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+h1rij6N0lUGO/E7ZKOwHfc3o7H8cFo1VZKk3y0lxN8=;
 b=jC1gss56CuzAGeO90xXUL80cdNuxkySvZwfjNOBSb4nZcoCyL4QNdIw7RF4yHXMN8+
 BXtgxTfllSE8N4HLJI3+xVkZKFO86zDfx+LmlC7r0I7nXnXJTG/c/4AMZGInyabmWk9A
 NpMrJt7EJiwgLQUeAf9mRru8oA8dGAMqXIWLZ853cCwdp6ZMf7WegUX+PFiTcQbt+sFM
 Ib9tASwJR9L38Da99erA2eB1Kwmz6NNtR8tH75OWv6shhV2EE8V9oWwWLorwRA6pZaWD
 i4il2of/b+HqDs0tLid6cDFhKIT7Dwr5u6Rb0GHwOhD1zAInFK9Aj5fXm7bCkrtc3inS
 lzlA==
X-Gm-Message-State: AO0yUKW2Dk3cpu/XdYybI9ZOFX2iGN97RkD7gK/3MN7nC/hTG+8VLQpd
 NA0PgQm0kZRZRMyPSKsUfkXPaSjzJXKlsPM4CIM=
X-Google-Smtp-Source: AK7set/GAIE8dIs01hI0FVo6FB5zbktg52ZImeNPVZn8V1GMCDG0CxElCY+45T+l43/aw+F7Hr5AmsBvy26xusOvxhw=
X-Received: by 2002:a05:6870:5a97:b0:176:31db:9a49 with SMTP id
 dt23-20020a0568705a9700b0017631db9a49mr6332180oab.3.1678287239001; Wed, 08
 Mar 2023 06:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20230307202221.880489-1-helgaas@kernel.org>
In-Reply-To: <20230307202221.880489-1-helgaas@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Mar 2023 09:53:47 -0500
Message-ID: <CADnq5_PffomFtJkVmOzFQnCk=Oqv9CmTZjKVm0oZoi94oq4KMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Drop redundant
 pci_enable_pcie_error_reporting()
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Mar 7, 2023 at 3:22 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> pci_enable_pcie_error_reporting() enables the device to send ERR_*
> Messages.  Since f26e58bf6f54 ("PCI/AER: Enable error reporting when AER is
> native"), the PCI core does this for all devices during enumeration, so the
> driver doesn't need to do it itself.
>
> Remove the redundant pci_enable_pcie_error_reporting() call from the
> driver.
>
> Note that this only controls ERR_* Messages from the device.  An ERR_*
> Message may cause the Root Port to generate an interrupt, depending on the
> AER Root Error Command register managed by the AER service driver.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 --
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 164141bc8b4a..208cebb40232 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -50,7 +50,6 @@
>  #include <linux/hashtable.h>
>  #include <linux/dma-fence.h>
>  #include <linux/pci.h>
> -#include <linux/aer.h>
>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_placement.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c4a4e2fe6681..a5151e83a3f7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3773,8 +3773,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>                 }
>         }
>
> -       pci_enable_pcie_error_reporting(adev->pdev);
> -
>         /* Post card if necessary */
>         if (amdgpu_device_need_post(adev)) {
>                 if (!adev->bios) {
> --
> 2.25.1
>
