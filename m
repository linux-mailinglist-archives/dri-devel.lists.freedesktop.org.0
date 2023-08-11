Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C97793E3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010E910E6AB;
	Fri, 11 Aug 2023 16:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D310A10E6AB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D61CD113E;
 Fri, 11 Aug 2023 09:09:06 -0700 (PDT)
Received: from [10.1.30.25] (e122027.cambridge.arm.com [10.1.30.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 813C03F64C;
 Fri, 11 Aug 2023 09:08:22 -0700 (PDT)
Message-ID: <ce6c867f-35b9-12c1-f423-0c99304322f6@arm.com>
Date: Fri, 11 Aug 2023 17:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 15/15] drm/panthor: Add an entry to MAINTAINERS
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-16-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230809165330.2451699-16-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/2023 17:53, Boris Brezillon wrote:
> Add an entry for the Panthor driver to the MAINTAINERS file.
> 
> v2:
> - New commit
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> 
> If anyone from Arm wants to volunteer to become a co-maintainer, that
> would be highly appreciated

*sticks his hand up* me me! ;) Seriously though I'm happy to help out
with the maintenance.

And I'll try to finish reviewing the patches next week. I gave it a
quick spin on my Rock 5B and the GPU seems to work fine. I also need to
rebase my user space submission work. And recover from coming back from
holiday! Plus I'm sure I wasn't full-time on GPU related things before I
went on holiday... ;)

Thanks,

Steve

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd882b87a3c6..6149ab68d461 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1624,6 +1624,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/panfrost/
>  F:	include/uapi/drm/panfrost_drm.h
>  
> +ARM MALI PANTHOR DRM DRIVER
> +M:	Boris Brezillon <boris.brezillon@collabora.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/panthor/
> +F:	include/uapi/drm/panthor_drm.h
> +
>  ARM MALI-DP DRM DRIVER
>  M:	Liviu Dudau <liviu.dudau@arm.com>
>  S:	Supported

