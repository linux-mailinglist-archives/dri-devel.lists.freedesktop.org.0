Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4770AFA7
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 20:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D847F10E05F;
	Sun, 21 May 2023 18:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFA610E023;
 Sun, 21 May 2023 18:50:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-513debc49e8so149527a12.0; 
 Sun, 21 May 2023 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684695006; x=1687287006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hI2OZ0N4nxc5zSXdubBHtpF/Q49iYURNNqXU694p3gI=;
 b=iJUtLlz5l2yY4W2Re17UxWiap3Yk4g6Se/jwUmS7mex83jT0BK0QWnAejk9d6pysh+
 0NsU3wKaPCiP7rC0YFVYUpnRgV0eqqLE44EzlGxjuWrQlCVpLMUfqf9uxLUq4aO9fr5u
 ZNNMdgAfzbD4iqgAdjhTHNGPmSXgC6Ok7F0qeLUyVhbOe7eBLSYXLvNrGw4W5pXNO63E
 ryLkJNHtNHilhOZQmMqA03levPKW7brOya9nFz4hCkn0+V6HawNkv9U0V7oBUFWVCvmo
 iRspEbjelQA8vOvEr3GXD+p3wBF8hPOjLyhgc87V9CcnL+E9XVjhoXBhmtEBxPhz0kWm
 rTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684695006; x=1687287006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hI2OZ0N4nxc5zSXdubBHtpF/Q49iYURNNqXU694p3gI=;
 b=VMiu6yBw1BnvJxHrwzXJTqgnyhqovGAtkQ5rZl5dBqcHrS/h/+RZe82mXTonoJGelv
 69byF+/UL5Xjs/exLfeviUAgK7w+4TcNj0LcNCOAUZsxzzdz01y0H8gH2Inw9S8kFWSS
 +g/MKTbxJxYKFBqhUbFB5WdEpjeNXBazYxQDTngXicAodRBLhf251aHqZt/CzCN8G8Xk
 fV+NffsRxx6yEElCk+abUfBI9E+pQNKtnwZUXp8IkgNv4U5yQG4812Y/iwUpSdye0X0z
 lUr/jyQgmLw3PB4jsvoydrd4YQCA11u53D1HAU8VcSR5c8UbhnqNnGrpFRsQvUhHv3G0
 /H8g==
X-Gm-Message-State: AC+VfDy5tNT9OXkZQIP01mSjbPnOjIAuSB9qTnPD0T/axXzGWnTdO2D2
 2YrTvXugF85BT6pzgOLRmV9HjzrC2pWQMocIWy3MnlyYJ9k=
X-Google-Smtp-Source: ACHHUZ4MWtCIpB7vMXxMrX9K8FrnFSbCfBYgMsPz4RrWJaYDSByS43l7zvDsy/zfh8ijxApdqiH8sX8WOlilJXWcQ4I=
X-Received: by 2002:a05:6402:4307:b0:506:c24e:667d with SMTP id
 m7-20020a056402430700b00506c24e667dmr7006173edc.4.1684695005838; Sun, 21 May
 2023 11:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230509183301.1745462-1-olvaffe@gmail.com>
 <CAPaKu7TqUt1L-5RUuwEagr2UUs8maOO+FSoS2PEoP9eO1-JJSw@mail.gmail.com>
 <CADnq5_OsGqg7CoNVgtgr91a+pyBtJzoUOBXHKmGMcOM9hLFkwQ@mail.gmail.com>
In-Reply-To: <CADnq5_OsGqg7CoNVgtgr91a+pyBtJzoUOBXHKmGMcOM9hLFkwQ@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 21 May 2023 11:49:54 -0700
Message-ID: <CAPaKu7SQ0NkDVN3NNRoJxGRQ8x2T2uXcxZJEkt7g2CkEzVU3Sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] amdgpu: validate drm_amdgpu_gem_va addrs for all ops
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
Cc: Philip Yang <Philip.Yang@amd.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Mukul Joshi <mukul.joshi@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 1:12=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Wed, May 17, 2023 at 5:27=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wro=
te:
> >
> > On Tue, May 9, 2023 at 11:33=E2=80=AFAM Chia-I Wu <olvaffe@gmail.com> w=
rote:
> > >
> > > Extend the address and size validations to AMDGPU_VA_OP_UNMAP and
> > > AMDGPU_VA_OP_CLEAR by moving the validations to amdgpu_gem_va_ioctl.
> > >
> > > Internal users of amdgpu_vm_bo_map are no longer validated but they
> > > should be fine.
> > >
> > > Userspace (radeonsi and radv) seems fine as well.
> > Does this series make sense?
>
> I think so, I haven't had a chance to go through this too closely yet,
> but amdgpu_vm_bo_map() is used by ROCm as well so we'd need to make
> sure that removing the checks in patch 1 wouldn't affect that path as
> well.  The changes in patch 2 look good.  Also, these patches are
> missing your SOB.
Indeed.  kfd_ioctl_alloc_memory_of_gpu, for example, does not validate
va.  I need to keep the validation in amdgpu_vm_bo_map for it at
least.  I guess it is more ideal for kfd_ioctl_alloc_memory_of_gpu to
validate, but I am not familiar with amdkfd..

I can keep the existing validations, and duplicate them in
amdgpu_gem_va_ioctl to cover AMDGPU_VA_OP_UNMAP/AMDGPU_VA_OP_CLEAR.

>
> Thanks,
>
> Alex
>
>
> Alex
