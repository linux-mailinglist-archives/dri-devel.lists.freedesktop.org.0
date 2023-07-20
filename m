Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C775B3FD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 18:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E15710E16B;
	Thu, 20 Jul 2023 16:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C3210E5DB;
 Thu, 20 Jul 2023 16:16:53 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-564e4656fecso641559eaf.0; 
 Thu, 20 Jul 2023 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689869813; x=1690474613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zplp2bhBZky4Squ0pXFd83tGtm8GV3nyjQWPNcN7AR4=;
 b=JoSeKiDK56FbZFVZu7TXcmkrCwjHKQQTcKFPBSiXHsCe2e6GDwDWovtVfteYXy9uoD
 CHcizBbXkboZTck4mXhABMQhEAfo2W9kOPBA0GZgR1rWKaA4ePdZgyOPDbLxZlYvPVvr
 +yHCIgr4FiNvaV1akSw7nRgUVlYfmOmmlvxoS66bBXyyko5iL7rowG/hNQR1H96Xhjoz
 3j3BubVdze3zzP806rkwJlnvEVuTD4D3VIdboXKqjOtREhayseNsK1AijD3BXdcuSgO1
 /BHLCI+QuP6StkOJTUnfIS9SiR68TiaoiiB9qzmlq2gLh7tpNscDJfXg0SQBhheTBu/H
 on+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689869813; x=1690474613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zplp2bhBZky4Squ0pXFd83tGtm8GV3nyjQWPNcN7AR4=;
 b=Al4ENq4mXrrl+TQJXcXuh43GCVffqRKdHL62saYQhukm28MKCOPmxoLbWpqq0Z5sTX
 NOo4FcG+NLFP0dJ7VY7m1fPHOL7u4xrsUgs4WNh91q0OhKqrdczL1uRovC13jRISFqYN
 xVqDbNwK4jGZWagBZipw5ehg0/ZzbSCKUWWs9UIaF+WLQh+987bMXHfNrfhGD+txFPKX
 LEfeeq3zmmPDFpdvVVVOvmzB61EuttgASVxOi70kzJ8vFcnIUpZC59J8wpGZthRijyXg
 DWl/ybw68jUbutVy9LqRvEVnzZ2M00YW0mDj/gMhZriuPX0RFo8+lym5PvFwuV+h5d1Y
 IQ3A==
X-Gm-Message-State: ABy/qLacbS/dPHpXehLju1NHASNbzwnG9Q/cj5j809dw5fyxllrCSd29
 3lj7UCM1aLwiPngZSLOIZq8R5SR/jImdJzy4RZM=
X-Google-Smtp-Source: APBJJlHPxwpvLcmzxvpZCJXCQSqwyr4vo54qVf7FXwF/N1UobpcY3kT97pZ3uoP7mJHu7P/J+Z3+No/tVKkf/zN5hHE=
X-Received: by 2002:a4a:4101:0:b0:567:867e:8702 with SMTP id
 x1-20020a4a4101000000b00567867e8702mr2619535ooa.7.1689869812970; Thu, 20 Jul
 2023 09:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230720010514.54342-1-yang.lee@linux.alibaba.com>
 <9d8254b2-2e68-2e4a-055a-5afdb04bd115@infradead.org>
In-Reply-To: <9d8254b2-2e68-2e4a-055a-5afdb04bd115@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Jul 2023 12:16:41 -0400
Message-ID: <CADnq5_PL0umjvrPh3x3aM+HbZTrVqr+16C2J1eZ-P2U8aYYnAw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: Fix one kernel-doc comment
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: alexander.deucher@amd.com, Yang Li <yang.lee@linux.alibaba.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jul 19, 2023 at 9:27=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 7/19/23 18:05, Yang Li wrote:
> > Use colon to separate parameter name from their specific meaning.
> > silence the warning:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:793: warning: Function parame=
ter or member 'adev' not described in 'amdgpu_vm_pte_update_noretry_flags'
> >
> > Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_vm_pt.c
> > index 83e1923f6775..96d601e209b8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> > @@ -783,7 +783,7 @@ int amdgpu_vm_pde_update(struct amdgpu_vm_update_pa=
rams *params,
> >  /**
> >   * amdgpu_vm_pte_update_noretry_flags - Update PTE no-retry flags
> >   *
> > - * @adev - amdgpu_device pointer
> > + * @adev: amdgpu_device pointer
> >   * @flags: pointer to PTE flags
> >   *
> >   * Update PTE no-retry flags when TF is enabled.
>
> --
> ~Randy
