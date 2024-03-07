Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ABD874DD3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 12:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAE910F3EF;
	Thu,  7 Mar 2024 11:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="OWeKb9op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2530C10F27F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 11:44:19 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tr6sH0tx7z9twc;
 Thu,  7 Mar 2024 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709811859; bh=D625r6cfP0p1lb5l+YhbA6ASW/Qc6RMFoEYDsOtbUSs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=OWeKb9opJ4m1eMCQv3QAzacCPMsyQRaJMyAmMBDlqB52BXbNZfiozMtPWxncsmD+b
 NlTsa5/yhxTDUhxZwq8XCmW0iSK8hFQGJBnvgV8wgeTWU0sCWDMNSP3XpFFc1sEjoJ
 bL8k70mZ8oaFiwI5p4JmYV5Y6AGOZgT8WevDRUXU=
X-Riseup-User-ID: E37B07F314684546F80F69AA524124761C502CB8EE3BD3046F66BEACB7AD38CC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tr6ry01HMzFtJD;
 Thu,  7 Mar 2024 11:44:01 +0000 (UTC)
Message-ID: <86e6f025-150d-4f02-b405-ebfcd4771aa3@riseup.net>
Date: Thu, 7 Mar 2024 08:43:21 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] drm/vkms: Fix compilation issues
Content-Language: en-US
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-4-5bfe7d129fdd@riseup.net>
 <ZekEVT_HNmZbFWNG@localhost.localdomain>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <ZekEVT_HNmZbFWNG@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
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



On 06/03/24 21:03, Louis Chauvet wrote:
> Le 06/03/24 - 17:03, Arthur Grillo a écrit :
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>>  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 2 +-
>>  drivers/gpu/drm/vkms/vkms_drv.h               | 4 ++++
>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
>> index 4636b013602f..3522ecee960f 100644
>> --- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
>> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
>> @@ -113,7 +113,7 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
>>  	for (size_t i = 0; i < param->n_colors; i++) {
>>  		const struct format_pair *color = &param->colors[i];
>>  
>> -		const struct conversion_matrix *matrix = get_conversion_matrix_to_argb_u16
>> +		struct conversion_matrix *matrix = get_conversion_matrix_to_argb_u16
>>  			(DRM_FORMAT_NV12, param->encoding, param->range);
>>  
>>  		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, matrix);
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index 393b76e7c694..3d62578499ab 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -47,6 +47,10 @@ struct pixel_argb_u16 {
>>  	u16 a, r, g, b;
>>  };
>>  
>> +struct pixel_yuv_u8 {
>> +	u8 y, u, v;
>> +};
> 
> Can I move this structure in the test itself? As discussed with Pekka, I 
> think it's not a good idea to have such specific `pixel_{fmt}_{size}` for 
> each variant. Leaving it in vkms_drv.h give the idea of "for each new kind 
> of format we have to create a new structure".

Sure, it makes more sense.

Best Regards,
~Arthur Grillo

> 
>> +
>>  struct line_buffer {
>>  	size_t n_pixels;
>>  	struct pixel_argb_u16 *pixels;
>>
>> -- 
>> 2.43.0
>>
> 
