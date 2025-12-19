Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA7CD18D9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 20:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDC110E4E9;
	Fri, 19 Dec 2025 19:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XC2/lN1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4887A10E4E9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 19:11:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C87FC1A22FA;
 Fri, 19 Dec 2025 19:11:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9DF656071D;
 Fri, 19 Dec 2025 19:11:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98737102F0BC0; Fri, 19 Dec 2025 20:10:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766171463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Ug66R9FnI9fcgiVr7X3wQd7beMpX5BAaPDYcsdzzrsY=;
 b=XC2/lN1xpxPHx765W3PubGbvXiOCuW13gXYNWZx3d736bAqa9UnedBbbo4zK3HVkOUkbVc
 H+w+17j4dqHEAoI942rB2eXkZlegYZum8EOoU4s6xSiMK4tsicndcSW7qJghryiGwzxMqZ
 1CdkFo7oBPoRenGd33d5C324s/1QFl+4FELvmzcSyL71BYuItor2cj1mlcBJG9c7fQeHre
 ixsK6E6NGFyqIjO7BNSMX5MYE5D2ZFkSyxBv3QMoBf4HozON4DKxVs1TOGr3SVZETpz+Qe
 6lA4fGoZMCcyVXdS9YEXJisSmlkEP48EhtUHBuw9VTprwxUisOteDZMV5SVkrw==
Message-ID: <76417a1c-1179-4e47-ab2d-00048116bfae@bootlin.com>
Date: Fri, 19 Dec 2025 20:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 29/32] drm/vkms: Rename vkms_connector_init to
 vkms_connector_init_static
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-29-a49a2d4cba26@bootlin.com>
 <DF2F97ZVFINU.VQ5ZD96C4ZNH@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF2F97ZVFINU.VQ5ZD96C4ZNH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 12/19/25 19:58, Luca Ceresoli wrote:
> On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
>> With the introduction of dynamic connectors we will have two way of
>> initializing a VKMS connector. Rename the current function to clarify
>> the case.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
>> --- a/drivers/gpu/drm/vkms/vkms_connector.h
>> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
>> @@ -4,6 +4,7 @@
>>   #define _VKMS_CONNECTOR_H_
>>
>>   #include "vkms_drv.h"
>> +#include "vkms_config.h"
> 
> Why? Maybe this is for another patch in the series?

This line is useful, I use struct vkms_config_connector
But I agree, this should be a separate patch.

> With that line removed:
> 
>   Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

