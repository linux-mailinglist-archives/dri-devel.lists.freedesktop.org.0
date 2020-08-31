Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07842572DB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 06:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B03789CCE;
	Mon, 31 Aug 2020 04:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D594189CB9;
 Mon, 31 Aug 2020 04:30:53 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id i10so3260631ybt.11;
 Sun, 30 Aug 2020 21:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3EHX4IFDP9HkXUW+b+ZNzN+U/N5NbUIOOxj43RJQFP8=;
 b=sFgwc5cHHE9FxursU6WRqYcmits9x/HyhItAsmn2E1mo5JX2JKbQ4kWAoVvXqJgHvX
 CEr0Pums8JT3qlyKoAgYpS3yK+ibCQGxWNVbQZgisAMuZdXm9u/InCEZgPYhZMLGZydH
 yd42w67EH6hWqQosjvmCFftCCPPp/at/gd3UhDMhUZJGFRT/JnHsiWGwocA66GWahivh
 pb+Myve0noIccwNerGhDQD/cIEcMlIqPzyLeXsKabrkChvK3nT3re1P10cmNy0cj5lsL
 mGaUjNxaOWScrpJXKjjr3m/W3J9uBUiBJRQe0HNBj0stSxKDZKyPYe+RqER4Imlt+dU7
 iKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EHX4IFDP9HkXUW+b+ZNzN+U/N5NbUIOOxj43RJQFP8=;
 b=tf6H4N99F6JK5dw3srZ3+VdcYTERM+K4qY2Gh3oiHkPAC68+DWLj+c5S6QJz8DdFr9
 Q5Ksvh9GiXZSw5Scjih5jnztFwEe8QEfwa2nl38Fm3MQweVYuRkZSXJG/7GyH2TqGndf
 TiTXbmaS7gr5fqJVqhXEarBfFbjTYOAC2bDJpZ361smYMP/rsUd4znODTR5db4mCcwpR
 98Ohq3OOa3iP1Wc3ecufMwUKuCFRtmdkzaK+4gUsk6ax6K6P6n89QkgXt9g7Xf6B7nBn
 5yvXu1EBhli7d/T8Bno0GuQiE7MNEliV7kBJ/yA5KW1VWmWILQbfNNTjEFT3jEjJUo7U
 /H2g==
X-Gm-Message-State: AOAM533wnX+pKvOs/KzvQpibfm68ir9tGwevgXsDUvZznKdSHFvU4/GY
 +GisXgUWszeP9c16bBeowVfrvWmDyprEklJrB7s=
X-Google-Smtp-Source: ABdhPJygqDhnYzGy1ODmzpjWOWvVU0KHozgD8foEW/pFKDAAJ/I2ilsDU+17Efoxy6pCnydvcuH5XqRX2oBauPkkZ+s=
X-Received: by 2002:a25:3803:: with SMTP id f3mr16938941yba.470.1598848253030; 
 Sun, 30 Aug 2020 21:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
In-Reply-To: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 31 Aug 2020 14:30:42 +1000
Message-ID: <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
Subject: Re: nouveau PUSHBUFFER_ERR on 5.9.0-rc2-next-20200824
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Next <linux-next@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Aug 2020 at 17:21, Alexander Kapshuk
<alexander.kapshuk@gmail.com> wrote:
>
> Since upgrading to linux-next based on 5.9.0-rc1 and 5.9.0-rc2 I have
> had my mouse pointer disappear soon after logging in, and I have
> observed the system freezing temporarily when clicking on objects and
> when typing text.
> I have also found records of push buffer errors in dmesg output:
> [ 6625.450394] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02
> [] chid 0 mthd 0000 data 00000400
Hey,

Yeah, I'm aware of this.  Lyude and I have both seen it, but it's been
very painful to track down to what's actually causing it so far.  It
likely is the commit you mentioned that's at fault, and I'm still
working to find a proper solution before I revert it.

Ben.

>
> I tried setting CONFIG_NOUVEAU_DEBUG=5 (tracing) to try and collect
> further debug info, but nothing caught the eye.
>
> The error message in question comes from nv50_disp_intr_error in
> drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:613,645.
> And nv50_disp_intr_error is called from nv50_disp_intr in the
> following while block:
> drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:647,658
> void
> nv50_disp_intr(struct nv50_disp *disp)
> {
>         struct nvkm_device *device = disp->base.engine.subdev.device;
>         u32 intr0 = nvkm_rd32(device, 0x610020);
>         u32 intr1 = nvkm_rd32(device, 0x610024);
>
>         while (intr0 & 0x001f0000) {
>                 u32 chid = __ffs(intr0 & 0x001f0000) - 16;
>                 nv50_disp_intr_error(disp, chid);
>                 intr0 &= ~(0x00010000 << chid);
>         }
> ...
> }
>
> Could this be in any way related to this series of commits?
> commit 0a96099691c8cd1ac0744ef30b6846869dc2b566
> Author: Ben Skeggs <bskeggs@redhat.com>
> Date:   Tue Jul 21 11:34:07 2020 +1000
>
>     drm/nouveau/kms/nv50-: implement proper push buffer control logic
>
>     We had a, what was supposed to be temporary, hack in the KMS code where we'd
>     completely drain an EVO/NVD channel's push buffer when wrapping to the start
>     again, instead of treating it as a ring buffer.
>
>     Let's fix that, finally.
>
>     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
>
> Here are my GPU details:
> 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> 210] (rev a1)
>         Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a93
>         Kernel driver in use: nouveau
>
> The last linux-next kernel I built where the problem reported does not
> manifest itself is 5.8.0-rc6-next-20200720.
>
> I would appreciate being given any pointers on how to further debug this.
> Or is git bisect the only way to proceed with this?
>
> Thanks.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
