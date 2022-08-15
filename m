Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C005933C8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 19:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8340FCE7EF;
	Mon, 15 Aug 2022 17:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F25B9150B;
 Mon, 15 Aug 2022 17:02:03 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id a22so6513705pfg.3;
 Mon, 15 Aug 2022 10:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kVI9j3DYdqBdWkziBWW1kk/pn2Ueg4C4jZV3ff8Htjw=;
 b=gZqQLXqcl92oRRJt+5e5u2qjisa8kzB6aZhxd9PIhqUmCxltZj383GoU8Cz3j8Tk4c
 vN3dentoCQF+MRI0FvyRZDu3ppO1yOn+l9OA8GhHnGrLqRWgaIjY5eBqJDZC13icn8hw
 +JAwQvLxC0EWZOG74h3jwKTqvyhuQAgdTqTQO3xsOZuG6xc4trx06//kNQR1Qf0Ld1Qt
 tKFvpd6kAwyjbVJ8t5yuX1bSinVtAAjspK7Ilp9HakXaNORZYJnsYGPk0LyRyExCiuIq
 zgLrz1HmdPJhISBHvYLb3Ttimvk0hFUuuNhLGuw8c59leJyeKyuYyxmeeXGhUtcLAc0k
 0nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kVI9j3DYdqBdWkziBWW1kk/pn2Ueg4C4jZV3ff8Htjw=;
 b=yXLg74SpL1geW94zzIOYWy2BjI7MM6P8Ob5OVe9HV2HUTAA46nF6fALukQY0Ufut6j
 sPzruywfKfOJ6v7PlcAueGXLL1vPLmkgc79/hgCb6kYbI4gSrWKzHcAhAv+ry+irV2il
 07P271xilHAk5gy5riRG8QnXJz0H97p1/QbYEUIIhOlnCp3FMKoIg7wq1fIm7hOemJ3L
 7oWjVGah92qDaq5CV5p9Mv6tsdYQnaj6ndiu3HIlqSmmivC5k1X+BhWMfvwspfrDnUUU
 lr5ROgMRf/V7sIjCiFnZfuV4bx7R4lUOa2rS0tnCFdsU61bzXZjCcIvlePIH8jp1Vn+k
 GxcA==
X-Gm-Message-State: ACgBeo18Pd7Q85uNlyMMVtYZ3qONdnGbwG9cA9xz2vXWnPUlXcMkEfsJ
 y41AF2mSdIUey67kfzlRD2A=
X-Google-Smtp-Source: AA6agR5RZ22iqECqURoT+vxzrH03J8Q9Bvu9e6PkSFwJuTLDiJCN3IdbpLDIa0y8FwM7EIYwWL+bEw==
X-Received: by 2002:aa7:88d1:0:b0:52e:f8e:aab5 with SMTP id
 k17-20020aa788d1000000b0052e0f8eaab5mr17090966pff.63.1660582921848; 
 Mon, 15 Aug 2022 10:02:01 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.138])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a17090b079400b001f89383d587sm4767063pjz.56.2022.08.15.10.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 10:02:01 -0700 (PDT)
Message-ID: <1e720378-8398-3e4a-5a77-e34b2fec58fd@gmail.com>
Date: Mon, 15 Aug 2022 23:01:49 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Content-Language: en-US
To: Greg KH <greg@kroah.com>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com> <YvpwVh359EMGa5kO@kroah.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <YvpwVh359EMGa5kO@kroah.com>
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Dong, Ruijing" <Ruijing.Dong@amd.com>,
 "Zhu, James" <James.Zhu@amd.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/22 22:12, Greg KH wrote:
> On Mon, Aug 15, 2022 at 09:11:18PM +0600, Khalid Masum wrote:
>> On 8/15/22 20:15, Dong, Ruijing wrote:
>>> [AMD Official Use Only - General]
>>>
>>> Sorry, which "r" value was overwritten?  I didn't see the point of making this change.
>>>
>>> Thanks
>>> Ruijing
>>>
>>> -----Original Message-----
>>> From: Khalid Masum <khalid.masum.92@gmail.com>
>>> Sent: Monday, August 15, 2022 3:01 AM
>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org
>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James <James.Zhu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>; Dong, Ruijing <Ruijing.Dong@amd.com>; Wan Jiabing <wanjiabing@vivo.com>; Liu, Leo <Leo.Liu@amd.com>; Khalid Masum <khalid.masum.92@gmail.com>
>>> Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in vcn_v4_0_stop
>>>
>>> The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten before it can be used. Remove this assignment.
>>>
>>> Addresses-Coverity: 1504988 ("Unused value")
>>> Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
>>> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> index ca14c3ef742e..80b8a2c66b36 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> @@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
>>>                   fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
>>>
>>>                   if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>> -                       r = vcn_v4_0_stop_dpg_mode(adev, i);
>>> +                       vcn_v4_0_stop_dpg_mode(adev, i);
>>>                           continue;
>>>                   }
>>>
>>> --
>>> 2.37.1
>>>
>>
>> After value is overwritten soon right after the diff.
>>
>> See:
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>
>> static int vcn_v4_0_stop(struct amdgpu_device *adev)
>> {
>>          volatile struct amdgpu_vcn4_fw_shared *fw_shared;
>> ...
>>
>>          for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>                  fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
>>                  fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
>>
>>                  if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>                          r = vcn_v4_0_stop_dpg_mode(adev, i);
>>                          continue;
>>                  }
>>
>>                  /* wait for vcn idle */
>>                  r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS,
>> UVD_STATUS__IDLE, 0x7);
>>
>> Here, any value assigned to r is overwritten before it could
>> be used. So the assignment in the true branch of the if statement
>> here can be removed.
> 
> Why not fix vcn_v4_0_stop_dpg_mode() to not return anything, as it does
> not, and then remove this assignment as well, which would fix up
> everything at once to be more obvious what is happening and why.

That makes sense. I shall send a v2 this way. Thanks for your suggestion.

> 
> thanks,
> 
> greg k-h

thanks,
   -- Khalid Masum

