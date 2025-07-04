Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F6BAF992B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 18:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9300F10E34B;
	Fri,  4 Jul 2025 16:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bQz2odiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671FC10E348
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DfTt13KaBgjZBz5elPAVafFy1ImSQAAQr44AcA6+pGE=; b=bQz2odizhpvQfOzSKFLFj2ENEq
 D12u144AvHHnRFwIx8nQTribkpiQ8FB3lrZUE5Xq5Tx2g5ZnRdeyUicw2Cng12Tgt+Qfy6N2ads+T
 Iw2yYsyN9sOO2c0KqsiuQe9WLbLodu8fKfyoEEpJip1X2BS1+mdcbPjQt8gcPCJfy5lcwb4nxP1eL
 fZLdAhw7tycHAQBg0OxFmC4aST70U1UiUBRajOwV6Dd1c7fXvR2SMNBIZX6pC+3yRzS8BZ4a8Uaqd
 nrPEGNE635mZhzQ2Bu96hsiLBWhywYNg0Y2PAjiUg+7uGfwr58DMBTn0/y7GydFIl3H0L0Bun1fOP
 QirPS3dA==;
Received: from [179.100.5.63] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXjYC-00CVSU-HD; Fri, 04 Jul 2025 18:46:12 +0200
Message-ID: <52c32d1b-e5c4-4f6d-82a3-cf02c0cf4681@igalia.com>
Date: Fri, 4 Jul 2025 13:46:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/doc: Fix title underline for "Task information"
To: Raag Jadav <raag.jadav@intel.com>
Cc: simona@ffwll.ch, Krzysztof Karas <krzysztof.karas@intel.com>,
 airlied@gmail.com, Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, kernel-dev@igalia.com
References: <20250627171715.438304-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250627171715.438304-1-andrealmeid@igalia.com>
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

Raag, gently ping for reviewing this series.

Em 27/06/2025 14:17, André Almeida escreveu:
> Fix the following warning:
> 
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> 
> Task information
> --------------- [docutils]
> 
> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Add Reported-by tag
> ---
>   Documentation/gpu/drm-uapi.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 263e5a97c080..10dea6a1f097 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
>   complete wedging.
>   
>   Task information
> ----------------
> +----------------
>   
>   The information about which application (if any) was involved in the device
>   wedging is useful for userspace if they want to notify the user about what
> @@ -728,4 +728,4 @@ Stable uAPI events
>   From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>   
>   .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> -   :doc: uAPI trace events
> \ No newline at end of file
> +   :doc: uAPI trace events

