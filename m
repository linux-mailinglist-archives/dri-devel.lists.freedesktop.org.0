Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONcOGU/yhWlsIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:53:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F531FE762
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7342310E06D;
	Fri,  6 Feb 2026 13:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jwgDK9Ge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549CF10E06D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:53:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 54F824E42443;
 Fri,  6 Feb 2026 13:53:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 19CB460729;
 Fri,  6 Feb 2026 13:53:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B10D119D1DE5; Fri,  6 Feb 2026 14:53:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770385992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IkegMkQjQ9Huckg5GnwS8w6Cf+9nWxzGJJ7tJM78RNE=;
 b=jwgDK9GepwUjC/MF1b3f9sikxDOTwNUwaCe0/C4F9H18iQxp9poUHflEM1IM7NdezWbVhO
 RdatYMVsxG0s4DiWiKVPocrmGkcWt0KfVqe5PILZeYtmbrDynfpMBt/MPQfrqWiQPREZXm
 FRohhBzQGdpgyHZC5aMiaKiZhKMuYwE4dte3PFKZaGlMZfOCYpBRKmWokvBoYelBUgjDRO
 X2Wu1J79hg6b/wT9LhVh1OWekEZ0/6VHUfkHWRMpg7tfZiWR7T3V+/TOKtGcbVdNChwRk/
 oR5e1xPXkIy08DH1Jm/0YoSV6p8b+b+lOU7SqNh1BR7Asligu226K7cY3wcOUQ==
Message-ID: <4e8f0724-d747-4712-854c-c231a31e9e2c@bootlin.com>
Date: Fri, 6 Feb 2026 14:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vkms: Add YUV410, YUV411, YVU410, and YVU411
 support
To: Renjun Wang <renjunw0@foxmail.com>, hamohammed.sa@gmail.com,
 simona@ffwll.ch, melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
References: <tencent_6033C535EB4984626B679256F0A439587007@qq.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <tencent_6033C535EB4984626B679256F0A439587007@qq.com>
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
	FREEMAIL_TO(0.00)[foxmail.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.977];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foxmail.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7F531FE762
X-Rspamd-Action: no action



On 2/2/26 16:11, Renjun Wang wrote:
> Add support for the following planar YUV formats:
> - DRM_FORMAT_YUV410
> - DRM_FORMAT_YUV411
> - DRM_FORMAT_YVU410
> - DRM_FORMAT_YVU411
> 
> These formats are handled by the existing planar_yuv_read_line()
> function, which correctly handles the subsampling defined in each
> format's drm_format_info.
> 
> The YVU variants (YVU410, YVU411) are also added to
> get_conversion_matrix_to_argb_u16() to ensure the U and V columns
> are swapped correctly in the conversion matrix.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> v2:
>   - update vkms_formats[] to add new formats.
> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
>   drivers/gpu/drm/vkms/vkms_plane.c   | 4 ++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index dfb8e13cba87..5ef5d49a44ef 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -730,9 +730,13 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   	case DRM_FORMAT_P012:
>   	case DRM_FORMAT_P016:
>   		return &YUV161616_semiplanar_read_line;
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>   	case DRM_FORMAT_YUV420:
>   	case DRM_FORMAT_YUV422:
>   	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>   	case DRM_FORMAT_YVU420:
>   	case DRM_FORMAT_YVU422:
>   	case DRM_FORMAT_YVU444:
> @@ -921,6 +925,8 @@ void get_conversion_matrix_to_argb_u16(u32 format,
>   	memcpy(matrix, matrix_to_copy, sizeof(*matrix_to_copy));
>   
>   	switch (format) {
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>   	case DRM_FORMAT_YVU420:
>   	case DRM_FORMAT_YVU422:
>   	case DRM_FORMAT_YVU444:
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 19fe6acad306..44773a82fbfd 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -35,9 +35,13 @@ static const u32 vkms_formats[] = {
>   	DRM_FORMAT_NV21,
>   	DRM_FORMAT_NV61,
>   	DRM_FORMAT_NV42,
> +	DRM_FORMAT_YUV410,
> +	DRM_FORMAT_YUV411,
>   	DRM_FORMAT_YUV420,
>   	DRM_FORMAT_YUV422,
>   	DRM_FORMAT_YUV444,
> +	DRM_FORMAT_YVU410,
> +	DRM_FORMAT_YVU411,
>   	DRM_FORMAT_YVU420,
>   	DRM_FORMAT_YVU422,
>   	DRM_FORMAT_YVU444,

