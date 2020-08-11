Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46BE241862
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 10:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E6289BB0;
	Tue, 11 Aug 2020 08:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E83A89BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 08:42:31 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g8so1838355wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 01:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/CpYjARpEWyILpfd/aEN8xiJr74+OfNiD15eZFUdw1A=;
 b=RJ/CwPGKy65eNlDP/g4IQXr3yAAZaEhz/Zi4NkCFmQockb73iBYWTDUm+uYJ1hTByJ
 s0y1CfTy5ka9lTJu7zYCs/RBKyxLoukd4U/bn+mS0un6rZMBJ8jIhTBDQenbGcSTyppP
 hnD/Y8OXiB8CYsVZ9+VozqpdMfcqKUtOIpnPV1V+riz1hqaCILEKfl+8WbpA45bjd5mb
 vNovHYXXXUjwOeDRD/HBShSp9AxOH0PAJ9FBm5ByxKfIMt44bPJRsnQacGwkak+65ZSZ
 KjUrACCahaD+TuiIh8MWKgP1d1ZLm2A3EwZr90QXRYVBoHfO7Ptoi8HiUn5IPem3GHEb
 k8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/CpYjARpEWyILpfd/aEN8xiJr74+OfNiD15eZFUdw1A=;
 b=VqqD5rvbukkVhjgPi9ZkfXr9iEzEmmAAclfzNH/2zzIcdwx2zxp/nXFfid1Pgt1lCa
 KTDMrbZIH7S/+6vWy5ktWH92MVx8tryw4PaMPwO9MCCZDz2fC8hkFziv5kRvfvZ6y62Z
 IVXkvB8dLgY2Dn5befkyFjAp3xEM5lAQ1HJM0+qhed5s4Ve6odKS7PfxlQlYxi9g1qxo
 fPq4V5YenR9KS9w/tiqTlfFoEHjPBafFuMLvU2nm5DvFP9VCKVOoirwt9BQXOljTDZhv
 TSwMEJA+dxzZaOCWpN/n13f5B4sTLEridMidA3zl3PGC+1vgazv0KElXVuI1RGumpB7c
 yrSg==
X-Gm-Message-State: AOAM5336kudYfc1TkCpo+BcmKYaWWSY6Z1DyKXQoJ4hFmPf0gBjSHf5d
 0Gz64DEJvRX1kVLiJ9rfZ3/OLu94
X-Google-Smtp-Source: ABdhPJy+GA1bBWf3I2W1wsy0zej4lGxXpXSIyjJtcwxONcftJ600uwKSNXzpMXXH1weI4psKezX/hg==
X-Received: by 2002:a1c:b487:: with SMTP id d129mr3183554wmf.185.1597135349484; 
 Tue, 11 Aug 2020 01:42:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m16sm24753248wrr.71.2020.08.11.01.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2020 01:42:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: init mem->bus in common code.
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20200811074658.58309-1-airlied@gmail.com>
 <CAPM=9tw2nZB569FUw_KGhhP07m0n8ZugcFNrAsa0kn+9xtndsg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ceca6880-201f-a4b1-4d07-caac3e570e93@gmail.com>
Date: Tue, 11 Aug 2020 10:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tw2nZB569FUw_KGhhP07m0n8ZugcFNrAsa0kn+9xtndsg@mail.gmail.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've totally missed those and still don't see any reference in any inbox 
to the original mail or patch #2 in this series.

But this patch at least looks like it makes a lot of sense.

BTW: Does anybody know why we separate base and offset here? That 
distinction seems to be superfluous as well.

Christian.

Am 11.08.20 um 10:02 schrieb Dave Airlie:
> (cc'ing Christian, just in case he misses them). 2 small cleanups.
>
> On Tue, 11 Aug 2020 at 17:47, Dave Airlie <airlied@gmail.com> wrote:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> The drivers all do the same thing here.
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 6 ------
>>   drivers/gpu/drm/drm_gem_vram_helper.c      | 6 ------
>>   drivers/gpu/drm/nouveau/nouveau_bo.c       | 6 ------
>>   drivers/gpu/drm/qxl/qxl_ttm.c              | 6 ------
>>   drivers/gpu/drm/radeon/radeon_ttm.c        | 6 ------
>>   drivers/gpu/drm/ttm/ttm_bo_util.c          | 5 +++++
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 6 ------
>>   7 files changed, 5 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 67d2eef2f9eb..324abf7a3cba 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -751,12 +751,6 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
>>          struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>>          struct drm_mm_node *mm_node = mem->mm_node;
>>
>> -       mem->bus.addr = NULL;
>> -       mem->bus.offset = 0;
>> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
>> -       mem->bus.base = 0;
>> -       mem->bus.is_iomem = false;
>> -
>>          switch (mem->mem_type) {
>>          case TTM_PL_SYSTEM:
>>                  /* system memory */
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index b410930d94a0..545a877406f4 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -1038,14 +1038,8 @@ static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
>>   {
>>          struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bdev);
>>
>> -       mem->bus.addr = NULL;
>> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
>> -
>>          switch (mem->mem_type) {
>>          case TTM_PL_SYSTEM:     /* nothing to do */
>> -               mem->bus.offset = 0;
>> -               mem->bus.base = 0;
>> -               mem->bus.is_iomem = false;
>>                  break;
>>          case TTM_PL_VRAM:
>>                  mem->bus.offset = mem->start << PAGE_SHIFT;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 604a74323696..7cfe3898ce62 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -1380,12 +1380,6 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *reg)
>>          struct nvkm_device *device = nvxx_device(&drm->client.device);
>>          struct nouveau_mem *mem = nouveau_mem(reg);
>>
>> -       reg->bus.addr = NULL;
>> -       reg->bus.offset = 0;
>> -       reg->bus.size = reg->num_pages << PAGE_SHIFT;
>> -       reg->bus.base = 0;
>> -       reg->bus.is_iomem = false;
>> -
>>          switch (reg->mem_type) {
>>          case TTM_PL_SYSTEM:
>>                  /* System memory */
>> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
>> index b1ea984f143a..c55ac31f5476 100644
>> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
>> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
>> @@ -75,12 +75,6 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
>>   {
>>          struct qxl_device *qdev = qxl_get_qdev(bdev);
>>
>> -       mem->bus.addr = NULL;
>> -       mem->bus.offset = 0;
>> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
>> -       mem->bus.base = 0;
>> -       mem->bus.is_iomem = false;
>> -
>>          switch (mem->mem_type) {
>>          case TTM_PL_SYSTEM:
>>                  /* system memory */
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index 3355b69b13d1..1f1e025b9f06 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -380,12 +380,6 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
>>   {
>>          struct radeon_device *rdev = radeon_get_rdev(bdev);
>>
>> -       mem->bus.addr = NULL;
>> -       mem->bus.offset = 0;
>> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
>> -       mem->bus.base = 0;
>> -       mem->bus.is_iomem = false;
>> -
>>          switch (mem->mem_type) {
>>          case TTM_PL_SYSTEM:
>>                  /* system memory */
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 496158acd5b9..023f0a2d07c9 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -138,6 +138,11 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
>>          if (!bdev->driver->io_mem_reserve)
>>                  return 0;
>>
>> +       mem->bus.addr = NULL;
>> +       mem->bus.offset = 0;
>> +       mem->bus.size = mem->num_pages << PAGE_SHIFT;
>> +       mem->bus.base = 0;
>> +       mem->bus.is_iomem = false;
>>   retry:
>>          ret = bdev->driver->io_mem_reserve(bdev, mem);
>>          if (ret == -ENOSPC) {
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> index 69e7e7fe2a4c..6ae4a856241b 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> @@ -717,12 +717,6 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resourc
>>   {
>>          struct vmw_private *dev_priv = container_of(bdev, struct vmw_private, bdev);
>>
>> -       mem->bus.addr = NULL;
>> -       mem->bus.is_iomem = false;
>> -       mem->bus.offset = 0;
>> -       mem->bus.size = mem->num_pages << PAGE_SHIFT;
>> -       mem->bus.base = 0;
>> -
>>          switch (mem->mem_type) {
>>          case TTM_PL_SYSTEM:
>>          case VMW_PL_GMR:
>> --
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
