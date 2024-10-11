Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D099A312
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 13:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1E510EACF;
	Fri, 11 Oct 2024 11:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WgjzI/MY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE67E10EACF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728647905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqtqYDJ5gmPb+okepgVdSWbzK6v/2AzBf5S5iY5omHQ=;
 b=WgjzI/MYpehKNnptZxml2ql9NOR7gq93gH/6jHzuYTbdAgycTdFrb/sfd+JAcwyXGkEX2t
 f6iluog6AAZ/umVEOxclRljno8XOdBNayCGbpgyxu0/kK+Yr6dzVKdP1uCqTzePoCSiMLO
 o5/12CGWST80AIQA2ZCPgJw/9TMX8/g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-dFImZFEpPM-PhnZcgJNjAg-1; Fri, 11 Oct 2024 07:58:23 -0400
X-MC-Unique: dFImZFEpPM-PhnZcgJNjAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43057c9b32bso12205205e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 04:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728647902; x=1729252702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HqtqYDJ5gmPb+okepgVdSWbzK6v/2AzBf5S5iY5omHQ=;
 b=OMaj7xiOw1RJSphNSbewPnsXknqv6kP0vzhctBa9fG3v0TMopjSdl2L1f0Wg0Vr55k
 ZFtBVinNXR9D1I+5HhT04HY1+4i28Was1K8YXnWOdKKTT9KPe8DzEjRObg0p3iOJZKDX
 cYRi5Kv2AE7PvT8TReK2zrBZdhEq3Gj6ggss3tbVjrlq17hH7LaNLUDL275tr/bZKPx+
 VbgV3vMNAwU4GqsXkRwkZbA+87IgnDh7z2YoYTJeF4TDJFvHyQUBRkAgnl/ZZlmtW0YD
 mi+mbTbEqnxo5NEaEEhDuFXiQlwMLIOJTNS3Xdop0S55hsf9zmjXbcQE2nlOSe+g5c73
 tCLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXarsZ/vukd726NNkIbnT9LyN9K6Ud5aYA1lpj4uc4lf0ekH7/j+Je4GfhFjo/aDSwVQ6MPXTY9SN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4kHXbu8kNw6Np0jWDJnb7EKRwE7LJ5iFrkomYnkuK9Yr4R/Nd
 zxdkTGgcZrsB5DIi2nxb2NZMQZfCg3Wqo5NmI87V9voNlgvKzKR/QVM6GWdXhC1wbiqByPyp7nP
 YOGRzWmzhC33I4OfqxA1NmLXf26QMSR9VRFrrtXHZkj2qavgnBjEsSDykKXpaJzZdnQ==
X-Received: by 2002:a05:600c:45ce:b0:42e:93eb:ca26 with SMTP id
 5b1f17b1804b1-4311ded374cmr18850605e9.11.1728647902592; 
 Fri, 11 Oct 2024 04:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdbupGZvOA1PH+zsyYzVgQX2lgglDGG00ph3V2nJxTXUb/SfavUodcnAmRNSFjnDd2BtjITg==
X-Received: by 2002:a05:600c:45ce:b0:42e:93eb:ca26 with SMTP id
 5b1f17b1804b1-4311ded374cmr18850385e9.11.1728647902118; 
 Fri, 11 Oct 2024 04:58:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430d70b4462sm73029795e9.30.2024.10.11.04.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 04:58:21 -0700 (PDT)
Message-ID: <fab4dac7-e332-452a-8c73-f275c0c76f34@redhat.com>
Date: Fri, 11 Oct 2024 13:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] drm/log: Add integer scaling support
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241011105526.615812-1-jfalempe@redhat.com>
 <20241011105526.615812-8-jfalempe@redhat.com> <8734l26g66.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <8734l26g66.fsf@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/10/2024 13:18, Jani Nikula wrote:
> On Fri, 11 Oct 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Add a module parameter, to increase the font size for HiDPI screen.
>> Even with CONFIG_FONT_TER16x32, it can still be a bit small to read.
>> In this case, adding drm_log.scale=2 to your kernel command line will
>> double the character size.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_log.c | 27 ++++++++++++++++++---------
>>   1 file changed, 18 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_log.c b/drivers/gpu/drm/drm_log.c
>> index 07d151300146..e44c10819bd0 100644
>> --- a/drivers/gpu/drm/drm_log.c
>> +++ b/drivers/gpu/drm/drm_log.c
>> @@ -25,6 +25,10 @@ MODULE_AUTHOR("Jocelyn Falempe");
>>   MODULE_DESCRIPTION("DRM boot logger");
>>   MODULE_LICENSE("GPL");
>>   
>> +static uint scale = 1;
> 
> Drive-by nit, please use regular types instead of sysv "uint".

ok, you're right. It looks like the most common pattern is to use 
unsigned int for the variable but still call module_param() with uint.
I will fix that for v5.

Thanks,

-- 

Jocelyn
> 
> BR,
> Jani.
> 
>> +module_param(scale, uint, 0444);
>> +MODULE_PARM_DESC(scale, "Integer scaling factor for drm_log, default is 1");
>> +
>>   /**
>>    * DOC: overview
>>    *
>> @@ -38,6 +42,8 @@ struct drm_log_scanout {
>>   	const struct font_desc *font;
>>   	u32 rows;
>>   	u32 columns;
>> +	u32 scaled_font_h;
>> +	u32 scaled_font_w;
>>   	u32 line;
>>   	u32 format;
>>   	u32 px_width;
>> @@ -67,7 +73,7 @@ static struct drm_log *console_to_drm_log(struct console *con)
>>   
>>   static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
>>   			 const u8 *src, unsigned int src_pitch,
>> -			 u32 height, u32 width, u32 scale, u32 px_width, u32 color)
>> +			 u32 height, u32 width, u32 px_width, u32 color)
>>   {
>>   	switch (px_width) {
>>   	case 2:
>> @@ -87,7 +93,7 @@ static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
>>   static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 line)
>>   {
>>   	struct drm_framebuffer *fb = scanout->buffer->fb;
>> -	unsigned long height = scanout->font->height;
>> +	unsigned long height = scanout->scaled_font_h;
>>   	struct iosys_map map;
>>   	struct drm_rect r = DRM_RECT_INIT(0, line * height, fb->width, height);
>>   
>> @@ -107,8 +113,8 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
>>   	size_t font_pitch = DIV_ROUND_UP(font->width, 8);
>>   	const u8 *src;
>>   	u32 px_width = fb->format->cpp[0];
>> -	struct drm_rect r = DRM_RECT_INIT(0, scanout->line * font->height,
>> -					  fb->width, (scanout->line + 1) * font->height);
>> +	struct drm_rect r = DRM_RECT_INIT(0, scanout->line * scanout->scaled_font_h,
>> +					  fb->width, (scanout->line + 1) * scanout->scaled_font_h);
>>   	u32 i;
>>   
>>   	if (drm_client_buffer_vmap_local(scanout->buffer, &map))
>> @@ -118,9 +124,10 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
>>   	for (i = 0; i < len && i < scanout->columns; i++) {
>>   		u32 color = (i < prefix_len) ? scanout->prefix_color : scanout->front_color;
>>   		src = drm_draw_get_char_bitmap(font, s[i], font_pitch);
>> -		drm_log_blit(&map, fb->pitches[0], src, font_pitch, font->height, font->width,
>> -			     1, px_width, color);
>> -		iosys_map_incr(&map, font->width * px_width);
>> +		drm_log_blit(&map, fb->pitches[0], src, font_pitch,
>> +			     scanout->scaled_font_h, scanout->scaled_font_w,
>> +			     px_width, color);
>> +		iosys_map_incr(&map, scanout->scaled_font_w * px_width);
>>   	}
>>   
>>   	scanout->line++;
>> @@ -205,8 +212,10 @@ static int drm_log_setup_modeset(struct drm_client_dev *client,
>>   		return -ENOMEM;
>>   	}
>>   	mode_set->fb = scanout->buffer->fb;
>> -	scanout->rows = height / scanout->font->height;
>> -	scanout->columns = width / scanout->font->width;
>> +	scanout->scaled_font_h = scanout->font->height * scale;
>> +	scanout->scaled_font_w = scanout->font->width * scale;
>> +	scanout->rows = height / scanout->scaled_font_h;
>> +	scanout->columns = width / scanout->scaled_font_w;
>>   	scanout->front_color = drm_draw_color_from_xrgb8888(0xffffff, format);
>>   	scanout->prefix_color = drm_draw_color_from_xrgb8888(0x4e9a06, format);
>>   	return 0;
> 

