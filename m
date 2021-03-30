Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007DA34EABC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 16:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A7D890BF;
	Tue, 30 Mar 2021 14:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1583 seconds by postgrey-1.36 at gabe;
 Tue, 30 Mar 2021 14:43:53 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EA2890BF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BGekwmLjbpJ6llGafJ1MR1U01x6za5TZhvCUhXNQRb8=; b=nUqOk/2T7FeVnpuqEnmymnf9VQ
 51QPbC2KbOJdgErze6bDp63f3vDVzcXz0kGuE2ivxcBoLaqN+VwWafE1v1182KSXOPnEKW6HRb+j6
 MxeD8LcqH7XIoBXfoG1AUugOghiAdTbwfyuapFvr3CmvPc/jmwJKhWevcxQCuw+geFzIY++sPzA/g
 BsvQiU1918+f6By7Z0kpdrDfq3LtIri1U2yfUTgEwMA3hIyUVfpJvizbZGzRVFJLRPCjRkSWyVCEq
 QeWbU0su1un0hkrowQ+mBfLP+tAlO+onvmZM4N1ph6HrhnEprp+Nst8Fa/IApOAn4mWRFb0jgNCeu
 5dhMhFAw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:60752 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <david@lechnology.com>)
 id 1lRFBJ-00068A-Lq; Tue, 30 Mar 2021 10:17:21 -0400
Subject: Re: [PATCH v3 0/1] drm/tiny: add support for Waveshare 2inch LCD
 module
To: Carlis <zhangxuezhi3@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 zhangxuezhi1@yulong.com
References: <20210330080846.116223-1-zhangxuezhi3@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <ee78a788-3a69-164d-95da-6482e05f8603@lechnology.com>
Date: Tue, 30 Mar 2021 09:17:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330080846.116223-1-zhangxuezhi3@gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: dri-devel@lists.freedesktop.org, sam@ravnborg.org, kraxel@redhat.com,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/21 3:08 AM, Carlis wrote:
> From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> 
> This adds a new module for the ST7789V controller with parameters for
> the Waveshare 2inch LCD module.
> 
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> ---
> v2:change compatible value.
> v3:change author name.
> ---
>   MAINTAINERS                    |   8 +
>   drivers/gpu/drm/tiny/Kconfig   |  14 ++
>   drivers/gpu/drm/tiny/Makefile  |   1 +
>   drivers/gpu/drm/tiny/st7789v.c | 269 +++++++++++++++++++++++++++++++++
>   4 files changed, 292 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/st7789v.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d92f85ca831d..df25e8e0deb1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5769,6 +5769,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
>   F:	drivers/gpu/drm/tiny/st7735r.c
>   
> +DRM DRIVER FOR SITRONIX ST7789V PANELS
> +M:	David Lechner <david@lechnology.com>

I should not be added here. I don't have one of these displays.

> +M:	Xuezhi Zhang <zhangxuezhi1@yulong.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/sitronix,st7789v-dbi.yaml
> +F:	drivers/gpu/drm/tiny/st7789v.c
> +
>   DRM DRIVER FOR SONY ACX424AKP PANELS
>   M:	Linus Walleij <linus.walleij@linaro.org>
>   S:	Maintained
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
