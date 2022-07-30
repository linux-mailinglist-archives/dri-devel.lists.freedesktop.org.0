Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B866585951
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489B410E84D;
	Sat, 30 Jul 2022 09:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8419E10E84D;
 Sat, 30 Jul 2022 09:06:15 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 g8-20020a9d6b08000000b0061d0ac9ebb2so4804420otp.10; 
 Sat, 30 Jul 2022 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=4eVRrmQ+WXTUA655hJC7om/Fw3gm4iKU9b/x4bJL90A=;
 b=J+r/cTKaC7sX+nLput/6FyeuQ2jWiikEwrwsmUBWQSWAqoIH9ZS3G7DyyVXhbIRWN3
 t+a9Hfa9oBQfWBipeAqIiLzzpGQM307ARmC1mp5YtOuzbqMjDDrZk3Z7UGwdVGNlcf4Y
 4ipwWMSRKRvYfUghdmPEmTl1iKi3aWv+YCV41Gn1FRwl7HSZTS6lcsrOIbbBMN+piQny
 +IlU7zpmj/+iWY4bHv8Gq+1yBK4n1MsB0ryjip0UNWz/uiUCJazYDQhd1JlZt6+F4VBC
 N0KhOvzQtZcTqbn3oamQFhbqygpDCE5wz/+3rNUAzqCL0uK1H6yEORWhRlEi+OJCbz1r
 yRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=4eVRrmQ+WXTUA655hJC7om/Fw3gm4iKU9b/x4bJL90A=;
 b=Ku7ax+yIdpDVNR8Y1M1vNO24yZkuY60FJEbYhjwRXmffFh84ZtrLuFXsQJuzvLnlYC
 80s1r8/NtvjSCyXKqZtoRQotgJbbPwzsdlpfUFZzhhvJfrFjbOLJakfxl1gqeCSrZ/DV
 swWkfbVuRKTq66hrgZyVG9F3KuPjAqSXGk7RX4DWiOMDzedaOeT0PZJmEeYqIaiRg9Ds
 hq2mdqnLuJ98LkiQHIA4nitHMVcyLKLllYodoPW/VIczCVrs5CcXo/f+kdA7zSpGSQ2D
 iFaLy3V9TK8FCti/rvJRfkxx8T/PHC/JJ3pLrj0sXUd+bMr/rwOWsw/Mf3DU3d1hI1jy
 3soA==
X-Gm-Message-State: AJIora8CQVBFnXZB+IjPEt/OhZ9Qog0DerwrotsQD/8kdrbcL9vUkuEo
 kIxfyfYvk4WovvF+QO8X/8Y=
X-Google-Smtp-Source: AGRyM1tx2RCvf5THPT7g5vMumNDZwSgV7NHBp0eGgabTb6fToRvUbVhKrQcvmNq0qVoMOtPaq2NAeQ==
X-Received: by 2002:a05:6830:d81:b0:616:abfa:796f with SMTP id
 bv1-20020a0568300d8100b00616abfa796fmr2849828otb.18.1659171974604; 
 Sat, 30 Jul 2022 02:06:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a056830164400b0061c9c7813d4sm1658129otr.24.2022.07.30.02.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jul 2022 02:06:13 -0700 (PDT)
Message-ID: <80410e6e-838b-fa3d-1f87-710eb3c751c5@roeck-us.net>
Date: Sat, 30 Jul 2022 02:06:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Stack-frame warnings in display_mode_vba_32.c
Content-Language: en-US
To: paulmck@kernel.org, =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20220730022532.GA1234397@paulmck-ThinkPad-P17-Gen-1>
 <85a49b72-8bb7-b3b3-8a69-2c90cda8079d@igalia.com>
 <20220730051238.GR2860372@paulmck-ThinkPad-P17-Gen-1>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220730051238.GR2860372@paulmck-ThinkPad-P17-Gen-1>
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
Cc: sfr@canb.auug.org.au, arnd@arndb.de, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/22 22:12, Paul E. McKenney wrote:
> On Fri, Jul 29, 2022 at 11:41:55PM -0300, André Almeida wrote:
>> Hi Paul,
>>
>> Às 23:25 de 29/07/22, Paul E. McKenney escreveu:
>>> Hello!
>>>
>>> I am seeing the following in allmodconfig builds of recent -next on x86:
>>>
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function ‘DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation’:
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1659:1: error: the frame size of 2144 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>>>   1659 | }
>>>        | ^
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function ‘dml32_ModeSupportAndSystemConfigurationFull’:
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:3799:1: error: the frame size of 2480 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>>>   3799 | } // ModeSupportAndSystemConfigurationFull
>>>        | ^
>>
>> I think they are fixed at amd-staging-drm-next:
>>
>> git log --oneline amd/amd-staging-drm-next
>> drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
>> 953daa61981b drm/amd/display: Reduce stack size in the mode support function
>> 361e705e712d drm/amd/display: reduce stack for
>> dml32_CalculatePrefetchSchedule
>> f2dbf5a4dd1e drm/amd/display: reduce stack for
>> dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
>> a0a68cda2ef8 drm/amd/display: reduce stack for dml32_CalculateVMRowAndSwath
>> ca6730ca0f01 drm/amd/display: reduce stack for
>> dml32_CalculateSwathAndDETConfiguration
>> 593eef8c1a5e drm/amd/display: reduce stack size in dcn32 dml (v2)
>>
>> https://gitlab.freedesktop.org/agd5f/linux/-/commits/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> 
> Very good, thank you!  I will test again on the next -next.
> 

Did you try next-20220728 ?

groeck@server:~/src/linux-next$ git describe
next-20220728
groeck@server:~/src/linux-next$ git log --oneline drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c
1b54a0121dba drm/amd/display: Reduce stack size in the mode support function
86e4863e67a9 drm/amd/display: reduce stack for dml32_CalculatePrefetchSchedule
3c3abac60117 drm/amd/display: reduce stack for dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
c3b3f9ba25e6 drm/amd/display: reduce stack for dml32_CalculateVMRowAndSwath
bac4b41d917a drm/amd/display: reduce stack for dml32_CalculateSwathAndDETConfiguration
7acc487ab57e drm/amd/display: reduce stack size in dcn32 dml (v2)

Guenter
