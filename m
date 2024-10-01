Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D698C073
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 16:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A5910E63C;
	Tue,  1 Oct 2024 14:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TqPVZv+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C1910E63C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 14:41:43 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso55885421fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727793702; x=1728398502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrh20PeToyIPNysilQWHip8q02mKnqO1PSLwm2b+JaM=;
 b=TqPVZv+slaDUJfYV2iUJEv4UDOv4ETPggwTCqKuB0NgR3x07gi7LKVclqmJMLF3S1y
 /oFS7YRVsQMz3xtGG7wJsoHo+tcqCT6hYN7Ri/oXz3SSuaCT8y8jPm5yBDX8p/NX0ygA
 XAzs8qv1TvwhyrjFZVedJEYhrjiGUG0FzB1elHHCowaBP7KDFu/oPhwO5Jl4zDOoSyBL
 YA7tb6r9xsoGDaf/uwkkcFhIQUmD6gp0bMf1EOErvJGlwtUf2Qe6YglVcTlBJDvyJ+pX
 zndgyK1zv9ntLAOzddqmv/v1GAkcIHdXkKww7oMmUGIfCEmMSHsNx00uLA/4YwfRe5t8
 oSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727793702; x=1728398502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rrh20PeToyIPNysilQWHip8q02mKnqO1PSLwm2b+JaM=;
 b=DXm43PoaTyIu0iZnq1Od8w4maKlKQQcxC2/33p039vMWMh7NAzYijwAnrMB3MMVwHu
 AFQbcChrje7IrUvGbBrr8bkBLy6mnI0g9EZk1vE7SbNIg+Bc0DwwB32nMGu3TG5ZKUO3
 s9YYLEIoBJBkwQyOvrINK2wtyc/SHfAklVoxjBJuBB2Szuuw0QfVC8awKL9/dvEJ3ImG
 8GCJ7lZLuWTzv0XXAsKTs+vdCHOh6tGp5Rif58gQFNGQ3ZXbNC+9ueOKDRf2AQds8+Cs
 8BkM9LX58z5+Ir5FiIwWcigHQeOKbQFuqfm2p6x9gJwuqGzf/49OvMOnEIknLUai1xJ5
 y72g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6wWoLhus7Qa6K14F3weeJxYjWXRHvXOoup/r+EMrJNfwbR2r9/VgXwITMV5lhoMdxmHfy8NEp9AU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsrKXiuQHBhVHSMHt6UIX5r0LqceHe+7h3Vd7ij8iJieX3IvNi
 eGt7X2x+LdMueIr3G0O6Mo0ya/2dFFMzST1gndeXcx3W6LY+GcOFqvfJ3U2a2QNzZXVMpwe4C0t
 4ejzvCar1S39UTu8wf2GFjJKw8fY=
X-Google-Smtp-Source: AGHT+IGGc8gFzH9smhq1yHsyHZ6ILkQdCoDDu18smqyOkfE6ES4TV04TjFUCC312UA1bqmbO3KHvY4d1RlzSJvLveJg=
X-Received: by 2002:a2e:bc1c:0:b0:2fa:bd56:98c5 with SMTP id
 38308e7fff4ca-2fabd569ad2mr93536981fa.33.1727793701631; Tue, 01 Oct 2024
 07:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
 <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de>
 <CANyH0kBnWZMZCG7K9vGt2a8Svr30U=PVOwrhwn-Q-CN9PZc=Sw@mail.gmail.com>
 <77d49375-8eac-45cf-83b7-c3334ed6d665@csgroup.eu>
In-Reply-To: <77d49375-8eac-45cf-83b7-c3334ed6d665@csgroup.eu>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Tue, 1 Oct 2024 22:41:28 +0800
Message-ID: <CANyH0kCRE93EZhL1xvBiHOG63TavUKm3ZphZ3y5_=qYmbeHj4w@mail.gmail.com>
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Alex Deucher <alexdeucher@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, 
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>,
 hypexed@yahoo.com.au, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
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

I will look into this and get back to you. Thank you.


On Tue, Oct 1, 2024 at 8:23=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi All,
>
> Le 01/10/2024 =C3=A0 14:09, Hoi Pok Wu a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de wuhoipok@gmail.com. D=C3=
=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutSend=
erIdentification ]
> >
> > Hi Thomas,
> >
> > Could you help on this issue?
> > I do not have access to the hardware now.
> > Thank you.
>
> The OOPS is from function drm_dp_aux_register(), exactly here below:
>
> static inline const char *dev_name(const struct device *dev)
> {
>         /* Use the init name until the kobject becomes available */
>         if (dev->init_name)
>
>      1ae0:      e8 89 00 50     ld      r4,80(r9)
>
>
> As you see in registers dump, r9 register is NULL. That's dev which is NU=
LL:
>
> GPR00: c0000000005b74f0 c0000000800daf10 c0000000015a3600 c00000008033f7e=
c
> GPR04: 0000000000000000 c000000001908f18 c000000080460c80 ffffffffc0c0c0c=
0
> GPR08: c000000080f74008 0000000000000000 0000000000000003 c000000080f7400=
8
> GPR12: 0000000048000828 c00000003fffeac0 0000000000000003 000000000100000=
0
> GPR16: c0000000804eaeca 0000000000000013 0000000000003113 000000000000000=
0
> GPR20: 0000000000000008 c0000000800db208 000000000000000a c0000000014d686=
8
> GPR24: 0000000000000000 0000000000000001 c0000000800db29c c0000000800db25=
0
> GPR28: c000000080bd8040 0000000000000001 c000000080f74000 c00000008033f4a=
0
>
> Full dump below:
>
> 0000000000001a5c <drm_dp_aux_register>:
> {
>      1a5c:      3c 4c 00 00     addis   r2,r12,0
>                         1a5e: R_PPC64_REL16_HA  .TOC.+0x2
>      1a60:      38 42 00 00     addi    r2,r2,0
>                         1a62: R_PPC64_REL16_LO  .TOC.+0x6
>      1a64:      7c 08 02 a6     mflr    r0
>      1a68:      fb e1 ff f8     std     r31,-8(r1)
>      1a6c:      f8 01 00 10     std     r0,16(r1)
>      1a70:      7c 7f 1b 78     mr      r31,r3
>      1a74:      f8 21 ff d1     stdu    r1,-48(r1)
>         WARN_ON_ONCE(!aux->drm_dev);
>      1a78:      e9 23 03 38     ld      r9,824(r3)
>      1a7c:      2f a9 00 00     cmpdi   cr7,r9,0
>      1a80:      41 de 00 90     beq-    cr7,1b10 <drm_dp_aux_register+0xb=
4>
>         if (!aux->ddc.algo)
>      1a84:      e9 3f 00 18     ld      r9,24(r31)
>      1a88:      2f a9 00 00     cmpdi   cr7,r9,0
>      1a8c:      41 de 00 74     beq-    cr7,1b00 <drm_dp_aux_register+0xa=
4>
>         strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev)=
,
>      1a90:      e8 9f 00 00     ld      r4,0(r31)
>         aux->ddc.owner =3D THIS_MODULE;
>      1a94:      39 40 00 00     li      r10,0
>         aux->ddc.dev.parent =3D aux->dev;
>      1a98:      e9 3f 03 30     ld      r9,816(r31)
>         strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev)=
,
>      1a9c:      38 7f 02 74     addi    r3,r31,628
>         aux->ddc.owner =3D THIS_MODULE;
>      1aa0:      f9 5f 00 08     std     r10,8(r31)
>         strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev)=
,
>      1aa4:      2f a4 00 00     cmpdi   cr7,r4,0
>         aux->ddc.dev.parent =3D aux->dev;
>      1aa8:      f9 3f 00 b8     std     r9,184(r31)
>         strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev)=
,
>      1aac:      41 de 00 34     beq-    cr7,1ae0 <drm_dp_aux_register+0x8=
4>
>      1ab0:      38 a0 00 30     li      r5,48
>      1ab4:      48 00 00 01     bl      1ab4 <drm_dp_aux_register+0x58>
>                         1ab4: R_PPC64_REL24     sized_strscpy
>      1ab8:      60 00 00 00     nop
>         ret =3D i2c_add_adapter(&aux->ddc);
>      1abc:      38 7f 00 08     addi    r3,r31,8
>      1ac0:      48 00 00 01     bl      1ac0 <drm_dp_aux_register+0x64>
>                         1ac0: R_PPC64_REL24     i2c_add_adapter
>      1ac4:      60 00 00 00     nop
> }
>      1ac8:      38 21 00 30     addi    r1,r1,48
>      1acc:      e8 01 00 10     ld      r0,16(r1)
>      1ad0:      eb e1 ff f8     ld      r31,-8(r1)
>      1ad4:      7c 08 03 a6     mtlr    r0
>      1ad8:      4e 80 00 20     blr
>      1adc:      60 00 00 00     nop
>   * Return: The kobject name of the device, or its initial name if
> unavailable.
>   */
> static inline const char *dev_name(const struct device *dev)
> {
>         /* Use the init name until the kobject becomes available */
>         if (dev->init_name)
>      1ae0:      e8 89 00 50     ld      r4,80(r9)
>      1ae4:      2f a4 00 00     cmpdi   cr7,r4,0
>      1ae8:      40 fe ff c8     bne+    cr7,1ab0 <drm_dp_aux_register+0x5=
4>
>                 return dev->init_name;
>
>         return kobject_name(&dev->kobj);
>      1aec:      e8 89 00 00     ld      r4,0(r9)
>      1af0:      4b ff ff c0     b       1ab0 <drm_dp_aux_register+0x54>
>      1af4:      60 00 00 00     nop
>      1af8:      60 00 00 00     nop
>      1afc:      60 00 00 00     nop
>                 drm_dp_aux_init(aux);
>      1b00:      7f e3 fb 78     mr      r3,r31
>      1b04:      48 00 00 01     bl      1b04 <drm_dp_aux_register+0xa8>
>                         1b04: R_PPC64_REL24     drm_dp_aux_init
>      1b08:      4b ff ff 88     b       1a90 <drm_dp_aux_register+0x34>
>      1b0c:      60 00 00 00     nop
>         WARN_ON_ONCE(!aux->drm_dev);
>      1b10:      0f e0 00 00     twui    r0,0
>      1b14:      4b ff ff 70     b       1a84 <drm_dp_aux_register+0x28>
>
>
>
> >
> > Regards,
> > Wu Hoi Pok
> >
> >
> > On Tue, Oct 1, 2024 at 12:26=E2=80=AFPM Christian Zigotzky
> > <chzigotzky@xenosoft.de> wrote:
> >>
> >> On 30 September 2024 3:27pm, Alex Deucher <alexdeucher@gmail.com> wrot=
e:
> >>
> >> =EF=BB=BF+ Wu Hoi Pok
> >>
> >> This is likely related to the drm device rework.
> >>
> >> Alex
> >>
> >> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
> >>
> >> Hi All,
> >>
> >> I was able to revert the drm-next-2024-09-19 updates for the RC1 of ke=
rnel 6.12.
> >>
> >> This kernel works on all machines without any problems.
> >>
> >> This means, the new Radeon DRM driver is unreliable after the DRM rewo=
rk.
> >>
> >> Please fix this issue because we can=E2=80=99t deliver the kernels wit=
h the new Radeon DRM driver.
> >>
> >> Error log: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.xenosoft.de%2FPuTTY_P5040_U-Boot.log&data=3D05%7C02%7Cchristop=
he.leroy%40csgroup.eu%7C9b40f906e2f2493cb25908dce211ee23%7C8b87af7d86474dc7=
8df45f69a2011bb5%7C0%7C0%7C638633814783011669%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C60000%7C%7C=
%7C&sdata=3DfgAj0osIOyJtNrzUKp%2Bpq0NN1sGW2bqGm8nXYj88Ne0%3D&reserved=3D0
> >>
> >> Thanks,
> >> Christian
