Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534E57B207B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB5510E677;
	Thu, 28 Sep 2023 15:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910B110E677
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LNO4zPWIKRMAnCszuJOtVMi2t2/688t4MnEaNtlW8aU=; b=ernvDuvFhZS+79Xav6Bsj8mamd
 bZuA5TKFvcliK4hgWw7knvntH3AswFJbJ7mbj8mr6wYyv8rW9bsjDAUI5qNU3MRVlUR7VvBq0VWd1
 z1B0IfmKsNXQMEDegT8+BHkEqflFFT3Lx/ZpNSApT85AvS3fgDDa/QJVAYd6SzgfZlmNB42fY91rD
 f8GE9xH9VxRdEPmlCYJD+YwZgSOLw2tr6L2EFLWOx60PUZUTaFFtft3rRBs/Nyn2l+JZ68u3XfHP4
 vwUb2Oa9vn7Gc9DaQc/h3lpWyTzEWR4LECkfgPBOLrhPErWt09kKuhwaBZFB9vSNKg7G5+/rKEbfU
 5y/K6nUw==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qlsbC-009JqJ-Ic; Thu, 28 Sep 2023 17:06:42 +0200
Message-ID: <fc8a8c69-1031-9532-de21-b85604ab6f7a@igalia.com>
Date: Thu, 28 Sep 2023 12:06:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/v3d: add brcm, 2712-v3d as a compatible V3D device
Content-Language: en-US
To: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
References: <20230928114532.167854-1-itoral@igalia.com>
 <20230928114532.167854-4-itoral@igalia.com>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20230928114532.167854-4-itoral@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please, add a commit message and your s-o-b.

Apart from that,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

On 9/28/23 08:45, Iago Toral Quiroga wrote:
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index ffbbe9d527d3..0ed2e7ba8b33 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -186,6 +186,7 @@ static const struct drm_driver v3d_drm_driver = {
>   };
>   
>   static const struct of_device_id v3d_of_match[] = {
> +	{ .compatible = "brcm,2712-v3d" },
>   	{ .compatible = "brcm,2711-v3d" },
>   	{ .compatible = "brcm,7268-v3d" },
>   	{ .compatible = "brcm,7278-v3d" },
