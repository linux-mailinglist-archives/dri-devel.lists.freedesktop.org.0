Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE658C1A9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 04:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362DC18A647;
	Mon,  8 Aug 2022 02:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349F918A686
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 02:35:12 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id o22so9651438edc.10
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Aug 2022 19:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=HR8fsz3D9jTQuvWD7UhLglZE9DhqQ7qKdBgq9AHGyhw=;
 b=TqMboQ6xUihS6VfN20PnmTTKTnnwgcivO+xrnjffl29WtUYC6OjzH+ZaspLdxyBezQ
 UBjIc5JGVvYG5LUeRRFzXPo80cYbSUYHPlElRZUcCVLI7I8Ye4YGZdEgkT1JULgOPCnt
 +v7/qzPSpxGvNhwv+DvKpqlqvPEYMvXjaVE/br0Hew76sD5B97yttSIhQUE+WpOvwJA9
 CWz6Acj4haWz1Ka1Rbb9Jnd5SBnReFIsI7idH9Rz3lWETcXdIOFTuOdCkdSAyCd7uLFe
 Z6qEO03LCFoRdhovVoiEqGRLysIooZo0AwRhgH5W9kiRo/VRj8eB+KxTFZ9wi+vnYe5w
 x5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=HR8fsz3D9jTQuvWD7UhLglZE9DhqQ7qKdBgq9AHGyhw=;
 b=TmKboc4HgVPMytw9x0GdXANEvuUir8i0fOgzhaQRTP2ZEw2rfb4RBG9QD6CbDTHG8L
 AMx0DeO3t7za/0dOsBXXy3lHZSIz49t5h+tTZO5pwfa0VNLQXYU2epUuqCDuGSwM9BBu
 XQdFj/LpwFDZYt9zGn/tj7mzd+Kh/a/spcm/atR9mpLNzNSDOc7bjuASxxHIIb3ZfjCe
 2+orLVfcQNeHomaGQpYRplw+6ChjtVQRs8qtBatPaPEysmsRlEQKN9cnwGSpaPdzzZrw
 wgZg7O7bPlBOAFNTPsrkOmaL4ry8Rb6xPUnAwpdu5nZQooCCxoQrJNBYjR/B1GSrOHlb
 7EDA==
X-Gm-Message-State: ACgBeo2G191+FBqxez2X3xjlYrCiPM1ozbzFcXiNQuukL/ZTGKb7MJyl
 owaVD8QQQMalXVTPDTr1F5hLN8wOa04WJTTAjJU=
X-Google-Smtp-Source: AA6agR6DnTRVcG6bu7XktaYl6QqQT8jwqMZ8ZUUVcmQNy/wet1iIg5SHkIGHbroERpdJpebUlX5ajwJN/ZpoLl93GbY=
X-Received: by 2002:aa7:d513:0:b0:43d:5c81:4f71 with SMTP id
 y19-20020aa7d513000000b0043d5c814f71mr12029971edq.308.1659926110611; Sun, 07
 Aug 2022 19:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
In-Reply-To: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 8 Aug 2022 12:34:59 +1000
Message-ID: <CAPM=9tyqsK3X_+s53Xy5jUs+cq3+aSkYne-E4NLLJ+NBnRqjNg@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] New DRM driver for Intel VPU
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>, andrzej.kacprowski@linux.intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Jul 2022 at 23:17, Jacek Lawrynowicz
<jacek.lawrynowicz@linux.intel.com> wrote:
>
> Hi,
>
> This patchset contains a new Linux* Kernel Driver for Intel=C2=AE VPUs.
>
> VPU stands for Versatile Processing Unit and it is an AI inference accele=
rator
> integrated with Intel non-server CPUs starting from 14th generation.
> VPU enables efficient execution of Deep Learning applications
> like object detection, classification etc.
>
> Driver is part of gpu/drm subsystem because VPU is similar in operation t=
o
> an integrated GPU. Reusing drm driver init, ioctl handling, gem and prime
> helpers and drm_mm allows to minimize code duplication in the kernel.
>
> The whole driver is licensed under GPL-2.0-only except for two headers im=
ported
> from the firmware that are MIT licensed.
>
> User mode driver stack consists of Level Zero API driver and OpenVINO plu=
gin.
> Both should be open-sourced by the end of Q3.
> The firmware for the VPU will be distributed as a closed source binary.


Thanks for the submission, this looks pretty good and well layed out,

just a few higher level things, I think I'd like this name intel-vpu
or ivpu or something, VPU is a pretty generic namespace usage.

I think adding some sort of TODO file with what is missing and what
future things need to happen would be useful to know when merging this
might be a good idea.

I'm kinda thinking with a rename we could merge this sooner into a
staging-lite model.

I think I'd like Christian/Maarten to maybe review the fencing/uapi,
to make sure nothing too much is wrong there. The submit/waitbo model
is getting a bit old, and using syncobjs might be useful to make it
more modern. Is this device meant to be used by multiple users at
once? Maybe we'd want scheduler integration for it as well (which I
think I saw mentioned somewhere in passing).

Dave.
