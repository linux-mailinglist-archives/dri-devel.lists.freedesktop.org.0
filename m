Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A493438CF77
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B699A6F910;
	Fri, 21 May 2021 20:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A4E6F90E;
 Fri, 21 May 2021 20:58:05 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so8681130oty.7; 
 Fri, 21 May 2021 13:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ab85Wj/pv/eyNCl9jj3/qpptG4tumUbJBe7Uftmergk=;
 b=DdprPYDEm5sNMdFVAXYdEMFrMv/Kiefs/9C+4QjFLvB8QUnGZbIUG3pRVi1U/IPHac
 49eUuSEqNHAgcpRgMKSnzzbhMjpsUgqMNscLpk4Bs9g5EOCfc6vMVciTzFeOi/tV0KRj
 vIsz9qHhNPT0nWQK0wsGkegXgR5jNtt/2dkWH1lGZO91/IDIb01+2nPAJJVvGrDhAOmV
 10moBR3buVC126UWuf8DQ15RzgkJM0DVply5vvzDvBcPt5I1M6UHVSGb4G1PP/SycFCL
 aDolkPD45t5HKqOuCaUKlLDhWquxw3YTBspd2tSdcdZluA9pA5D7dha+HI3q2pJKgIgv
 7crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ab85Wj/pv/eyNCl9jj3/qpptG4tumUbJBe7Uftmergk=;
 b=nnOO5UBIdmVYZKm2r51PMYJ9LPs7Mdidni5Toxv9+R+RyF9ZrjoOmPXqIi0HjRgHOn
 tUJ5lKPdN5ItIsgV96/2cBlp7aHoEI/SqxiVYc6eVRfszcukB5NbhkU5by4LVZfm1Ot4
 S8Nv/FeScZZ3mu5188YyvuVgo1ra7YiWY0ovBm1lrqHUC1NMdojccMd9A0lkemDfhF8g
 4UyItQ07GwWLgg7OM7YZFQNtOTgNYL7uVtsi1yGNnJbb4+Td6h1y9coLn42Oz/oT+LPS
 6rX+5B/lzHFi8L2hsQNsLu7NNo2fPt09arVNGM2JRi2HNeEljZHQooiZxGlViVi8AjIm
 9i4w==
X-Gm-Message-State: AOAM530TRpr7AbvvsTLeHjYAfzgc1R19Xlmn7jzH5e5t0oWGmkV3DInI
 /hwVNWXVE29QQ8TpP64veMklSofAVYwRSJ8XeAQ=
X-Google-Smtp-Source: ABdhPJx3V+DsXUMXDdny3yj3qLa/FEDVRdL1jKpJIxgqkQN/OddU4parCfOQx7J2uD/2WkJI/ItEpc7QspYOIvQE4Rw=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr10018862otl.311.1621630684620; 
 Fri, 21 May 2021 13:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <1621590628-75988-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <09e40764-1d3a-0dfe-b278-5b5ce04670a9@gmail.com>
In-Reply-To: <09e40764-1d3a-0dfe-b278-5b5ce04670a9@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 May 2021 16:57:53 -0400
Message-ID: <CADnq5_M0nuj60jP04_3Rhx+piQLbfcCmksEkFePAreHjwButSA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix inconsistent indenting
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
 Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, May 21, 2021 at 9:35 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 21.05.21 um 11:50 schrieb Jiapeng Chong:
> > Eliminate the follow smatch warning:
> >
> > drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:449
> > sdma_v5_0_ring_emit_mem_sync() warn: inconsistent indenting.
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 13 ++++++-------
> >   1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/a=
md/amdgpu/sdma_v5_0.c
> > index 75d7310..c45e1b0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> > @@ -440,20 +440,19 @@ static void sdma_v5_0_ring_emit_ib(struct amdgpu_=
ring *ring,
> >    */
> >   static void sdma_v5_0_ring_emit_mem_sync(struct amdgpu_ring *ring)
> >   {
> > -    uint32_t gcr_cntl =3D
> > -                 SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV=
 |
> > -                     SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GL=
K_INV |
> > -                     SDMA_GCR_GLI_INV(1);
> > +     uint32_t gcr_cntl =3D SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_G=
CR_GLM_INV |
> > +                         SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GC=
R_GLK_INV |
> > +                         SDMA_GCR_GLI_INV(1);
> >
> >       /* flush entire cache L0/L1/L2, this can be optimized by performa=
nce requirement */
> >       amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_GCR_REQ));
> >       amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD1_BASE_VA_31_7(0)=
);
> >       amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD2_GCR_CONTROL_15_=
0(gcr_cntl) |
> > -                     SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
> > +                       SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
> >       amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD3_LIMIT_VA_31_7(0=
) |
> > -                     SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr_c=
ntl >> 16));
> > +                       SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr=
_cntl >> 16));
> >       amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD4_LIMIT_VA_47_32(=
0) |
> > -                     SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
> > +                       SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
> >   }
> >
> >   /**
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
