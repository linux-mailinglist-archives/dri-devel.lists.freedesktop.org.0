Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA98794CE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9873112E09;
	Tue, 12 Mar 2024 13:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XHxZlxDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A7C112E0C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=StjC2vYSMMtZevQTB+aDJBWNx2X2BTnIUrUn6XgVG64=; b=XHxZlxDYoIk6HG5gxxGJyyEBCy
 ft9laPX5zJX11MzgZhV9LIGZe2xmOerZLgaeVRj4e95Vn1X6LoISwrGGaA3doOsplb4pAtBks0wuQ
 F/N/oLhnMYJBNmgtFv4PYZyjrGhP2xZmOtSFNmzDtCLJa/6/+vMhdk0xCiDvmE/csURcspgBjXaS2
 kpBR4dZva+27pDthdbdoOiLP8k2B9VMFG8MbrYmApB3n1TZnKI7VRUaZ9jwvc3xL/OgARAdxI1LBq
 vJqKYVdlaPx04sFm0W4QR+PSpfMHsoNkaKbFXK1kDrJ43dtDQtQ3pVAE7fofnUNaHS4/eGnWC9MnL
 tbANlzvA==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rk1se-009KGM-S9; Tue, 12 Mar 2024 14:09:20 +0100
Message-ID: <ed7ecd56-0b5e-4543-80f6-7d28ddf8e2ec@igalia.com>
Date: Tue, 12 Mar 2024 13:09:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Russell King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-3-mcanal@igalia.com>
 <30a7f20b-1f2c-41cb-b193-03429c160b63@igalia.com>
 <3a5d07c0-120f-47f9-a35a-31f3bfcc9330@amd.com>
 <07885e3b-ee7b-456b-9fad-17d9009a4cb7@igalia.com>
 <a0ac2e10-f5f5-4fbb-b591-bd188967ce53@amd.com>
 <e8165baa-9ded-4149-aaa6-6713d112b621@igalia.com>
 <69576e6d-9704-42b9-905f-289f9f9017b9@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <69576e6d-9704-42b9-905f-289f9f9017b9@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/03/2024 10:37, Christian König wrote:
> Am 12.03.24 um 11:31 schrieb Tvrtko Ursulin:
>>
>> On 12/03/2024 10:23, Christian König wrote:
>>> Am 12.03.24 um 10:30 schrieb Tvrtko Ursulin:
>>>>
>>>> On 12/03/2024 08:59, Christian König wrote:
>>>>> Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>>>>>>
>>>>>> Hi Maira,
>>>>>>
>>>>>> On 11/03/2024 10:05, Maíra Canal wrote:
>>>>>>> For some applications, such as using huge pages, we might want to 
>>>>>>> have a
>>>>>>> different mountpoint, for which we pass in mount flags that 
>>>>>>> better match
>>>>>>> our usecase.
>>>>>>>
>>>>>>> Therefore, add a new parameter to drm_gem_object_init() that 
>>>>>>> allow us to
>>>>>>> define the tmpfs mountpoint where the GEM object will be created. If
>>>>>>> this parameter is NULL, then we fallback to shmem_file_setup().
>>>>>>
>>>>>> One strategy for reducing churn, and so the number of drivers this 
>>>>>> patch touches, could be to add a lower level drm_gem_object_init() 
>>>>>> (which takes vfsmount, call it __drm_gem_object_init(), or 
>>>>>> drm__gem_object_init_mnt(), and make drm_gem_object_init() call 
>>>>>> that one with a NULL argument.
>>>>>
>>>>> I would even go a step further into the other direction. The shmem 
>>>>> backed GEM object is just some special handling as far as I can see.
>>>>>
>>>>> So I would rather suggest to rename all drm_gem_* function which 
>>>>> only deal with the shmem backed GEM object into drm_gem_shmem_*.
>>>>
>>>> That makes sense although it would be very churny. I at least would 
>>>> be on the fence regarding the cost vs benefit.
>>>
>>> Yeah, it should clearly not be part of this patch here.
>>>
>>>>
>>>>> Also the explanation why a different mount point helps with 
>>>>> something isn't very satisfying.
>>>>
>>>> Not satisfying as you think it is not detailed enough to say driver 
>>>> wants to use huge pages for performance? Or not satisying as you 
>>>> question why huge pages would help?
>>>
>>> That huge pages are beneficial is clear to me, but I'm missing the 
>>> connection why a different mount point helps with using huge pages.
>>
>> Ah right, same as in i915, one needs to mount a tmpfs instance passing 
>> huge=within_size or huge=always option. Default is 'never', see man 5 
>> tmpfs.
> 
> Thanks for the explanation, I wasn't aware of that.
> 
> Mhm, shouldn't we always use huge pages? Is there a reason for a DRM 
> device to not use huge pages with the shmem backend?

AFAIU, according to b901bb89324a ("drm/i915/gemfs: enable THP"), back 
then the understanding was within_size may overallocate, meaning there 
would be some space wastage, until the memory pressure makes the thp 
code split the trailing huge page. I haven't checked if that still applies.

Other than that I don't know if some drivers/platforms could have 
problems if they have some limitations or hardcoded assumptions when 
they iterate the sg list.

Te Cc is plenty large so perhaps someone else will have additional 
information. :)

Regards,

Tvrtko

> 
> I mean it would make this patch here even smaller.
> 
> Regards,
> Christian.
> 
>>
>>
>> Regards,
>>
>> Tvrtko
> 
