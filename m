Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F53B6E8155
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 20:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E22610EA81;
	Wed, 19 Apr 2023 18:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1699210EA7D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 18:39:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C58F6379B;
 Wed, 19 Apr 2023 18:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C49C433EF;
 Wed, 19 Apr 2023 18:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681929563;
 bh=LfkZq5zJCyG0QdfnBfgE2MosMbCsWHxc+Ri9mlO/Gew=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=n5zzGj/+CjiVmFvj2sj6vi23KmZFrrV/tmQWbtjZtk1CLNNdebAPdCHzlAN4lIwkB
 mLzUSPwKeDaWtr9T86QE9odOmGx7obfMr3WeZR9Wcibvo2BJFWWWP7aRPeVQ9kthD9
 Ku/cYuoi1LARgMBY86HCBI1o/JzjcT9xc5TfbU98YnTrEXBcowESwemsdMrPddQVuV
 wVL2MAfv5KWF4yKXChaPNBxFjCsnBRCF20mrlA3jnXQ1JcmMhsPQ8RFzp1LUVgWaR/
 LsbFBUk0K2RqMmy0ZkWjxvzc1r8ynR+9wsIGy9qJNdbm4H7e3YNgBK3WwHiuk527Sg
 ijtaSACGMXXog==
Date: Wed, 19 Apr 2023 13:39:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Patrick McLean <chutzpah@gentoo.org>
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
Message-ID: <20230419183920.GA217365@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418225757.1361301-1-chutzpah@gentoo.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 03:57:57PM -0700, Patrick McLean wrote:
> Currently the ASPEED PCI vendor ID is defined in
> drivers/gpu/drm/ast/ast_drv.c, move that to include/linux/pci_ids.h
> with all the rest of the PCI vendor ID definitions. Rename the definition
> to follow the format that the other definitions follow.
> 
> Signed-off-by: Patrick McLean <chutzpah@gentoo.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

But please include this patch in the series that adds the use in
libata-core, as in your original posting, so we can see *why* we're
moving this to pci_ids.h.  That also makes it easier to make sure
those patches go together.

> ---
>  drivers/gpu/drm/ast/ast_drv.c | 4 +---
>  include/linux/pci_ids.h       | 2 ++
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index d78852c7cf5b..232e797793b6 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -70,12 +70,10 @@ static const struct drm_driver ast_driver = {
>   * PCI driver
>   */
>  
> -#define PCI_VENDOR_ASPEED 0x1a03
> -
>  #define AST_VGA_DEVICE(id, info) {		\
>  	.class = PCI_BASE_CLASS_DISPLAY << 16,	\
>  	.class_mask = 0xff0000,			\
> -	.vendor = PCI_VENDOR_ASPEED,			\
> +	.vendor = PCI_VENDOR_ID_ASPEED,			\
>  	.device = id,				\
>  	.subvendor = PCI_ANY_ID,		\
>  	.subdevice = PCI_ANY_ID,		\
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 45c3d62e616d..40e04e88ca5a 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2553,6 +2553,8 @@
>  #define PCI_DEVICE_ID_NETRONOME_NFP3800_VF	0x3803
>  #define PCI_DEVICE_ID_NETRONOME_NFP6000_VF	0x6003
>  
> +#define PCI_VENDOR_ID_ASPEED		0x1a03
> +
>  #define PCI_VENDOR_ID_QMI		0x1a32
>  
>  #define PCI_VENDOR_ID_AZWAVE		0x1a3b
> -- 
> 2.40.0
> 
