Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD84B2F03
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 22:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC3E10E9E5;
	Fri, 11 Feb 2022 21:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359AA10E9E5;
 Fri, 11 Feb 2022 21:02:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4AACB82CF8;
 Fri, 11 Feb 2022 21:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B97C340E9;
 Fri, 11 Feb 2022 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644613370;
 bh=ApT45q3g7mkRiUKpHndWjTAzQ/rKHh2xKyLJKPCYKpg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=QT6uV2oz9XTg8oBcDwpiSDNkfbOCuBDdwTQPQjrbpacmqAUuE9kRf9tTPNrr9J/Xb
 UbdNCzO7kwyw5xX2S1c/YuKHeUr+qynZcdm/d37Ayjwwyu3gIzYnjXVncbYYI6sley
 pzCaRuBA/J46LFhghaKiVktGCvFRv0xeimhv2bqZ2mJkYL9Br+fgk+qmD7iL/aERya
 phT76xW8wXz/QjFyk5dBOqsp7fVv1LIzefSRor9FHR/Vkhrjy6/hK1u7QLs74eVkuK
 tXzrpiT61ZTfJpU84aAGy1ahBx3V3Qxu5S38FQRB8ssvliOkfna8OjcnRynWZQAAxz
 s4H9kso4K2C9Q==
Date: Fri, 11 Feb 2022 15:02:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 01/12] thunderbolt: move definition of
 PCI_CLASS_SERIAL_USB_USB4
Message-ID: <20220211210248.GA734887@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211193250.1904843-2-mario.limonciello@amd.com>
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
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 01:32:39PM -0600, Mario Limonciello wrote:
> This PCI class definition of the USB4 device is currently located only in
> the thunderbolt driver.
> 
> It will be needed by a few other drivers for upcoming changes. Move it into
> the common include file.
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I would change the subject to:

  PCI: Add USB4 class definition

because this seems like more of a PCI thing than a Thunderbolt thing,
but either way:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/thunderbolt/nhi.h | 2 --
>  include/linux/pci_ids.h   | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 69083aab2736..79e980b51f94 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -81,6 +81,4 @@ extern const struct tb_nhi_ops icl_nhi_ops;
>  #define PCI_DEVICE_ID_INTEL_TGL_H_NHI0			0x9a1f
>  #define PCI_DEVICE_ID_INTEL_TGL_H_NHI1			0x9a21
>  
> -#define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
> -
>  #endif
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index aad54c666407..61b161d914f0 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -116,6 +116,7 @@
>  #define PCI_CLASS_SERIAL_USB_OHCI	0x0c0310
>  #define PCI_CLASS_SERIAL_USB_EHCI	0x0c0320
>  #define PCI_CLASS_SERIAL_USB_XHCI	0x0c0330
> +#define PCI_CLASS_SERIAL_USB_USB4	0x0c0340
>  #define PCI_CLASS_SERIAL_USB_DEVICE	0x0c03fe
>  #define PCI_CLASS_SERIAL_FIBER		0x0c04
>  #define PCI_CLASS_SERIAL_SMBUS		0x0c05
> -- 
> 2.34.1
> 
