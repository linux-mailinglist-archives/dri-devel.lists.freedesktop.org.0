Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FE7B206F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A8810E676;
	Thu, 28 Sep 2023 15:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5167E10E676
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NDSOU0OqWaIZY0Tvd8ud58I7eDJ5xOfpim3bq5oUwGU=; b=j2yrzGsGfrFlPCeps4ksGlc61o
 ybi9EomOtFe2zncUVB69yVMi7f/pCysR/PdED5rVow4CyksatOw6aUZcRHyV7cQIksSkE2uCkb6ko
 HmRsd/byEPMhagCGrAtWcEpixH7MEATkvUMdJo/cX3H9geTOJ3D0T/+fSrZE7b8Vz693ljqn+JmL+
 4JmO49Ec6STwrDNHMgcCIzzK0uI0vIMRjnGrFWNpGapkt5u0tpzMnsFWQVKCNtF7AVuSxfETWS1aY
 iK6TGngGAWa0sFoF5h/zsze4r1wXe2EBBBuOk1Rt7j9DSC25pzxb0Q4pjD2yAzCu222XH6GKXVveZ
 hCLmJoqQ==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qlsaI-009Jop-P5; Thu, 28 Sep 2023 17:05:47 +0200
Message-ID: <d01bd636-1cd4-1adc-208c-f92f10ce4a34@igalia.com>
Date: Thu, 28 Sep 2023 12:05:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/v3d: update UAPI to match user-space for V3D 7.x
Content-Language: en-US
To: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org
References: <20230928114532.167854-1-itoral@igalia.com>
 <20230928114532.167854-3-itoral@igalia.com>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20230928114532.167854-3-itoral@igalia.com>
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

Hi Iago,

On 9/28/23 08:45, Iago Toral Quiroga wrote:
> V3D t.x takes a new parameter to configure TFU jobs that needs

I believe t.x should be 7.x.

> to be provided by user space.

As I mentioned before, please, add your s-o-b.

> ---
>   include/uapi/drm/v3d_drm.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 3dfc0af8756a..1a7d7a689de3 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -319,6 +319,11 @@ struct drm_v3d_submit_tfu {
>   
>   	/* Pointer to an array of ioctl extensions*/
>   	__u64 extensions;
> +
> +	struct {
> +		__u32 ioc;
> +		__u32 pad;
> +	} v71;

Is there any possibility that the name of the struct could be more
meaningful?

Best Regards,
- Maíra

>   };
>   
>   /* Submits a compute shader for dispatch.  This job will block on any
