Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC240CE9262
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 10:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5B710E5E4;
	Tue, 30 Dec 2025 09:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="N0EvK/9C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD0910E5E4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 09:08:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A4D681A2521;
 Tue, 30 Dec 2025 09:08:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 628BD6072C;
 Tue, 30 Dec 2025 09:08:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 17A20113B029B; Tue, 30 Dec 2025 10:08:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767085701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/3qkW7WfKSvbi2RWkAYE/rfjPp7ZbZTAQh+qTIgAjRU=;
 b=N0EvK/9CP8IwlzcZOJZQtkdZzn8ZuyqOc8z3OpDONVSP8Z8D7SZaQF3aCbN2vZpzHFcmZH
 SgmMyfsQ+zjoWnwfRTJjIf9NV8OAtJIwUkvSAwhWpyb8cEPODJgNlakV0SX4tyIP7xnCtC
 MDNcFjnqB2ZFLrhPVpwdBM7a+wwQPDMYb+xcM8k/hha+i3odGloiwmE+gT7zlIQqpoYOJg
 JJp0Y+Fg4jycT0Zhm1qHnfVRauDzDwUw+FaLL+6C0FVq2R2oEAKK1XGWMK/u6Ylqa1JJR9
 H3sK6+vYWNOoInUCsbX6CKquHNM9ekUFC8O8pOm6uN0B2AwHXAjL55FwJTvjKQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Dec 2025 10:08:15 +0100
Message-Id: <DFBFLLKWYFB5.23TQQWRA5MD4A@bootlin.com>
Subject: Re: [PATCH v3 17/33] drm/vkms: Introduce config for plane format
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-17-ba42dc3fb9ff@bootlin.com>
 <DF5NE3Y8O21F.1KKJWMX9JVXUP@bootlin.com>
 <0886f178-1935-4f37-8d0b-48274245f57e@bootlin.com>
In-Reply-To: <0886f178-1935-4f37-8d0b-48274245f57e@bootlin.com>
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

Hi Louis,

On Mon Dec 29, 2025 at 4:29 PM CET, Louis Chauvet wrote:
>>> --- a/drivers/gpu/drm/vkms/vkms_config.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_config.c
>>
>>> +void vkms_config_plane_remove_all_formats(struct vkms_config_plane *pl=
ane_cfg)
>>> +{
>>> +	plane_cfg->supported_formats_count =3D 0;
>>
>> Why not kfree(plane_cfg->supported_formats) too? You will be (re)allocat=
ing
>> anyway if adding one or all formats later on, so the buffer you're not
>> freeing won't be reused anyway.
>
> IIRC realloc reuse the existing allocated buffer if it is big enough to f=
it the new
> size. But I think this is probably an oversight here and I will add the f=
ree to clarify the situation :-)

Thanks. My point is that keeping the buffer allocated for future use is not
great because if it is not reused it will take memory for all the remaining
uptime.

>>> +}
>>> +
>>> +void vkms_config_plane_remove_format(struct vkms_config_plane *plane_c=
fg, u32 drm_format)
>>> +{
>>> +	for (unsigned int i =3D 0; i < plane_cfg->supported_formats_count; i+=
+) {
>>> +		if (plane_cfg->supported_formats[i] =3D=3D drm_format) {
>>> +			plane_cfg->supported_formats[i] =3D plane_cfg->supported_formats[pl=
ane_cfg->supported_formats_count - 1];
>>
>> I doubt these are less than 100 chars. ;-)
>
> yes, 127, but I don't know how to format it so it is readable.
>
> I tried
>
> plane_cfg->supported_formats[i] =3D
> 	plane_cfg->supported_formats[plane_cfg->supported_formats_count - 1];
>
> But the second line is 101 chars...

I vote for this one. 101 is close enough to 100, and I see no reaonable way
to format better (and I agree the two below are ugly).

> Checkpatch don't complain if I do:
>
> plane_cfg->supported_formats[i] =3D
> 	plane_cfg->supported_formats[
> 		plane_cfg->supported_formats_count - 1];
>
> or
>
> plane_cfg->supported_formats[i] =3D
> 	plane_cfg->supported_formats[plane_cfg->supported_formats_count-
> 		1];
>
> But that very ugly and not readable...

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
