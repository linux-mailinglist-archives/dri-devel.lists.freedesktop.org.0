Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99D399A580
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 15:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6F210EAF1;
	Fri, 11 Oct 2024 13:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="nuZy5WSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D8510EAE8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 13:54:02 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XQ7QK6MYsz9tt6;
 Fri, 11 Oct 2024 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1728654842; bh=n1WOgztgdZol/yqRy+BG+Mbi1frWGk6AMzu1Epuh+V4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=nuZy5WSHICq/1Ht8q1e9TZ+T0+jGxvSWYUOA4N9C/4m7/CKPHF5n0YXUO5iCm4KLN
 xdwR5K+zjxN4CdecizTOHMnOpJjkkHrvc5kT7o843X1aI3iG3FlKlrJp4+KdpdDh3u
 ts2xwzy1FvYSs1Fs+B8fcKZFZlUyYmOEweXgkt0s=
X-Riseup-User-ID: DE0616E53A0FE088A8995C5F0A19FD8B9EDA153B7652DC58E32077D8E8E2CD23
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XQ7QB6JnQzFrsK;
 Fri, 11 Oct 2024 13:53:54 +0000 (UTC)
Message-ID: <608074ed-567c-4e6d-b1c2-9e0ecf1d102b@riseup.net>
Date: Fri, 11 Oct 2024 10:53:52 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v12 09/15] drm/vkms: Remove useless drm_rotation_simplify
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
 <20241007-yuv-v12-9-01c1ada6fec8@bootlin.com>
 <Zwjxo2TEAR3PelO9@louis-chauvet-laptop>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <Zwjxo2TEAR3PelO9@louis-chauvet-laptop>
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

Hi Louis,

On 10/11/24 06:36, Louis Chauvet wrote:
> 
> Hi all,
> 
> Until this point, this series has not received any major comments since
> v9. I will commit patches 1-9 next week if there are no further comments.
> 

Although we are maintainers of VKMS, it isn't recommended that we push
our own changes without even the Ack of another person. Please, read the
"drm-misc Committer Guidelines" [1].

I can ack patches 05/15, 07/15, and 09/15, but it would be more
beneficial for the community if you ask for an ack (from me or from the
DRM maintainers, which are always around), instead of saying that you
are going to commit the patches without any review.

[1] 
https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html

Best Regards,
- Maíra

> For patches 10-15, I am currently waiting for feedback from Maxime to
> send the next iteration with a fix for kunit tests.
> 
> Thanks,
> Louis Chauvet
> 
> On 07/10/24 - 18:10, Louis Chauvet wrote:
>> As all the rotation are now supported by VKMS, this simplification does
>> not make sense anymore, so remove it.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index 8875bed76410..5a028ee96c91 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>   	frame_info->fb = fb;
>>   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>>   	drm_framebuffer_get(frame_info->fb);
>> -	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
>> -									  DRM_MODE_ROTATE_90 |
>> -									  DRM_MODE_ROTATE_270 |
>> -									  DRM_MODE_REFLECT_X |
>> -									  DRM_MODE_REFLECT_Y);
>> -
>> +	frame_info->rotation = new_state->rotation;
>>   
>>   	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
>>   }
>>
>> -- 
>> 2.46.2
>>
