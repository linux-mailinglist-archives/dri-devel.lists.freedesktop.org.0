Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAOoE4ecgGl2/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:45:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DFCCC746
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46D110E4BC;
	Mon,  2 Feb 2026 12:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nlLAE4wV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BAE10E4A8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:45:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C8AF0C237F3;
 Mon,  2 Feb 2026 12:45:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F0C7660767;
 Mon,  2 Feb 2026 12:45:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 264E3119A8888; Mon,  2 Feb 2026 13:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770036351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vfqffI0PSjnSTnsWU7z9LKCNNAy2Pw0spoRY3R9EZE4=;
 b=nlLAE4wVWiyctO3wzm/0R5UM16KEdx1iaje2nsBQEhJhs33AlwRKRyeQUKLzg6K4kHiarT
 SMI+KNd0ytNMq1gWSwYEoSx+MBYzL0PMxwMwHs3XS6tbIR67p7mlWF9IcVh9zLMExd34Th
 lPFnwFtYm0xRimwXCG+OsYlB3s6rk2wap9WEaBESydY5v1ZTp9cw/7UDjKtoBmrpdyxUhr
 9yRRa9kUVzSI7VNNBcoG+zFdsKpAKnt//uG0Z0qW8CH1A+jiWYOUdDmvHQLYiP7JUIDmQl
 hFIQ5fxO7qlFZMtWHBTsORAGOFDIJrVbdBku/2fYFsMeTt7kWMwSXilOl2slmw==
Message-ID: <ff48b706-6fdc-4350-a2de-1edc7b3f9ca7@bootlin.com>
Date: Mon, 2 Feb 2026 13:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Add YUV410, YUV411, YVU410, and YVU411 support
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Renjun Wang <renjunw0@foxmail.com>, hamohammed.sa@gmail.com,
 simona@ffwll.ch, melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <tencent_8D922FAC8459EF1AC3A4503196336AEB6006@qq.com>
 <cb2fa1da-3c5a-4398-af10-68f838f02c6d@bootlin.com>
Content-Language: en-US
In-Reply-To: <cb2fa1da-3c5a-4398-af10-68f838f02c6d@bootlin.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:renjunw0@foxmail.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[louis.chauvet@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 95DFCCC746
X-Rspamd-Action: no action



On 2/2/26 13:14, Louis Chauvet wrote:
> 
> 
> On 2/1/26 15:02, Renjun Wang wrote:
>> Add support for the following planar YUV formats:
>> - DRM_FORMAT_YUV410
>> - DRM_FORMAT_YUV411
>> - DRM_FORMAT_YVU410
>> - DRM_FORMAT_YVU411
>>
>> These formats are handled by the existing planar_yuv_read_line()
>> function, which correctly handles the subsampling defined in each
>> format's drm_format_info.
>>
>> The YVU variants (YVU410, YVU411) are also added to
>> get_conversion_matrix_to_argb_u16() to ensure the U and V columns
>> are swapped correctly in the conversion matrix.
>>
>> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> 
> This patch seems correct, so you can add my:
> 
> Acked-by: Louis Chauvet <louis.chauvet@bootlin.com>
 >
> But how did you test it? I don't see the support in IGT. You have an 
> other application / use-case?

I revert my Acked-by for this patch. It looks like the list in 
vkms_config.c wasn’t updated, which means the format won’t be usable by 
userspace.

Could you also add support in IGT so that kms_plane can test it? From 
what I recall, this shouldn’t be much more complex than the VKMS 
implementation—just a few switches to handle the proper conversions.

Thanks,
Louis Chauvet

> Thanks,
> Louis Chauvet
> 
>> ---
>>   drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/ 
>> vkms/vkms_formats.c
>> index dfb8e13cba87..5ef5d49a44ef 100644
>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>> @@ -730,9 +730,13 @@ pixel_read_line_t 
>> get_pixel_read_line_function(u32 format)
>>       case DRM_FORMAT_P012:
>>       case DRM_FORMAT_P016:
>>           return &YUV161616_semiplanar_read_line;
>> +    case DRM_FORMAT_YUV410:
>> +    case DRM_FORMAT_YUV411:
>>       case DRM_FORMAT_YUV420:
>>       case DRM_FORMAT_YUV422:
>>       case DRM_FORMAT_YUV444:
>> +    case DRM_FORMAT_YVU410:
>> +    case DRM_FORMAT_YVU411:
>>       case DRM_FORMAT_YVU420:
>>       case DRM_FORMAT_YVU422:
>>       case DRM_FORMAT_YVU444:
>> @@ -921,6 +925,8 @@ void get_conversion_matrix_to_argb_u16(u32 format,
>>       memcpy(matrix, matrix_to_copy, sizeof(*matrix_to_copy));
>>       switch (format) {
>> +    case DRM_FORMAT_YVU410:
>> +    case DRM_FORMAT_YVU411:
>>       case DRM_FORMAT_YVU420:
>>       case DRM_FORMAT_YVU422:
>>       case DRM_FORMAT_YVU444:
> 

