Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB887942D4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB9A10E6E5;
	Wed,  6 Sep 2023 18:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7947410E6E8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 18:10:46 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.134.102.128])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 10DE76606E9D;
 Wed,  6 Sep 2023 19:10:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694023845;
 bh=+BguOnFMoN0DTEiUJmqvKDEQH9cUWtAs2AUE4hzsEfs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XGr2l4DMSIi0YKMIThC5xNr6ONwfxb3OkfXw/vDpEqW2rrzxJGnMLFjhl2/tz69aw
 KG+fXoq0i8viL6lLfhtXmecqrFEOWTN/APQg+SvwQmDs3mH102RBt4to042tiRhOX9
 ZbviQDzTQqE91t5jmM6B2bZckV3AE0NcS6cGh/HHh9oHVWPCaQ5iP9YxQnnSgv2773
 lZMwTv0MHFSsq0RVooZcNvzp+GOGMbfOGMPzYJBpBnI8Exdq9f1ybq4VQmpWXcE2Kp
 ar1MXA5be30LqVbZ6Qrxwz9XF999wq4IyGV1qNj601na7BjhmPOTXHUmI/Vc7YJ+gZ
 UcfWh66AdcERg==
Message-ID: <5e44d344-dee0-027d-4766-01515e6ea155@collabora.com>
Date: Wed, 6 Sep 2023 15:10:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] Remove the parameter not described warning
Content-Language: en-US
To: Vinayak Hegde <vinayakph123@gmail.com>, sumit.semwal@linaro.org,
 gustavo@padovan.org
References: <ZPiuH+ghqamtwJGA@vinayak-ubuntu>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <ZPiuH+ghqamtwJGA@vinayak-ubuntu>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinayak,

Thanks for you patch

On 06/09/2023 13:51, Vinayak Hegde wrote:
> I encountered a warning during kernel documentation compilation

Usually we write the commit message in imperative mood, please check: 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> due to a missing colon in the documentation for the
> 'num_fences' variable in the sync_file.h header file.
> This change adds the missing colon to align with the documentation format.
> 
> Signed-off-by: Vinayak Hegde <vinayakph123@gmail.com>
> ---
>   include/uapi/linux/sync_file.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> index 7e42a5b7558b..b389a5495181 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h

Since you are modifying this file, if you run:
     git log --oneline include/uapi/linux/sync_file.h
you will notice that almost all changes start with "dma-buf/sync_file:" 
prefix, it would be nice to maintain the style pattern for the commit title.

Regards,
Helen

> @@ -56,7 +56,7 @@ struct sync_fence_info {
>    * @name:	name of fence
>    * @status:	status of fence. 1: signaled 0:active <0:error
>    * @flags:	sync_file_info flags
> - * @num_fences	number of fences in the sync_file
> + * @num_fences: number of fences in the sync_file
>    * @pad:	padding for 64-bit alignment, should always be zero
>    * @sync_fence_info: pointer to array of struct &sync_fence_info with all
>    *		 fences in the sync_file
