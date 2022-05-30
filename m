Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D1F53744A
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3C610E99C;
	Mon, 30 May 2022 06:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F3C10E99C;
 Mon, 30 May 2022 06:02:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so3928835wmq.1; 
 Sun, 29 May 2022 23:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=stC9EFhI7+6UGa360KSWWIzphU4ZEQIlBW0zuTPcZWw=;
 b=KJI4pXydZOPKX6r4YCVdsLLYo1ITFqFsAAOc8b8/0XcZIwkGUfkJZG+o58Rs8xIeUA
 OqqOk4bm4irI3poESRU9d1MhSM+fmCO52Pi/uiltiQwSWayKluHcXOyT0zYZTxp2eLWz
 XsYDgSTOhnFRuF5gK2hSLLWOveYUbPiVC4oXKIVqM/HHSWjAaprFdiN8ZDgI7x3Ag0bI
 py4G1fLzJM4YvcGYyW6r59Z9lpLbgQ4Ni3eo9xeFv2UH+eK24Ho4yAH6ajhM4VKJtRaI
 jWRHjfLhrS/qwtfLW6kG9g3L610slt6Gcej4je+b2K44kCSYONoTIekFYalipwAqODFL
 KiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=stC9EFhI7+6UGa360KSWWIzphU4ZEQIlBW0zuTPcZWw=;
 b=Y2oNzOgdd+oSFJTe9btAyVw1SUbNi3xZpKtI5a79w98yt4Zh9IebrcndAlYLP4nkNx
 O1LLH1gTCpOA+AGOlr+vjJXdcM+VPdltyknixOPbCWX5sMMoj/4A/8+3Wv9ToAvJSc3a
 yWdrix9CkT44U4YR6/svfmd7hAtJDzGZ8xtcLEmdwJA+zBmk1OtxUGZcBwUC6mZXRO1F
 Ofx01n+BTlpvtItgVeJQAAN35mXnr6GisOgTDYajCemCdOcnFmqaOpUL7GjiY7WJItXF
 3i0D5X4Bb2Do5SOuq/DEI+kq6I5FcuYI79ejvqHAYHk3qyjTTI3PVIOgk+YYltncAJzP
 pv+A==
X-Gm-Message-State: AOAM530p5kDk93KmrkpUmaadX4TOntoBJDRIiuWCrhVR35+t1ayLdABX
 2tPSvREQFtKv/XtUXWtF4yY=
X-Google-Smtp-Source: ABdhPJx1K05y6WnmLQ52xnVpB9ZXRm+8ZJoO6jFbU2oizpKYmLBI3MYt328y743escx8q5igOaVTlg==
X-Received: by 2002:a05:600c:3c91:b0:39b:6b:d5de with SMTP id
 bg17-20020a05600c3c9100b0039b006bd5demr6275935wmb.132.1653890559143; 
 Sun, 29 May 2022 23:02:39 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea17a.dip0.t-ipconnect.de.
 [91.14.161.122]) by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c254500b003942a244f49sm9206907wma.34.2022.05.29.23.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 23:02:38 -0700 (PDT)
Message-ID: <5c9a514d-53a3-c821-5549-07aa7fb8e756@gmail.com>
Date: Mon, 30 May 2022 08:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Mike Lothian <mike@fireburn.co.uk>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
 <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
 <CAHbf0-En606VT_HYDyeo6TtsfSZmR_+wsZaVgS4XiedLO9ndiA@mail.gmail.com>
 <8b99ca20-f711-ec32-0cd2-16fc52846ce0@amd.com>
 <CAHbf0-EzPP5gAyZQmxeAo3Ep0g-rO4XbDgEB_SdsR84xY+at9A@mail.gmail.com>
 <CAHbf0-G-rnvNXaXxMzkPerW6h=9vkxJyysUUV-oJV5UGD67KqA@mail.gmail.com>
 <CADnq5_PTRPTsCvGwKFzNA_k7diAVqYEv1xV1yJszRD1K-v2FfQ@mail.gmail.com>
 <MN2PR12MB43425B6EC07A7F6877B884C7E4DB9@MN2PR12MB4342.namprd12.prod.outlook.com>
 <CAHbf0-G8Qgv-uKHBYxhv=SLUv7-z4gzjMziN_x+oAobTrqW0PQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAHbf0-G8Qgv-uKHBYxhv=SLUv7-z4gzjMziN_x+oAobTrqW0PQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.05.22 um 01:52 schrieb Mike Lothian:
> On Sat, 28 May 2022 at 08:44, Paneer Selvam, Arunpravin
> <Arunpravin.PaneerSelvam@amd.com> wrote:
>> [Public]
>>
>> Hi,
>>
>> After investigating quite some time on this issue, found freeze problem is not with the amdgpu part of buddy allocator patch as the patch doesn’t throw any issues when applied separately on top of the stable base of drm-next. After digging more into this issue, the below patch seems to be the cause of this problem,
>>
>> drm/ttm: rework bulk move handling v5
>> https://cgit.freedesktop.org/drm/drm/commit/?id=fee2ede155423b0f7a559050a39750b98fe9db69
>>
>> when this patch applied on top of the stable (working version) of drm-next without buddy allocator patch, we can see multiple issues listed below, each thrown randomly at every GravityMark run, 1. general protection fault at ttm_lru_bulk_move_tail() 2. NULL pointer deference at ttm_lru_bulk_move_tail() 3. NULL pointer deference at ttm_resource_init().
>>
>> Regards,
>> Arun.
> Thanks for tracking it down, fee2ede155423b0f7a559050a39750b98fe9db69
> isn't trivial to revert
>
> Hopefully Christian can figure it out

Arun is unfortunately running into the wrong direction with his testing. 
The merge fallout from "drm/ttm: rework bulk move handling v5" is 
already fixed by "drm/amdgpu: fix drm-next merge fallout", but your 
problem with the buddy allocator is separate to that.

Regards,
Christian.
