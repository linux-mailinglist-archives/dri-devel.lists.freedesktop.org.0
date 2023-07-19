Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5A7759703
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 15:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6AD10E4A9;
	Wed, 19 Jul 2023 13:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0311410E4A9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:34:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-316eabffaa6so6078494f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689773685; x=1692365685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7iqyJ1tyt/zGintHwIRAOam+B9iGxWukjiMScggaplw=;
 b=tnwmFnoxmhunQP8kjZ6qRl/OGitVUDE3mJI4J0Bb9Bp8DUXPw7FUvoH4SJaponnIjO
 79/V5ps+CVomWPG8NqwqNbIO27SABfwVaVw3Mb6qZ7VdwIgmflhthWPDxDkyN+f84CyN
 Zq8sLp3Svrl/2foju6LSuOvdNyrJH3ic0TqeIW8z8qycFVYogIcRSsPJoWCvYQP1w8aL
 n/t1wnClJAh/vfLOvbGFPdk/C5OweTX/OB/xQHUXjfxicXFF43koJxJP4T8yqxoolLPE
 XjzgJzV1MbjftRFqHKBTG8TuBD/B+I1enQDU1ce3L3gmKkUdxXiX6YtiZQRcIeH2Vk5D
 97zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689773685; x=1692365685;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7iqyJ1tyt/zGintHwIRAOam+B9iGxWukjiMScggaplw=;
 b=ARukQAxtEZo7NQTglxeJXCpjpkpzEF9AjE4CzqFYEgEwMUkMrU85RicFUuMcLThhvF
 K6zutl2B97XlPGVNL3GFLj1W5eWlOXvkPnIb1DoPp9M61I4w3tYAk7AACxwJ3xY8yjuA
 VHvYCnDLU2mr8UV5TwD3fOGPKxG8SPBEDFz49c8yIA6uk2g8kRX8Yq43pQiJzvk6aKdk
 MMZuDrMNRPnxV1bF3+0TpYBNPsEDkExOdqFLzAK66vmLfQ4epW1a9TbbMjMZdlj6G1gP
 MJdL+xTR5UgnGSndd6T+CI77RohLt1DqAqCux+rSEMV1Wkf7Nv//TVOkZNhfXMA0U5qC
 zhOA==
X-Gm-Message-State: ABy/qLaB8efQ4WgK7YOuvFFTRxS8WR2vArutp9n53xTtkirN9h7PFUYP
 +GyiAgqt0vukYMfJtekv0H+6+g==
X-Google-Smtp-Source: APBJJlFyZliGO0KLF5ziGaA7+vZ36hbi8ZslxYYTzzyedsAOYH9vMG5lUGP70/h12j9uhl/y1hPRvg==
X-Received: by 2002:a5d:5906:0:b0:314:f1c:90bc with SMTP id
 v6-20020a5d5906000000b003140f1c90bcmr2067900wrd.69.1689773684758; 
 Wed, 19 Jul 2023 06:34:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.201.220])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d5682000000b00314367cf43asm5360910wrv.106.2023.07.19.06.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 06:34:44 -0700 (PDT)
Message-ID: <f918a76f-324a-5c91-7dcc-5f5d43b247f6@linaro.org>
Date: Wed, 19 Jul 2023 15:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] vgacon, arch/*: remove unused screen_info
 definitions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-5-arnd@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230719123944.3438363-5-arnd@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Palmer Dabbelt <palmer@rivosinc.com>,
 loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/7/23 14:39, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of architectures either kept the screen_info definition for
> historical purposes as it used to be required by the generic VT code, or
> they copied it from another architecture in order to build the VGA console
> driver in an allmodconfig build. The mips definition is used by some
> platforms, but the initialization on jazz is not needed.
> 
> Now that vgacon no longer builds on these architectures, remove the
> stale definitions and initializations.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/csky/kernel/setup.c          | 12 ------------
>   arch/hexagon/kernel/Makefile      |  2 --
>   arch/hexagon/kernel/screen_info.c |  3 ---
>   arch/mips/jazz/setup.c            |  9 ---------
>   arch/nios2/kernel/setup.c         |  5 -----
>   arch/sh/kernel/setup.c            |  5 -----
>   arch/sparc/kernel/setup_32.c      | 13 -------------
>   arch/sparc/kernel/setup_64.c      | 13 -------------
>   arch/xtensa/kernel/setup.c        | 12 ------------
>   9 files changed, 74 deletions(-)
>   delete mode 100644 arch/hexagon/kernel/screen_info.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

