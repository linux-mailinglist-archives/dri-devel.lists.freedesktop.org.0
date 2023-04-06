Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819646D952F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80E10EB6A;
	Thu,  6 Apr 2023 11:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EF910EB6B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8YyNubASXgqzuAszxAEBZMdUvN7vGFCZr8m0DMH+wl4=; b=Qjge+YxKanAjlN/WTvbJxc46ib
 bRUwXsrnKAVK6pvWJOKwoBzP/kn1Q0tzUIYdhDoB8a0PI3vwq5RgCAEFA19+aTazBJ3FPrljyvb7G
 URiksvI1rpfZl2pk/YOglMpZusik2fJqwQsH561oFIdLh1FnTsLjLAIMFiDPl1+/ui2BLPWyxk+K+
 eJJIUxes7siMIMrIMa+JNvJ3g6Xfd4gpbQHtR87m0Sd4AyfWuYMMolFHRdKt/i3ZFYOO07t2VAoKo
 YJ62CncxoL7ZjMtFUZhPNAcDmUH48HbXsS3e5RG0GHV1cP/whdvSEnVQt1dl7h8G1hVSFQkoR2UDj
 m0ICheMg==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pkNqN-0080Ca-UI; Thu, 06 Apr 2023 13:31:55 +0200
Message-ID: <b2cdb1fd-2559-5ae7-7d3c-0706969a85e2@igalia.com>
Date: Thu, 6 Apr 2023 08:31:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/2] drm/vkms: A couple of trivial cleanups
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230406110235.3092055-1-javierm@redhat.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230406110235.3092055-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 Marius Vlad <marius.vlad@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

for the series.

Thanks for helping to cleanup vkms!

Best Regards,
- Maíra Canal

On 4/6/23 08:02, Javier Martinez Canillas wrote:
> Hello,
> 
> This series contains two trivial cleanups for the vkms driver.
> 
> Patch #1 just gets rid of a wrapper helper that wasn't really adding that
> much value and patch #2 drops the <drm/drm_simple_kms_helper.h> header
> that was only used to call the drm_simple_encoder_init() function helper.
> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (2):
>    drm/vkms: Drop vkms_connector_destroy() wrapper
>    drm/vkms: Remove <drm/drm_simple_kms_helper.h> include
> 
>   drivers/gpu/drm/vkms/vkms_output.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 77d08a2de6a43521f5a02848f11185b6f46af21c
