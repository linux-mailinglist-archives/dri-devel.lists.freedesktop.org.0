Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C208E76C274
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 03:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6718810E1A3;
	Wed,  2 Aug 2023 01:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4B410E1A3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 01:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=0CUaD88ixdQlKKg3c3lyTBnIp7cf8tS4gItoh+RXFxk=; b=pU/Iu5vO32up1nvIi6eVLX5UMX
 tNHo+fsvkXmyNMV5uyWWB03Vk/ZdOhnMJfmiGZfAvG4uE5OmYhgRQuw/absf+jeIxSKeVMTFm0vfR
 aQusR+aTK8zUrD2JqAgAFjTKg72aFUnoRPChIl1P0PedyskAAks1W347Fahqn+jmJq6mDRjPwxg8H
 8zFydT0Z2WHYo1MbsP8eHx9OnBfmtPXXtQVoYquH9M/iOqU/r7gKRtNCeXU9gk/MufUJjcvfhSFB2
 Cf4bmH09+A+z+TafnyV/nNPZi+16jls8kqjHC3XgJd1Y4zGBO2tnpSVATAa7ZKsnera1lZbBVyK4Y
 bbT0bCXg==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qR0xt-003jDJ-27; Wed, 02 Aug 2023 01:47:53 +0000
Message-ID: <b77460b7-b126-a3a3-d1fd-d26c57c6fcba@infradead.org>
Date: Tue, 1 Aug 2023 18:47:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] drm/tests: Fix one kernel-doc comment
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com, daniel@ffwll.ch
References: <20230802004630.74104-1-yang.lee@linux.alibaba.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230802004630.74104-1-yang.lee@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/1/23 17:46, Yang Li wrote:
> Make @drm_kunit_helper_context_alloc to
> @drm_kunit_helper_acquire_ctx_alloc, to silence the warning:
> 
> drivers/gpu/drm/tests/drm_kunit_helpers.c:172: warning: expecting prototype for drm_kunit_helper_context_alloc(). Prototype was for drm_kunit_helper_acquire_ctx_alloc() instead
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6073
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index 3d624ff2f651..c1dfbfcaa000 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -156,7 +156,7 @@ static void action_drm_release_context(void *ptr)
>  }
>  
>  /**
> - * drm_kunit_helper_context_alloc - Allocates an acquire context
> + * drm_kunit_helper_acquire_ctx_alloc - Allocates an acquire context
>   * @test: The test context object
>   *
>   * Allocates and initializes a modeset acquire context.

-- 
~Randy
