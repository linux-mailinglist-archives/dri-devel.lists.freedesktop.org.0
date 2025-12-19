Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A3CD1373
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 18:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0519E10EF10;
	Fri, 19 Dec 2025 17:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IX5qyWp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB83710EF10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 17:51:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4F6AFC1B20B;
 Fri, 19 Dec 2025 17:50:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D4B7A6071D;
 Fri, 19 Dec 2025 17:51:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A099102F0B50; Fri, 19 Dec 2025 18:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766166683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=gZbsi0/3CZI5iarKyG4+kknPxxal0vEqKpFXZJhtcU8=;
 b=IX5qyWp6BgdVqIKfMv1qi8h7GIJUZAnKj+KErS5E92teFxs0a/aue8nsSwbQVBZ6T7cFFG
 Tv40kzCvJLp8lTeXJJueMJ81d7eZm3GXkhShU64s2zuB20Wh1x9BJnAQN0QZAwS9lOYO04
 x5Md+/ZZtLgEd22EDtCWOYBwi+qq/LeMgQtL5HyPQJlRKCqrrmdDFPnOcGuBa3H8TbV/WV
 Skg2KHfsIakVO+jIiDsvACwB6hHIgSEKYLcs3JkQodp408euTUWOFgJKI+nyBhqMIxXJAy
 rdoqW87wpistffUjZx8ZbH3a6YdDqM/ApwrESYaxGK6YdN4FtmjLPfBK0jFKfg==
Message-ID: <4fbe256e-503c-47c3-959a-5fe8d19d7d4a@bootlin.com>
Date: Fri, 19 Dec 2025 18:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 12/32] drm/vkms: Introduce configfs for plane
 color encoding
From: Louis Chauvet <louis.chauvet@bootlin.com>
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
 <20251029-vkms-all-config-v2-12-a49a2d4cba26@bootlin.com>
 <DF1JDXPWYWVQ.2FSDNACYTUOMH@bootlin.com>
 <bd38f577-7a09-4287-b71b-6e6e3e0f2cf2@bootlin.com>
Content-Language: en-US
In-Reply-To: <bd38f577-7a09-4287-b71b-6e6e3e0f2cf2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


>>> +
>>> +    ret = kstrtouint(page, 10, &val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Should be a supported value */
>>> +    if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
>>> +            BIT(DRM_COLOR_YCBCR_BT709) |
>>> +            BIT(DRM_COLOR_YCBCR_BT2020)))
>>> +        return -EINVAL;
>>> +    /* Should at least provide one color range */
>>> +    if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
>>> +            BIT(DRM_COLOR_YCBCR_BT709) |
>>> +            BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
>>> +        return -EINVAL;
>>
>> Shouldn't you check that exactly one bit is set? As in patch 9.
> 
> Because this code is wrong... the default rotation should be 
> DRM_COLOR_YCBCR_BT601 / DRM_COLOR_YCBCR_BT709 / DRM_COLOR_YCBCR_BT2020
> not a bitfield...

And after fixing this, I think I will keep bitmask with only one bit set 
so supported_color_encodings and default_color_encoding will have 
exactly the same values. Same for color ranges. Thanks for the report!

> 
>>> +
>>> +    scoped_guard(mutex, &plane->dev->lock) {
>>> +        /* Ensures that the default rotation is included in 
>>> supported rotation */
>>> +        if (plane->dev->enabled)
>>> +            return -EINVAL;
>>
>> As before, wrong comment.
>>
>> Luca
>>
>> -- 
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> 

