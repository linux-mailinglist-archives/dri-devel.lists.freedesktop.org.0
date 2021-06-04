Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AB739B3A3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 09:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1597D6F5AD;
	Fri,  4 Jun 2021 07:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FE76E091;
 Fri,  4 Jun 2021 07:14:19 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id og14so7651236ejc.5;
 Fri, 04 Jun 2021 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=/P6C5qybY/q+1vxzvn7jQLyL3bc3qA6knEuzqM8bOeI=;
 b=sdAjb+7y9XnZqeiLqrH1Y6sUvIDUM+UCNXPdcFMtsz9Scw9z553DE2mIpv7gEoRc1I
 7oFcEiBDvG8N4bdsKxVXz1nxqj+IrOCBvQTqLnhVJUqZlfj7mprlCZTvIEBQD8GnN2S1
 h2/OFVzrMDU+7ErwECzqJrbg+fOh6CnOB5EGWaGmSBZPmhH1wJc5eFF/MdFnUA0+lJk2
 uC33Ywu5Q/83lAy5Vt6IB9koBU7W1bOpbYWshO1CszaNarFnyTGxRa+Hv9Te0k47Ax9e
 VhnhJQS7fUx7MObGaJvLWnnW+4vve/ZwRFXqVrXlC3ooocytRX/cnZNKJjGzUJ7XGog/
 c2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/P6C5qybY/q+1vxzvn7jQLyL3bc3qA6knEuzqM8bOeI=;
 b=jrISxA3R2y6HaMtMlU5WiFM3vNasttmNJT8a1NxoGs8Zy0KvSohT6QjmpL6t13h5qU
 ws3QPe6/SrF0cKWNyVQdKjFzBhzndQ0DkpKfs6AQrbP8zq1nQQkZ/AL5pQYowTW/VOd9
 3N/G9cEUiwlvljH8Qdg6vuDaHnJW3A8esFKVxI+3aipU40p+H5MCB7QmTNtyj8+MeiRS
 E7V44wCvdKVRenIY4+KbmmBNfFuCJEmu9PSeKxOYjBL/FFxH3041Nl/5Wc8BIVL9+jwa
 suSh4LZxAvLFo0SjVvT71WzqnEUGUnDY0HQ9DmDN+wYqTwBkSpOmQ9k1Gypu3FialAX8
 KuYA==
X-Gm-Message-State: AOAM532AK8BCeGYB258xr2VX/1vpJV9HOq3w6V6TspEyJY19JWx+0blz
 N4+xJDjlDSlhe4hm7HmyKaxSWfJOBqo=
X-Google-Smtp-Source: ABdhPJwJELdgn0P0dMdg+NANfZtY50Z/FwT+gyijse6tn22fK5QP5EXZsAj56rMN30TDbJhuBCS0Fw==
X-Received: by 2002:a17:906:ccd9:: with SMTP id
 ot25mr2855004ejb.386.1622790857901; 
 Fri, 04 Jun 2021 00:14:17 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id c19sm2874714edv.36.2021.06.04.00.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 00:14:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] radeon: fix coding issues reported from sparse
To: Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <87o8cnfr3s.wl-chenli@uniontech.com>
 <87lf7qfi1v.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <12eca88f-908c-4112-fb62-1f35c171b1f2@gmail.com>
Date: Fri, 4 Jun 2021 09:14:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87lf7qfi1v.wl-chenli@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 04.06.21 um 05:02 schrieb Chen Li:
> Also fix some coding issue reported from sparse.
>
> Signed-off-by: Chen Li <chenli@uniontech.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index dfa9fdbe98da..85a1f2c31749 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -152,9 +152,11 @@ int radeon_uvd_init(struct radeon_device *rdev)
>   
>   			rdev->uvd.fw_header_present = true;
>   
> -			family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
> -			version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
> -			version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
> +			family_id = (__force u32)(hdr->ucode_version) & 0xff;
> +			version_major = (le32_to_cpu((__force __le32)(hdr->ucode_version))
> +							 >> 24) & 0xff;
> +			version_minor = (le32_to_cpu((__force __le32)(hdr->ucode_version))
> +							 >> 8) & 0xff;
>   			DRM_INFO("Found UVD firmware Version: %u.%u Family ID: %u\n",
>   				 version_major, version_minor, family_id);
>   
> @@ -791,17 +793,17 @@ int radeon_uvd_get_create_msg(struct radeon_device *rdev, int ring,
>   		return r;
>   
>   	/* stitch together an UVD create msg */
> -	writel(cpu_to_le32(0x00000de4), &msg[0]);
> +	writel((__force u32)cpu_to_le32(0x00000de4), &msg[0]);
>   	writel(0x0, (void __iomem *)&msg[1]);
> -	writel(cpu_to_le32(handle), &msg[2]);
> +	writel((__force u32)cpu_to_le32(handle), &msg[2]);
>   	writel(0x0, &msg[3]);
>   	writel(0x0, &msg[4]);
>   	writel(0x0, &msg[5]);
>   	writel(0x0, &msg[6]);
> -	writel(cpu_to_le32(0x00000780), &msg[7]);
> -	writel(cpu_to_le32(0x00000440), &msg[8]);
> +	writel((__force u32)cpu_to_le32(0x00000780), &msg[7]);
> +	writel((__force u32)cpu_to_le32(0x00000440), &msg[8]);
>   	writel(0x0, &msg[9]);
> -	writel(cpu_to_le32(0x01b37000), &msg[10]);
> +	writel((__force u32)cpu_to_le32(0x01b37000), &msg[10]);
>   	for (i = 11; i < 1024; ++i)
>   		writel(0x0, &msg[i]);
>   
> @@ -827,9 +829,9 @@ int radeon_uvd_get_destroy_msg(struct radeon_device *rdev, int ring,
>   		return r;
>   
>   	/* stitch together an UVD destroy msg */
> -	writel(cpu_to_le32(0x00000de4), &msg[0]);
> -	writel(cpu_to_le32(0x00000002), &msg[1]);
> -	writel(cpu_to_le32(handle), &msg[2]);
> +	writel((__force u32)cpu_to_le32(0x00000de4), &msg[0]);
> +	writel((__force u32)cpu_to_le32(0x00000002), &msg[1]);
> +	writel((__force u32)cpu_to_le32(handle), &msg[2]);
>   	writel(0x0, &msg[3]);
>   	for (i = 4; i < 1024; ++i)
>   		writel(0x0, &msg[i]);

