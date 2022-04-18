Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00786505EA1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 21:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2975D10E17D;
	Mon, 18 Apr 2022 19:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22E910E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 19:43:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 90E4C1F41C3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650310988;
 bh=e3aXhhV0iMbSTBQMtpX2+7/OpY3JByN6nT0sgNfy5eo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WA4NVuAj0cyf/adVZpyR3XPEfwqgPhrzLAbhFfdZ/CinSZF97KjZJlY+8CmMSQ1qp
 rz0ySyDia/c9dEvKixvPeeWbcTKuGhvZXpgiwNJNstgRssmJ+jfWaRuzUfveZgwan5
 5lnLlEaj6uqh5m8DHyyVeqVEk0Qgigr4NG5/4nEiBomB56hAIa+uBVLdkiK+JAfNnD
 x+S9+U4j6V9J3+8wxQUFLlHRR7o/Zq1EuSPiFUcGV4/8fkUuMors8F2UExujcMVm/y
 HBn3KRF8mfjuvaPO5ZQXzIguoHfErPiYd5rFd6/wppwnDBlF05URRJOvG9HfzrFHFN
 jscGbrCLtAOew==
Message-ID: <33625122-6aad-86c1-444a-07144325835c@collabora.com>
Date: Mon, 18 Apr 2022 22:43:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 09/15] drm/shmem-helper: Correct doc-comment of
 drm_gem_shmem_get_sg_table()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-10-dmitry.osipenko@collabora.com>
 <eefe5120-638a-40bc-5ed8-e26defe178ca@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <eefe5120-638a-40bc-5ed8-e26defe178ca@suse.de>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/22 21:25, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.04.22 um 00:37 schrieb Dmitry Osipenko:
>> drm_gem_shmem_get_sg_table() never returns NULL on error, but a ERR_PTR.
>> Correct the doc comment which says that it returns NULL on error.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> 
>> ---
>>   drivers/gpu/drm/drm_gem_shmem_helper.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 8ad0e02991ca..30ee46348a99 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -662,7 +662,7 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
>>    * drm_gem_shmem_get_pages_sgt() instead.
>>    *
>>    * Returns:
>> - * A pointer to the scatter/gather table of pinned pages or NULL on
>> failure.
>> + * A pointer to the scatter/gather table of pinned pages or errno on
>> failure.
> 
> ', or an ERR_PTR()-encoded errno code on failure'
> 
>>    */
>>   struct sg_table *drm_gem_shmem_get_sg_table(struct
>> drm_gem_shmem_object *shmem)
>>   {
>> @@ -688,7 +688,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>>    * drm_gem_shmem_get_sg_table() should not be directly called by
>> drivers.
>>    *
>>    * Returns:
>> - * A pointer to the scatter/gather table of pinned pages or errno on
>> failure.
>> + * A pointer to the scatter/gather table of pinned pages
>> ERR_PTR()-encoded
> 
> ', or an' before ERR_PTR
> 
> With the improved grammar:
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, something went wrong with these comments in this patch and I
haven't noticed that :)

