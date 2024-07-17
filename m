Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45014933BC4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 13:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F0F10EA6B;
	Wed, 17 Jul 2024 11:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MV/1IOpf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366E510E0CD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721214383;
 bh=Rgnc14t1XaU9RoAetWesEyPyRCyAFeeWF8j4uv8d1fc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MV/1IOpfOP/6LuqhAi1dpyZdnbK5+fm5NqNBzbyTDVYDvGqfth96D7u40SwjZENPS
 0+VEQIFfSPTlI96hvCTFWbE9VYqYiKDDBECLmV1DYULR2y6VY8achyIJyZgKUJaBhE
 IpPxXCNzaNHGIm/yX4opi9YhZYNzPaLQxOdQzg/D3scB8rBBWKNIDgJdwbkedhZfO1
 JiNUZqoS2CGPqGgphENT88MjKFjfm9+Lh1ngTD97LliWjHjWM3MzYwomahqq7k55C8
 6TVUw4LQZypH0xB/DrBB1a6d41xj/qHm2G27Es61v0jcy02QIjYr5hkHxbv5eKD3SB
 JXf7ISY2RfthA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A9F133780BC9;
 Wed, 17 Jul 2024 11:06:20 +0000 (UTC)
Message-ID: <f9ed4aba-9a28-4620-be5f-9060556efd93@collabora.com>
Date: Wed, 17 Jul 2024 08:06:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Upgrade setuptools requirement to 70.0.0
To: WangYuli <wangyuli@uniontech.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 vignesh.raman@collabora.com, torvalds@linux-foundation.org,
 guanwentao@uniontech.com
References: <0237854884D6DB3C+20240716083743.33415-1-wangyuli@uniontech.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <0237854884D6DB3C+20240716083743.33415-1-wangyuli@uniontech.com>
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



On 16/07/2024 05:37, WangYuli wrote:
> GitHub Dependabot has issued the following alert:
> 
> "Upgrade setuptools to version 70.0.0 or later.
> 
>   A vulnerability in the package_index module of pypa/setuptools
>   versions up to 69.1.1 allows for remote code execution via its
>   download functions. These functions, which are used to download
>   packages from URLs provided by users or retrieved from package
>   index servers, are susceptible to code injection. If these
>   functions are exposed to user-controlled inputs, such as package
>   URLs, they can execute arbitrary commands on the system. The
>   issue is fixed in version 70.0.
> 
>   Severity: 8.8 / 10 (High)
>   Attack vector:        Network
>   Attack complexity:        Low
>   Privileges required:     None
>   User interaction:    Required
>   Scope:              Unchanged
>   Confidentiality:         High
>   Integrity:               High
>   Availability:            High
>   CVE ID:         CVE-2024-6345"
> 
> To avoid disturbing everyone with the kernel repo hosted on GitHub,
> I suggest we upgrade our python dependencies once again to appease
> GitHub Dependabot.
> 
> Link: https://github.com/dependabot
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>   drivers/gpu/drm/ci/xfails/requirements.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt
> index e9994c9db799..5e6d48d98e4e 100644
> --- a/drivers/gpu/drm/ci/xfails/requirements.txt
> +++ b/drivers/gpu/drm/ci/xfails/requirements.txt
> @@ -11,7 +11,7 @@ requests==2.31.0
>   requests-toolbelt==1.0.0
>   ruamel.yaml==0.17.32
>   ruamel.yaml.clib==0.2.7
> -setuptools==68.0.0
> +setuptools==70.0.0
>   tenacity==8.2.3
>   urllib3==2.0.7
>   wheel==0.41.1

