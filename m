Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308CA953F02
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 03:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1F910E548;
	Fri, 16 Aug 2024 01:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gIMmrrng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D441810E534;
 Fri, 16 Aug 2024 01:40:53 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so1906250a12.3; 
 Thu, 15 Aug 2024 18:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723772452; x=1724377252; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bRh/D8FV6YCWVNSyLYIhbO/5vjfzg+GdvjBEoJO6AfI=;
 b=gIMmrrngGo2FDmiUgxAaGvlolBuJc3mN1NQY57iU4miJ1uiIPtoU4ZtHHJNLFOUUfd
 RXmzGgWJpSUiQJ7bEHWxzOvW2pEXbzqyADa+Mqjrlr7d5hiVk3EKJ9aOAnekCZzTdSQB
 1E8UYcfL8k2d8s1+0+oq0APErb9/FLbASVLEvreY5+Um8Qf9g31zgEc15Z3seP0p8KtM
 2ULcKkmRHRQEpY4sUmqQjJWN9X8nG96oHEuTQUSrnxTBEnZA2auPCOu8xXmo3ecI6laj
 tfe4LLjT6u7VLvBYMVYk9hlrecjU7/rBZY2xio5fok3mXNg6GWYSpWhlT9sMASBQwVp9
 8VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723772452; x=1724377252;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bRh/D8FV6YCWVNSyLYIhbO/5vjfzg+GdvjBEoJO6AfI=;
 b=wJIBZNoVcFDVSkrCli9uhs4jnCXLgfCkwM0vrxwJgAkXjakO8B9ZQosGCy7sS/f/t3
 2Rb2XoUDGtPobXvpaQ1XbRxbxsjcqj0eMdK0Rd+FFWv51bTD8YouqunuNsGbv/nXcuyi
 CMHW+fLIoaFvCHR+SpmeO/hmbAadzReaMYTiQrCQq7Pbqzo2PaN0438A3hqUpkWFohBj
 i9fb0+ZqjqMnjBHSDORl0uzdmlajMwaapwmQ+myJMR6xpM4GLRLcmgLlmH1qPwbCznjc
 H/dE9HdHgTjUFsi7+zHi5waMf9dj/3nSQVKqHCoQK2XwiR//li3C1B1Ayhx7ibo/eSGV
 VFvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYEwOAKBiXV86tszSGfGNDgBnfysM8pJWlzyvNzDaVL8f1fLUkDPkBYPh8a3VwbfI7o1V+z52IQHoB8aqiDgA0zKNl+Lv6LpFoRpr94Q==
X-Gm-Message-State: AOJu0YxFXP75cBByNqy2PQ/cEOqCwYE4LrvTO4wWsUwjTr324XwUnqAb
 NsYRqfU0AxdbEgf9Z+7Thyk1Qh0cRxoaZgvZ9ku+j5Y904dnFv1enFzO+c02ehRamC76oENeDQl
 nF/md9M/kah/JbhvlA25qY6SvmkX8Cg==
X-Google-Smtp-Source: AGHT+IHyPtmRFygcPqPXenfhzuodNCCMoEWKqzze9avEOHJdcXeYcLTPbNNcXS3eU7nSfB4GYWDVZNUG56Kks3sq7WQ=
X-Received: by 2002:a17:907:e66a:b0:a7d:d1a6:d943 with SMTP id
 a640c23a62f3a-a8392956005mr94106566b.40.1723772451858; Thu, 15 Aug 2024
 18:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240815201923.632803-1-airlied@gmail.com>
 <Zr6jEY1L0Cv3FIOt@cassiopeiae>
In-Reply-To: <Zr6jEY1L0Cv3FIOt@cassiopeiae>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Aug 2024 11:40:40 +1000
Message-ID: <CAPM=9txBkrhNvQvBHLUA-QKf8ufyywVMXonY9rwj21OUQmWTRg@mail.gmail.com>
Subject: Re: [PATCH] nouveau/firmware: using dma non-coherent interfaces for
 fw loading. (v2)
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 16 Aug 2024 at 10:53, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Fri, Aug 16, 2024 at 06:19:23AM +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > Currently, enabling SG_DEBUG in the kernel will cause nouveau to hit a
> > BUG() on startup, when the iommu is enabled:
> >
> > kernel BUG at include/linux/scatterlist.h:187!
> > invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> > CPU: 7 PID: 930 Comm: (udev-worker) Not tainted 6.9.0-rc3Lyude-Test+ #30
> > Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BIOS 1.I0 01/22/2019
> > RIP: 0010:sg_init_one+0x85/0xa0
> > Code: 69 88 32 01 83 e1 03 f6 c3 03 75 20 a8 01 75 1e 48 09 cb 41 89 54
> > 24 08 49 89 1c 24 41 89 6c 24 0c 5b 5d 41 5c e9 7b b9 88 00 <0f> 0b 0f 0b
> > 0f 0b 48 8b 05 5e 46 9a 01 eb b2 66 66 2e 0f 1f 84 00
> > RSP: 0018:ffffa776017bf6a0 EFLAGS: 00010246
> > RAX: 0000000000000000 RBX: ffffa77600d87000 RCX: 000000000000002b
> > RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffffa77680d87000
> > RBP: 000000000000e000 R08: 0000000000000000 R09: 0000000000000000
> > R10: ffff98f4c46aa508 R11: 0000000000000000 R12: ffff98f4c46aa508
> > R13: ffff98f4c46aa008 R14: ffffa77600d4a000 R15: ffffa77600d4a018
> > FS:  00007feeb5aae980(0000) GS:ffff98f5c4dc0000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007f22cb9a4520 CR3: 00000001043ba000 CR4: 00000000003506f0
> > Call Trace:
> >  <TASK>
> >  ? die+0x36/0x90
> >  ? do_trap+0xdd/0x100
> >  ? sg_init_one+0x85/0xa0
> >  ? do_error_trap+0x65/0x80
> >  ? sg_init_one+0x85/0xa0
> >  ? exc_invalid_op+0x50/0x70
> >  ? sg_init_one+0x85/0xa0
> >  ? asm_exc_invalid_op+0x1a/0x20
> >  ? sg_init_one+0x85/0xa0
> >  nvkm_firmware_ctor+0x14a/0x250 [nouveau]
> >  nvkm_falcon_fw_ctor+0x42/0x70 [nouveau]
> >  ga102_gsp_booter_ctor+0xb4/0x1a0 [nouveau]
> >  r535_gsp_oneinit+0xb3/0x15f0 [nouveau]
> >  ? srso_return_thunk+0x5/0x5f
> >  ? srso_return_thunk+0x5/0x5f
> >  ? nvkm_udevice_new+0x95/0x140 [nouveau]
> >  ? srso_return_thunk+0x5/0x5f
> >  ? srso_return_thunk+0x5/0x5f
> >  ? ktime_get+0x47/0xb0
> >
> > Fix this by using the non-coherent allocator instead, I think there
> > might be a better answer to this, but it involve ripping up some of
> > APIs using sg lists.
> >
> > v2: fix build warning
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > Cc: stable@vger.kernel.org
>
> Does this need the following fixes tag?
>
> Fixes: 2541626cfb79 ("drm/nouveau/acr: use common falcon HS FW code for ACR FWs")

Please add that on commit, it's probably not that necessary since I
expect prior to that things are just broken in a different place, but
probably good to have a backport target.

Dave.
