Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 344756E7A66
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 15:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC1510E992;
	Wed, 19 Apr 2023 13:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D48C10E98C;
 Wed, 19 Apr 2023 13:15:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb297so1621443f8f.1; 
 Wed, 19 Apr 2023 06:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681910115; x=1684502115;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gAXLfpBdEAZ7L9LyE2Dg6CDtrTU5pXyCTIUvkFoTHg8=;
 b=ZS/dsr8o5NpgoYkkfd/3H7xxe/kLwMYGVOQy8b4vjCn8zoRO9L5pS/krQwN1MS6WX3
 WjePneq03bl0lTuCybclj+9X3iXjEH+z849HJl/IRV8unddHgiCz6p1gAeIxqlOwTNXH
 TqnxA5AfMf77kUjGYm1Zk6HeSuw8Ox0YyeSXX8pBev6nGKGuszSJugwP6Yo32+rxBKGb
 DJ1+/iLWVq0s2c6r+UzzrgqzAy85zcGnueQxtr8Bfx5qe7m5IAZSjtE/ZFfVxnLJzW+z
 KrjeyQ3Ya2jqQ2JPVZ19oH5QOd9XjX5/9BiDKVQ5qbyggSM7kGwjXKhW0cZPsol1Y+BA
 3ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681910115; x=1684502115;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gAXLfpBdEAZ7L9LyE2Dg6CDtrTU5pXyCTIUvkFoTHg8=;
 b=h0ZVtY8s4mQc+9Cyz4pv2nu2ZPKH0elGLxcsT03TiZixQ3t19xjW6NC86wEmyt5nE+
 ORat/DYVMkuQyL+XKyZ6TDwDjPs8UQN+DlZb16vNTcod1G5Tv/SuD7DSuj3YVJ+i3eYq
 mHuMeZ0TZk2IGi+XHF3yxdY1H/Arohs+LBoUwb5leirjIjPh4kSNTzx2HahnfxjsCkGI
 VFkVNrzPClIYZ5oGo4pJh4u5HKjiaFSV8ycVpBH5G+lNJwQ82B2hDvqWU75bzEYL155y
 fxSxtOar7TXsImm7YmoRH4J5HgRykt4AL96ifhXPzvZ/3hjtKfKm8O6TI71afKbWGHy0
 vW/A==
X-Gm-Message-State: AAQBX9fnG1o5zh29jfKAkAKeO+nrmiS2p83iYPcMQVqs4F6E2p/wF2a2
 S2zV6hm2Mc13rIX6nFDX7iA=
X-Google-Smtp-Source: AKy350aPlsjK13S7C71KRWT/oio7uG4H/s8dmBtZ5+MH8hC6XWxHMi8d+uyiP3QrliiFBV539Q/y1Q==
X-Received: by 2002:a5d:4242:0:b0:2ef:b7cc:289a with SMTP id
 s2-20020a5d4242000000b002efb7cc289amr4229298wrr.7.1681910114853; 
 Wed, 19 Apr 2023 06:15:14 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:6273:6c76:9697:9b4c?
 ([2a02:908:1256:79a0:6273:6c76:9697:9b4c])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d6a04000000b002f0442a2d3asm15804492wru.48.2023.04.19.06.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 06:15:14 -0700 (PDT)
Message-ID: <d96519fb-9e12-5a81-a60b-384dcb286f28@gmail.com>
Date: Wed, 19 Apr 2023 15:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
 <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
 <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
 <CABXGCsPcPY8dqZm0aF4c1p0ZvMYHy+NksMrZi9xK0=WdE5_osA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsPcPY8dqZm0aF4c1p0ZvMYHy+NksMrZi9xK0=WdE5_osA@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.04.23 um 15:13 schrieb Mikhail Gavrilov:
> On Wed, Apr 19, 2023 at 1:12 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> I'm already looking into this, but can't figure out why we run into
>> problems here.
>>
>> What happens is that a CS is aborted without sending the job to the
>> scheduler and in this case the cleanup function doesn't seem to work.
>>
>> Christian.
> I can easily reproduce it on any AMD GPU hardware.

Well exactly that's the problem, I can't reproduce it.

Have you applied any local change or config which could explain that?

Christian.

> You can add more logs to debug and I return with new logs which explains this.
> Thanks.
>

