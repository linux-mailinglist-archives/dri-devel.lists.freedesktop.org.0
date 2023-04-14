Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C36E29B8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 19:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C382610EE32;
	Fri, 14 Apr 2023 17:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701A610E1D4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Smp6oU47DEE3G8uRWTgxTRgUaV9J1Who2o9os2NQENY=; b=nMw+Q8jlR7w6Ak7NUVLn1F5Duo
 f4t/N6SyZMPgtwOgq68jaQXJ1/gV5JGEFrWlUFfid6AEvCRISe3KfuEP9phwdc3snn4ksS/LIPktO
 UNcOHK4yYdOn6clVw226L10y56K640U8AqzTV22LIC/EHjHFTQEZ4iexxR6uldmScMpW1E+4+Q5nB
 hihlMWyio5W05SZLVmoWB8U0FpScuxM9MMFZJeBA7lMPYremB8yzFoEpO2RmMZKQV9NOY2H2kre1O
 Xa5zIC8ucTSMyvw56AO32rVgfx2tSVUVhA3TpQTngwdSYb6t/pTA/ZMXJiWSjs4JA+wbKBkfTNJQ/
 6wR68pIQ==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pnNcY-001D0O-Ka; Fri, 14 Apr 2023 19:54:02 +0200
Message-ID: <79f5c3bf-ac4d-18f5-4b09-2b9a2422202c@igalia.com>
Date: Fri, 14 Apr 2023 14:53:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 6/7] drm/vkms: add reflect-y property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230414135151.75975-1-mcanal@igalia.com>
 <20230414135151.75975-7-mcanal@igalia.com> <ZDliI+iEgQlDMZWJ@intel.com>
 <38df4fc1-b6ad-ae3d-daab-de09fde30ffc@igalia.com>
 <ZDlnTHCUqktMjGef@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <ZDlnTHCUqktMjGef@intel.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/14/23 11:46, Ville Syrjälä wrote:
> On Fri, Apr 14, 2023 at 11:37:17AM -0300, Maíra Canal wrote:
>> On 4/14/23 11:24, Ville Syrjälä wrote:
>>> On Fri, Apr 14, 2023 at 10:51:50AM -0300, Maíra Canal wrote:
>>>> Currently, vkms only support the reflect-x property. Therefore, add the
>>>> reflect-y property to vkms through a software implementation of the
>>>> operation. This is possible by reverse reading the y axis during the
>>>> blending.
>>>>
>>>> Now, vkms support all possible rotation values.
>>>>
>>>> Tested with igt@kms_rotation_crc@primary-reflect-y and
>>>> igt@kms_rotation_crc@sprite-reflect-y [1].
>>>>
>>>> [1] https://patchwork.freedesktop.org/series/116025/
>>>>
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++++-
>>>>    drivers/gpu/drm/vkms/vkms_plane.c    | 16 ++++------------
>>>>    2 files changed, 10 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> index b05bd008aeab..19d1078e9d34 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>>>> @@ -92,8 +92,13 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
>>>>    			return -1;
>>>>    		return y + frame_info->dst.x1;
>>>>    	default:
>>>> -		return y;
>>>> +		break;
>>>>    	}
>>>> +
>>>> +	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
>>>> +		return drm_rect_height(&frame_info->dst) - y - 1;
>>>> +
>>>> +	return y;
>>>>    }
>>>>    
>>>>    static bool check_limit(struct vkms_frame_info *frame_info, int pos)
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>>>> index 11662afa9fe4..d08bda869a24 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>>>> @@ -121,12 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>>>    	frame_info->fb = fb;
>>>>    	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>>>>    	drm_framebuffer_get(frame_info->fb);
>>>> -	frame_info->rotation = drm_rotation_simplify(new_state->rotation,
>>>> -						     DRM_MODE_ROTATE_0 |
>>>> -						     DRM_MODE_ROTATE_90 |
>>>> -						     DRM_MODE_ROTATE_180 |
>>>> -						     DRM_MODE_ROTATE_270 |
>>>> -						     DRM_MODE_REFLECT_X);
>>>> +	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_MASK |
>>>> +						     DRM_MODE_REFLECT_MASK);
>>>
>>> What are you trying to achieve with that?
>>
>> Yeah, seeing it right now I can see that this is not achieving anything.
>> I will remove it in the next version.
> 
> I think using it might still make sense to eg. remove the 180/270
> cases from your actual rendering code.

I will remove it on the next version.

> 
> I'm also a bit uneasy about all that hand rolled coordinate calculation
> stuff. Ideally drm_rect_rotate*() should handle all that for you, and
> make sure the rotate vs. reflect actually get applied in the correct
> order.
> 

At first, I had a similar idea that drm_rect_rotate() would handle all the
rotation. But, this turn out to be untrue. From what I can see, although
the drm_rect_rotate() helps by performing the coordinates rotation, we also
need to change the way the blending occurs. Although the coordinates have
changed, the vmap stays the same and we will still start reading the vmap
by the first line (y = 0). That's why we need to change the iteration
boundaries in the blending loops.

So, drm_rect_rotate() is a part of the solution, but it is not able to handle
it completely.

If you have any suggestions on how to perform the rotation without changing
the way the blending occurs, I would be glad to hear. Unfortunately, just
performing drm_rect_rotate() doesn't seem to be a solution.

Best Regards,
- Maíra Canal
