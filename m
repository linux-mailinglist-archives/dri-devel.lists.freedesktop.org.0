Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9386470C5D7
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 21:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F8E10E23B;
	Mon, 22 May 2023 19:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1A810E238;
 Mon, 22 May 2023 19:12:50 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-96f50e26b8bso838737666b.2; 
 Mon, 22 May 2023 12:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684782766; x=1687374766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1RH0Zf6SSIW6QoBUKPWp/zoQijLydPGslM9QKv8h/5w=;
 b=oph+D4WWLxlnyEmFPNjgsPeJBISPU+KD4UUa9fg3DYqpUFyUcSy2A8sXDz1JY90HSj
 xzoIZxLys2edI8VLxZ8SUICa6hs3ltLdhVckgRuVX12qWbyO/5/P5pXToBwghYmBImM4
 GxRtg+DjoFlZs2IQbw0GRuJkLAWdEq1jL02CeY8Oq1Vw/LZ24lXVPWKiu9wvC6wvwqZe
 4zxJGa7IFF9hpOxgj4zYfuwN4QgxA9EJl+uW/GIm5xFwfzg32f6498xgXrNJY+sWojOs
 3i26c1lUlOX7fCy8Iy8fJMXZc8FzORlXncsYSBRN0ku1dfkTcxAIO4l1uhBY/2ohh+8c
 +YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684782766; x=1687374766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1RH0Zf6SSIW6QoBUKPWp/zoQijLydPGslM9QKv8h/5w=;
 b=doRiS7oLdVXLmCASVNvK03rE14G2SU627RrU+n9Qcdi7hNYue4Rx/k43imA6+vd8qG
 uH308UB9IngrzZPNCfa/K9aJMapnbf37DTL05fTDoqAIre6uTtjKKLirfyD4n360jGga
 xn617ogvLps9l8mzf6Y84RleucOHB6KhYB1TwAs3BguaH2q5SOajheB1zY1JWDZGMih/
 lY1U5V44O9kaRdBOnydMbKr+L/ZXOjLc2RdV1f/lYvkC80f+BUrCKtWHvTjuTJZRe8KB
 8nDiIT0hLEDvWrZgxaJCsliq2jquxA1deD5zXG8o+Gfe7Kr4SOJJoLjW5Yi73IQWuzpm
 2a3Q==
X-Gm-Message-State: AC+VfDzITqm12dxynTZP3k8lCngqIv5F97jCjheq/q+NpzsQp4nnu3z7
 z/MvDKasdduW4IBVabvNtNZqCmjIxcc=
X-Google-Smtp-Source: ACHHUZ51p7wdPuwDp950is/pz1bFqE/LofFB2M9EBORGJoNj3EX0tf2KmXVRNkRcdY8N+GBHZZwCwA==
X-Received: by 2002:a17:907:3fa8:b0:965:6075:d100 with SMTP id
 hr40-20020a1709073fa800b009656075d100mr13228831ejc.39.1684782766162; 
 Mon, 22 May 2023 12:12:46 -0700 (PDT)
Received: from ?IPV6:2a00:e180:15c4:ff00:1a51:43c9:7f06:6b44?
 ([2a00:e180:15c4:ff00:1a51:43c9:7f06:6b44])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906085800b0096f887f29d2sm3474738ejd.62.2023.05.22.12.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 12:12:45 -0700 (PDT)
Message-ID: <07ce00de-c686-05c6-3f27-f8857417ef10@gmail.com>
Date: Mon, 22 May 2023 21:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] amdgpu: validate drm_amdgpu_gem_va addrs for all ops
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20230509183301.1745462-1-olvaffe@gmail.com>
 <CAPaKu7TqUt1L-5RUuwEagr2UUs8maOO+FSoS2PEoP9eO1-JJSw@mail.gmail.com>
 <CADnq5_OsGqg7CoNVgtgr91a+pyBtJzoUOBXHKmGMcOM9hLFkwQ@mail.gmail.com>
 <CAPaKu7SQ0NkDVN3NNRoJxGRQ8x2T2uXcxZJEkt7g2CkEzVU3Sg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAPaKu7SQ0NkDVN3NNRoJxGRQ8x2T2uXcxZJEkt7g2CkEzVU3Sg@mail.gmail.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Mukul Joshi <mukul.joshi@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.23 um 20:49 schrieb Chia-I Wu:
> On Thu, May 18, 2023 at 1:12 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Wed, May 17, 2023 at 5:27 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>>> On Tue, May 9, 2023 at 11:33 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>>>> Extend the address and size validations to AMDGPU_VA_OP_UNMAP and
>>>> AMDGPU_VA_OP_CLEAR by moving the validations to amdgpu_gem_va_ioctl.
>>>>
>>>> Internal users of amdgpu_vm_bo_map are no longer validated but they
>>>> should be fine.
>>>>
>>>> Userspace (radeonsi and radv) seems fine as well.
>>> Does this series make sense?
>> I think so, I haven't had a chance to go through this too closely yet,
>> but amdgpu_vm_bo_map() is used by ROCm as well so we'd need to make
>> sure that removing the checks in patch 1 wouldn't affect that path as
>> well.  The changes in patch 2 look good.  Also, these patches are
>> missing your SOB.
> Indeed.  kfd_ioctl_alloc_memory_of_gpu, for example, does not validate
> va.  I need to keep the validation in amdgpu_vm_bo_map for it at
> least.  I guess it is more ideal for kfd_ioctl_alloc_memory_of_gpu to
> validate, but I am not familiar with amdkfd..
>
> I can keep the existing validations, and duplicate them in
> amdgpu_gem_va_ioctl to cover AMDGPU_VA_OP_UNMAP/AMDGPU_VA_OP_CLEAR.

The key point is that unmap and clear don't need those validations.

It's perfectly valid to request unmap of an unaligned mapping, it will 
just fail because we can't find that mapping.

Regards,
Christian.

>
>> Thanks,
>>
>> Alex
>>
>>
>> Alex

