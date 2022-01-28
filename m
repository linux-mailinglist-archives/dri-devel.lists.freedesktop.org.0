Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2C4A013D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5092310E116;
	Fri, 28 Jan 2022 19:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F138A10E116
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643399861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmGbmOUvK4yjDAJwMxxJBb4Z/xtyIfwX7CGR6Y/DpC0=;
 b=LwtsHgmimcQzxAdD9Mew9ArQv7lQvZSy6LtCABAqGORwQnODviIWvR29LB9wHAUaJSd+DD
 XrlMmJlSxPCmlYSVtR7rGCQrsPrOuLqTniplxnk3SjiwKaFa4yx1P+QLqOoaLRa6SQ4Fkx
 Kr+ZNkBcjneyoqJQEHiNn1vAWTV7dd4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-nNMFNrkUMKSAAgTrc_8O-w-1; Fri, 28 Jan 2022 14:57:39 -0500
X-MC-Unique: nNMFNrkUMKSAAgTrc_8O-w-1
Received: by mail-qt1-f199.google.com with SMTP id
 c15-20020ac87dcf000000b002d0a849c0beso5364224qte.16
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gmGbmOUvK4yjDAJwMxxJBb4Z/xtyIfwX7CGR6Y/DpC0=;
 b=HGrDkeCxnOwg+fQu9ArGhSm1FCNHiU2CPhD1O3Jv+zgXoXKBqOOFfdXx2Kg8ofm31y
 FyGzkFsnAAEhYQDrhqlFc8abqrkERFkzKWnN6ZaUdA8A79js5HUTj75LAprZV/Db+uXb
 hd2cLHVXgNci7YujUqFuR2Ku3hS6CP73Jkkd/aarSwsBnp/HNfNv/sGOzfdzSjE8/1a0
 HcfITG4t5jshKFFABwE0ce9znNC7NUNLNlCSeyFWnxQdKA7xkQE4vthUccd6zrwWJeOW
 41gffsKHQks1lNb3Bw2eRd5ezW9/FMSN2eOrtg0+ze5sFhGNuG/74zOlECypeDzpx7GO
 b6eQ==
X-Gm-Message-State: AOAM533lpDwq4iPvBhPV6TIf9oU+MFmQiPHFWNyn6HcPlJVT1Ep8n8km
 ATE928GgkW0NMYHUDloa8P1npYE6brIK5bjXw4E8LQXTPKXCaeCVGD9iKkRNfMGiVkCcWFYcYBo
 3NzbKj28Vk58tDeE73kDX7ZWaojB7
X-Received: by 2002:a05:622a:34f:: with SMTP id
 r15mr7313863qtw.614.1643399859187; 
 Fri, 28 Jan 2022 11:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqqqWZZnT4Gi792LqHhFNNSJChpEPsdTeaK71iFNML++Ifr0P0KAn1UTLen+GqF1t7TRUCOg==
X-Received: by 2002:a05:622a:34f:: with SMTP id
 r15mr7313857qtw.614.1643399858977; 
 Fri, 28 Jan 2022 11:57:38 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id bl1sm3880139qkb.16.2022.01.28.11.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:57:38 -0800 (PST)
Message-ID: <9457f3e139bdf3938e829e1affd01300c11c67dc.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
From: Lyude Paul <lyude@redhat.com>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jan 2022 14:57:36 -0500
In-Reply-To: <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-01-28 at 14:53 -0500, Alex Deucher wrote:
> On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > Sigh-thank you for catching this - I had totally forgot about the umn.edu
> > ban.
> > I pushed this already but I will go ahead and send a revert for this
> > patch.
> > Will cc you on it as well.
> 
> This seems short-sighted.  If the patch is valid I see no reason to
> not accept it.  I'm not trying to downplay the mess umn got into, but
> as long as the patch is well scrutinized and fixes a valid issue, it
> should be applied rather than leaving potential bugs in place.
> 

Yeah - I sent a revert for this, but that was mainly just to make sure I
didn't cause problems with Linus or something like that. If it's all the same
I'd much rather just leave this patch in, as looking at the code the fix seems
completely valid.

> Alex
> 
> 
> > 
> > On Fri, 2022-01-28 at 11:18 +0100, Greg KH wrote:
> > > On Tue, Jan 25, 2022 at 12:58:55AM +0800, Zhou Qingyang wrote:
> > > > In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> > > > passed to memcpy(), which could lead to undefined behavior on failure
> > > > of kmalloc().
> > > > 
> > > > Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> > > > 
> > > > This bug was found by a static analyzer.
> > > > 
> > > > Builds with 'make allyesconfig' show no new warnings,
> > > > and our static analyzer no longer warns about this code.
> > > > 
> > > > Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> > > > "secure boot"")
> > > > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > > > ---
> > > > The analysis employs differential checking to identify inconsistent
> > > > security operations (e.g., checks or kfrees) between two code paths
> > > > and confirms that the inconsistent operations are not recovered in the
> > > > current function or the callers, so they constitute bugs.
> > > > 
> > > > Note that, as a bug found by static analysis, it can be a false
> > > > positive or hard to trigger. Multiple researchers have cross-reviewed
> > > > the bug.
> > > > 
> > > >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
> > > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > index 667fa016496e..a6ea89a5d51a 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr,
> > > > const
> > > > char *name, int ver,
> > > > 
> > > >         hsfw->imem_size = desc->code_size;
> > > >         hsfw->imem_tag = desc->start_tag;
> > > > -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> > > > -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> > > > -
> > > > +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> > > > GFP_KERNEL);
> > > >         nvkm_firmware_put(fw);
> > > > -       return 0;
> > > > +       if (!hsfw->imem)
> > > > +               return -ENOMEM;
> > > > +       else
> > > > +               return 0;
> > > >  }
> > > > 
> > > >  int
> > > > --
> > > > 2.25.1
> > > > 
> > > 
> > > As stated before, umn.edu is still not allowed to contribute to the
> > > Linux kernel.  Please work with your administration to resolve this
> > > issue.
> > > 
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

