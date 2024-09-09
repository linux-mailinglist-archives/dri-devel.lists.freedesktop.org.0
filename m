Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C9C971CE2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 16:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708B710E3B1;
	Mon,  9 Sep 2024 14:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZhmXJ4PH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7395410E125;
 Mon,  9 Sep 2024 14:40:20 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-82ade877fbeso87552439f.0; 
 Mon, 09 Sep 2024 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725892819; x=1726497619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yADGgFh0Qr9khviAqSL4T0j/ayR5ihAosN0nFeWJtFw=;
 b=ZhmXJ4PHVayrLSacXX2qJrapZ+na5uXtWiBem0oBzTRCSp3ugNBHJQIqTWyW9JCHG4
 TnFTNNCCbQdtAhgdCftqgloyLBxZegW1SQUhR0hChTqtgnfBrUC+2yQQpnEPsKDEc44M
 q3YR1zhMxk0kCoO6Vn47xXvjwT67sQY8AHsCRYkJm7ViBo0kyZbmyntmJ1BEHhqWPkTV
 SL6Voe3n6UwFQuf62FXuHekgchjAbvhamZqrYw8oxkgAOinggL/A9n6P2S2MGUbRrAvl
 RYGy0qsE+/99clTeQdDsJq9T7sa43P9P3jr2hXrj/gHQ+ayU4cFNNUMNWO8x564F1k94
 Wcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725892819; x=1726497619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yADGgFh0Qr9khviAqSL4T0j/ayR5ihAosN0nFeWJtFw=;
 b=RVG0Qvp6VGPVUUV2L5vj4yTA66bSXpTzsrv1yMd6w5GygTz6W2JMQRSwcStksWtqZB
 BxIYFzWbg2eNeYcJilZQV3DEOy8ZCHujjcefRR74T3Rc0thz5VKFHUnxCjCSoGJ+lPtw
 L89dcqt72RmWSdN8RAOY2QBZIzOuHtP5ZrO6n0/APV2wrBRGz5gwpnRBCDwPXBVcYrf5
 n48JQsoPJjwwqwmQy08WuCd2lheRe62CMvNo24axPdCJUIzsQqvc+FhHN9u5pCxRoGyP
 tK7rwyrphYh0VJ55pgcCqI4wc7UE2OMmAuTlMFVZBAx12T85RRAktSTwSSKDVTpNZ/YQ
 FgiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0SwlVQp0Ir8Y0JLQz2grZmbw2DtF/hdegVIDjGNOBrCbiawGeIBIruQC7E8sHUcmtI/U3dXgvdTcY@lists.freedesktop.org,
 AJvYcCXsjmwLYn2PSW8vnGw3jrNM5Dzj+0qmgpDosuYAJIB2b37FpKIuHdEIYvP2JUlXlYiTNHA9hrwN0qI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqZDfZDoUCA4WkDJOy+1CBRNoEAbdy1wMuewFi5juhdaWJ6dZj
 UsBl+chs+49JhpRRdk7HWCX2ZIjhWDGyt+wkLo7x4YGIXiuwg4i5KIXglmNb9D9Uct7Mglyukhr
 mVE9SqzgX0UD2kCsTyuXtqw8DpNQ=
X-Google-Smtp-Source: AGHT+IG/zidy3pUha3J4vBn+TgE6JlPVQqsYOcZPn1/PZgtYteEn9j/NJ/+ZfxxiFMsg3wdTfHQX1c5/CxyHbAkt+Ic=
X-Received: by 2002:a05:6e02:1d06:b0:3a0:4a63:e7ac with SMTP id
 e9e14a558f8ab-3a04f0ccccfmr140661735ab.18.1725892819444; Mon, 09 Sep 2024
 07:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com>
 <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
 <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
 <CACu1E7GSMQHa6258hV2OwS5nTGh+kTeZ-qQPMfGTy5YVP5kX3g@mail.gmail.com>
In-Reply-To: <CACu1E7GSMQHa6258hV2OwS5nTGh+kTeZ-qQPMfGTy5YVP5kX3g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Sep 2024 07:40:07 -0700
Message-ID: <CAF6AEGvv60CS43dCijsUCzELLn=t1PJQVCzMx01cFJsNJ1Uk9g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX
 targets
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sharat Masetty <smasetty@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Mon, Sep 9, 2024 at 6:43=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> On Mon, Sep 9, 2024 at 2:15=E2=80=AFPM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
> >
> > On 9/6/24 9:54 PM, Akhil P Oommen wrote:
> > > On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
> > >> This patch implements preemption feature for A6xx targets, this allo=
ws
> > >> the GPU to switch to a higher priority ringbuffer if one is ready. A=
6XX
> > >> hardware as such supports multiple levels of preemption granularitie=
s,
> > >> ranging from coarse grained(ringbuffer level) to a more fine grained
> > >> such as draw-call level or a bin boundary level preemption. This pat=
ch
> > >> enables the basic preemption level, with more fine grained preemptio=
n
> > >> support to follow.
> > >>
> > >> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QR=
D
> > >> ---
> > >>   drivers/gpu/drm/msm/Makefile              |   1 +
> > >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 ++++++++++++++++++=
+++-
> > >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
> > ...
> > >
> > > we can use the lighter smp variant here.
> > >
> > >> +
> > >> +            if (a6xx_gpu->cur_ring =3D=3D ring)
> > >> +                    gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> > >> +            else
> > >> +                    ring->skip_inline_wptr =3D true;
> > >> +    } else {
> > >> +            ring->skip_inline_wptr =3D true;
> > >> +    }
> > >> +
> > >> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
> > >>   }
> > >>
> > >>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 cou=
nter,
> > >> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu=
 *a6xx_gpu,
> > >
> > > set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
> > > not. This is currently not tracked separately for each ring. Can you
> > > please check that?
> >
> > I totally missed that. Thanks for catching it!
> >
> > >
> > > I wonder why that didn't cause any gpu errors in testing. Not sure if=
 I
> > > am missing something.
> > >
> >
> > I think this is because, so long as a single context doesn't submit to
> > two different rings with differenr priorities, we will only be incorrec=
t
> > in the sense that we emit more page table switches than necessary and
> > never less. However untrusted userspace could create a context that
> > submits to two different rings and that would lead to execution in the
> > wrong context so we must fix this.
>
> FWIW, in Mesa in the future we may want to expose multiple Vulkan
> queues per device. Then this would definitely blow up.

This will actually be required by future android versions, with the
switch to vk hwui backend (because apparently locking is hard, the
solution was to use different queue's for different threads)

https://gitlab.freedesktop.org/mesa/mesa/-/issues/11326

BR,
-R
