Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF30A43259
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 02:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6267810E50E;
	Tue, 25 Feb 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ni7ysPaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BC110E50D;
 Tue, 25 Feb 2025 01:16:21 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5e0452f859cso7870126a12.2; 
 Mon, 24 Feb 2025 17:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740446179; x=1741050979; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=USud5gyYtWrU8U8QerFLgqPcIKFBmDezEDg0FlIDuDg=;
 b=Ni7ysPaPJY/XUicHQck9dJaT6OdHG0xJuM+fr2NDpFQJRqmmYqYFoG/mOCEviRONfX
 mmgF37ATt+fxRkzoGLymRGJZWXmXTwfRV2H+lX3gXBwg8E1xn5nCf06rTJ19o/cZ0fDa
 KpJlrKNEirNfgzAi9zy5AQ3B9YLQvXW2pEKcXrGSirmNFq0VOb2zfdGcsLWs0VzdKgF3
 FcmYj2+dfMVv9PIjMgsxXbL8vPUtGRQtgOJAMXwM9P56SkUAtuoZL7ISGwdlRmma14iX
 63u33jJ7+A+D0lhqgoFThOXEOz1/Ni2G1qGdJSljVdpYuwBw5I0Py+nPXRNI7x3GuVKc
 4sIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740446179; x=1741050979;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=USud5gyYtWrU8U8QerFLgqPcIKFBmDezEDg0FlIDuDg=;
 b=qQzP7OshlGNLzbStuv6YUyXBuyDsk4pAIsjBXutkqHHk6aqIRdx5GrqpoobD5kgDz4
 QExQrAsCvPd5wHXJPdr8Ekcpnkh539OmK8BKMzywKCrGGrEQfgAe2aL73gYu474MpYkm
 NihcINnJjDVXpm9Ai0pBeys2MWLiXW4lpwfvj/zT73tct/n+J9nIwyvbDP/4BuuTWFhg
 flAq4Oyr+XBXOo/tcxS++eEve56KND3w5gbD7mRUi/2jKoelx8fNSz4w3hjgAf/lou4K
 phU/FXWWyyvEbIqEHhb6Ea64Se4zT8yvFaIjdUFE45/W+oRUkUeIzy0ZE46FfmhDqWdR
 sdeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPHHyR+GIptzNbjM7iCgGYLKlmYJ+QmIHqPIgxJPc8cWCtArmdVj35y+cnkX2YvL3r0Ia4baetsw==@lists.freedesktop.org,
 AJvYcCWMSwl//o1OR+MnBkEVGf4vjtGHQrxT3IB/WP0zVdD0HYifNJ9wh03456EFNxsaRH6PkQzLaZoF7Qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyWRnRG/Th/QNSrItJ91VHALJsYCbEP41oqMY/XElW5tpP7MGC
 xYZfwuAqaa+L8LHAJdBcAwTzsltTBs9YZM4actONPoCoqQRPVcMV9Vzcd7hSOmWjHGuCxt+VoVA
 Txh+olRLFd9A2HoqCvJJufk6NuiA=
X-Gm-Gg: ASbGnctLfS75J9O6n49Y6bid+D1OPv1+5a+xunV6XX+CG//PmN9g7/OTy1cvIcpuEnQ
 MgtLeGbxRe/8xAi1DSjKs16+k4DfPPkkuASY7ehXKBeBsqLpoxvYW8HvJQ9y8HB9mxJPQgn+RON
 SHCFSHdw==
X-Google-Smtp-Source: AGHT+IF0RS4ftxUi/5gsMlDTZ97MqhoilTR5nbgQvR9Hbq3pJnw0GQ+UCMGT6Y+mJn5iC29yoSvinQroVFNzfU+X1OE=
X-Received: by 2002:a17:907:9724:b0:ab7:851d:4718 with SMTP id
 a640c23a62f3a-abc09c27044mr1736963766b.36.1740446179223; Mon, 24 Feb 2025
 17:16:19 -0800 (PST)
MIME-Version: 1.0
References: <Z6xjZhHxRp4Bu_SX@kspp> <Z69UdL9zaCINQSFC@cassiopeiae>
In-Reply-To: <Z69UdL9zaCINQSFC@cassiopeiae>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 25 Feb 2025 11:16:07 +1000
X-Gm-Features: AWEUYZmgRiwQFNtUHE3LYO3HnyBJ0zVgwbRvgZnt3tdjjXgXcXdwfVxCgBec9ww
Message-ID: <CAPM=9twgrjQdNCrnK2gXMckqDHRjBAwnCKx4HwAfty-Q6VZrig@mail.gmail.com>
Subject: Re: [PATCH][next] drm/nouveau: Avoid multiple
 -Wflex-array-member-not-at-end warnings
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 15 Feb 2025 at 00:34, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed, Feb 12, 2025 at 07:31:26PM +1030, Gustavo A. R. Silva wrote:
> > -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> > getting ready to enable it, globally.
> >
> > So, in order to avoid ending up with flexible-array members in the
> > middle of other structs, we use the `struct_group_tagged()` helper
> > to separate the flexible arrays from the rest of the members in the
> > flexible structures. We then use the newly created tagged `struct
> > nvif_ioctl_v0_hdr` and `struct nvif_ioctl_mthd_v0_hdr` to replace the
> > type of the objects causing trouble in multiple structures.
> >
> > We also want to ensure that when new members need to be added to the
> > flexible structures, they are always included within the newly created
> > tagged structs. For this, we use `static_assert()`. This ensures that the
> > memory layout for both the flexible structure and the new tagged struct
> > is the same after any changes.
> >
> > So, with these changes, fix the following warnings:
> > drivers/gpu/drm/nouveau/nvif/object.c:60:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > drivers/gpu/drm/nouveau/nvif/object.c:233:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > drivers/gpu/drm/nouveau/nvif/object.c:214:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > drivers/gpu/drm/nouveau/nvif/object.c:152:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > drivers/gpu/drm/nouveau/nvif/object.c:138:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > drivers/gpu/drm/nouveau/nvif/object.c:104:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > drivers/gpu/drm/nouveau/nouveau_svm.c:83:35: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > drivers/gpu/drm/nouveau/nouveau_svm.c:82:30: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> >
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> @Faith, Karol: Can I get an ACK from mesa for this one?

If we do reimport this to userspace we will have to figure it out, but for now,

Acked-by: Dave Airlie <airlied@redhat.com>

>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvif/ioctl.h | 32 +++++++++++++-------
> >  drivers/gpu/drm/nouveau/nouveau_svm.c        |  4 +--
> >  drivers/gpu/drm/nouveau/nvif/object.c        | 12 ++++----
> >  3 files changed, 29 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
> > index e825c8a1d9ca..00015412cb3e 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
> > @@ -3,25 +3,30 @@
> >  #define __NVIF_IOCTL_H__
> >
> >  struct nvif_ioctl_v0 {
> > -     __u8  version;
> > +     /* New members MUST be added within the struct_group() macro below. */
> > +     struct_group_tagged(nvif_ioctl_v0_hdr, __hdr,
> > +             __u8  version;
> >  #define NVIF_IOCTL_V0_SCLASS                                               0x01
> >  #define NVIF_IOCTL_V0_NEW                                                  0x02
> >  #define NVIF_IOCTL_V0_DEL                                                  0x03
> >  #define NVIF_IOCTL_V0_MTHD                                                 0x04
> >  #define NVIF_IOCTL_V0_MAP                                                  0x07
> >  #define NVIF_IOCTL_V0_UNMAP                                                0x08
> > -     __u8  type;
> > -     __u8  pad02[4];
> > +             __u8  type;
> > +             __u8  pad02[4];
> >  #define NVIF_IOCTL_V0_OWNER_NVIF                                           0x00
> >  #define NVIF_IOCTL_V0_OWNER_ANY                                            0xff
> > -     __u8  owner;
> > +             __u8  owner;
> >  #define NVIF_IOCTL_V0_ROUTE_NVIF                                           0x00
> >  #define NVIF_IOCTL_V0_ROUTE_HIDDEN                                         0xff
> > -     __u8  route;
> > -     __u64 token;
> > -     __u64 object;
> > +             __u8  route;
> > +             __u64 token;
> > +             __u64 object;
> > +     );
> >       __u8  data[];           /* ioctl data (below) */
> >  };
> > +static_assert(offsetof(struct nvif_ioctl_v0, data) == sizeof(struct nvif_ioctl_v0_hdr),
> > +           "struct member likely outside of struct_group()");
> >
> >  struct nvif_ioctl_sclass_v0 {
> >       /* nvif_ioctl ... */
> > @@ -51,12 +56,17 @@ struct nvif_ioctl_del {
> >  };
> >
> >  struct nvif_ioctl_mthd_v0 {
> > -     /* nvif_ioctl ... */
> > -     __u8  version;
> > -     __u8  method;
> > -     __u8  pad02[6];
> > +     /* New members MUST be added within the struct_group() macro below. */
> > +     struct_group_tagged(nvif_ioctl_mthd_v0_hdr, __hdr,
> > +             /* nvif_ioctl ... */
> > +             __u8  version;
> > +             __u8  method;
> > +             __u8  pad02[6];
> > +     );
> >       __u8  data[];           /* method data (class.h) */
> >  };
> > +static_assert(offsetof(struct nvif_ioctl_mthd_v0, data) == sizeof(struct nvif_ioctl_mthd_v0_hdr),
> > +           "struct member likely outside of struct_group()");
> >
> >  struct nvif_ioctl_map_v0 {
> >       /* nvif_ioctl ... */
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> > index b4da82ddbb6b..fc64c3d3169e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> > @@ -79,8 +79,8 @@ struct nouveau_svm {
> >  #define SVM_ERR(s,f,a...) NV_WARN((s)->drm, "svm: "f"\n", ##a)
> >
> >  struct nouveau_pfnmap_args {
> > -     struct nvif_ioctl_v0 i;
> > -     struct nvif_ioctl_mthd_v0 m;
> > +     struct nvif_ioctl_v0_hdr i;
> > +     struct nvif_ioctl_mthd_v0_hdr m;
> >       struct nvif_vmm_pfnmap_v0 p;
> >  };
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
> > index 0b87278ac0f8..70af63d70976 100644
> > --- a/drivers/gpu/drm/nouveau/nvif/object.c
> > +++ b/drivers/gpu/drm/nouveau/nvif/object.c
> > @@ -57,7 +57,7 @@ int
> >  nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
> >  {
> >       struct {
> > -             struct nvif_ioctl_v0 ioctl;
> > +             struct nvif_ioctl_v0_hdr ioctl;
> >               struct nvif_ioctl_sclass_v0 sclass;
> >       } *args = NULL;
> >       int ret, cnt = 0, i;
> > @@ -101,7 +101,7 @@ int
> >  nvif_object_mthd(struct nvif_object *object, u32 mthd, void *data, u32 size)
> >  {
> >       struct {
> > -             struct nvif_ioctl_v0 ioctl;
> > +             struct nvif_ioctl_v0_hdr ioctl;
> >               struct nvif_ioctl_mthd_v0 mthd;
> >       } *args;
> >       u32 args_size;
> > @@ -135,7 +135,7 @@ void
> >  nvif_object_unmap_handle(struct nvif_object *object)
> >  {
> >       struct {
> > -             struct nvif_ioctl_v0 ioctl;
> > +             struct nvif_ioctl_v0_hdr ioctl;
> >               struct nvif_ioctl_unmap unmap;
> >       } args = {
> >               .ioctl.type = NVIF_IOCTL_V0_UNMAP,
> > @@ -149,7 +149,7 @@ nvif_object_map_handle(struct nvif_object *object, void *argv, u32 argc,
> >                      u64 *handle, u64 *length)
> >  {
> >       struct {
> > -             struct nvif_ioctl_v0 ioctl;
> > +             struct nvif_ioctl_v0_hdr ioctl;
> >               struct nvif_ioctl_map_v0 map;
> >       } *args;
> >       u32 argn = sizeof(*args) + argc;
> > @@ -211,7 +211,7 @@ void
> >  nvif_object_dtor(struct nvif_object *object)
> >  {
> >       struct {
> > -             struct nvif_ioctl_v0 ioctl;
> > +             struct nvif_ioctl_v0_hdr ioctl;
> >               struct nvif_ioctl_del del;
> >       } args = {
> >               .ioctl.type = NVIF_IOCTL_V0_DEL,
> > @@ -230,7 +230,7 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
> >                s32 oclass, void *data, u32 size, struct nvif_object *object)
> >  {
> >       struct {
> > -             struct nvif_ioctl_v0 ioctl;
> > +             struct nvif_ioctl_v0_hdr ioctl;
> >               struct nvif_ioctl_new_v0 new;
> >       } *args;
> >       int ret = 0;
> > --
> > 2.43.0
> >
