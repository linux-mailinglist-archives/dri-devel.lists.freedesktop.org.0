Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8458ECE7377
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 16:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA8D10E137;
	Mon, 29 Dec 2025 15:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DpSN5srU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D982510E137
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 15:33:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3D8B04E41E53;
 Mon, 29 Dec 2025 15:33:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 10E5860725;
 Mon, 29 Dec 2025 15:33:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ADBBC113B066A; Mon, 29 Dec 2025 16:33:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767022414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IDdhD5FiKGQVnfA+qu2cR5kivif94jwoKyJPaFjtOIk=;
 b=DpSN5srUGDhJY2vWsbKpOcR853HjKBBoXojKTvJdWquQxxmNq0sLMeGLVCdyOhuTPlJIp1
 iiwAtd2yct88YMJsd4H8Utx74JC8giC8hhF7QfKT5/rrbEFOrdinKnbuUN7QDaryaBrPtn
 WlFyaggxO8ZwzDajUuIj1cAnvFhpjDsoNnGAqh0c/svE1mk/6vXDvh83NDfiumuubX2lJT
 zhMv7N5xJp7pv7o5NORCgQa7ppJcOE6mzMnparxqGGlPEUCQWuDfmQa6ftjMfYUym93HDN
 mf58KqssbikXTA7jxegmTWoQhK/UWAhGftvJu+Kw1NGnd3HkvBdPKhxH0WiQJQ==
Message-ID: <8bed1d97-be75-4918-b033-698d3a49e61b@bootlin.com>
Date: Mon, 29 Dec 2025 16:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
 <aUyMiJvJX1KhffVb@archie.me>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <aUyMiJvJX1KhffVb@archie.me>
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



On 12/25/25 01:59, Bagas Sanjaya wrote:
> On Mon, Dec 22, 2025 at 11:11:20AM +0100, Louis Chauvet wrote:
>> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
>> +Date:		Nov 2025
>> +Contact:	dri-devel@lists.freedesktop.org
>> +Description:
>> +        List of supported formats for this plane. To add a new
>> +        item, write its fourcc code prefixed with '+'. To remove,
>> +        use '-' prefix. Use '+*' to add all formats, '-*' to
>> +        remove all.
>> +
> 
> Sphinx reports htmldocs warning:
> 
> Documentation/ABI/testing/configfs-vkms:199: WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> I have to escape the wildcard:
> 
> ---- >8 ----
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index a7fce35fcf91d1..3839b6e3c9c935 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -202,7 +202,7 @@ Contact:	dri-devel@lists.freedesktop.org
>   Description:
>           List of supported formats for this plane. To add a new
>           item, write its fourcc code prefixed with '+'. To remove,
> -        use '-' prefix. Use '+*' to add all formats, '-*' to
> +        use '-' prefix. Use '+*' to add all formats, '-\*' to

Hi, thanks for the fix!

I only have to escape the second wildcard? Not the `+*`?

>           remove all.
>   
>   What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_enabled
> 
> Thanks.
> 

