Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2253DFE01
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 11:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3936EA39;
	Wed,  4 Aug 2021 09:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E24E6EA37;
 Wed,  4 Aug 2021 09:29:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8479A60EB9;
 Wed,  4 Aug 2021 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628069359;
 bh=F+pN4N1gCpcgAacPjKXnlhSvfsbduWSEH5hSqYGQZho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OUqwhSgOHz5aASIUVzmFjsN4XW6wWo/6hB1iKEtbR1O83smCX+Jtkv/WclRRQFI/O
 0WDCWtQBmV8zTOfhyzuPgqcQdvu7SDFE9As4eXWNKu5HaB8nuuoDsJteva510sQIXR
 RYPw/u1iE225cq1l47QW6rnCrNXarVMbRokKmAJA=
Date: Wed, 4 Aug 2021 11:29:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dianders@chromium.org, mkrishn@codeaurora.org,
 saiprakash.ranjan@codeaurora.org, rnayak@codeaurora.org,
 stable@vger.kernel.org
Subject: Re: [Resend v3] drm/msm/disp/dpu1: add safe lut config in dpu driver
Message-ID: <YQpd7P7xYaaf45OS@kroah.com>
References: <1628066313-9717-1-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628066313-9717-1-git-send-email-kalyan_t@codeaurora.org>
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

On Wed, Aug 04, 2021 at 01:38:33AM -0700, Kalyan Thota wrote:
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
> Changes in v2:
> - Add fixes tag (Sai)
> - CC stable kernel (Dimtry)
> 
> Changes in v3:
> - Correct fixes tag with appropriate hash (stephen)
> - Resend patch adding reviewed by tag
> 
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
