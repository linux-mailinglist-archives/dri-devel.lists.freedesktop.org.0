Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C9A3B306
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 09:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7A410E477;
	Wed, 19 Feb 2025 08:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hoYfRI86";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="36VhpKuX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="olS2jPCY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0EFsskqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A2510E477
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 08:02:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DD6E20114;
 Wed, 19 Feb 2025 08:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739952138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sozIbeB09zXFHrwy7GrS/V1BsYGWUEYwSeF7GCgqvSA=;
 b=hoYfRI86vMcgvV9JK2BFgk1zdhiJ76W4ujRnCG/LnohxU+Yeu2QH9fnagya4mLZKeH7eRR
 pJ+JBwo/NKjKiGOHNzjc/rhBXZsUPy+6r3U7md4xQkgKzWCgXlgBEwyiDPBuGDOZGii9eB
 WeIfeTGL/i8n6ag7Ow4IbY4Xv4Zo6HI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739952138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sozIbeB09zXFHrwy7GrS/V1BsYGWUEYwSeF7GCgqvSA=;
 b=36VhpKuXwzhTkuaNK3+s86Pw6J4g18bwrWSMt77L9AaV2crohaOAA20MogqsDWdhebeMzi
 97bgllomBLvBGJAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=olS2jPCY;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0EFsskqI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739952137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sozIbeB09zXFHrwy7GrS/V1BsYGWUEYwSeF7GCgqvSA=;
 b=olS2jPCYVV2BGgrOo5IfcpULUNkgNS1YcnQsTQ7/Mgxex6HGaWF7LFvIlUMwl09JTu2n7U
 xF9jRhtLugcsPK/4CDWTiCzdP20pUtb4rEArilH4kr8kzML6/HzYvsMX67Yc7djeoJD6bg
 omtr11BTvaSF9YenTAjRHOjRX9vz+2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739952137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sozIbeB09zXFHrwy7GrS/V1BsYGWUEYwSeF7GCgqvSA=;
 b=0EFsskqIBvchCiDK13CVIW2w1pyoUsq5kU3WOg+tZaDYRnID6Wql+RJS4ZngUNghBixg/Q
 LUK6sr1fzGAa16AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 015FB13806;
 Wed, 19 Feb 2025 08:02:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UByVOgiQtWdYFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Feb 2025 08:02:16 +0000
Message-ID: <e76a94cc-3102-4327-9868-b5af5706cecd@suse.de>
Date: Wed, 19 Feb 2025 09:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Aditya Garg <gargaditya08@live.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
 <F16BB9EB-632C-4BC4-A8BA-492BF32E43C1@live.com>
 <d9304ed0-911b-4877-a15c-981b3335bbf9@suse.de>
 <BC25CBDD-D101-49DA-B10B-F47F1CAE2A6F@live.com>
 <81826e1b-1ec8-4665-9682-2a57c95f06d3@suse.de>
Content-Language: en-US
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <81826e1b-1ec8-4665-9682-2a57c95f06d3@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3DD6E20114
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FREEMAIL_TO(0.00)[live.com];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,bootlin.com:url]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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

Hi

Am 19.02.25 um 08:57 schrieb Thomas Zimmermann:
> Hi
>
> Am 18.02.25 um 21:12 schrieb Aditya Garg:
>> Hi
>>
>> In continuation to my previous mail.
>>
>>>> +
>>>> +static int appletbdrm_send_msg(struct appletbdrm_device *adev, u32 
>>>> msg)
>>>> +{
>>>> + struct appletbdrm_msg_simple_request *request;
>>>> + int ret;
>>>> +
>>>> + request = kzalloc(sizeof(*request), GFP_KERNEL);
>>>> + if (!request)
>>>> + return -ENOMEM;
>>>> +
>>>> + request->header.unk_00 = cpu_to_le16(2);
>>>> + request->header.unk_02 = cpu_to_le16(0x1512);
>>>> + request->header.size = cpu_to_le32(sizeof(*request) - 
>>>> sizeof(request->header));
>>>> + request->msg = msg;
>>>> + request->size = request->header.size;
>>>> +
>>>> + ret = appletbdrm_send_request(adev, &request->header, 
>>>> sizeof(*request));
>>>> +
>>>> + kfree(request);
>>> This is temporary data for the send operation and save to free here?
>> Probably yes. If I understand correctly, it’s needed to make the 
>> touchbar go into the display mode, from the hid keyboard mode.
>>
>> We here are doing the same as the Windows driver [1] for this does.
>>
>> [1] 
>> https://github.com/imbushuo/DFRDisplayKm/blob/master/src/DFRDisplayKm/include/Dfr.h#L3
>
> Yeah. My concern was that request is being freed while the USB send 
> operation is still using it. But in the USB code, it doesn't look like 
> that.
>
> [...]
>>> Can we void the use of drm_fb_blit()? Since you know all formats in 
>>> advance, just do
>>>
>>> switch (format)
>>> case XRGB8888: drm_fb_xrgb888_to_bgr888() break default:
>>>     drm_fb_memcpy() break }We use blit in simpledrm and ofdrm, where 
>>> we don't know the formats and output buffers in advance. But it's 
>>> really not so great in other drivers, I think.
>> I think you mean this:
>>
>> #include <drm/drm_framebuffer.h>
>>
>>         switch (fb->format->format) {
>>         case DRM_FORMAT_XRGB8888:
>>             drm_fb_xrgb8888_to_bgr888(&dst, NULL, 
>> &shadow_plane_state->data[0], fb, &damage, 
>> &shadow_plane_state->fmtcnv_state);
>>             break;
>>         default:
>>             drm_fb_memcpy(&dst, NULL, &shadow_plane_state->data[0], 
>> fb, &damage);
>>             break;
>>         }
>
> Yes.
>
> [...]
>>> For USB devices, we need special wiring to make PRIME work. The 
>>> PRIME device must support DMA, but a USB device doesn't. So we pass 
>>> the USB controller device instead. See [2] for what udl does and how 
>>> it obtains dmadev.
>>>
>>> [2] 
>>> https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/gpu/drm/udl/udl_drv.c#L76
>> Disregard my previous reply for this. I believe you meant by this?:
>>
>> —>8—
>>  From b6fda730995b7f28374c1ff38778a6f3e6da65da Mon Sep 17 00:00:00 2001
>> From: Aditya Garg <gargaditya08@live.com>
>> Date: Tue, 18 Feb 2025 22:47:44 +0530
>> Subject: [PATCH] prime
>>
>> ---
>> drivers/gpu/drm/tiny/appletbdrm.c | 13 +++++++++++++
>> 1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tiny/appletbdrm.c 
>> b/drivers/gpu/drm/tiny/appletbdrm.c
>> index f2d911325..b835063c2 100644
>> --- a/drivers/gpu/drm/tiny/appletbdrm.c
>> +++ b/drivers/gpu/drm/tiny/appletbdrm.c
>> @@ -118,6 +118,7 @@ struct appletbdrm_fb_request_response {
>>
>> struct appletbdrm_device {
>>     struct device *dev;
>> +    struct device *dmadev;
>>
>>     unsigned int in_ep;
>>     unsigned int out_ep;
>> @@ -521,10 +522,22 @@ static const struct drm_encoder_funcs 
>> appletbdrm_encoder_funcs = {
>>     .destroy = drm_encoder_cleanup,
>> };
>>
>> +static struct drm_gem_object 
>> *appletbdrm_driver_gem_prime_import(struct drm_device *dev,
>> +                                 struct dma_buf *dma_buf)
>> +{
>> +    struct appletbdrm_device *adev = drm_to_adev(dev);
>> +
>> +    if (!adev->dmadev)
>> +        return ERR_PTR(-ENODEV);
>> +
>> +    return drm_gem_prime_import_dev(dev, dma_buf, adev->dmadev);
>> +}
>> +
>> DEFINE_DRM_GEM_FOPS(appletbdrm_drm_fops);
>>
>> static const struct drm_driver appletbdrm_drm_driver = {
>>     DRM_GEM_SHMEM_DRIVER_OPS,
>> +    .gem_prime_import    = appletbdrm_driver_gem_prime_import,
>
> Exactly. The TODO item for this problem is at [1], but there's quite a 
> bit of change involved to fix it. Setting a dedicated DMA device is 
> the next best thing.
>
> [1] 
> https://elixir.bootlin.com/linux/v6.13.3/source/Documentation/gpu/todo.rst#L615

To add to this: you also have to set dmadev. See [2] for the respective 
code in udl. And please git-grep udl for dmadev and look for the places 
were it handles device ref-counting.

[2] 
https://elixir.bootlin.com/linux/v6.13.2/source/drivers/gpu/drm/udl/udl_main.c#L314

Best regards
Thomas

>
> Best regards
> Thomas
>
>>     .name            = "appletbdrm",
>>     .desc            = "Apple Touch Bar DRM Driver",
>>     .major            = 1,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

