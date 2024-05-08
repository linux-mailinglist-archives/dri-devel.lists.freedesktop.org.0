Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E28BF650
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 08:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECEE112819;
	Wed,  8 May 2024 06:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C0Qz1h2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0211130BB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 04:01:37 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-23db0b5dd28so2684495fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 21:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715140896; x=1715745696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+w9bVyptRG2mM4nJ0QEwgO6GkJB8d7uOJxZbUEs7ko=;
 b=C0Qz1h2cCzB2I8PNmDpFwXGRm4Xzvg0dLr+jWMTLdhKXUVYmD5xfUp0TFXdxxvyvEM
 0D2/xJrY77RcRGUpuZ0N6DVJha92lEMZSHL9ygXAFTd1klLyD1ETa4rkP06mmbpLPrKe
 qUiThtuo/177mpuvJEgDzCTbJwKUIyzCTKRMK5dvHGIOJMUqBRmIz07a1Sy1UM+G/frm
 Lu3/HK2KggadudD6O8qS1sA/jI13yoVVQ7q2YvBfu9sBfOxBrMDzzAkf1lncMomg86kg
 2+6vs42WNNyDb7f994dQ5JANzwWl6IJRLOFm3nev/mgDCMsgVUmx4XPDPqElc2HmNIIH
 Dx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715140896; x=1715745696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+w9bVyptRG2mM4nJ0QEwgO6GkJB8d7uOJxZbUEs7ko=;
 b=WMnzj+jnc98bEJcn8Gi+C1r7Z5sxATREcTGEcX3fuj0zJbdW1QdO5yAMyGhJ87ZD+c
 t7gmndDlQAmp1of377ODkobFDmxqplqSt2DvhNkJEhkILpGJ0KA1QZSz+e3aTvVnN93b
 UeLuY5m/jOjKEERWZdtpn8+tn1gq6FwQWS6SfYTQgegcoedb9PjVrMVUFAOPO4SUQVb2
 jJMwxHGYNnExSdaQlCJjSlDYZ1Aj2qMy/MUncvQltOuvwHTEl5aFcO57waNkyUnA7yMP
 nQf1yKiHdXdBVxxVFwOLQcDxEDFSd4V+tOvLAgIsEtwRJy+t7Vax77g3z9d/RWwBK6n4
 cH9g==
X-Gm-Message-State: AOJu0Yz2wPGyi7ZdR419ziImYYZ02ilKymBlHjmD9zPT8e2lUagwfuwQ
 UAMFaRnC2J/A6PRRWK/+Fq8jVpsNGh2f08ziiuicCdHQgQnNhxJNuRM+66om/T5Zo2dl9jUQKZP
 ASo1OCJ+dYtYdrWl61SC1bRA9rphXUriPrQw=
X-Google-Smtp-Source: AGHT+IGMDf0985XPYpt4J5Ziij8dVEoK6JA1ElAz93ID/0BoC1njZ05XHJE475s3bs5/u1QhOU8EFba5ffWzK5xuHUg=
X-Received: by 2002:a05:6870:8552:b0:23c:bbe9:858 with SMTP id
 586e51a60fabf-2409809af32mr1749273fac.16.1715140896182; Tue, 07 May 2024
 21:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAG-UpRQ5Dp4sO2CBTiOpBtjZoRj4U2rNxAwSbari+VcqvayuSQ@mail.gmail.com>
 <CAK7LNASSrB_L7VbS1z3O6QuMf0nti1hGJVwip7RRF_-=jn2OHw@mail.gmail.com>
In-Reply-To: <CAK7LNASSrB_L7VbS1z3O6QuMf0nti1hGJVwip7RRF_-=jn2OHw@mail.gmail.com>
From: Henry Wu <triangletrap12@gmail.com>
Date: Wed, 8 May 2024 12:01:22 +0800
Message-ID: <CAG-UpRQQU4ksYGZUM0kZPK0C02VWKqnA_Jokxb_208RRXMhDRQ@mail.gmail.com>
Subject: Re: A link error related to DRM and fbdev
To: dri-devel@lists.freedesktop.org
Cc: linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 08 May 2024 06:34:39 +0000
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

Thanks for your reply. I will communicate with member of dri-devel further.

I tried to reproduce this issue on master branch and there was no link erro=
r:

...
  CC      arch/x86/boot/compressed/efi.o
  AS      arch/x86/boot/compressed/efi_mixed.o
  CC      arch/x86/boot/compressed/misc.o
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)
$ cat .config | grep 'CONFIG_DRM_KMS\|CONFIG_FB\b\|FBDEV_EMUL'
CONFIG_DRM_KMS_HELPER=3Dy
CONFIG_DRM_FBDEV_EMULATION=3Dy
CONFIG_FB=3Dm
$

In the attachments you can find two ".config".
kernel_config_515y_failed is used on branch 5.15.y (tag 5.15.157) and
kernel_config_master_succeed is what I used for master branch.

Masahiro Yamada <masahiroy@kernel.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=887=E6=
=97=A5=E5=91=A8=E4=BA=8C 23:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Fw: DRM list
>
> On Mon, May 6, 2024 at 2:53=E2=80=AFPM Henry Wu <triangletrap12@gmail.com=
> wrote:
> >
> > Hi, all.
> >
> > I found a link error related to DRM and fbdev on branch linux-5.15.y
> > (tag v5.15.157). It has same phenomenon with
> > https://lore.kernel.org/all/202303150232.MBonYhiv-lkp@intel.com/.
> >
> > I tried to investigate this issue and found that build will fail if
> > CONFIG_FB=3Dm and it will succeed if CONFIG_FB=3Dy.
> >
> > [user@localhost linux]$ cat .config | grep
> > 'CONFIG_DRM_KMS\|CONFIG_FB\b\|FBDEV_EMUL'
> > CONFIG_DRM_KMS_HELPER=3Dy
> > CONFIG_DRM_FBDEV_EMULATION=3Dy
> > CONFIG_FB=3Dm
> > [user@localhost linux]$
> >
> > I'm not familiar with kbuild. Can anyone troubleshoot it further? You
> > can find .config from attachment.
>
>
> I do not have time to take a look at every build error,
> but somebody in the DRM list may help you.
>
>
>
> --
> Best Regards
> Masahiro Yamada
