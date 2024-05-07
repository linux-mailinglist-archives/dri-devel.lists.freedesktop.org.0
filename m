Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D528BEABC
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 19:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACE410FDA3;
	Tue,  7 May 2024 17:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Aw8YBnd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B56710F6DC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 17:45:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa2fso27965065e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715103905; x=1715708705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z39aNp6ho/cansGz6z4As7qPLlCotOLLvlN9d9rLPQI=;
 b=Aw8YBnd0jM44Qg+Ad+8wZ1GGHGpDQrF8xNEmn9sIgi2fw7cyL2QfdMyld2INX6CoLw
 BjssP4hdyiopvkmbR9goZ2lo3vZarqJjiJZMsQeRTgQMoe0f5n74hIzgKKrR5IYrb9aM
 SRxm++EZnRketABrbwwVucdJjmefEFTw7k/VSxU0KCsRgLadSFqiwZxx1Ae9iESykttc
 m0lf07O680+xxWMAJyst0d5iH3uJEWLI5ChJrM5DLZ4F1IjpUwo6d6d2FjX2X3Yd7gaZ
 PbEVW0g1HjudwFSWGSGtkGT5Yq1E+MgehgjfBdTXALv6ijiQh+3kIDdEnH4Ufcqq9+Vy
 +hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715103905; x=1715708705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z39aNp6ho/cansGz6z4As7qPLlCotOLLvlN9d9rLPQI=;
 b=nkOkZ4JbCuFTGEz7RtAFhgIOd1YnOa6VmM2z7e9aEJULSR83RajVqluuGce1zgSrVy
 T9YCtmq/Bgd76XPZMXVL1tv5OPHdhflNzP/NXlY9UJvNhqY8LoV6RWdH2Yk5mJ4a79qI
 NeqdFEGBDjTr8SWmaOU7dqXfsre+UQIWMBMGBdh52wcGAPiXf+DT0JNbfnZZSpAp/cGB
 /5ecN0xf54FHxAQCH+nCwIRlBvi6IjhIKd1ua7okT+kELygdnhKEkVLW4EI8V0Ax4xLb
 LY9X4L9KFej7cKQ9e2ruKbhuGClXhh16HqMODl3Z/Zfvf50mouRlDniynnmfaCE/8Dv9
 GEPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqQhYEJnc2mKVhaivOBOOinYLHKKHnBCUwX2Ovm+mFbi9soadAiYtM/hm0lRrkozEtgRngT6axMkv1g+0p7YLHIVwfeAWPLhX9F9ejpVnf
X-Gm-Message-State: AOJu0YyEFJlYfz3lPkO2nh7jHlYOj44TBfnu+oCr0uiDHlLK1jRJUmJp
 xp5qxDLaZfIp4LDsw0T65yOijt7GKDMlbU2d7kpdMXe6VMzhgmr7
X-Google-Smtp-Source: AGHT+IEeIO2faXt4HPtaKPSv53LPLgfetsgWUZ2rrUB+vNo+nARJS5K74POuW8sS151Q2FCZsZtlxw==
X-Received: by 2002:a05:600c:458d:b0:41c:503:9a01 with SMTP id
 5b1f17b1804b1-41f71ecb256mr3191275e9.25.1715103905216; 
 Tue, 07 May 2024 10:45:05 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b0041bfa349cadsm23910612wmq.16.2024.05.07.10.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 10:45:04 -0700 (PDT)
Message-ID: <d68417df-1493-421a-8558-879abe36d6fa@gmail.com>
Date: Tue, 7 May 2024 19:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 keescook@chromium.org, axboe@kernel.dk, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, jack@suse.cz,
 laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.05.24 um 18:46 schrieb Linus Torvalds:
> On Tue, 7 May 2024 at 04:03, Daniel Vetter <daniel@ffwll.ch> wrote:
>> It's really annoying that on some distros/builds we don't have that, and
>> for gpu driver stack reasons we _really_ need to know whether a fd is the
>> same as another, due to some messy uniqueness requirements on buffer
>> objects various drivers have.
> It's sad that such a simple thing would require two other horrid
> models (EPOLL or KCMP).
>
> There'[s a reason that KCMP is a config option - *some* of that is
> horrible code - but the "compare file descriptors for equality" is not
> that reason.
>
> Note that KCMP really is a broken mess. It's also a potential security
> hole, even for the simple things, because of how it ends up comparing
> kernel pointers (ie it doesn't just say "same file descriptor", it
> gives an ordering of them, so you can use KCMP to sort things in
> kernel space).
>
> And yes, it orders them after obfuscating the pointer, but it's still
> not something I would consider sane as a baseline interface. It was
> designed for checkpoint-restore, it's the wrong thing to use for some
> "are these file descriptors the same".
>
> The same argument goes for using EPOLL for that. Disgusting hack.
>
> Just what are the requirements for the GPU stack? Is one of the file
> descriptors "trusted", IOW, you know what kind it is?
>
> Because dammit, it's *so* easy to do. You could just add a core DRM
> ioctl for it. Literally just
>
>          struct fd f1 = fdget(fd1);
>          struct fd f2 = fdget(fd2);
>          int same;
>
>          same = f1.file && f1.file == f2.file;
>          fdput(fd1);
>          fdput(fd2);
>          return same;
>
> where the only question is if you also woudl want to deal with O_PATH
> fd's, in which case the "fdget()" would be "fdget_raw()".
>
> Honestly, adding some DRM ioctl for this sounds hacky, but it sounds
> less hacky than relying on EPOLL or KCMP.
>
> I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
> too, if this is possibly a more common thing. and not just DRM wants
> it.
>
> Would something like that work for you?

Well the generic approach yes, the DRM specific one maybe. IIRC we need 
to be able to compare both DRM as well as DMA-buf file descriptors.

The basic problem userspace tries to solve is that drivers might get the 
same fd through two different code paths.

For example application using OpenGL/Vulkan for rendering and VA-API for 
video decoding/encoding at the same time.

Both APIs get a fd which identifies the device to use. It can be the 
same, but it doesn't have to.

If it's the same device driver connection (or in kernel speak underlying 
struct file) then you can optimize away importing and exporting of 
buffers for example.

Additional to that it makes cgroup accounting much easier because you 
don't count things twice because they are shared etc...

Regards,
Christian.

>
>                   Linus

