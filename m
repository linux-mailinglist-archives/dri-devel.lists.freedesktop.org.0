Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C727DB9E8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 13:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DC010E2A5;
	Mon, 30 Oct 2023 12:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C56310E2AD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 12:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
 :References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NrQphLKEXxg2Teo4CtjhXVI9BbJBpJZSqT1o7JDXPno=; b=HRiBFxBz60bdK3J/SSoqRNrEPh
 wuoKSvVZPdEBppsGu+nGUPTiyS1y74WUquA6ZhKvwPCLQcLnaJZISr1sxvqWoYX4gi9qirhyVfphu
 4vIn5fHlziJLWtJhDn5EzNBAbWjRF9AoSfW47hWDNnMqOH2gcrirni5AuqY7N3NOSmzYLMUrg5fHt
 Qxn+KNm5AA2CIC7Qtqrvm0hEu5Xk2qmx85Uouybz3lYUoMhGqI7P5u8XLX01/ZVD9S+jSDKe4QBJH
 kyXRIgMozQPEHfzmsY8kkBVFomvj70c/Bh+mRcDFzCC6n1kF8HwJNJN4xU2oRbwbcmr2NLkUMAy0d
 yYhrLKgw==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qxRLX-00EuAe-B0; Mon, 30 Oct 2023 13:26:19 +0100
Message-ID: <dd5006f1-32ea-cd36-37d7-6c7404cf117e@igalia.com>
Date: Mon, 30 Oct 2023 09:26:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
References: <20231030082858.30321-1-itoral@igalia.com>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 0/4] V3D module changes for Pi5
In-Reply-To: <20231030082858.30321-1-itoral@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

The whole series is:

Reviewed-by: Maíra Canal <mcanal@igalia.com>

You can add my r-b in the next version (adding the DTS maintainers in
CC).

Best Regards,
- Maíra

On 10/30/23 05:28, Iago Toral Quiroga wrote:
> This series includes patches to update the V3D kernel module
> that drives the VideoCore VI GPU in Raspberry Pi 4 to also support
> the Video Core VII iteration present in Raspberry Pi 5.
> 
> The first patch in the series adds a small uAPI update required for
> TFU jobs, the second patch addresses the bulk of the work and
> involves mostly updates to register addresses, the third and fourth
> patches match the 'brcm,2712-v3d' device string from Pi5 with the
> V3D driver.
> 
> The changes for the user-space driver can be found in the
> corresponding Mesa MR here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25450
> 
> Iago Toral Quiroga (4):
>    drm/v3d: update UAPI to match user-space for V3D 7.x
>    drm/v3d: fix up register addresses for V3D 7.x
>    dt-bindings: gpu: v3d: Add BCM2712's compatible
>    drm/v3d: add brcm,2712-v3d as a compatible V3D device
> 
>   .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml |   1 +
>   drivers/gpu/drm/v3d/v3d_debugfs.c             | 178 ++++++++++--------
>   drivers/gpu/drm/v3d/v3d_drv.c                 |   1 +
>   drivers/gpu/drm/v3d/v3d_gem.c                 |   4 +-
>   drivers/gpu/drm/v3d/v3d_irq.c                 |  46 +++--
>   drivers/gpu/drm/v3d/v3d_regs.h                |  94 +++++----
>   drivers/gpu/drm/v3d/v3d_sched.c               |  38 ++--
>   include/uapi/drm/v3d_drm.h                    |   5 +
>   8 files changed, 211 insertions(+), 156 deletions(-)
> 
