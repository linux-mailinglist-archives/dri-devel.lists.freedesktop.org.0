Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F0956C43
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 15:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4564D10E272;
	Mon, 19 Aug 2024 13:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DUBo3j1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D24810E272
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724074622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Py1nKUzAfM/OTvIy7L2sYTr0+ohPDjRTycpz1UnhWhw=;
 b=DUBo3j1jjylzFM0VpwcFWueQNz8TR8nySZvMDlARC9X6OtHh5sXqQhjAWuruu9G5ViYWpo
 u+pfLzDGCKKOkHGcMq7PMXxUGfWvZ6KNFXRcPG0RQCQbQtXrETm/wLowRSMJ1R6RMYMhHn
 nTh3SGCmRCxyu4KVgJsZRzJitPyBkOI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-xY0N3K4_Nr6lE3X6Cuz0Yw-1; Mon, 19 Aug 2024 09:36:57 -0400
X-MC-Unique: xY0N3K4_Nr6lE3X6Cuz0Yw-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3db2017a251so3915841b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 06:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724074615; x=1724679415;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/iJNM2H0Bn+mH5epT+OXY9z51A/PXnyvIAFT4yJMBs=;
 b=bUwxevhfnsaC5tDW2xbXTmbe4jBQhQ11YacPwYdH/Opnsb2FOOb8MIPmRmphYiu5dX
 5FCY+c+dGdFnmvIctYCpmkCGVSSLiPFpumOgjojVjQTh+rtL0pGxxggREWZF41LRcrq/
 NtTRfM5ssB2/szLg7UPusRyS1p5Irxhi2R8/9dvLGtKbnU5uRnfnYEpoYeTd04NoHug4
 H+OpBtkoPcQroVTZQbkN/EpB9LpCazxabqyilFmBHxEWti+GnuFEfl0+b2toiYvGePLs
 Zn3YQjDEC6tKC9Z4+TgD/B+r2k0skTr55Up+LOgz03d5DkpivvGlv6vC2WWOfx6xofFw
 Xx3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSzvRs19GAPInSG6gZ4lzjKT/ajA4QBxiQPZMFoi3H2okDPVVDxR/QqbzRfN505bL/wq7fzEWs7Iu3XTC9eOvfR7BqjFFQVrS+LoFFKp9p
X-Gm-Message-State: AOJu0YyKnu5DgjRYldKIFOWnQ1y3DuDLAr428tIjmcN0mBK/KkG3SV1Z
 Kigryua1u6GCgNVuHPmH18MwpZsYUxs/Bxt7K1PYiobLb+42WuFW7rz4A1euH+9w31ox7TjtEeK
 ugrCiyoOQzLm2W0vRt9mK1bo1HE/HDkNsog+luZ/zCkTY6yPI9hwZJxfBwUnrJqGOuw==
X-Received: by 2002:a05:6808:148a:b0:3da:e219:bf with SMTP id
 5614622812f47-3dd3ae320edmr14893359b6e.43.1724074615347; 
 Mon, 19 Aug 2024 06:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPpaKdjs9uyeLCpbyaYGw5neC/R9XgXicCaeDNO0oBOnU3UKv8pW+3H0tiVsMRwweNVZ2MzA==
X-Received: by 2002:a05:6808:148a:b0:3da:e219:bf with SMTP id
 5614622812f47-3dd3ae320edmr14893327b6e.43.1724074614976; 
 Mon, 19 Aug 2024 06:36:54 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61a6dcfsm6585022a12.7.2024.08.19.06.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 06:36:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexdeucher@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Helge Deller <deller@gmx.de>, Sam
 Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org
Subject: Re: [PATCH] video/aperture: match the pci device when calling
 sysfb_disable()
In-Reply-To: <8bbf3f92-3719-4ff4-9587-e076635758d1@suse.de>
References: <20240809150327.2485848-1-alexander.deucher@amd.com>
 <202408101951.tXyqYOzv-lkp@intel.com>
 <1c77f913-4707-4300-b84a-36fcf99942f4@suse.de>
 <CADnq5_NjCFyy+bQY+uyijcZwvwXYkvVLLUQdtzN_ODvHAj193Q@mail.gmail.com>
 <8bbf3f92-3719-4ff4-9587-e076635758d1@suse.de>
Date: Mon, 19 Aug 2024 15:36:51 +0200
Message-ID: <87frr0ljm4.fsf@minerva.mail-host-address-is-not-set>
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

Hello Alex and Thomas,

> Hi
>
> Am 16.08.24 um 22:57 schrieb Alex Deucher:
>> On Mon, Aug 12, 2024 at 8:10=E2=80=AFAM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
>>> Hi
>>>
>>> Am 10.08.24 um 13:44 schrieb kernel test robot:
>>>> Hi Alex,
>>>>
>>>> kernel test robot noticed the following build errors:
>>>>
>>>> [auto build test ERROR on drm-misc/drm-misc-next]
>>>> [also build test ERROR on linus/master v6.11-rc2 next-20240809]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a note=
.
>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>
>>>> url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Deucher/vi=
deo-aperture-match-the-pci-device-when-calling-sysfb_disable/20240810-02135=
7
>>>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>>> patch link:    https://lore.kernel.org/r/20240809150327.2485848-1-alex=
ander.deucher%40amd.com
>>>> patch subject: [PATCH] video/aperture: match the pci device when calli=
ng sysfb_disable()
>>>> config: csky-randconfig-001-20240810 (https://download.01.org/0day-ci/=
archive/20240810/202408101951.tXyqYOzv-lkp@intel.com/config)
>>>> compiler: csky-linux-gcc (GCC) 14.1.0
>>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20240810/202408101951.tXyqYOzv-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202408101951.tXyqYOzv-=
lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>      csky-linux-ld: drivers/video/aperture.o: in function `aperture_re=
move_conflicting_pci_devices':
>>>>>> aperture.c:(.text+0x222): undefined reference to `screen_info_pci_de=
v'
>>> Strange. There's a already placeholder [1] for architectures without
>>> PCI. Otherwise the source file is listed at [2].
>> So I dug into this, and the problem seems to be that
>> CONFIG_SCREEN_INFO is not defined in that config.  I can't figure out
>> how this should work in that case or why this is not a problem in
>> drivers/firmware/sysfb.c.
>>
>> Something like this works:
>> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
>> index 56a5a0bc2b1af..50e98210c9fe5 100644
>> --- a/drivers/video/aperture.c
>> +++ b/drivers/video/aperture.c
>> @@ -347,7 +347,9 @@ EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
>>    */
>>   int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
>> const char *name)
>>   {
>> +#if defined(CONFIG_SCREEN_INFO)
>>          struct screen_info *si =3D &screen_info;
>> +#endif
>>          bool primary =3D false;
>>          resource_size_t base, size;
>>          int bar, ret =3D 0;
>> @@ -355,8 +357,10 @@ int
>> aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
>> char *na
>>          if (pdev =3D=3D vga_default_device())
>>                  primary =3D true;
>>
>> +#if defined(CONFIG_SCREEN_INFO)
>>          if (pdev =3D=3D screen_info_pci_dev(si))
>>                  sysfb_disable();
>> +#endif
>>
>>          for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
>>                  if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>>
>> But that can't be the right fix...  Any ideas?
>
> Thanks for investigating. I'd say we should pass the device (pdev->dev)=
=20
> to sysfb_disable() and=C2=A0 do the test there. In sysfb.c, next to=20
> sysfb_disable(), you'll find sysfb_parent_dev(), which gives the Linux=20
> device of the screen_info.
>
> The code then looks something like this:
>
> sysfb_disable(struct device *dev)
> {
>  =C2=A0=C2=A0=C2=A0 if (dev && dev =3D=3D sysfb_parent_dev(screen_info))
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
>
>  =C2=A0 /* else do the current code */
> }
>
> there's an invocation of sysfb_disable() in drivers/of/platform.c where=
=20
> you can pass NULL.
>

Agreed. That sounds like the best approach.

> Best regards
> Thomas
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

