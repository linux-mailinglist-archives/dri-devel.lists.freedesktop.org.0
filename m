Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86FA3DFDBC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 11:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23DF6EA2E;
	Wed,  4 Aug 2021 09:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60FD6EA35;
 Wed,  4 Aug 2021 09:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5787E60240;
 Wed,  4 Aug 2021 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628068209;
 bh=9X4hL8TfLuspjEJ70He/hj+tn4fH/H3eNlS2f2ndoxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXGa+WHPnySCeMTNtLIsO/kdHKYiEZq1T6/faJZEnj+zhHUAyq7pWT+Z3fJxMBEtM
 IHh+amcv6TJagOcUhRdnb2Uz3kx5ZH2lH8zztQF3hk1Xi0VHDkrHV5aa+GXCn++0KC
 /9DlvY0Uw7IBsSwlM8FwcztWIceVscmOQU/BtPJE=
Date: Wed, 4 Aug 2021 11:10:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dianders@chromium.org, mkrishn@codeaurora.org,
 saiprakash.ranjan@codeaurora.org, rnayak@codeaurora.org,
 stable@vger.kernel.org
Subject: Re: [v3] drm/msm/disp/dpu1: add safe lut config in dpu driver
Message-ID: <YQpZbosqlBo9EkG6@kroah.com>
References: <1628064990-6990-1-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628064990-6990-1-git-send-email-kalyan_t@codeaurora.org>
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

On Wed, Aug 04, 2021 at 01:16:30AM -0700, Kalyan Thota wrote:
> Add safe lut configuration for all the targets in dpu
> driver as per QOS recommendation.
> 
> Issue reported on SC7280:
> 
> With wait-for-safe feature in smmu enabled, RT client
> buffer levels are checked to be safe before smmu invalidation.
> Since display was always set to unsafe it was delaying the
> invalidaiton process thus impacting the performance on NRT clients
> such as eMMC and NVMe.
> 
> Validated this change on SC7280, With this change eMMC performance
> has improved significantly.
> 
> Changes in v1:
> - Add fixes tag (Sai)
> - CC stable kernel (Dimtry)
> 
> Changes in v2:
> - Correct fixes tag with appropriate hash (stephen)
> 
> Fixes: 591e34a091d1 (drm/msm/disp/dpu1: add support for display
> for SC7280 target)
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> (sc7280, sc7180)
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
