Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731A1BE295D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04DC10E98D;
	Thu, 16 Oct 2025 09:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=gus@collabora.com header.b="JOCdKZjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5605D10E999
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 09:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760608768; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UPQ+aBY94US7ij1tO9uyyLy+BbQVyKqTekj1jpsjWfL1A25b2i9Dzlis52ArtMqcmYs3EmEypYleJkX3AiMnKRmwQrde0TYuqI5haONAm1ww2sC+pXN4N5GSmwyRz33A/GrdHtxXjhwTMFDQlIg71VXHTkhvVlCJ9FoXqjVW/tA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760608768;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CVJ7y67b8YKm3o8RTHQrQS1h70ifhx7DfX3PMdznC1M=; 
 b=JZkla3npPJIjv6/21LNKCPZ/SK0vahuWZ71eWmhgz3Hbb5C1NvN89sPjaQrixJ2caU5o9+XfroTldT0mI0CmL57VRQTHmV5EEo1X36Rhocp2xWrspnmKgeQQZLct3LeRNv0y5sRsQi+egwHtPQAxkgZxgUkNqmEgKTihSKiTZFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=gus@collabora.com;
 dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760608768; 
 s=zohomail; d=collabora.com; i=gus@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CVJ7y67b8YKm3o8RTHQrQS1h70ifhx7DfX3PMdznC1M=;
 b=JOCdKZjMjN79GRhasfc7d4Hr17q8Zu10Yas+F2oSIiIvC131SZx2nE3poO8VSmt1
 ebUi69gktLf6u8iMEaSmCY3QHTNPf4gUy6/BSX1PDvC0jNnjv+tOfanJN7iTZLTRQwv
 5NiOhr80cQCQdzGpOKqOquWsNJ2LF+rolZlvDZQU=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1760608767219157.4044678793631;
 Thu, 16 Oct 2025 02:59:27 -0700 (PDT)
Date: Thu, 16 Oct 2025 06:59:27 -0300
From: Gustavo Padovan <gus@collabora.com>
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: "kernelci" <kernelci@lists.linux.dev>,
 "kernelci-results" <kernelci-results@groups.io>,
 =?UTF-8?Q?=22Guido_G=C3=BCnther=22?= <agx@sigxcpu.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "phone-devel" <phone-devel@vger.kernel.org>,
 "regressions" <regressions@lists.linux.dev>,
 "linux-next" <linux-next@vger.kernel.org>
Message-ID: <199ec75cce1.3f69ac7c921986.1695662047481478034@collabora.com>
In-Reply-To: <73bf512e-fe5f-420c-8d47-eccfa079af99@infradead.org>
References: <176045034384.1788.868853922191153052@15dd6324cc71>
 <73bf512e-fe5f-420c-8d47-eccfa079af99@infradead.org>
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `devm_backlight_device_register' in vmlinux...
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

Hi Randy,


---- On Thu, 16 Oct 2025 00:47:35 -0300 Randy Dunlap <rdunlap@infradead.org> wrote ---

 > Guido, 
 >  
 > Looks like this driver needs 
 >  
 > +    depends on BACKLIGHT_CLASS_DEVICE 
 >  
 > to fix the build. 
 >  
 > @Gus- please read comments near bottom/end. 
 >  
 >  
 > On 10/14/25 6:59 AM, KernelCI bot wrote: 
 > > 
 > > 
 > > 
 > > 
 > > Hello, 
 > > 
 > > New build issue found on next/master: 
 > > 
 > > --- 
 > >  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error] 
 > > --- 
 > > 
 > > - dashboard: https://d.kernelci.org/i/maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 
 > > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
 > > - commit HEAD:  13863a59e410cab46d26751941980dc8f088b9b3 
 > > - tags: next-20251014 
 > > 
 > > 
 > > Log excerpt: 
 > > ===================================================== 
 > >   LD      .tmp_vmlinux1 
 > > aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected! 
 > > aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected! 
 > > aarch64-linux-gnu-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_create_backlight': 
 > > /tmp/kci/linux/drivers/gpu/drm/panel/panel-visionox-rm69299.c:343: undefined reference to `devm_backlight_device_register' 
 > > 
 > > ===================================================== 
 > > 
 > > 
 > > # Builds where the incident occurred: 
 > > 
 > > ## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-16k_pages-68ee4f14a6dc7c71db9fda21/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f14a6dc7c71db9fda21 
 > > 
 > > ## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-64k_pages-68ee4f17a6dc7c71db9fda24/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f17a6dc7c71db9fda24 
 > > 
 > > ## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-mainline-big_endian-68ee4f32a6dc7c71db9fda39/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f32a6dc7c71db9fda39 
 > > 
 > > ## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-randomize-68ee4f1fa6dc7c71db9fda2a/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f1fa6dc7c71db9fda2a 
 > > 
 > > ## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-chromebook-kcidebug-68ee4f2ba6dc7c71db9fda33/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f2ba6dc7c71db9fda33 
 > > 
 > > ## defconfig+arm64-chromebook+kselftest on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-kselftest-16k_pages-68ee4f23a6dc7c71db9fda2d/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f23a6dc7c71db9fda2d 
 > > 
 > > ## defconfig+arm64-chromebook+preempt_rt on (arm64): 
 > > - compiler: gcc-12 
 > > - config: https://files.kernelci.org/kbuild-gcc-12-arm64-preempt_rt_chromebook-68ee4f3aa6dc7c71db9fda3f/.config 
 > > - dashboard: https://d.kernelci.org/build/maestro:68ee4f3aa6dc7c71db9fda3f 
 > > 
 > > 
 > > #kernelci issue maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 
 > > 
 > > Reported-by: kernelci.org bot <bot@kernelci.org> 
 > > 
 > > -- 
 > > This is an experimental report format. Please send feedback in! 
 > > Talk to us at kernelci@lists.linux.dev 
 > > 
 > > Made with love by the KernelCI team - https://kernelci.org 
 > > 
 >  
 > Gus, the CI reporter needs to learn how to do a few things because developers 
 > (other than me ?) don't scrounge mailing lists to look for problems. 

Absolutely. Our goal is to automate as many steps as possible!
 
 > a. find the commit that caused the problem (or the email series) 
 >  
 > b. send the report (Cc:) to whoever wrote the patch and to the 
 > appropriate mailing list. 
 >  
 > I expect that b. is easier than a., so do it first. 

b. is easier that a. yes, but I don't think we can do it first because we
need to figure the patch first. Essentially, you are asking us for
build bisections. Something that is already on our roadmap, but
we didn't had the time to tackle yet, but should come to it in the
coming months.

 >  
 > And I'm sure that I have missed a thing or two that could be 
 > added as well. 

Please keep the feedback coming!

Best,

- Gus

