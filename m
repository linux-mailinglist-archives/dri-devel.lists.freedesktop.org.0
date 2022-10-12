Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C145FC086
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 08:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890B110E18B;
	Wed, 12 Oct 2022 06:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17E010E18B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 06:18:22 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id w18so9409600ejq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 23:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FiAL6uWliZ0/umTH8bSWXdKgT/Fdjdjs7i/VQkdMUec=;
 b=S3dkjNu7un7M6+NvsF++5hLXPgev4QzRxhu3glJIGHBFAVKTqdVBMFh50fYmfcYIul
 Z3Y/17K3MCHcCUtVmj0qBRxK1SxzQ40MXmuiR9T+Dm7Sr8TFo46AMEw/uV2fC9HwhGic
 MxpxY55eiY34CpiEKD8Gh3vZJShmWK1VEnBp0ovbWpRBUuO1Ps/nz2AhNuvK9zeBB/fI
 r0KRGTI9mVL9A2+0Qv64Qk9S7ObV1yJ4oBhX7vi3qXORJChCT6xjbVTdzk9YU7JBzp5n
 p8XK3tAz5SDsfEUN5GIy7sANJuEiXT62ruT3Dqaqz+2zem8oeQ+NXZAqtDkydH+zRtgy
 R0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiAL6uWliZ0/umTH8bSWXdKgT/Fdjdjs7i/VQkdMUec=;
 b=k0ZTKjZMmoVRICQCLic2D8Vdxwsl6NSvz3G607Cz9qarmHz8jKUk+gbEhV6odJSDyu
 SlR+cWfbYI5i7DKTGuHimanx27gZC2+O9x7gUzADYThdwo7lozxuZir8vAFtIOcPoqSj
 F9LHVmvjrvBp6bDonE1cA+Pd07pxsXxYblbudNiFWEs+Yjm163geKon7qSuCU4+yrbx1
 LEXTf6EgQOPQOFzjs8VY2fj/y/Tp4jsoSHSUmjCCYsz8sjbCwPGbPGSx/LPHfsxJtC6f
 px0KpnxnU+ixPHukwNmrO2UwGIdbT2mqL6mc1QGu7gQnLfRP9BFFmc7r4bvQARZE+/Kt
 1hXg==
X-Gm-Message-State: ACrzQf0cIGOsa/tclQA1Cyd5ED5TyRiAMBOrX4uLv/zvE9DIgM9oB87Q
 PiL6XExFhXX2Hhsb9av6Suk=
X-Google-Smtp-Source: AMsMyM7+Yx1waCDm9ebB8WFMCqg7jLNJVK1hG93g4ccUtaIK2DimZSIbJZXwQsz37gT9mxAayF5p5A==
X-Received: by 2002:a17:907:60c7:b0:78c:b9e8:89b8 with SMTP id
 hv7-20020a17090760c700b0078cb9e889b8mr21238368ejc.439.1665555501223; 
 Tue, 11 Oct 2022 23:18:21 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:d109:468b:fb13:8942?
 ([2a02:908:1256:79a0:d109:468b:fb13:8942])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a17090632d400b00772061034dbsm641496ejk.182.2022.10.11.23.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 23:18:20 -0700 (PDT)
Message-ID: <c99acf27-aa07-f365-2d1b-74cf160badd8@gmail.com>
Date: Wed, 12 Oct 2022 08:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Render only DRM devices
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <LDyPQX1u8PCwIfQuy1sQStoURXxBW-sM2cRZGiIJdf50YWWpG5HnlgD04FEfx88xnGtm0ZrvjF0XX4PF2qsXNYpdsUdmCswiuCO23-K2vaI=@emersion.fr>
 <7f14fd6b-475c-0b75-4faf-b777ebc42b02@gmail.com>
 <7IxXaAojWv9lUvhfsVunLet4nXmj7JUmYWlg5w6FMjaIpwD3q4TTLa35cCXozQAkGTXw3SaNKn5h-kwS1zOYV7fR8SqOfaX36mylqAihZfE=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <7IxXaAojWv9lUvhfsVunLet4nXmj7JUmYWlg5w6FMjaIpwD3q4TTLa35cCXozQAkGTXw3SaNKn5h-kwS1zOYV7fR8SqOfaX36mylqAihZfE=@emersion.fr>
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.10.22 um 17:20 schrieb Simon Ser:
> On Tuesday, October 11th, 2022 at 13:56, Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Am 11.10.22 um 13:37 schrieb Simon Ser:
>>
>>> On Tuesday, October 11th, 2022 at 13:04, Christian König ckoenig.leichtzumerken@gmail.com wrote:
>>>
>>>> we already have quite a bunch of devices which are essentially render
>>>> only and don't expose any connectors or more general display functionality.
>>>>
>>>> Just recently I ran into a case where an older X/DDX combination
>>>> caused problems for such a device so I looked a bit into the
>>>> possibility to allow drivers to disable the primary node and only
>>>> expose the render node.
>>>>
>>>> It turned out that this effectively hides the device from X, but
>>>> OpenGL and Vulkan can still use it perfectly fine.
>>>>
>>>> The only crux is that this is checked so early in the initialization
>>>> that drivers don't have an opportunity to update their
>>>> dev->driver_features. So we will always need a separate drm_driver
>>>> structure for render only devices.
>>>> Typically render-only devices still expose a primary node, but don't
>>>> expose any KMS resources on it. See drmIsKMS() in libdrm.
>>> Primary nodes could still be used by older user-space for rendering with
>>> legacy DRM authentication.
>> Yeah, and that's exactly what we try to avoid :)
> But, wouldn't that regress user-space which renders using primary nodes +
> DRM auth?

Yes and that is completely intentional as well. At least for new 
hardware generations we shouldn't have any userspace using this any more.

DRM auth based authentication is seen as a security risk and we want to 
get rid of that for render only devices (at least for the new ones).

I should probably add a wider explanation to the commit message.

Thanks,
Christian.
