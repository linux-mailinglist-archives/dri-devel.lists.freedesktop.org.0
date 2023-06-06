Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95B724D81
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 21:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE6110E3A3;
	Tue,  6 Jun 2023 19:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1080D10E19E;
 Tue,  6 Jun 2023 19:49:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBDBF63749;
 Tue,  6 Jun 2023 19:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22544C433D2;
 Tue,  6 Jun 2023 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686080963;
 bh=pbIbz4/tc0Rq6Sy3ly+bzAO4xmFxE3ciFF0GfdmXFBI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=E4U6lVYqlhekeW3u/0dM8shOTdRaShUhgAE4YQMPUQTzSh3LHrvZwaPYvl2dhjAET
 WPV8DqyvjoKuBIdDnyDIpmDQsniskymtjKrWlOkzg5qXGIAQmqLw7N4WEx5g65xC9V
 hClqEzeTSafaEiu2/E95qwmKUqSeLLQxydJmHgApphwCzWJnDfQ1TV7MnAvvUVlH4J
 sITvP9IMTddL1S/66qiiVLnOf58x4/Sta6Xf2qKsbjFW/LqQRqXqNeMI2yB83s/Ooj
 SYujT0vnhtU1m7idliZPEQQZqcLDK7iZ7OM7xoQoZW/TzUXEESrkF3jvvgyj0f1mlz
 2J8SpOPxGoCyA==
Date: Tue, 6 Jun 2023 14:49:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [Intel-gfx] [PATCH v2 1/2] vgaarb: various coding style and
 comments fix
Message-ID: <20230606194921.GA1139774@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604205831.3357596-1-15330273260@189.cn>
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Match the subject line style:

  $ git log --oneline drivers/pci/vgaarb.c
  f321c35feaee PCI/VGA: Replace full MIT license text with SPDX identifier
  d5109fe4d1ec PCI/VGA: Use unsigned format string to print lock counts
  4e6c91847a7f PCI/VGA: Log bridge control messages when adding devices
  dc593fd48abb PCI/VGA: Remove empty vga_arb_device_card_gone()
  ...

Subject line should be a summary of the commit log, not just "various
style fixes".  This one needs to say something about
vga_str_to_iostate().

On Mon, Jun 05, 2023 at 04:58:30AM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> To keep consistent with vga_iostate_to_str() function, the third argument
> of vga_str_to_iostate() function should be 'unsigned int *'.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c   | 29 +++++++++++++++--------------
>  include/linux/vgaarb.h |  8 +++-----
>  2 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 5a696078b382..e40e6e5e5f03 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -61,7 +61,6 @@ static bool vga_arbiter_used;
>  static DEFINE_SPINLOCK(vga_lock);
>  static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
>  
> -
>  static const char *vga_iostate_to_str(unsigned int iostate)
>  {
>  	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
> @@ -77,10 +76,12 @@ static const char *vga_iostate_to_str(unsigned int iostate)
>  	return "none";
>  }
>  
> -static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
> +static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
>  {
> -	/* we could in theory hand out locks on IO and mem
> -	 * separately to userspace but it can cause deadlocks */
> +	/*
> +	 * we could in theory hand out locks on IO and mem
> +	 * separately to userspace but it can cause deadlocks
> +	 */

Omit all the comment formatting changes.  They are distractions from the
vga_str_to_iostate() parameter change.

I think this patch should be the single line change to the
vga_str_to_iostate() prototype so it matches the callers.

If you want to do the other comment formatting changes, they're fine,
but they should be all together in a separate patch that clearly
doesn't change the generated code.

Bjorn
