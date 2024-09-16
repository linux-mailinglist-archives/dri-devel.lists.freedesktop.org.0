Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9379979E39
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD72210E31E;
	Mon, 16 Sep 2024 09:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JpPs063m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2120610E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726478274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4y4nz5Nv7wOUIE0PuGjkvUmulAldY5WgyA0UlbnwHA=;
 b=JpPs063mWMpAQ2Jg1tFq/sVJeDeIcosmCxEWhJWUAI1MWWF2j9W/KxwQJ5XJtFXkGvfyYF
 nVrPYmbCcS5w5/8aEQ7JbGCU5d+WowFZypN0bOiAUEtfnyOztmiOvmWTLPvYknVJt3iK8s
 x7cDTaOccMi16DnVQ2t+CxU+CKvxQqU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-1DTCpm03MsKU-ov6JxSoyg-1; Mon, 16 Sep 2024 05:17:52 -0400
X-MC-Unique: 1DTCpm03MsKU-ov6JxSoyg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c9b0daf3so1069694f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 02:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726478271; x=1727083071;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZlUpJD1u2D4y829v0MZ+38o7vNfH4MDWrJrr43iAOo=;
 b=RM9LB1fCam4jSgmok2o5fOecR6rIlWcuk2mlKafT+P1UYn67M3LYtPu8P3iHdkGHYH
 szX4srxxNFekofkdDM77HecmHYWB5nYLKJ185HRKh/GuR5RNVtxCRpNt1dC1wqCNwr7S
 88PyYUa/GX++N41w/MuUkkuYT6WjClGfeFWtOJ10fAMZysRZjWAYTyeEJLqbZRFwkwEi
 pp5GKrlvTddgyuMhvzSsC9/a4sXOu25C0C+3Ei4Y3I1vfv+s+qTmjjZ3LyiIEtAYOjqY
 SbxpJv+GOYE2LBW56PDTvIC2oqAhmWBSxWKSvbpuBgHV7VpU6VlODnqjoforHpGbE6Le
 LfKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3/ccAl+dmaR7eOhcygo7Fot+vzoj6YTsng77zpxCtB0nppb9XQE7zveT9fgvESPMSQ2Qz72LfcPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE+7Hl70+H5uQR25yWdd/URxBEDuiWS1Zdbw9moKyYxNFWv56L
 faiccYmi4F0mmznjPoOcJUakk6MsD/7cRbZztdi92eaWJNGrFr3pRZtCWxXDg0jYJpdAVkasynZ
 /iTLOiToEQ6V8vM6XID21rY+MN3B2/USzNZoXjHeenvTfm0Dg/tyR7qteGHT9lFGrwg==
X-Received: by 2002:a05:6000:459a:b0:374:c87c:6653 with SMTP id
 ffacd0b85a97d-378d625d1bcmr5180011f8f.59.1726478271528; 
 Mon, 16 Sep 2024 02:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr/amHL1g9g9bIGYoMJCQHZMKTHGf7MVVMg5YL/dVBytjGa9ZBq7SHyvot4r13prMJmLQeqg==
X-Received: by 2002:a05:6000:459a:b0:374:c87c:6653 with SMTP id
 ffacd0b85a97d-378d625d1bcmr5179986f8f.59.1726478270844; 
 Mon, 16 Sep 2024 02:17:50 -0700 (PDT)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e71ed08esm6763307f8f.4.2024.09.16.02.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 02:17:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot
 <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Julius Werner
 <jwerner@chromium.org>, Hugues Bruant <hugues.bruant@gmail.com>,
 intel-gfx@lists.freedesktop.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v3] firmware: coreboot: Don't register a pdev if
 screen_info data is present
In-Reply-To: <a6a994b0-5021-49e5-b853-a1b2abe3af2f@suse.de>
References: <20240913213246.1549213-1-javierm@redhat.com>
 <202409151528.CIWZRPBq-lkp@intel.com>
 <eeac1c3c-4a21-4cd5-b513-8e55cffe0bae@suse.de>
 <8734m0atbu.fsf@minerva.mail-host-address-is-not-set>
 <a6a994b0-5021-49e5-b853-a1b2abe3af2f@suse.de>
Date: Mon, 16 Sep 2024 11:17:49 +0200
Message-ID: <875xqwufcy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 16.09.24 um 10:36 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas and Tzung-Bi,
>>
>>> Hi
>>>
>>> Am 15.09.24 um 09:44 schrieb kernel test robot:
>>>> Hi Javier,
>>>>
>>>> kernel test robot noticed the following build errors:
>>>>
>>>> [auto build test ERROR on chrome-platform/for-next]
>>>> [also build test ERROR on chrome-platform/for-firmware-next linus/mast=
er v6.11-rc7 next-20240913]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a note=
.
>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>
>>>> url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez=
-Canillas/firmware-coreboot-Don-t-register-a-pdev-if-screen_info-data-is-pr=
esent/20240914-053323
>>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platfor=
m/linux.git for-next
>>>> patch link:    https://lore.kernel.org/r/20240913213246.1549213-1-javi=
erm%40redhat.com
>>>> patch subject: [PATCH v3] firmware: coreboot: Don't register a pdev if=
 screen_info data is present
>>>> config: riscv-randconfig-001-20240915 (https://download.01.org/0day-ci=
/archive/20240915/202409151528.CIWZRPBq-lkp@intel.com/config)
>>>> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8=
dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
>>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20240915/202409151528.CIWZRPBq-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202409151528.CIWZRPBq-=
lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>>> ld.lld: error: undefined symbol: screen_info
>>>>      >>> referenced by framebuffer-coreboot.c:27 (drivers/firmware/goo=
gle/framebuffer-coreboot.c:27)
>>>>      >>>               drivers/firmware/google/framebuffer-coreboot.o:=
(framebuffer_probe) in archive vmlinux.a
>>>>      >>> referenced by framebuffer-coreboot.c:27 (drivers/firmware/goo=
gle/framebuffer-coreboot.c:27)
>>>>      >>>               drivers/firmware/google/framebuffer-coreboot.o:=
(framebuffer_probe) in archive vmlinux.a
>>> Not all platforms define screen_info. Maybe fix this by following
>> Yes, after reading the build errors reported by the robot I remembered
>> that we had similar issues with sysfb, for example commit 1260b9a7020
>> ("drivers/firmware: fix SYSFB depends to prevent build failures") fixed
>> one of those.
>>
>>> Tzung-Bi's advice of removing the local variables and then guard the
>>> test by CONFIG_SYSFB. If SYSFB has been defined, screen_info has to be
>>> there. It's not a super pretty solution, though.
>>>
>> If possible I would prefer to avoid the ifdefery in the driver. I also
>> believe that the local variables makes the code easier to read. But if
>> you folks think that's better to drop them, I can do it in the next rev.
>>
>> Another option is to restrict the architectures where this driver could
>> be build. As far as I understand it is mainly for x86 and ARM64 arches.
>>
>> These two have a screen_info defined so the driver will build correctly.
>> I can include a preparatory patch that adds a "depends on x86 || ARM64".
>
> That feels arbitrary, as the dependency is not really in coreboot, but=20
> in sysbf. What you'd want is a HAVE_SCREEN_INFO define on the=20
> architectures that provide it. IIRC earlier attempts to add this have=20
> failed. :/
>
> If you don't want the ifdef-ery in coreboot.c, you could add a helper to=
=20
> sysfb. Let's say
>
>  =C2=A0 bool sysfb_handles_screen_info(void)
>
> returns the result of the test. If you put it next to sysfb_disable(),=20
> you could add an empty wrapper into the sysfb.h header as well. [1]
>
> (There's still the possibility that screen_info is available, but sysfb=
=20
> has been disabled. But that's not different from how it currently works.)
>

I like that. And when SYSFB is not enabled, sysfb_handles_screen_info()
could just be defined as "return false;" which will indicate to drivers
that would have to handle the system frambuffer themselves.

I'll try to type the patches later today.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

