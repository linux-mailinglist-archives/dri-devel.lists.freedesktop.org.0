Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F3BEBFD3
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 01:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30CB10E15A;
	Fri, 17 Oct 2025 23:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="cATijpfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558E210E15A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=+kSTjgG+lIjQZOuH6P1ABDb8BSSN4vnO26YFIvHPP1U=; b=cATijpfpwuBU3G19ZDpYqs2/rj
 1eNq9nzfksMCe7s6399AKG/3M0qTRvZReCfFENObbRJSwERQI70tKrWDWSFuQ+SfUOlBtextSgF1q
 mNa19Yy1A+4VeMTZwrCg3tuIXk25siPi6QUUgWmBP+PZhIU/gFH1z1WVtR/f6LZ0cOhP5rpQ3sxLU
 cB+IzvBndKUHNp/4yipDe8gSIsA71Hy6hdV/8wG0Det2WqcMBR7ybVFnsvzWHOXPySZETV71cMJuu
 7fnBeYQy/XudKazK+pAZPOd7JvaHwFbUg0S7ry9W8y/F6vnfzCHRj79zxpXapsBa5hqJV3/yew0SH
 +gQFeKqg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v9tnX-00000009BCi-1pvu; Fri, 17 Oct 2025 23:23:47 +0000
Message-ID: <022e9853-6973-4000-940f-12f3bf68b50d@infradead.org>
Date: Fri, 17 Oct 2025 16:23:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `devm_backlight_device_register' in vmlinux...
To: Gustavo Padovan <gus@collabora.com>
Cc: kernelci <kernelci@lists.linux.dev>,
 kernelci-results <kernelci-results@groups.io>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 phone-devel <phone-devel@vger.kernel.org>,
 regressions <regressions@lists.linux.dev>,
 linux-next <linux-next@vger.kernel.org>
References: <176045034384.1788.868853922191153052@15dd6324cc71>
 <73bf512e-fe5f-420c-8d47-eccfa079af99@infradead.org>
 <199ec75cce1.3f69ac7c921986.1695662047481478034@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <199ec75cce1.3f69ac7c921986.1695662047481478034@collabora.com>
Content-Type: text/plain; charset=UTF-8
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



On 10/16/25 2:59 AM, Gustavo Padovan wrote:
> Hi Randy,
> 
> 
> ---- On Thu, 16 Oct 2025 00:47:35 -0300 Randy Dunlap <rdunlap@infradead.org> wrote ---
> 
>  > Guido, 
>  >  
>  > Looks like this driver needs 
>  >  
>  > +    depends on BACKLIGHT_CLASS_DEVICE 
>  >  
>  > to fix the build. 
>  >  
>  > @Gus- please read comments near bottom/end. 
>  >  
>  >  
>  > On 10/14/25 6:59 AM, KernelCI bot wrote: 
>  > > 
>  > > 
>  > > 
>  > > 
>  > > Hello, 
>  > > 
>  > > New build issue found on next/master: 
>  > > 
>  > > --- 
>  > >  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error] 
>  > > --- 
>  > > 
>  > > - dashboard: https://d.kernelci.org/i/maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 
>  > > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>  > > - commit HEAD:  13863a59e410cab46d26751941980dc8f088b9b3 
>  > > - tags: next-20251014 
>  > > 
>  > > 
>  > > Log excerpt: 
>  > > ===================================================== 
>  > >   LD      .tmp_vmlinux1 
>  > > aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected! 
>  > > aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected! 
>  > > aarch64-linux-gnu-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_create_backlight': 
>  > > /tmp/kci/linux/drivers/gpu/drm/panel/panel-visionox-rm69299.c:343: undefined reference to `devm_backlight_device_register' 
>  > > 
>  > > ===================================================== 
>  > > 
>  > > 
>  > > # Builds where the incident occurred: 
>  > > 
>  > > ## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64): 
>  > > - compiler: gcc-12 
>  > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-16k_pages-68ee4f14a6dc7c71db9fda21/.config 
>  > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f14a6dc7c71db9fda21 
>  > > 
>  > > ## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64): 
>  > > - compiler: gcc-12 
>  > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-64k_pages-68ee4f17a6dc7c71db9fda24/.config 
>  > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f17a6dc7c71db9fda24 
>  > > 
>  > > ## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64): 
>  > > - compiler: gcc-12 
>  > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-mainline-big_endian-68ee4f32a6dc7c71db9fda39/.config 
>  > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f32a6dc7c71db9fda39 
>  > > 
>  > > ## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64): 
>  > > - compiler: gcc-12 
>  > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-randomize-68ee4f1fa6dc7c71db9fda2a/.config 
>  > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f1fa6dc7c71db9fda2a 
>  > > 
>  > > ## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64): 
>  > > - compiler: gcc-12 
>  > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-chromebook-kcidebug-68ee4f2ba6dc7c71db9fda33/.config 
>  > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f2ba6dc7c71db9fda33 
>  > > 
>  > > ## defconfig+arm64-chromebook+kselftest on (arm64): 
>  > > - compiler: gcc-12 
>  > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-kselftest-16k_pages-68ee4f23a6dc7c71db9fda2d/.config 
>  > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f23a6dc7c71db9fda2d 
>  > > 
>  > > ## defconfig+arm64-chromebook+preempt_rt on (arm64): 
>  > > - compiler: gcc-12 
>  > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-preempt_rt_chromebook-68ee4f3aa6dc7c71db9fda3f/.config 
>  > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f3aa6dc7c71db9fda3f 
>  > > 
>  > > 
>  > > #kernelci issue maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 
>  > > 
>  > > Reported-by: kernelci.org bot <bot@kernelci.org> 
>  > > 
>  > > -- 
>  > > This is an experimental report format. Please send feedback in! 
>  > > Talk to us at kernelci@lists.linux.dev 
>  > > 
>  > > Made with love by the KernelCI team - https://kernelci.org 
>  > > 
>  >  
>  > Gus, the CI reporter needs to learn how to do a few things because developers 
>  > (other than me ?) don't scrounge mailing lists to look for problems. 
> 
> Absolutely. Our goal is to automate as many steps as possible!
>  
>  > a. find the commit that caused the problem (or the email series) 
>  >  
>  > b. send the report (Cc:) to whoever wrote the patch and to the 
>  > appropriate mailing list. 
>  >  
>  > I expect that b. is easier than a., so do it first. 
> 
> b. is easier that a. yes, but I don't think we can do it first because we
> need to figure the patch first. Essentially, you are asking us for
> build bisections. Something that is already on our roadmap, but
> we didn't had the time to tackle yet, but should come to it in the
> coming months.

Sometimes a bisect could be required. For cases such as this report,
a simple git blame or git log will show the culprit. Although coding
that is not as simple as a human looking at the screen.

>  >  
>  > And I'm sure that I have missed a thing or two that could be 
>  > added as well. 
> 
> Please keep the feedback coming!

-- 
~Randy

