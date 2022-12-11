Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C283E6493EA
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 12:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43B610E02D;
	Sun, 11 Dec 2022 11:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5560A10E02D
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LC4w5TQb+qnsn84K9tIiy6j9WGBF4Nr7PFZvJNYeVsQ=; b=Af4S3atyPpFDdv0H6xz3dvStnP
 oKPoXxnx3s8aPEwEkGNnZ14V3EtfpCbB8hMHkI92mJOQovMDm/c99fHh3xjN7uBlVy1+iZloNmo+R
 OtSg4o6s5GmxxkgDo2gnXB4c5EZL9IpzQ2S0wtkBcRqh9pN7o/fzD+/SM/aPoEYlQJqX2U5rTLcZU
 UxxvD3BhIRKJMvspQonmXs6Rax/0pKIvMCmndwHMNqGVNtLmxKSI3wU3DeVOvwBKbrz6yRlJL3bIO
 2v/5GGcFQjtBdV49v9osQNJcOcq0Bg4uzjuuf8U7nhH77K710XR+U7AiRHfGpfzPaa88CyuFupANV
 SDnrVMMg==;
Received: from [177.34.169.227] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p4KZW-001I4U-CT; Sun, 11 Dec 2022 12:32:42 +0100
Message-ID: <fb978a9e-43af-865a-00c6-d98499414ec5@igalia.com>
Date: Sun, 11 Dec 2022 08:32:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Documentation: gpu: vc4: add blank line separator before
 KUnit code block
To: Bagas Sanjaya <bagasdotme@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <202212102116.A10vg3jG-lkp@intel.com>
 <20221211053051.18125-1-bagasdotme@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221211053051.18125-1-bagasdotme@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I believe Maxime fixed this issue on [1], but it hasn't been yet merged
into drm-misc-next.

[1]
https://lore.kernel.org/dri-devel/20221208094727.2848310-1-maxime@cerno.tech/

Best Regards,
- Maíra Canal

On 12/11/22 02:30, Bagas Sanjaya wrote:
> kernel test robot reports htmldocs warning:
> 
> Documentation/gpu/vc4.rst:65: WARNING: Unexpected indentation.
> 
> The warning is due to missing blank line separator between KUnit mock
> driver sentence and its code block.
> 
> Add the separator to fix the warning.
> 
> Link: https://lore.kernel.org/linux-doc/202212102116.A10vg3jG-lkp@intel.com/
> Fixes: 5304c8e6010012 ("Documentation: gpu: vc4: Add KUnit Tests Section")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/gpu/vc4.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/gpu/vc4.rst b/Documentation/gpu/vc4.rst
> index a2375f1584e6d9..ec920c4f5bb322 100644
> --- a/Documentation/gpu/vc4.rst
> +++ b/Documentation/gpu/vc4.rst
> @@ -62,6 +62,7 @@ integration tests.
>  
>  These tests are using a mock driver and can be ran using the
>  command::
> +
>  	./tools/testing/kunit/kunit.py run \
>  		--kunitconfig=drivers/gpu/drm/vc4/tests/.kunitconfig \
>  		--cross_compile aarch64-linux-gnu- --arch arm64
> 
> base-commit: 612e241fb4bcd98d8ff9da7a795abb86b8ccfe38
