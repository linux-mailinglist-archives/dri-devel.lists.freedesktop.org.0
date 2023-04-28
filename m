Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554636F1990
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C1510E7D9;
	Fri, 28 Apr 2023 13:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE71A10E7D9;
 Fri, 28 Apr 2023 13:31:45 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6a5dd070aa1so3840262a34.3; 
 Fri, 28 Apr 2023 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682688704; x=1685280704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjkfMeDN5MElQoz8pTsP+XGTEHdi6FRFZYxvJHVi3ac=;
 b=FDeDMqBwExbEym6j6TOk37nY9oI4HncB9PyjAK3xsu85s//1YumEwNM6XHMpBiJaTl
 LIcOQoKJF3duQpQ4fi3MUuNe95JzAdbMC+jaDaenqC9vQQ1PkPeCQDxUORlr4jph7+mF
 aeh4W4qQGGJCNLbzlh8+cRDwOptfjIM4q4M1u5OCET/NL/eBuHsz2HgpROszr0KEGVox
 XSGj4sSLwyz5aSOVxxH6xSfd0oTKHk67mW+/DdbNEIUn2vRkkBoWq+38UrBLH0AHIwhl
 qxH1tfTR+iPiFkm6BnPOWuyjX76DWygTZTpasvFWXmgnhAxOU2daWz5NAHvLmcPA197T
 7mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688704; x=1685280704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjkfMeDN5MElQoz8pTsP+XGTEHdi6FRFZYxvJHVi3ac=;
 b=DkOf2aRe7wqK5+v1v51QcWs4474qMWVQZrfuBleW6zBYOykx1dAg3i9WQVMilxZ/r8
 m2NwrkcKyy/L+VEe+O+32+cZuLVwd7uJTa41JcIq6jR7bRwpJzvuFkV7HuCrC2Od0R5l
 joKMWvUnZaARUYTBD3tW9g5LG7voFvi59NMCYUgl9Exh21peU1c12X8QYmOJlCczw6Fw
 CZcgbDWqCQhHt2VWt7oH4tnClXRXynw+pjqRf+YD0389TpxSR4m14Sg0uUQlO3QwCAuz
 6T1MB+fpJbhD1Odj5nSmVUCbJnT870YvL+nOKj5dpsB6ifaGBKWoRh1S2iBmSAibI30o
 ekGA==
X-Gm-Message-State: AC+VfDwdEC7McOa4izHWV90QG17XmGooAt/dNeKP1HbVAHATosNsReXD
 76i+E8a+Add6U+ch80bKv8TXbzOnh5Jzh3g9AXk=
X-Google-Smtp-Source: ACHHUZ7yvFYc1g1/6ZrWu+yC981EbH+g9hDzh8IJ1jVWuHgi19JnIS7N2v3hh/Wbl3/EX2jYloKqk69fVlW/msgtfZM=
X-Received: by 2002:a05:6870:51d5:b0:18e:ae84:7d87 with SMTP id
 b21-20020a05687051d500b0018eae847d87mr2369255oaj.53.1682688704128; Fri, 28
 Apr 2023 06:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230419122233.3440-1-hackyzh002@gmail.com>
 <CAF6NKda1Jy_wfxaVqWt-o75f1BO-o4JXHY9HS9_JtJ2FHztMmQ@mail.gmail.com>
 <CADnq5_MfynMAPU8c-Lq1X_dcDOdRpjW6i=m-Qo8zsZZ=dO-62w@mail.gmail.com>
 <CAF6NKdaxK_ZRkKRyWtm9Cj-8fNE9RptW3FjW-V39rmaHaCGHTw@mail.gmail.com>
In-Reply-To: <CAF6NKdaxK_ZRkKRyWtm9Cj-8fNE9RptW3FjW-V39rmaHaCGHTw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Apr 2023 09:31:33 -0400
Message-ID: <CADnq5_MrRC-htfEn3TbR7pbs4rRZJL=zW-3swuc8VZQyHW0DXw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
To: whitehat002 whitehat002 <hackyzh002@gmail.com>
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

these?
https://patchwork.freedesktop.org/series/116699/
https://patchwork.freedesktop.org/series/116695/

On Thu, Apr 27, 2023 at 8:45=E2=80=AFPM whitehat002 whitehat002
<hackyzh002@gmail.com> wrote:
>
> Alex,I have a question, why I don't see it on the
> https://patchwork.freedesktop.org/
>
> Alex Deucher <alexdeucher@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8827=
=E6=97=A5=E5=91=A8=E5=9B=9B 20:40=E5=86=99=E9=81=93=EF=BC=9A
> >
> > As per my prior reply, it has been applied.
> >
> > Thanks,
> >
> > Alex
> >
> > On Thu, Apr 27, 2023 at 8:39=E2=80=AFAM whitehat002 whitehat002
> > <hackyzh002@gmail.com> wrote:
> > >
> > > hello
> > > What is the current status of this patch, has it been applied?
> > >
> > >
> > > hackyzh002 <hackyzh002@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8819=
=E6=97=A5=E5=91=A8=E4=B8=89 20:23=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > The type of size is unsigned int, if size is 0x40000000, there will
> > > > be an integer overflow, size will be zero after size *=3D sizeof(ui=
nt32_t),
> > > > will cause uninitialized memory to be referenced later.
> > > >
> > > > Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_cs.c
> > > > index 08eced097..89bcacc65 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > > > @@ -192,7 +192,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_par=
ser *p,
> > > >         uint64_t *chunk_array_user;
> > > >         uint64_t *chunk_array;
> > > >         uint32_t uf_offset =3D 0;
> > > > -       unsigned int size;
> > > > +       size_t size;
> > > >         int ret;
> > > >         int i;
> > > >
> > > > --
> > > > 2.34.1
> > > >
