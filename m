Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5586BBEC9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 22:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2913810E350;
	Wed, 15 Mar 2023 21:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF63710E350
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 21:18:25 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x13so33437106edd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678915104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBqLUoUpF3OF7zxZU/l2FdHELYPCmOM+mGZbmPLqr9o=;
 b=XaV5eGty7CcjSosYmEqRFrtejjDEjWmwe5NI9ZBdeuZwicvrZXD+JFTdyfWMRvqNc4
 wOpGJJ+GyLCv55RnBY4v1ULS7y9rvgyVnBi41ncT+KIRvtbnE9iX4IfYkrgXCHztLodh
 Q63+4Zw5XxOrr00L8mB/pCDRTnA37MB0vRoKFZtKMGr4nsGAfNpFqrPK97f0QGyGH72g
 cxYMFIANCG0uvfeoLi1GjwPQZUdCwBp2mvblr/QJAniijknZ/QwTU1wVtjQD0ShuAaNC
 zPjTHX/baI0OZsJD9F2y7M17mJWhWcXkAVlGSxTihWDkbMX1WRNMy9D5RvvhfPVh566r
 72Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678915104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBqLUoUpF3OF7zxZU/l2FdHELYPCmOM+mGZbmPLqr9o=;
 b=oLf7SAPAy9Ydlwi7maZRTwIu3IqrVCnieeEAOJivVJl+wJ4WqRgPln+LbtLM6vSkU0
 NhSAjRF6Yu3gjQEnxtnnSZ0mgUV155QvA6HN1idHSSZx9RopQU+zNqqiyOJZdl0WN6J6
 YydaR73ZBZNuvaNoJYhI7EVh3/L3+VdCiGFj3xR/boAJyi12E/lnp+mRLsOxqD8FCEK/
 OjQwkPNDoFGBdsofyVWa9TDioado/203EOAyaj+X7/4VrDohOGnLB72YANJD/3qb/sJR
 O9SPmRCh9sUGg/ZYkDZtwu9ScVp6bvXn3m3pf77IU0oMjy4lLf3LkYkk8gMN+Yd/YKHZ
 P1fg==
X-Gm-Message-State: AO0yUKVsquYl2lVe57+5MEGO4U5gEENwGgy7TMwH0VZMwH5+wildqkLt
 IBC5mU20uGVwIn2cw3nihoHKYVno0mNDyEIHOpc=
X-Google-Smtp-Source: AK7set8jwZL7fgymUE6xxgKxGLXRpJ2c9p/Oc0D75Nr5lj2nNzbBhCi/Td3TIGMjK5vhD0soO0x6en6uysyJya2As6Y=
X-Received: by 2002:a17:906:3106:b0:877:747d:4a90 with SMTP id
 6-20020a170906310600b00877747d4a90mr4132308ejx.14.1678915104137; Wed, 15 Mar
 2023 14:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txaQfHkjs6nWcwBtnYQXtr996dyht7wasJ7QOovjepmAw@mail.gmail.com>
 <CADnq5_PdxFdvVwVnQ2n4vXXPYKe0ZOVYBPT0Kf+6aPuQLc960g@mail.gmail.com>
In-Reply-To: <CADnq5_PdxFdvVwVnQ2n4vXXPYKe0ZOVYBPT0Kf+6aPuQLc960g@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 Mar 2023 07:18:11 +1000
Message-ID: <CAPM=9txGT2hFNAQbY8Fncz_zGr0nNeQ4KbN_s=D0XXueCtDmLQ@mail.gmail.com>
Subject: Re: enhancing module info to allow grouping of firmwares
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Luis R. Rodriguez" <mcgrof@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-modules@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023 at 06:56, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Mar 15, 2023 at 4:35=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > Hey moduly/firmware people,
> >
> > We are facing a problem in the future of NVIDIA providing giant
> > firmwares for their devices that are version locked with unstable
> > APIs. Even if they weren't version locked we'd likely have to support
> > multiple major versions over time.
> >
> > Now this becomes a problem because when you generate multiple
> > initramfs and stick them into /boot over time the number of firmwares
> > MODULE_FIRMWARE will match will increase and dracut will shove them
> > all into the initramfs.
> >
> > I think one way to mitigate that would be to provide some sort of
> > grouping of module firmwares that are acceptable, and having dracut
> > only pick one from the list to provide in the initramfs (hopefully the
> > latest one). That way the driver can provide a list of MODULE_FIRMWARE
> > lines and userspace knows they are a group.
> >
> > I've just little idea how we could expose this via current module
> > info, happy to try and come up with an enhanced scheme maybe with a
> > fallback to just include all of them but was just wanting to get some
> > feedback on whether this was something that anyone has ever considered
> > before now.
>
> What about bundling the compatible FWs together into one big FW
> package and tag it with some sort of common metadata header that the
> driver can parse.  That would keep all cross FW compatibilities
> together.  Then on the driver side, change the firmware name specified
> in the kernel to match whatever is required for that kernel version.
> E.g., one kernel could specify nv_fw_1_0.bin and another could specify
> nv_fw_2_1.bin, etc.  It's pretty ugly and not a great user experience
> if there is no backwards compat, but it should work as only the
> compatible FW would be copied to the initrd.

The main thing here is to reduce on-disk size, which I don't think
this will achieve.

I'd rather have the driver say it can support v1, v2, v3 fw and dracut
just put v3 in the initramfs if it's available, else put v2 in etc.

Obviously for newer hw support people will have to ship new fw
versions, and if something gets deprecated then we'd have to move the
fw for that to an always include list.

I envisaged something like

MODULE_FIRMWARE_GROUP("g1")
MODULE_FIRMWARE("fwv1.bin")
MODULE_FIRMWARE("fwv2.bin")
MODULE_FIRMWARE_GROUP_END("g2")

or

MODULE_FIRMWARE("fwv1.bin#g1")
MODULE_FIRMWARE("fwv2.bin#g2")

I also don't want to encourage any firmware teams from abandoning the
stable API principles I think this is mostly to deal with
hostile/semi-hostile and non-vendor drivers where we have no control.

It would be nice though for the couple of amdgpu hiccups we've had over tim=
e.

Dave.
>
> Alex
>
>
> >
> > Thanks,
> > Dave.
