Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 067E83905A3
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0008E6EA67;
	Tue, 25 May 2021 15:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DFD6EA66;
 Tue, 25 May 2021 15:38:58 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so4686635otl.3; 
 Tue, 25 May 2021 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G29C7319Dv2jp3aawArMwM12C1t7ygPQnrD+x7K3emo=;
 b=KU7xaHHWx+wjYxjyiCHaCZEWUPHeUexy/WMEsPCmjL8AAcOY6Vq2QpeGYW0xF87Ll7
 q261c+N8lKPgZf/XwQ7j7x3C6Qa6A12CgzAe3UzfA2ubPMbkB1zFND9rE4wuz9ScI9+J
 agYywA53hAc2mlCHM4WT2j/Y1/8PaTyCaXJMDwnj9xHnIl/jxyOV6TuuFx1Vk6Z+b0nz
 l/ha/d3NccEWuIY09x7gkQPjt9pmGPRYLH+KxlE2+Z6ZSQqlYUIedi/QPpWaGTKOTfqO
 S+AvIR8SGj09nK1ODGEOX5JoJS05lrzwrYIAvbnJAF6ZkmkyKm18LulSYjCIKAWTsTT3
 jkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G29C7319Dv2jp3aawArMwM12C1t7ygPQnrD+x7K3emo=;
 b=Ugruow4qjoYx0KmJ8wTDBxMowtOwDfZGhGKBr6bNW+wpF7GILvI0JHrmPLVLEt74Pz
 Q/qTqA44hdm+CB4x9tChZtlHJlsCSrwROKB6hbVp221DOncklVFgCzQaG5/GbHM0i1SR
 v2XMRQDU6z0wv0s4fvcLKRMUZzxrJiRDAsHU9WoEo0yFOiT2Fn2D9nFJ6+iQ9vWPa4nL
 vxFvTiPjtttlrE58nShG3k9hH37Y7aTanNLwr5rNXdtL+wT2Pg2tPpzQe4xm78lBlXNH
 TpQ4/6PdRBA1066Vj6K9hnDhfy9bXyUvK1KAf/hPhr/rkZMCt9L3AUSd5pkMJ1xbuN75
 0J9Q==
X-Gm-Message-State: AOAM531G8JIkUxCYvqdjJIsVtb+dft8e92ujET9EoJBSe6WIS9szqC8Y
 gVtREo3spj5fsuDBzvmYafDmiH/ohQl4YtuUocs=
X-Google-Smtp-Source: ABdhPJyGNsx4a/dIqRXAcEEjQuHqAgdTAML8/MtCbrWA0+YY4Kkwm24gxdVHMVAyL+bFEaY7hRXemO0XzttpEfnPt+s=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr24158328otl.132.1621957138307; 
 Tue, 25 May 2021 08:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <CADnq5_N3WkoYHcn8b1-qZ23+t=E9xxV5fV_1Lwqck6x2dUPqmA@mail.gmail.com>
 <950d5d2a-c01f-35d4-0933-04cae2c4984d@gmail.com>
In-Reply-To: <950d5d2a-c01f-35d4-0933-04cae2c4984d@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 May 2021 11:38:47 -0400
Message-ID: <CADnq5_PgmZMTOKGSt29_MkonMaf5exgBy1VUgHyd14dKT+_13A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unreachable code
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 11:27 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 24.05.21 um 20:48 schrieb Alex Deucher:
> > Applied.  Thanks!
>
> Ok, that's unfortunate.
>
> IIRC we added the code because of a different compiler warning.
>

I can revert it.

Alex

> Christian.
>
> >
> > Alex
> >
> > On Mon, May 24, 2021 at 6:47 AM Jiapeng Chong
> > <jiapeng.chong@linux.alibaba.com> wrote:
> >> In the function amdgpu_uvd_cs_msg(), every branch in the switch
> >> statement will have a return, so the code below the switch statement
> >> will not be executed.
> >>
> >> Eliminate the follow smatch warning:
> >>
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> >> ignoring unreachable code.
> >>
> >> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> >> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_uvd.c
> >> index 82f0542..375b346 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> >> @@ -842,8 +842,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_=
ctx *ctx,
> >>                  DRM_ERROR("Illegal UVD message type (%d)!\n", msg_typ=
e);
> >>                  return -EINVAL;
> >>          }
> >> -       BUG();
> >> -       return -EINVAL;
> >>   }
> >>
> >>   /**
> >> --
> >> 1.8.3.1
> >>
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
