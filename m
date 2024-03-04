Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48431870ADB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820E210E6A4;
	Mon,  4 Mar 2024 19:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gFJ7Lelu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9194110E6A4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:44:37 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-42e6939d34fso69271cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 11:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709581476; x=1710186276;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJziShSE5N9NFf9GEp25onUfKHjDILdb8pau9PDQq4s=;
 b=gFJ7LeluZLHYvDFXw8BDITKvhBy1xL17hWFI8C7CXz1dJB2j9BhDTsi8PyaLD5tU1Z
 i/v/39wo4WRUnxYBLnM5p7r2XcjK17kUHvCV6l3aFIv0GJHqzyolWEwa3i/z9VirM6lU
 QwiG03YhrrJxsgs2GxfFJIzNVDOo7TqR+zfRhFdYMknmpxqWqeQjNj0HVI0YhiT93OL6
 yo9zZ9qVx0HqkOnHKiCF5FiVWFRuFTrgXMJh0qPmaYXldzAvsQ7L2WrW+Y6RWhEBaotN
 s3Yh7z2ld6JCNkhgZK/qfZLr6BwbgOqnogSGQ/uVPh3paO4jMX4rVIsPc6RS3+AEp5yI
 SxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709581476; x=1710186276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJziShSE5N9NFf9GEp25onUfKHjDILdb8pau9PDQq4s=;
 b=XWW5ZZm7GuIHWlSd3XJfdA7iz8LQx355HNI1sQpE/O6xOXJVlZArDRU1di7LJzW5qq
 m2keLIjvpw6dbcjWUb/SKZ7Eh0wHvIf/O46EsmPwlcwgRiaFBZgdyq+CuZuf+Hsqluae
 4Zxvk3/0BxTUoH+i94q+vJKV5E86bLKcNAPeem6sjekvKICeDJ8t7GNXoEzhKbMpZb+l
 rBsI9+ZzlhLNUVNQCo4pW54yupPCQCbW16fQ4myoJA5ZrHpofEt2cQSzKNf9xORVCPeG
 ynkgAWuOxczJo+HBsaWT1dzFk8/ToD8VJedw5XHa8pyojwjGUSm+Z/EfhzV+i0Q6q4ok
 BxJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFqbi/3hOrONccFFxkgu17g+Kt6DWcpkYIgRljQjnGDEkpBdPHr4w8Ho/xIfJaH+4aBXKkwOYLnthRq4dXzVXqqOvCeocW0h/IcT2gNqnw
X-Gm-Message-State: AOJu0YwjMju4MUEDc/cphn9VrKrdxOWt2TMCaRL3QpvpEouUFK6+ra/G
 6/fxnTpPutueeTnLNFCXp0Imn3mfM78CqaH6U0xOHUGmGG+EpCa6kIbDFje5QW58lmtXVzY5Uoy
 5xGzEuD6mDIoC6WHtwaC291wJLaTMKhYGQKe1
X-Google-Smtp-Source: AGHT+IHCoxbqlkbvC40r/0Ghlkohpq677Z5qku5s52QYJ8GDMhK8thtW4dw5bCp5PdHftTKp8r3OdR4wiI1Sy39wTq4=
X-Received: by 2002:ac8:7f56:0:b0:42e:f958:ea67 with SMTP id
 g22-20020ac87f56000000b0042ef958ea67mr5712qtk.7.1709581476100; Mon, 04 Mar
 2024 11:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
 <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
 <20240304-ludicrous-grinning-goldfish-090aac@houat>
 <CABXOdTeDydWO9mf2yxWjjebHZ1bE=R2HPs1P4XYwNhzznNKxmw@mail.gmail.com>
 <20240304-benevolent-brawny-urchin-0af0ad@houat>
In-Reply-To: <20240304-benevolent-brawny-urchin-0af0ad@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 11:44:23 -0800
Message-ID: <CABXOdTcT+szLRMfx=3WFoXDirOmWCY7T+8Q+zZJ=B5GscpDNnQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>, 
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 gustavo.padovan@collabora.com, pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
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

On Mon, Mar 4, 2024 at 9:09=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:

[ ...]

>
> And singling out DRM because it regularly allegedly breaks things on
> xtensa or m68k and claiming we're not taking CI seriously because of it
> is completely ridiculous. If the all the subsystems were taking CI as
> seriously as DRM, we would be in a much better place.
>

FWIW:

$ git grep CONFIG_DRM arch/xtensa/ arch/m68k/
arch/m68k/configs/virt_defconfig:CONFIG_DRM=3Dy
arch/m68k/configs/virt_defconfig:CONFIG_DRM_FBDEV_EMULATION=3Dy
arch/m68k/configs/virt_defconfig:CONFIG_DRM_VIRTIO_GPU=3Dy
arch/xtensa/configs/virt_defconfig:CONFIG_DRM=3Dy
arch/xtensa/configs/virt_defconfig:CONFIG_DRM_VGEM=3Dy
arch/xtensa/configs/virt_defconfig:CONFIG_DRM_VIRTIO_GPU=3Dy

If that isn't supported, it might really make sense to declare that
CONFIG_DRM depends on !xtensa and !m68k.

Guenter
