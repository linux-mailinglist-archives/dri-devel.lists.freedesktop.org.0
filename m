Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D9FA32818
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E637410E8AD;
	Wed, 12 Feb 2025 14:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="B1zSwnxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8946A10E8AD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:10:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 594344429F;
 Wed, 12 Feb 2025 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739369451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7KO9jUpYxi1t4t4/FEqpUIJN4ZPvH+UIm4Yv7jJ4s9c=;
 b=B1zSwnxCW6zFBpa4erS1g/rR8UTgP/Kf1HLTA7hqIDUQbgO2/tRCFuYxcSrbxwlPPyO9MC
 9xSvbjhkNRtW+8Is9JiRVTVjc/RGB6oNdM/ZZ/TRQel8HDs/m/NQQrOeJeRMD3BLhzg3Vt
 R6z5XkDHrwwLELRQGHlihMPmliqQMfb+Ln3QDo0f7BHKroNv6UzTXC6sYXuyt9GZTBTEdn
 YbNjMy+ZbStaeoVfH8DMarTVXDqZl5F41lizxzxbx1fsJIJGpAeXCleckZ951ydtKVrTWa
 n+tPVt3tU1MPQt/64wsaydXtQmCZr1cFeH0J+MbSP3kt4KZxa9XWW+uPhljx9w==
Message-ID: <b05831de-c67b-4ba9-8808-f049d97b3654@bootlin.com>
Date: Wed, 12 Feb 2025 15:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] drm/vkms: Allow to attach planes and CRTCs
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-10-jose.exposito89@gmail.com>
 <Z5uDJd4iV9Vnrp9e@louis-chauvet-laptop> <Z6sq0h0lKxjmBcxk@fedora>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <Z6sq0h0lKxjmBcxk@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmr
 ggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 11/02/2025 à 11:47, José Expósito a écrit :
> On Thu, Jan 30, 2025 at 02:48:21PM +0100, Louis Chauvet wrote:
>> On 29/01/25 - 12:00, José Expósito wrote:
>>> Add a list of possible CRTCs to the plane configuration and helpers to
>>> attach, detach and get the primary and cursor planes attached to a CRTC.
>>>
>>> Now that the default configuration has its planes and CRTC correctly
>>> attached, configure the output following the configuration.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>
>> Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
>>
>> [...]
>>
>>> -static bool valid_plane_type(struct vkms_config *config)
>>> +static bool valid_plane_type(struct vkms_config *config,
>>> +			     struct vkms_config_crtc *crtc_cfg)
>>
>> What do you think about renaming it to "valid_planes_for_crtc" to reflect
>> the fact you tests if a CRTC is attached to a valid combination of planes?
>>
>>>   {
>>>   	struct vkms_config_plane *plane_cfg;
>>>   	bool has_primary_plane = false;
>>>   	bool has_cursor_plane = false;
>>>   
>>>   	list_for_each_entry(plane_cfg, &config->planes, link) {
>>> +		struct vkms_config_crtc *possible_crtc;
>>> +		unsigned long idx = 0;
>>>   		enum drm_plane_type type;
>>>   
>>>   		type = vkms_config_plane_get_type(plane_cfg);
>>>   
>>> -		if (type == DRM_PLANE_TYPE_PRIMARY) {
>>> -			if (has_primary_plane) {
>>> -				pr_err("Multiple primary planes\n");
>>> -				return false;
>>> -			}
>>> +		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
>>> +			if (possible_crtc != crtc_cfg)
>>> +				continue;
>>>   
>>> -			has_primary_plane = true;
>>> -		} else if (type == DRM_PLANE_TYPE_CURSOR) {
>>> -			if (has_cursor_plane) {
>>> -				pr_err("Multiple cursor planes\n");
>>> -				return false;
>>> -			}
>>> +			if (type == DRM_PLANE_TYPE_PRIMARY) {
>>> +				if (has_primary_plane) {
>>> +					pr_err("Multiple primary planes\n");
>>> +					return false;
>>> +				}
>>>   
>>> -			has_cursor_plane = true;
>>> +				has_primary_plane = true;
>>> +			} else if (type == DRM_PLANE_TYPE_CURSOR) {
>>> +				if (has_cursor_plane) {
>>> +					pr_err("Multiple cursor planes\n");
>>> +					return false;
>>> +				}
>>> +
>>> +				has_cursor_plane = true;
>>> +			}
>>>   		}
>>>   	}
>>
>> [...]
>>
>>> +int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *plane_cfg,
>>> +					       struct vkms_config_crtc *crtc_cfg)
>>> +{
>>> +	struct vkms_config_crtc *possible_crtc;
>>> +	unsigned long idx = 0;
>>> +	u32 crtc_idx = 0;
>>> +
>>> +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
>>> +		if (possible_crtc == crtc_cfg)
>>> +			return -EINVAL;
>>
>> Is it really an error? After this call, we expect plane and crtc to be
>> attached, so if the plane is already attached, I don't see any issue.
> 
> In my opinion, this could be either handled as an error or not. I think that
> there are arguments for both approaches but, for our use case, I think that it
> is better to return an error.
> 
> Since the main (and for the moment only) user of this function will be configfs,
> it is very convenient to return an error to avoid creating 2 links between
> plane <-> crtc.
> 
> If we allow to create multiple links, and the user deletes one of them, the
> items would be still linked, which is a bit unexpected.
> 
> The same applies to the other vkms_config_*_attach_* functions.

I see your reasoning, I did not think about this issue.
We can keep the error, but can we use `EEXIST` to reflect better the status?

And I just think about it, maybe we can add here the check "is the crtc 
part of the same config as the plane" (and return EINVAL if not)? It 
will remove the need to do the check in configFS + avoid errors for 
future users of vkms_config.

> For these reasons, I didn't change it in v2, let me know your opinion.
> Jose
> 
>>> +	}
>>> +
>>> +	return xa_alloc(&plane_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
>>> +			xa_limit_32b, GFP_KERNEL);
>>> +}
>>> +
>>
>> [...]
>>
>>> +struct vkms_config_crtc **vkms_config_plane_get_possible_crtcs(struct vkms_config_plane *plane_cfg,
>>> +							       size_t *out_length)
>>> +{
>>> +	struct vkms_config_crtc **array;
>>> +	struct vkms_config_crtc *possible_crtc;
>>> +	unsigned long idx;
>>> +	size_t length = 0;
>>> +	int n = 0;
>>> +
>>> +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc)
>>> +		length++;
>>> +
>>> +	if (length == 0) {
>>> +		*out_length = length;
>>> +		return NULL;
>>> +	}
>>> +
>>> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
>>> +	if (!array)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
>>> +		array[n] = possible_crtc;
>>> +		n++;
>>> +	}
>>> +
>>> +	*out_length = length;
>>> +	return array;
>>> +}
>>
>> Same as before, can we use an iterator?
>>
>>> +static struct vkms_config_plane *vkms_config_crtc_get_plane(const struct vkms_config *config,
>>> +							    struct vkms_config_crtc *crtc_cfg,
>>> +							    enum drm_plane_type type)
>>
>> Even if this is a private function, can we add a comment explaning that
>> the returned value is only one of the available planes of this type?
>>
>> 	/**
>> 	 * vkms_config_crtc_get_plane() - Get the first attached plane
>>           * found of a specific type
>> 	 * @config: configuration containing the crtc and the planes
>> 	 * @crtc_cfg: Only find planes attached to this CRTC
>> 	 * @type: Plane type to search
>> 	 *
>> 	 * Returns:
>> 	 * The first plane found attached to @crtc_cfg with the type
>> 	 * @type.
>> 	 */
>>
>>> +{
>>> +	struct vkms_config_plane *plane_cfg;
>>> +	struct vkms_config_crtc *possible_crtc;
>>> +	enum drm_plane_type current_type;
>>> +	unsigned long idx;
>>> +
>>> +	list_for_each_entry(plane_cfg, &config->planes, link) {
>>> +		current_type = vkms_config_plane_get_type(plane_cfg);
>>> +
>>> +		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
>>> +			if (possible_crtc == crtc_cfg && current_type == type)
>>> +				return plane_cfg;
>>> +		}
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
>>
>> [...]
>>
>>> +/**
>>> + * vkms_config_crtc_primary_plane() - Return the primary plane for a CRTC
>>> + * @config: Configuration containing the CRTC
>>> + * @crtc_config: Target CRTC
>>> + *
>>> + * Returns:
>>> + * The primary plane or NULL if none is assigned yet.
>>> + */
>>
>> Same as above, can you speficy that it is one of the primary plane?
>>
>>> +struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_config *config,
>>> +							 struct vkms_config_crtc *crtc_cfg);
>>> +
>>> +/**
>>> + * vkms_config_crtc_cursor_plane() - Return the cursor plane for a CRTC
>>
>> Ditto
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
>>
>> [...]
>>
>>> @@ -35,19 +41,54 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>>>   			ret = PTR_ERR(plane_cfg->plane);
>>>   			goto err_free;
>>>   		}
>>> +	}
>>> +
>>> +	for (n = 0; n < n_crtcs; n++) {
>>> +		struct vkms_config_crtc *crtc_cfg;
>>> +		struct vkms_config_plane *primary, *cursor;
>>> +
>>> +		crtc_cfg = crtc_cfgs[n];
>>> +		primary = vkms_config_crtc_primary_plane(vkmsdev->config, crtc_cfg);
>>> +		cursor = vkms_config_crtc_cursor_plane(vkmsdev->config, crtc_cfg);
>>
>> Linked with a previous comment: here we have no garantee that primary is a
>> valid pointer, can we check it or call vkms_config_is_valid to ensure it?
>>
>>> +		crtc_cfg->crtc = vkms_crtc_init(dev, &primary->plane->base,
>>> +						cursor ? &cursor->plane->base : NULL);
>>> +		if (IS_ERR(crtc_cfg->crtc)) {
>>> +			DRM_ERROR("Failed to allocate CRTC\n");
>>> +			ret = PTR_ERR(crtc_cfg->crtc);
>>> +			goto err_free;
>>> +		}
>>
>> [...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

