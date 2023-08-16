Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D03D77DDA2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64F010E30C;
	Wed, 16 Aug 2023 09:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DE210E08B;
 Wed, 16 Aug 2023 09:44:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5259cf39154so78165a12.2; 
 Wed, 16 Aug 2023 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692179090; x=1692783890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8zand1bf++dDgXm+FjYcnuIBuhLXkX3zFM+5SMeXGc=;
 b=HRYFoxGjBZzXBdTkpHd73l2h3v/JuuD2i1kNBqAwYjOdIpHBBSZoy5H9X8PTFnyZNa
 qBvUGytxHcEACJtKntItMDimW+GC0SsKZvM97Q5F0ucWIMEyKbI4KcI9ctspDyBVDDrY
 RapzgyftLuS63fDgcmoBmvBXAYmliy4rGchDoK15Pluse8JQDskGGz7oWHbu+x5VshoD
 B9wii+pAmee+v+Q0pFAUVCKvhBg6m4AuTzt3nZkbnPMc3zrRFbW4HzvORRg9MQtcFD1/
 CG3oLBDo1J8nwI/0byiDkt7NTABA1yLSDt+AN5+YpPSI5EVr/uJ9uTniZc6PxMLb7VIk
 W23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692179090; x=1692783890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+8zand1bf++dDgXm+FjYcnuIBuhLXkX3zFM+5SMeXGc=;
 b=SKANF5wMSlyE5nx7cpN2T7TrYSGmqJekGn0+d6pDRKcfdygHTAquQbGIZhl6l39I7o
 s1igyYkJ9JW07BwglfunkfYFp+h/CwJ6Dq/QDhTAHzUoHjKWGR0Ljo3YNorLg1RhmKv7
 wHxEnc2RtAQwEGRru4tPm7a0SRj2oIPuLYASMSjZ+0ceWxFZdRipE1xX9221k6LTN/6l
 0i5Nz1tNopAQycZIXQDleGAA5IwBsqjzgaxq6AZ8MATPdmV75J0Aw3xQRhYdUBzpOZLh
 Bi8vrmE/LNG3e7DpWxJW9CxSA7ezJgrRdxur1r67KXly9l86KDfpD5vJntMkc202PAdS
 w6ig==
X-Gm-Message-State: AOJu0YyJSvBRo/tbXroo1ObWZY+2xOs6WF+oNFYgjc+9fp5q8SG5UVJr
 E5J7eOYPgH0GyRCkBFQy6Mc=
X-Google-Smtp-Source: AGHT+IEHjvlHvnzDZrz7U+x+ynkgWAIb4qZcKYYFRjnG3NOZ2EpwdYWyFkZxj65jMbqaDEqTu/83Uw==
X-Received: by 2002:a17:906:4999:b0:999:26d3:b815 with SMTP id
 p25-20020a170906499900b0099926d3b815mr1234651eju.64.1692179090211; 
 Wed, 16 Aug 2023 02:44:50 -0700 (PDT)
Received: from ?IPV6:2a00:e180:15f4:7600:6260:d6f0:1ba4:569e?
 ([2a00:e180:15f4:7600:6260:d6f0:1ba4:569e])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a17090668d600b0099bcdfff7cbsm8200410ejr.160.2023.08.16.02.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 02:44:49 -0700 (PDT)
Message-ID: <fd477ce4-1726-b5a1-1826-8cc5245fcf89@gmail.com>
Date: Wed, 16 Aug 2023 11:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/amdgpu/gmc6: fix in case the PCI BAR is larger than
 the actual amount of vram
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, hongao <hongao@uniontech.com>
References: <20230815065445.25576-1-hongao@uniontech.com>
 <CADnq5_N8nHV5ub0qf6ihU=+QKXOFfM4AnWbYmWf=EG8SbJXa8A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_N8nHV5ub0qf6ihU=+QKXOFfM4AnWbYmWf=EG8SbJXa8A@mail.gmail.com>
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
Cc: Xinhui.Pan@amd.com, lijo.lazar@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wait a second.

This is unnecessary because we have this check in 
amdgpu_gmc_vram_location():

         if (mc->real_vram_size < mc->visible_vram_size)
                 mc->visible_vram_size = mc->real_vram_size;


Which makes sure that the visible VRAM size is never larger than the 
actual size for all HW generations.

Regards,
Christian.

Am 15.08.23 um 17:50 schrieb Alex Deucher:
> Applied.  Thanks!
>
> On Tue, Aug 15, 2023 at 3:13 AM hongao <hongao@uniontech.com> wrote:
>> [why]
>> limit visible_vram_size to real_vram_size in case
>> the PCI BAR is larger than the actual amount of vram.
>>
>> Signed-off-by: hongao <hongao@uniontech.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> index b7dad4e67813..c0de7496bfd1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> @@ -320,6 +320,8 @@ static int gmc_v6_0_mc_init(struct amdgpu_device *adev)
>>          adev->gmc.aper_base = pci_resource_start(adev->pdev, 0);
>>          adev->gmc.aper_size = pci_resource_len(adev->pdev, 0);
>>          adev->gmc.visible_vram_size = adev->gmc.aper_size;
>> +       if (adev->gmc.visible_vram_size > adev->gmc.real_vram_size)
>> +               adev->gmc.visible_vram_size = adev->gmc.real_vram_size;
>>
>>          /* set the gart size */
>>          if (amdgpu_gart_size == -1) {
>> --
>> 2.20.1
>>

