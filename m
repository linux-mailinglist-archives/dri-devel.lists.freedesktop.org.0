Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5981793581
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 08:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2255010E3A7;
	Wed,  6 Sep 2023 06:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B3510E0C8;
 Wed,  6 Sep 2023 06:45:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso32110655e9.2; 
 Tue, 05 Sep 2023 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693982719; x=1694587519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WbC+PTccFxw+0DVOTgccrbkscfu/JcAyQutBiCpNZyU=;
 b=ADA9cQUMM8Efxe/0ejb5ci9CNcMugz7mkKbzts+tgCEli1PBYEJXscVfJu2KZCuFvn
 eNp+U6L5K0vSACx29A7Xcqclv7y5SivwhIZsxGvpviPBx6Au25jwoPushdKxlb6pot4F
 v2n+66j3GsOJqcag8hhdJGGWaNt3X7wF4OYIYRtuCyRq2C6nlS5MIfaiskJ3uxqc4IlL
 pUnjzDWtqijm7IDg+mpAU/VlOrYEQ475vMEFm9OGDbRf2wzTLlCP7ceolLky5Hg/VjxX
 mi8VGmSo4vfjxto0MU30WrsYwUlsRcN63bREdAtYyGTzEuSBqoN1VdqioakfwbWYVi5t
 7S6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693982719; x=1694587519;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WbC+PTccFxw+0DVOTgccrbkscfu/JcAyQutBiCpNZyU=;
 b=UotILUgHFj6+deao0YpNg8nzd+aXZx7aoerZKbVUAcmr81+9vmDegeK757ihooexLM
 JYZYNMNeA+peEmk64bTgpLzm7rF2IoekFK+WBK0JykIzbwGATGMKjgJ1zPmnWYeRkAA9
 tgK4cm4sqcXK8WlzkFveXe3tH7TO4S/+FqLhgFpmVPTvKpzmI3syjOOq9fag8f3DHC+n
 lYgQ/f5XqiGppjCgiOP6uCTWre7UxQNUepp59fj40ZveBmW7+QTzJbkQO/tw/k0CT0zf
 dDLsWEO26v4CQxWHc6NZLoJVuq+s3EDilntXWETWwu2FVckTjNp3+v0nMynxybybtyyH
 qopg==
X-Gm-Message-State: AOJu0YxoECXEJGCzICB7t/yWFGweJbRkKorgF8pzncc6G7JEwI2q5qIW
 AFdh0gAiP1BYcvF3ebxDkpY=
X-Google-Smtp-Source: AGHT+IEjlomr6GhSa/peo2K0S5StXQRwjl6hxXlIzISB+VOeqKfc7FMbOl/xn6u/5EwAY+fXSbGWHg==
X-Received: by 2002:a1c:7207:0:b0:401:cf0d:25cd with SMTP id
 n7-20020a1c7207000000b00401cf0d25cdmr1486233wmc.22.1693982718606; 
 Tue, 05 Sep 2023 23:45:18 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fbb25da65bsm19248601wmc.30.2023.09.05.23.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 23:45:17 -0700 (PDT)
Message-ID: <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
Date: Wed, 6 Sep 2023 08:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
Content-Language: en-US
To: suijingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <bhelgaas@google.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.09.23 um 15:30 schrieb suijingfeng:
> Hi,
>
>
> On 2023/9/5 18:45, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 04.09.23 um 21:57 schrieb Sui Jingfeng:
>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>
>>> On a machine with multiple GPUs, a Linux user has no control over which
>>> one is primary at boot time. This series tries to solve above mentioned
>>
>> If anything, the primary graphics adapter is the one initialized by 
>> the firmware. I think our boot-up graphics also make this assumption 
>> implicitly.
>>
>
> Yes, but by the time of DRM drivers get loaded successfully,the 
> boot-up graphics already finished.

This is an incorrect assumption.

drm_aperture_remove_conflicting_pci_framebuffers() and co don't kill the 
framebuffer, they just remove the current framebuffer driver to avoid 
further updates.

So what happens (at least for amdgpu) is that we take over the 
framebuffer, including both mode and it's contents, and provide a new 
framebuffer interface until DRM masters like X or Wayland take over.

> Firmware framebuffer device already get killed by the 
> drm_aperture_remove_conflicting_pci_framebuffers()
> function (or its siblings). So, this series is definitely not to 
> interact with the firmware framebuffer
> (or more intelligent framebuffer drivers).  It is for user space 
> program, such as X server and Wayland
> compositor. Its for Linux user or drm drivers testers, which allow 
> them to direct graphic display server
> using right hardware of interested as primary video card.
>
> Also, I believe that X server and Wayland compositor are the best test 
> examples.
> If a specific DRM driver can't work with X server as a primary,
> then there probably have something wrong.
>
>
>> But what's the use case for overriding this setting?
>>
>
> On a specific machine with multiple GPUs mounted,
> only the primary graphics get POST-ed (initialized) by the firmware.
> Therefore, the DRM drivers for the rest video cards, have to choose to
> work without the prerequisite setups done by firmware, This is called 
> as POST.

Well, you don't seem to understand the background here. This is 
perfectly normal behavior.

Secondary cards are posted after loading the appropriate DRM driver. At 
least for amdgpu this is done by calling the appropriate functions in 
the BIOS.

>
> One of the use cases of this series is to test if a specific DRM 
> driver could works properly,
> even though there is no prerequisite works have been done by firmware 
> at all.
> And it seems that the results is not satisfying in all cases.
>
> drm/ast is the first drm drivers which refused to work if not being 
> POST-ed by the firmware.

As far as I know this is expected as well. AST is a relatively simple 
driver and when it's not the primary one during boot the assumption is 
that it isn't used at all.

Regards,
Christian.

>
> Before apply this series, I was unable make drm/ast as the primary 
> video card easily. On a
> multiple video card configuration, the monitor connected with the 
> AST2400 not light up.
> While confusing, a naive programmer may suspect the PRIME is not working.
>
> After applied this series and passing ast.modeset=10 on the kernel cmd 
> line,
> I found that the monitor connected with my ast2400 video card still 
> black,
> It doesn't display and doesn't show image to me.
>
> While in the process of study drm/ast, I know that drm/ast driver has 
> the POST code shipped.
> See the ast_post_gpu() function, then, I was wondering why this 
> function doesn't works.
> After a short-time (hasty) debugging, I found that the the 
> ast_post_gpu() function
> didn't get run. Because it have something to do with the 
> ast->config_mode.
>
> Without thinking too much, I hardcoded the ast->config_mode as 
> ast_use_p2a to
> force the ast_post_gpu() function get run.
>
> ```
>
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -132,6 +132,8 @@ static int ast_device_config_init(struct 
> ast_device *ast)
>                 }
>         }
>
> +       ast->config_mode = ast_use_p2a;
> +
>         switch (ast->config_mode) {
>         case ast_use_defaults:
>                 drm_info(dev, "Using default configuration\n");
>
> ```
>
> Then, the monitor light up, it display the Ubuntu greeter to me.
> Therefore, my patch is helpful, at lease for the Linux drm driver 
> tester and developer.
> It allow programmers to test the specific part of the specific drive
> without changing a line of the source code and without the need of 
> sudo authority.
> It helps to improve efficiency of the testing and patch verification.
>
> I know the PrimaryGPU option of Xorg conf, but this approach will 
> remember the setup
> have been made, you need modify it with root authority each time you 
> want to switch
> the primary. But on rapid developing and/or testing multiple video 
> drivers, with
> only one computer hardware resource available. What we really want 
> probably is a
> one-shoot command as this series provide.
>
> So, this is the first use case. This probably also help to test full 
> modeset,
> PRIME and reverse PRIME on multiple video card machine.
>
>
>> Best regards
>> Thomas
>>
>

