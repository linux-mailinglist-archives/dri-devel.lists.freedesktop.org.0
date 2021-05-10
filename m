Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0442D3798B6
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 23:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00266E8F1;
	Mon, 10 May 2021 21:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA6E6E8F1;
 Mon, 10 May 2021 21:02:44 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so15706803oth.5; 
 Mon, 10 May 2021 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3cBBZkePd5gfKATN60V4QwGBhUGNtLUNcw+1xoOiiZs=;
 b=S2lsNjatPX3UKOV5pkxnIgd2tRdEDE1F/mJYBW1mBH0XTLW23kTgYMfvEuqFgWgCcG
 GpeN7skQ8HRDLyzonMznUF4k4KFu9cRWv9zQBbCtBdxybb7lS7+cyIM8ceLQvVpqebto
 Ta+XIA3rtvSzNn4QMP/U5sGbl11s41Entls7NMUUyS7wgK8ENv7EKgBBvrS2SLGEeu/q
 d1IQpmZRoZCDXEKRI0odbDo0kwhcdmT8MQOmT+KdCYBwpXFOZgoUV4JgLhmcnri/7V1S
 Spb/pP0HPKxZnPu9b/Ufuha9NG2NpU2UJiquIBsEYYnlWwNWoBWkSs0Wbz2Mx2SUicRq
 3rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3cBBZkePd5gfKATN60V4QwGBhUGNtLUNcw+1xoOiiZs=;
 b=VbbplB+RIXjxMIA7j7/1JW3hwOkgKQaMWNHrQS/2awiOl+JyXh3ew3i2283UIyzmc0
 gHWfTIbAikI6EHsBPWwgCXGw/su4AzbcvBec9mneOBxODxJcdSbYPMBjOU4Xr/ofu/KS
 nfMQV1xyTqknV9vV6z/VwneNi/vEtofAdb2tcirHw+lbKie3WqLkazbFtyrxLoy86NDv
 tYHzuxsLYu+FhL8VpM8fjnagv4lwOWiTYm8dJ4Gtv/381U2/EpsVXBYxDoL3KDRLVi5A
 zpB2YFogyoH2gjZPkA4m2It687Z8+AW/yZ+cUnluzdWGVau6z2nrJjfgwKYz9OIU51Xl
 WhFA==
X-Gm-Message-State: AOAM530opQqLXN513XocSSCuMklD3dU3KxQcE74aoroh4HVF0b4p3TLO
 XYth/IFT33VTEJVMlcVi4v9hzz72SD4Yk5sP1lQ=
X-Google-Smtp-Source: ABdhPJw7DyKD1Lyyq9S41EMv+Yyu/ErA9AViQoXtkzjglGNF7HKdlfnp86mEla//UDe5eTZlAP0X/kMW5Kco3byONpk=
X-Received: by 2002:a9d:51c6:: with SMTP id d6mr16637610oth.311.1620680564170; 
 Mon, 10 May 2021 14:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210509144923.6316-1-dwaipayanray1@gmail.com>
 <2c5387b7-2fa1-9b5a-c671-806429b463aa@amd.com>
In-Reply-To: <2c5387b7-2fa1-9b5a-c671-806429b463aa@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 May 2021 17:02:32 -0400
Message-ID: <CADnq5_NXXD1K6kb0Jr8P5DPGcHRMo0jQTC+y2n4-4sfZY12pyA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Fix errors in function documentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, May 9, 2021 at 12:30 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 09.05.21 um 16:49 schrieb Dwaipayan Ray:
> > Fix a couple of syntax errors and removed one excess
> > parameter in the function documentations which lead
> > to kernel docs build warning.
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 -
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ras.c
> > index ae9fb2025259..312f24004413 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > @@ -320,11 +320,14 @@ static int amdgpu_ras_debugfs_ctrl_parse_data(str=
uct file *f,
> >    * "disable" requires only the block.
> >    * "enable" requires the block and error type.
> >    * "inject" requires the block, error type, address, and value.
> > + *
> >    * The block is one of: umc, sdma, gfx, etc.
> >    *  see ras_block_string[] for details
> > + *
> >    * The error type is one of: ue, ce, where,
> >    *  ue is multi-uncorrectable
> >    *  ce is single-correctable
> > + *
> >    * The sub-block is a the sub-block index, pass 0 if there is no sub-=
block.
> >    * The address and value are hexadecimal numbers, leading 0x is optio=
nal.
> >    *
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 16252d48e5a4..7e1a67295106 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -2796,7 +2796,6 @@ long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, lo=
ng timeout)
> >    *
> >    * @adev: amdgpu_device pointer
> >    * @vm: requested vm
> > - * @vm_context: Indicates if it GFX or Compute context
> >    * @pasid: Process address space identifier
> >    *
> >    * Init @vm fields.
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
