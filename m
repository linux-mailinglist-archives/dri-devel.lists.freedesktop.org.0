Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FF8740597
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 23:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ADF10E32A;
	Tue, 27 Jun 2023 21:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCD710E32A;
 Tue, 27 Jun 2023 21:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HhfdKor3rdtZnPNJc3y75iM+mV1CbPl8HuUmtaB3724=; b=bOVCO+/GXHsB/vPZil7nxKnAcZ
 mUEd8dGgo7tKTqvvaUH+2nRi7DSw7nlClFNqTfLG+gF/VAaEiLb8RBltUxciS4fpB6xR5WswhocUx
 jTPm6TFqotWNjNfWUK2xObVFUgMLKwgAqCL9mJaPmxSEl0nqx4cUOWLpAAqxyH0ZC1wlPbv23DbiM
 VDZN32hvg1cmcUC2udqPABocExg1lP1UlaNu4uYPs+5KC4hJLl5MHTG3u5Sm/dMfQfMpKSD7JPC5I
 AgJI4eQr2dN31xLRap3PJy+Vl8qfnrui8yAUYF8QKCfualP6RGDEc3Z5XpK3OQtOjdp0Yej7hbWdH
 rldu+IYg==;
Received: from [179.113.218.86] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qEGHi-004rUB-GO; Tue, 27 Jun 2023 23:31:38 +0200
Message-ID: <4302638a-c33b-7355-5201-d3020f5b1525@igalia.com>
Date: Tue, 27 Jun 2023 18:31:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Content-Language: en-US
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CAAxE2A4Hquz9bJNSEaUtBoJC3qbLBPYXd8i3JX9AhNUx_iUKpg@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CAAxE2A4Hquz9bJNSEaUtBoJC3qbLBPYXd8i3JX9AhNUx_iUKpg@mail.gmail.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Em 27/06/2023 15:57, Marek Olšák escreveu:
> On Tue, Jun 27, 2023, 09:23 André Almeida <andrealmeid@igalia.com 
> <mailto:andrealmeid@igalia.com>> wrote:
> 
>     +User Mode Driver
>     +----------------
>     +
>     +The UMD should check before submitting new commands to the KMD if
>     the device has
>     +been reset, and this can be checked more often if the UMD requires
>     it. After
>     +detecting a reset, UMD will then proceed to report it to the
>     application using
>     +the appropriate API error code, as explained in the section below about
>     +robustness.
> 
> 
> The UMD won't check the device status before every command submission 
> due to ioctl overhead. Instead, the KMD should skip command submission 
> and return an error that it was skipped.

I wrote like this because when reading the source code for 
vk::check_status()[0] and Gallium's si_flush_gfx_cs()[1], I was under 
the impression that UMD checks the reset status before every 
submission/flush.

Is your comment about of how things are currently implemented, or how 
they would ideally work? Either way I can apply your suggestion, I just 
want to make it clear.

[0] 
https://elixir.bootlin.com/mesa/mesa-23.1.3/source/src/vulkan/runtime/vk_device.h#L142
[1] 
https://elixir.bootlin.com/mesa/mesa-23.1.3/source/src/gallium/drivers/radeonsi/si_gfx_cs.c#L83

> 
> The only case where that won't be applicable is user queues where 
> drivers don't call into the kernel to submit work, but they do call into 
> the kernel to create a dma_fence. In that case, the call to create a 
> dma_fence can fail with an error.
> 
> Marek

