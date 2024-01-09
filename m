Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723738288EE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 16:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7386410E487;
	Tue,  9 Jan 2024 15:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA2A10E484
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 15:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=PG+ct9tl+XJUkOtpwleGiRdFKMPxDZT6aSLMrQtzQrk=; b=srY7sN3ugEnSYTjzTstuheG7Cb
 odMfvtsX9Os/rG71VVkAdMJTtvGy4G8kSv8892YvEzbONyoQRN02X5svQeoGwU8pgGwCwRHopWW40
 OM98FkRpZH9HwaNqrR/E4lA1RZyITQkdoClCsEsm9Q3RK8+LTxsFaJxCqZiO1udZxQZfFXEhvlL43
 xmOoGqaDqaT4eGmhX+putZtclLmmwociCdP6ldfXzecs3kMmRTvTdlMWW5b/aZj7Y5OhKOGFrhgHN
 HKBDQTnRK14dzB5vm+erRWahnhDq62vmT9T8B3PwH5DlRVGPWiSQ4ZawliiOZh64w0y19Sp0czJzJ
 +XwHPq2Q==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rNDxF-008f1o-26; Tue, 09 Jan 2024 15:23:49 +0000
Message-ID: <10b6ec8a-8b58-43a0-a3f8-c6d354b71ee4@infradead.org>
Date: Tue, 9 Jan 2024 07:23:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20240106032957.1195-1-rdunlap@infradead.org>
 <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
 <dd917333-9ae8-4e76-991d-39b6229ba8ce@infradead.org>
 <ZZ1DIDjGlHP-tmAi@phenom.ffwll.local>
 <CAKMK7uFbjQ1apr3-XrnWTH=TwRqW_9TDZ-21QAwJtiNB5FZ8dA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAKMK7uFbjQ1apr3-XrnWTH=TwRqW_9TDZ-21QAwJtiNB5FZ8dA@mail.gmail.com>
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/9/24 05:42, Daniel Vetter wrote:
> On Tue, 9 Jan 2024 at 13:59, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Mon, Jan 08, 2024 at 01:10:12PM -0800, Randy Dunlap wrote:
>>> Hi Thomas,
>>>
>>> On 1/8/24 00:57, Thomas Zimmermann wrote:
>>>> Hi,
>>>>
>>>> thanks for the fix.
>>>>
>>>> Am 06.01.24 um 04:29 schrieb Randy Dunlap:
>>>>> Remove the @funcs entry from struct drm_vram_mm to quieten the kernel-doc
>>>>> warning.
>>>>>
>>>>> Use the "define" kernel-doc keyword and an '\' line continuation
>>>>> to fix another kernel-doc warning.
>>>>>
>>>>> drm_gem_vram_helper.h:129: warning: missing initial short description on line:
>>>>>   * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
>>>>> drm_gem_vram_helper.h:185: warning: Excess struct member 'funcs' description in 'drm_vram_mm'
>>>>>
>>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>> v2: Add commit description
>>>>>
>>>>> base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
>>>>>
>>>>>   include/drm/drm_gem_vram_helper.h |    3 +--
>>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff -- a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
>>>>> --- a/include/drm/drm_gem_vram_helper.h
>>>>> +++ b/include/drm/drm_gem_vram_helper.h
>>>>> @@ -126,7 +126,7 @@ drm_gem_vram_plane_helper_cleanup_fb(str
>>>>>                        struct drm_plane_state *old_state);
>>>>>     /**
>>>>> - * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
>>>>> + * define DRM_GEM_VRAM_PLANE_HELPER_FUNCS - \
>>>>
>>>> Did something change wrt. doc syntax? I think this used to work without warnings. About this 'define': we don't use is in another docs. Can we leave it out here or is this the new syntax?
>>>>
>>>
>>> There are no doc syntax changes that I know of. This is not
>>> new syntax. It has been around since 2014:
>>>   cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
>>
>> I had no idea this exists, thanks a lot for this TIL :-)
>>
>> I guess the issue here is that this exists, yay, but it's not documented
>> with the other here:
>>
>> https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#structure-union-and-enumeration-documentation
>>
>> I guess a patch to kernel-doc.rst would be great. Adding some kernel-doc
>> folks.
> 
> Ok I went ahead and typed that patch (just we don't waste effort),
> just waiting for the sphinx build to finish to make sure it looks nice
> before I send out the patch.
> -Sima

I sent one a few days ago:

https://lore.kernel.org/lkml/20240107012400.32587-1-rdunlap@infradead.org/

-- 
#Randy
