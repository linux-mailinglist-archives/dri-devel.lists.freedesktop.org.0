Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0973A257643
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CEF89EA6;
	Mon, 31 Aug 2020 09:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4F489FC3;
 Mon, 31 Aug 2020 05:33:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so4178831wmj.2;
 Sun, 30 Aug 2020 22:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZDEON+YiSW0YCSec5Nu5L0EktnuUvNjTc14NjRB7JKE=;
 b=LPN3jT/PTqKlR2lZSgNunOp1H6kJ1/4T1MhBuqtbUeNvDSvF40OX3bDD8E3k7FqntV
 zG2B4hBde0AW65QsIHGewoTGXbr/B6uJh6iDUNCFgVpuVFOztKcS9soSx6N9iOI7lim+
 kGeQrcpaYNzAtqc5oc2EOJ/itQ//L/sEBmhWR6KMO0C1P4etBYE0zdcSrytoeJSKg5r5
 BQqOxbA26wSnVJokGLEqNVaH43jCx3tx1YCDN8NB3PffyeAkjDT8yMlTwdp/TNiUhEJb
 iK/jutqDxQnnsbbno3A5ByYPPinpzVNfB2q1qrvK4JNNM6QnprM6rcD2bM9sIyVULPga
 VPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZDEON+YiSW0YCSec5Nu5L0EktnuUvNjTc14NjRB7JKE=;
 b=rmllKAZlFzmmoiZoquAsvMKt92T7d5cYNFe1yVSbqY+PdbV7MZUbse9Zu2XEQhBy/m
 DpTCWP8VBpoHY10jLPbGo/+Up3hO4PDhw6tCP96+c+GdUb5hRUJnAsk2ILr58wKaIgq5
 g5UfEVrdo+3DWH/CkCbHBeg6smsa5xvpj+ntd9C0yYtCVcM76tp+oNFMItmZt+W9U0Qy
 YwWnQ9lsFuWV+GU4atm+I8KPamu9bCiLOOkbiNF7qNaXYdVAUwrIy4MbYlZuK8LhNgYm
 Ujwy6dPB233g8rMD4gudD+bzxEsEHRbtEMRYh5krBJY+Qur62ij7ZYK0CXCJtkXmx727
 omRA==
X-Gm-Message-State: AOAM531bfeF0rySALXOX9+W9pTLZwanSp4mfCEaH6+8XSVagnPCg2tM1
 yRJEljHhTBWCm0vFofZabrzzDPfNFusGRJ7xP/Q=
X-Google-Smtp-Source: ABdhPJyJjEzdp5HeU3Ef2tiRuhk4m/xlRlX3jpGxweA9NEFIkrZlBPpBBfH8HNOxR/70yJAH5exQiNVdwbcoaeL6DUU=
X-Received: by 2002:a1c:f003:: with SMTP id a3mr88385wmb.170.1598852037062;
 Sun, 30 Aug 2020 22:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
 <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
In-Reply-To: <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Mon, 31 Aug 2020 08:33:20 +0300
Message-ID: <CAJ1xhMVOZAM=VwtNdYmjWY9NjVOpr0JJXi0Civ5Pgb9f4og49w@mail.gmail.com>
Subject: Re: nouveau PUSHBUFFER_ERR on 5.9.0-rc2-next-20200824
To: Ben Skeggs <skeggsb@gmail.com>
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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

On Mon, Aug 31, 2020 at 7:30 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> On Tue, 25 Aug 2020 at 17:21, Alexander Kapshuk
> <alexander.kapshuk@gmail.com> wrote:
> >
> > Since upgrading to linux-next based on 5.9.0-rc1 and 5.9.0-rc2 I have
> > had my mouse pointer disappear soon after logging in, and I have
> > observed the system freezing temporarily when clicking on objects and
> > when typing text.
> > I have also found records of push buffer errors in dmesg output:
> > [ 6625.450394] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02
> > [] chid 0 mthd 0000 data 00000400
> Hey,
>
> Yeah, I'm aware of this.  Lyude and I have both seen it, but it's been
> very painful to track down to what's actually causing it so far.  It
> likely is the commit you mentioned that's at fault, and I'm still
> working to find a proper solution before I revert it.
>
> Ben.
>
> >
> > I tried setting CONFIG_NOUVEAU_DEBUG=5 (tracing) to try and collect
> > further debug info, but nothing caught the eye.
> >
> > The error message in question comes from nv50_disp_intr_error in
> > drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:613,645.
> > And nv50_disp_intr_error is called from nv50_disp_intr in the
> > following while block:
> > drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:647,658
> > void
> > nv50_disp_intr(struct nv50_disp *disp)
> > {
> >         struct nvkm_device *device = disp->base.engine.subdev.device;
> >         u32 intr0 = nvkm_rd32(device, 0x610020);
> >         u32 intr1 = nvkm_rd32(device, 0x610024);
> >
> >         while (intr0 & 0x001f0000) {
> >                 u32 chid = __ffs(intr0 & 0x001f0000) - 16;
> >                 nv50_disp_intr_error(disp, chid);
> >                 intr0 &= ~(0x00010000 << chid);
> >         }
> > ...
> > }
> >
> > Could this be in any way related to this series of commits?
> > commit 0a96099691c8cd1ac0744ef30b6846869dc2b566
> > Author: Ben Skeggs <bskeggs@redhat.com>
> > Date:   Tue Jul 21 11:34:07 2020 +1000
> >
> >     drm/nouveau/kms/nv50-: implement proper push buffer control logic
> >
> >     We had a, what was supposed to be temporary, hack in the KMS code where we'd
> >     completely drain an EVO/NVD channel's push buffer when wrapping to the start
> >     again, instead of treating it as a ring buffer.
> >
> >     Let's fix that, finally.
> >
> >     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> >
> > Here are my GPU details:
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> > 210] (rev a1)
> >         Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a93
> >         Kernel driver in use: nouveau
> >
> > The last linux-next kernel I built where the problem reported does not
> > manifest itself is 5.8.0-rc6-next-20200720.
> >
> > I would appreciate being given any pointers on how to further debug this.
> > Or is git bisect the only way to proceed with this?
> >
> > Thanks.
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

Thanks a lot for getting back to me about this.
Please let me know if there's anything else I can do to help track this down.

Alexander.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
