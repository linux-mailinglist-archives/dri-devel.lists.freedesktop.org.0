Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C448E25F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 03:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB96910EB5B;
	Fri, 14 Jan 2022 02:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2B210EB5B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 02:06:57 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id g5so11974073plo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 18:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oP85wEibAgdAllFjeeWyOD+iyUTYy6my1+XJQtMFYUQ=;
 b=6WAP5NS+llYsdT26NLQfMH1T1HBtOUbzDEhZ7R8iQYWLIoxXv95oPSls63p0TYd2MJ
 YxlLnQ1Ir5kfFAfQD1V8xNSb7U0opn7zb6u44VnX8DACbWarpcj3KEDC3IuFFAL250xY
 n85BmLXWGnReW52NNo4tTsJLc7W204tViaeMuMewM2345JoYSuiAPG3+pYkP/0QXilfS
 Pz36d9yVYgw+Zz+LF08gCKFJKlslb/rCdgIAW5yRSERtgv2T013wjqWv0WqxVGPMlhP5
 nSKBGrBxwSiOXSrH70IdufD9whvD4fnqQ7nVNGBy/2EfrdGUKOG3qtdO+aZAA2BZDkBI
 +Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oP85wEibAgdAllFjeeWyOD+iyUTYy6my1+XJQtMFYUQ=;
 b=nxZVjrosxNRyRL1HUhkidue8L5tFSfVYZcgJXLgeIPmxXLiRZNgDpyJitJpD4XxOEs
 +X0DuRPCxgKZYDnI5vhO07khQYk7t12pqDjgNA3S/ESsCywASFEMtqFZlu+2ihWhn5yg
 j6s6Q+mqmnLB6LOWsm2VQFMVCP/EH10I6mZ52p7yurEUYnluwwxrrH7gcDljjT53BJ5e
 88/t7zGDB2wY/3yBJONBy4k5AhsbbEDttbv/x+aCP1tCGfpXCAd/0cZVqGGzqxbcF3Kz
 pP79fHiQlrlJVzWrMQSoecEdWBRa8szK9JhuOujdUwBmmjBGNUckjGbfdK4esqlXNd1B
 NaBw==
X-Gm-Message-State: AOAM532KTuTaECUH+dK75XgzUZlVmQ3a6XQvAS4vWFOueIn2SiANbhOz
 xMA5LOZHc79JPSIbu3oojFatRw==
X-Google-Smtp-Source: ABdhPJwAf8JNoK0IFF/OFmOGwLzMqK0nv9iCuKxfLT1lgh3OfeKFFLd0NcCDqRORNBbkRlpxc/KA2g==
X-Received: by 2002:a17:90b:1a88:: with SMTP id
 ng8mr17797236pjb.180.1642126016944; 
 Thu, 13 Jan 2022 18:06:56 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id i4sm3554122pjj.30.2022.01.13.18.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 18:06:56 -0800 (PST)
Message-ID: <d8882c4a-df6f-77e4-8a6d-57cf907574b6@igel.co.jp>
Date: Fri, 14 Jan 2022 11:06:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH v2 2/3] drm: set fb_modifiers_not_supported flag in
 legacy drivers
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220113094419.12433-1-etom@igel.co.jp>
 <20220113094419.12433-3-etom@igel.co.jp>
 <CAP+8YyF60rXVacY3-ZKieYjxRzseb_SGJbNnXaUzUyUUS-n42Q@mail.gmail.com>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <CAP+8YyF60rXVacY3-ZKieYjxRzseb_SGJbNnXaUzUyUUS-n42Q@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, etom@igel.co.jp,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Alex Deucher <alexander.deucher@amd.com>, Takanari Hayama <taki@igel.co.jp>,
 Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mark Yacoub <markyacoub@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for your comment.

On 2022/01/14 2:56, Bas Nieuwenhuizen wrote:
> I think we'll also want to do a conditional disable for DC
> (drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c) since it only
> enables modifiers on newer HW.  Something like "if (modifiers == NULL)
> fb_modifiers_not_supported = true;" in amdgpu_dm_plane_init.

Ok, I'll add a conditional disable in amdgpu_dm_plane_init().

Thanks,
Tomohito Esaki

> On Thu, Jan 13, 2022 at 10:44 AM Tomohito Esaki <etom@igel.co.jp> wrote:
>>
>> Set fb_modifiers_not_supported flag in legacy drivers whose planes
>> support non-linear layouts but does not support modifiers, and replace
>> allow_fb_modifiers with fb_modifiers_not_supported.
>>
>> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 6 +++---
>>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c      | 2 ++
>>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c      | 2 ++
>>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c       | 1 +
>>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c       | 2 ++
>>   drivers/gpu/drm/nouveau/nouveau_display.c   | 6 ++++--
>>   drivers/gpu/drm/radeon/radeon_display.c     | 2 ++
>>   7 files changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index dc50c05f23fc..cbaea9c6cfda 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -958,7 +958,7 @@ static int amdgpu_display_verify_sizes(struct amdgpu_framebuffer *rfb)
>>          int ret;
>>          unsigned int i, block_width, block_height, block_size_log2;
>>
>> -       if (!rfb->base.dev->mode_config.allow_fb_modifiers)
>> +       if (rfb->base.dev->mode_config.fb_modifiers_not_supported)
>>                  return 0;
>>
>>          for (i = 0; i < format_info->num_planes; ++i) {
>> @@ -1145,7 +1145,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
>>          if (ret)
>>                  return ret;
>>
>> -       if (!dev->mode_config.allow_fb_modifiers) {
>> +       if (dev->mode_config.fb_modifiers_not_supported) {
>>                  drm_WARN_ONCE(dev, adev->family >= AMDGPU_FAMILY_AI,
>>                                "GFX9+ requires FB check based on format modifier\n");
>>                  ret = check_tiling_flags_gfx6(rfb);
>> @@ -1153,7 +1153,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
>>                          return ret;
>>          }
>>
>> -       if (dev->mode_config.allow_fb_modifiers &&
>> +       if (!dev->mode_config.fb_modifiers_not_supported &&
>>              !(rfb->base.flags & DRM_MODE_FB_MODIFIERS)) {
>>                  ret = convert_tiling_flags_to_modifier(rfb);
>>                  if (ret) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> index d1570a462a51..fb61c0814115 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> @@ -2798,6 +2798,8 @@ static int dce_v10_0_sw_init(void *handle)
>>          adev_to_drm(adev)->mode_config.preferred_depth = 24;
>>          adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>>
>> +       adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>> +
>>          adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>>
>>          r = amdgpu_display_modeset_create_props(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> index 18a7b3bd633b..17942a11366d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> @@ -2916,6 +2916,8 @@ static int dce_v11_0_sw_init(void *handle)
>>          adev_to_drm(adev)->mode_config.preferred_depth = 24;
>>          adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>>
>> +       adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>> +
>>          adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>>
>>          r = amdgpu_display_modeset_create_props(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> index c7803dc2b2d5..2ec99ec8e1a3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> @@ -2674,6 +2674,7 @@ static int dce_v6_0_sw_init(void *handle)
>>          adev_to_drm(adev)->mode_config.max_height = 16384;
>>          adev_to_drm(adev)->mode_config.preferred_depth = 24;
>>          adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>> +       adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>>          adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>>
>>          r = amdgpu_display_modeset_create_props(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> index b200b9e722d9..8369336cec90 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> @@ -2699,6 +2699,8 @@ static int dce_v8_0_sw_init(void *handle)
>>          adev_to_drm(adev)->mode_config.preferred_depth = 24;
>>          adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>>
>> +       adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>> +
>>          adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>>
>>          r = amdgpu_display_modeset_create_props(adev);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index 929de41c281f..1ecad7fa3e8a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -711,10 +711,12 @@ nouveau_display_create(struct drm_device *dev)
>>                                       &disp->disp);
>>                  if (ret == 0) {
>>                          nouveau_display_create_properties(dev);
>> -                       if (disp->disp.object.oclass < NV50_DISP)
>> +                       if (disp->disp.object.oclass < NV50_DISP) {
>> +                               dev->mode_config.fb_modifiers_not_supported = true;
>>                                  ret = nv04_display_create(dev);
>> -                       else
>> +                       } else {
>>                                  ret = nv50_display_create(dev);
>> +                       }
>>                  }
>>          } else {
>>                  ret = 0;
>> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
>> index 573154268d43..b9a07677a71e 100644
>> --- a/drivers/gpu/drm/radeon/radeon_display.c
>> +++ b/drivers/gpu/drm/radeon/radeon_display.c
>> @@ -1596,6 +1596,8 @@ int radeon_modeset_init(struct radeon_device *rdev)
>>          rdev->ddev->mode_config.preferred_depth = 24;
>>          rdev->ddev->mode_config.prefer_shadow = 1;
>>
>> +       rdev->ddev->mode_config.fb_modifiers_not_supported = true;
>> +
>>          rdev->ddev->mode_config.fb_base = rdev->mc.aper_base;
>>
>>          ret = radeon_modeset_create_props(rdev);
>> --
>> 2.25.1
>>

