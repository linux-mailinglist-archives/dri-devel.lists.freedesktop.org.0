Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17055C7C034
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 01:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BBC10E8C8;
	Sat, 22 Nov 2025 00:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="W3Hp+HO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7291B10E8C8
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 00:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Yru/Aj0uKUE7zBjBvHyFS3l3XpwZvOAEFYXN5H1BHT0=; b=W3Hp+HO+J5KKzMOJzv7V0AwKcE
 ZtX1UlevJyc1AQW3vKCEiJ3RerQUREHboFpGCN1iwZk49rXaRM+m/K/+cpQY2+AvkB2NQp2hoO9sG
 GvQ3bpdnFAWy2vl9yIQQ4eS5poW7Pn7VDR2pF5V/SUUj+CdDUQiIKJ2Bb3InhDhbTffWyRhm+IZt1
 sm13yF780EK3/bavwbuEXH6U2Xz8885WTwl/X1MLDadfDHi1OpMrzHsLZE1cwgpGZG9/iNGnWkp1P
 2EkFgli9c6sV+bC9Io49glg7uRKx81aVTC21ZIi76bA+4K4Kx4wbhAMVSHKtgN7A1FVJc4jpyi4x4
 z/3NocHA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vMbVd-000000096HN-1PYc; Sat, 22 Nov 2025 00:29:49 +0000
Message-ID: <1022b551-ad51-4eed-bd75-a5865bd8d466@infradead.org>
Date: Fri, 21 Nov 2025 16:29:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/imagination: Document pvr_device.power member
To: Matt Coster <matt.coster@imgtec.com>, Frank Binns
 <frank.binns@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/21/25 7:20 AM, Matt Coster wrote:
> Automated testing caught this missing doc comment; add something suitable
> (and useful).
> 
> Fixes: 330e76d31697 ("drm/imagination: Add power domain control")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20251106152448.453b53ad@canb.auug.org.au/
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Based on the build target indicated in the report, I tried (and failed)
> to reproduce the reported warning using:
> 
>    make W=1 htmldocs
> 
> I was, however, able to get the reported warning (and verify that this
> patch clears it) using:
> 
>    scripts/kernel-doc -none drivers/gpu/drm/imagination/pvr_device.h
> 
> Does anyone have any ideas why my invocation of htmldocs didn't seem to
> have the same effect? Is it just simply that the relevant doc comment
> isn't pulled into any of the rst docs; in which case how did the
> linux-next build catch this warning?

Hi Matt,
I get the warnings when I run "make W=1 htmldocs" on the linux-next tree.
Are you using mainline (or close to it)? If so, it could be a difference in
scripts/kernel-doc.

The patch looks good. Thanks.
Acked-by: Randy Dunlap <rdunlap@infradead.org>

> Changes in v2:
> - Add a proper commit description.
> - Link to v1: https://lore.kernel.org/r/20251106-device-power-doc-fix-v1-1-76d9841c8084@imgtec.com
> ---
>  drivers/gpu/drm/imagination/pvr_device.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
> index ab8f56ae15df..ec53ff275541 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -146,6 +146,14 @@ struct pvr_device {
>  	 */
>  	struct clk *mem_clk;
>  
> +	/**
> +	 * @power: Optional power domain devices.
> +	 *
> +	 * On platforms with more than one power domain for the GPU, they are
> +	 * stored here in @domain_devs, along with links between them in
> +	 * @domain_links. The size of @domain_devs is given by @domain_count,
> +	 * while the size of @domain_links is (2 * @domain_count) - 1.
> +	 */
>  	struct pvr_device_power {
>  		struct device **domain_devs;
>  		struct device_link **domain_links;
> 
> ---
> base-commit: cead55e24cf9e092890cf51c0548eccd7569defa
> change-id: 20251106-device-power-doc-fix-ba1a5d753b6f
> 
> 

-- 
~Randy
