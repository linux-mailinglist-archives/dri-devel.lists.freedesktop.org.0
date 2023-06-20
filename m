Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFCB736DFB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 15:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB19510E2E5;
	Tue, 20 Jun 2023 13:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvwxzv.outbound-mail.sendgrid.net
 (s.wrqvwxzv.outbound-mail.sendgrid.net [149.72.154.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7582910E2E1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=mime-version:subject:references:from:in-reply-to:to:cc:content-type:
 content-transfer-encoding:cc:content-type:from:subject:to;
 s=s1; bh=9grUNdjpwqcccJBDhf97I+CcaImjeCFFPj4g4gaFuZI=;
 b=Ja+cPrGU74pYP/PEoZNoGXjNhsM5CxymvSf6Z9demJvbei59nawZEY7OSrrKftzqd/RI
 0e9RJeil6W7IdF871oQdxyi6QPHu0SIoJHjUNtpiYYRhPqVu5SK8b8pfwF5SSxXYuFF7q2
 tPS3dCNQJsU0VNe7voHO8nXpVm8zLNOFnUqe4EP4B6TQVo8a5lBJz7u7bP71pwzscczTjJ
 rknChUUSWeCiX6f60EdPq+mf06MbfsbMDkyF7ziqO0UdLs0bWN3rQmuB+nwpm6iD08RH15
 0/y205azE1XRhv6Gb+R7wvqdxMTZ8gaNgfCzT14T8tKMOTEDQf6V/i+kOp8J2eJA==
Received: by filterdrecv-84b96456cb-jnxmg with SMTP id
 filterdrecv-84b96456cb-jnxmg-1-6491B000-11
 2023-06-20 13:56:16.489152857 +0000 UTC m=+3507455.908062499
Received: from [192.168.1.50] (unknown) by geopod-ismtpd-9 (SG) with ESMTP
 id yRlPZ-tUSQOW3d5KxRVAdg Tue, 20 Jun 2023 13:56:16.135 +0000 (UTC)
Message-ID: <34c08fc9-eb9b-376d-57fb-d47a68c2fc4d@kwiboo.se>
Date: Tue, 20 Jun 2023 13:56:16 +0000 (UTC)
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] drm/rockchip: Resolve dependency in GEM DMA helpers
Content-Language: en-US
References: <20230620121202.28263-1-tzimmermann@suse.de>
 <20230620121202.28263-3-tzimmermann@suse.de>
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20230620121202.28263-3-tzimmermann@suse.de>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h584SJKyuyhG0hFts?=
 =?us-ascii?Q?c+ciLuROhOoYSR1iWZ7yKcZEhmAlMelTfRjOp7s?=
 =?us-ascii?Q?IRhf554NLzeDvXtYeCMp2cTjVytqzvhvUNMtzJQ?=
 =?us-ascii?Q?sHWsoc4X+g4IsgfpDNB8oDb3CwWauRGysYAonTV?=
 =?us-ascii?Q?eHA=2F3=2FkEW732oxMY7Aj6J56HwnQ+gY1Sia7Zy=2Fn?=
 =?us-ascii?Q?=2FTWaCpcl87SGgNfcJcdsw=3D=3D?=
To: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 hjc@rock-chips.com, heiko@sntech.de
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Type: text/plain; charset=us-ascii
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
Cc: linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 2023-06-20 14:03, Thomas Zimmermann wrote:
> Remove the dependency on the GEM DMA helper library. Rockchip comes
> with its own implementation of the GEM interface. It only uses the VM
> callbacks in drm_gem_dma_vm_ops from the GEM DMA helpers. These are
> not DMA specific.
> 
> Duplicate drm_gem_dma_vm_ops in rockchip and remove all dependencies on
> the GEM DMA helper library.

I have intentions to remove the entire custom implementation of the GEM
interface and replace it with use of GEM DMA helpers in a future series.

Current custom implementation break import of video framebuffers located
in memory beyond 4GB. Switching to use pure GEM DMA helpers solved that
issue but requires reworking IOMMU integration for full support of
multiple VOPs on e.g., RK3288 and RK3399.

I have no ETA on when such series can be ready so this is more of a
heads up that I will revert this removal of dependency on GEM DMA helper
library in a future series.

Regards,
Jonas

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/rockchip/Kconfig            | 1 -
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 8 ++++++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
[snip]
