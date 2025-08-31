Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B29B3D463
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 18:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C2D10E079;
	Sun, 31 Aug 2025 16:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="nWseXR19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B2310E079
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=tIlR0ABRCw5cP9VP0XpZIHyi0kWpklyEXK549O9ruGU=; b=nWseXR19JIjh6MN1ByXrzThvpu
 oSAyjzbDg5V1P/2Y08uF/wPVYcQ2SP7Olgy7A86g5EN6hVbVfdIXgQ0haiDdjNAuXFpmgFWSYrteI
 O+IosjRXQo+1puBkPAM7/TeApoVaPr772Rps2ZkwQBGIEgRfP0/7B4LMSfc896JWdJr8HzjwW15oO
 MtIWwFXeF/R3md6dejYpdOdzvv8Xoj/vKM/EERTblslFNTW//DLEOUhNk/BfQzKq6WUag6Dd3beiC
 ibxCWET5QnQW+jOWtzyWk3QdoDaixkl3SX8qAnDdcst5ZuUjn9V1DozyIkkD/CmBCG/DHUUiPGpjN
 Il4WgJVw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1usl1M-0000000AQBJ-1FQh; Sun, 31 Aug 2025 16:35:12 +0000
Message-ID: <72852085-9f20-48b8-b51a-c41df915bff0@infradead.org>
Date: Sun, 31 Aug 2025 09:35:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: gpu: fix spelling error in drm-uapi.rst
To: mohin24khertz@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250831141522.7813-1-mohin24khertz@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250831141522.7813-1-mohin24khertz@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/31/25 7:15 AM, mohin24khertz@gmail.com wrote:
> From: Mohin Nadaf <mohin24khertz@gmail.com>
> 
> Fix typo 'unpriviledged' -> 'unprivileged' in DRM UAPI
> documentation describing error codes for operations
> requiring elevated privileges.
> 
> Signed-off-by: Mohin Nadaf <mohin24khertz@gmail.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 843facf01b2d..7435664a1ffe 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -535,7 +535,7 @@ ENOSPC:
>  EPERM/EACCES:
>          Returned for an operation that is valid, but needs more privileges.
>          E.g. root-only or much more common, DRM master-only operations return
> -        this when called by unpriviledged clients. There's no clear
> +        this when called by unprivileged clients. There's no clear
>          difference between EACCES and EPERM.
>  
>  ENODEV:

Hi,

There was a patch for this on Aug. 21, 2025, but I don't know if it has been
applied/merged anywhere yet.  It could be in one of the DRM git trees --
I don't know.

https://gitlab.freedesktop.org/drm/misc/kernel.git
or
https://gitlab.freedesktop.org/drm/kernel.git


https://lore.kernel.org/all/20250821025957.22546-3-rakuram.e96@gmail.com/

thanks.
-- 
~Randy

