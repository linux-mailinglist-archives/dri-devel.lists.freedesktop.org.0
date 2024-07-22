Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA113939586
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 23:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B404D10E342;
	Mon, 22 Jul 2024 21:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nIbJJYNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3652210E342;
 Mon, 22 Jul 2024 21:34:04 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7515437ff16so3319848a12.2; 
 Mon, 22 Jul 2024 14:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721684044; x=1722288844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lz7eC/D5EN2MO/b1N+VJzo23wffYTBqRV9t9w8/j8yw=;
 b=nIbJJYNQL66cEqs0fnlnnG06Jpq/NZ+Wq4WAXT6FN2ylg8QXg/tF/JpD+j3MLb5qD/
 Wc0l+CueH33o1psnA/42qujjZOJAcCNnmLXdazfjBuq3HUczLPldQkyBBAmdJbR9kKKz
 tIUle0JenDKjPkkf9+eyNXlyBnJ20qIUZ9sB8pZGI9qMUJYozjjTrnalwQjlTdWTKmrv
 9mew0N0XkGq7pSfPfEYySko8UjbtLHQ1PLnfLK59naObwEToTP+6G+BOYxfFicokUwNQ
 yYOjPfYfn2b3gG/YKjFRPtYTlRb4aztvrlq/jTA1GBor+dIXEwyt80DnxTPH/hj52c0x
 I0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684044; x=1722288844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lz7eC/D5EN2MO/b1N+VJzo23wffYTBqRV9t9w8/j8yw=;
 b=UqkO668gXLhuIqXa3D7eiFUJlzj3xXdvITgvb+iv2eIhzlxKU4i4OgQIqTSh+Hr0to
 5YIa/r9qMLieum9FGRt4EcXd24YzOzgGC7teU41vZ2mB5aUXxPSFroDpVieVociz3xJf
 IwvXjfl3SD7qNOMGrURtf3Okj0H/AW5McOgvALYlfSzsJyNpE5NWrsXOszGfCaoGm7Si
 bhU5MRBXzvaSDaO52rG0Bg+nGkDef0rv+njUWhz1VswoFXCoSVSbHsRAbLMey5ucFhEw
 f+e9HvFhycsD+Y1G+bEd2pOWFlc4v416JcnUigua0qzw41Oci3K2eA2qLbFgZwBbya/7
 UErg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFrqHXQfPQU0AgkFLd+dp+vv5BMl2S/zho9eOYtFZr1JmiWTlskl8xSVgOfoaNmB98bkqh9WVcb+6zvVZN75Q66aPdThHwP/vJ5rDnZMq7PELlGvsZF0kFBobDjyYcU6peRFRXwM1btl1L8IvV2w==
X-Gm-Message-State: AOJu0YxXgU+/kyeB2lWWj71hf0goTyrPio7EEwbGfnGa8SbR25XOEUjK
 lNrGYjnLk5LnKmGtHI8H//smc/NN4C9vDSsc8KUuTXMPsC/QimMKdE20ovP/mH6T75vYserOgrL
 2sELl0UkjEuaMC5xsbDvOVtqeUZ0=
X-Google-Smtp-Source: AGHT+IHCu5c9EE/Wlr9s8CQAwkdMP+PqJ8V5BHoTwpWhrVrxKoLgY/TnlbaathYFILbfFj/YltBbCqdqJZuTyaLle1Q=
X-Received: by 2002:a17:90b:3e8a:b0:2cd:3445:f87e with SMTP id
 98e67ed59e1d1-2cd34460729mr6176252a91.2.1721684043513; Mon, 22 Jul 2024
 14:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsMmtqzBfUykT-JgyhZn-7ZXtftHL35znDdYuTnUOpGnoQ@mail.gmail.com>
 <1266c4af-a000-48c0-bd0d-79c2e918aea9@gmail.com>
In-Reply-To: <1266c4af-a000-48c0-bd0d-79c2e918aea9@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Jul 2024 17:33:51 -0400
Message-ID: <CADnq5_O-hKQZoMxuX2=HiukiorxE=bFAJownQFkTbzNR2d411g@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - Since commit e356d321d024 in the
 kernel log appears the message "MES failed to respond to msg=MISC
 (WAIT_REG_MEM)" which were never seen before
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>, mukul.joshi@amd.com, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Mon, Jul 22, 2024 at 4:50=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> That's a known issue and we are already working on it.

Do either of these patches help?
https://patchwork.freedesktop.org/patch/605437/
https://patchwork.freedesktop.org/patch/605201/

Alex

>
> Regards,
> Christian.
>
> Am 20.07.24 um 19:08 schrieb Mikhail Gavrilov:
> > Hi,
> > I spotted "MES failed to respond to msg=3DMISC (WAIT_REG_MEM)" messages
> > in my kernel log since 6.10-rc5.
> > After this message, usually follow "[drm:amdgpu_mes_reg_write_reg_wait
> > [amdgpu]] *ERROR* failed to reg_write_reg_wait".
> >
> > [ 8972.590502] input: Noble FoKus Mystique (AVRCP) as
> > /devices/virtual/input/input21
> > [ 9964.748433] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748433] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748434] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748494] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748493] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748476] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748479] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748477] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748478] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748661] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9964.748770] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9977.224893] Bluetooth: hci0: ACL packet for unknown connection handl=
e 3837
> > [ 9980.347061] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.347077] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349857] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349859] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349858] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349859] amdgpu 0000:03:00.0: amdgpu: MES failed to respond to
> > msg=3DMISC (WAIT_REG_MEM)
> > [ 9980.349870] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349868] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349870] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349890] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349865] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349865] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349866] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349867] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349867] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349869] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [ 9980.349871] [drm:amdgpu_mes_reg_write_reg_wait [amdgpu]] *ERROR*
> > failed to reg_write_reg_wait
> > [10037.250083] Bluetooth: hci0: ACL packet for unknown connection handl=
e 3837
> > [12054.238867] workqueue: gc_worker [nf_conntrack] hogged CPU for
> >> 10000us 1027 times, consider switching to WQ_UNBOUND
> > [12851.087896] fossilize_repla (45968) used greatest stack depth:
> > 17440 bytes left
> >
> > Unfortunately, it is not easily reproducible.
> > Usually it appears when I play several hours in the game "STAR WARS
> > Jedi: Survivor".
> > So it is why I bisected it so long.
> >
> > git bisect start
> > # status: waiting for both good and bad commits
> > # bad: [f2661062f16b2de5d7b6a5c42a9a5c96326b8454] Linux 6.10-rc5
> > git bisect bad f2661062f16b2de5d7b6a5c42a9a5c96326b8454
> > # good: [50736169ecc8387247fe6a00932852ce7b057083] Merge tag
> > 'for-6.10-rc4-tag' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> > git bisect good 50736169ecc8387247fe6a00932852ce7b057083
> > # bad: [d4ba3313e84dfcdeb92a13434a2d02aad5e973e1] Merge tag
> > 'loongarch-fixes-6.10-2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson
> > git bisect bad d4ba3313e84dfcdeb92a13434a2d02aad5e973e1
> > # good: [264efe488fd82cf3145a3dc625f394c61db99934] Merge tag
> > 'ovl-fixes-6.10-rc5' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs
> > git bisect good 264efe488fd82cf3145a3dc625f394c61db99934
> > # bad: [35bb670d65fc0f80c62383ab4f2544cec85ac57a] Merge tag
> > 'scsi-fixes' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
> > git bisect bad 35bb670d65fc0f80c62383ab4f2544cec85ac57a
> > # good: [f0d576f840153392d04b2d52cf3adab8f62e8cb6] drm/amdgpu: fix
> > UBSAN warning in kv_dpm.c
> > git bisect good f0d576f840153392d04b2d52cf3adab8f62e8cb6
> > # bad: [07e06189c5ea7ffe897d12b546c918380d3bffb1] Merge tag
> > 'amd-drm-fixes-6.10-2024-06-19' of
> > https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
> > git bisect bad 07e06189c5ea7ffe897d12b546c918380d3bffb1
> > # bad: [ed5a4484f074aa2bfb1dad99ff3628ea8da4acdc] drm/amdgpu: init TA
> > fw for psp v14
> > git bisect bad ed5a4484f074aa2bfb1dad99ff3628ea8da4acdc
> > # bad: [e356d321d0240663a09b139fa3658ddbca163e27] drm/amdgpu: cleanup
> > MES11 command submission
> > git bisect bad e356d321d0240663a09b139fa3658ddbca163e27
> > # first bad commit: [e356d321d0240663a09b139fa3658ddbca163e27]
> > drm/amdgpu: cleanup MES11 command submission
> >
> > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Date:   Fri May 31 10:56:00 2024 +0200
> >
> >      drm/amdgpu: cleanup MES11 command submission
> >
> >      The approach of having a separate WB slot for each submission does=
n't
> >      really work well and for example breaks GPU reset.
> >
> >      Use a status query packet for the fence update instead since those
> >      should always succeed we can use the fence of the original packet =
to
> >      signal the state of the operation.
> >
> >      While at it cleanup the coding style.
> >
> >      Fixes: eef016ba8986 ("drm/amdgpu/mes11: Use a separate fence per
> > transaction")
> >      Reviewed-by: Mukul Joshi <mukul.joshi@amd.com>
> >      Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >      Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > And I can confirm after reverting e356d321d024 I played the whole day,
> > and the "MES failed to respond" error message does not appear anymore.
> >
> > My hardware specs are: https://linux-hardware.org/?probe=3D78d8c680db
> >
> > Christian, can you look into it, please?
> >
>
