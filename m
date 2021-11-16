Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D90452FEC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 12:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C16E9EF;
	Tue, 16 Nov 2021 11:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6E26E9EF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637060959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HL9hhLdIrLyUpBuE4w+BC97fd9zpve2OyGyAHsqNBwE=;
 b=DEC4tYVqVE97FFFuwOk91/GtZN1xD2nGcA0K3Pfuk1kN83eX2c4qMIzAW7FqXsitywfPFR
 H4xhqjlKnjY7xGm92W1Rm65P3Kyxac4+XFeorqFwi0zsWI4vERAMhuh86lZoQ4TZo1a/qQ
 0N9Cy+lkzXFvKtQF+SAA9+GJt7vGh7U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-pL3KMUUjMYi8OOIttwRmAA-1; Tue, 16 Nov 2021 06:09:18 -0500
X-MC-Unique: pL3KMUUjMYi8OOIttwRmAA-1
Received: by mail-wr1-f71.google.com with SMTP id
 y10-20020adffa4a000000b0017eea6cb05dso4396443wrr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 03:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HL9hhLdIrLyUpBuE4w+BC97fd9zpve2OyGyAHsqNBwE=;
 b=ghi7UGHSoZ1uNN1+TIWxL6s4TQSOvhbInWT3YtB6B23bmL6FkG1o1xQYBFQ37EQzZ2
 AOwhqx1NXVXJ3II88HiobaIqityBXpakpXIItrX/Y1M0z2w6qJL57odEi5sfFBioqyKV
 lHrdrsPlpaAfqsLl/TeAMdfx0Wcfierdqi24BQoChCqYsAFpFlBkAKAI/pIHYj0yAZ+g
 eTGTo3c1cEFerLuGGUo0DST6fVejqFoMWWDENXAEYLIH0HkJUZBY1p6thc2HERxWh36f
 I0KHKzMQZlhzDEUreVHT6Q27raAc7QaulRglWmxBgd2TTfsLaiSIKMM2zlUx0vXjCP+j
 c8/Q==
X-Gm-Message-State: AOAM532hC5JIIFVOS6XktQn0/yVj7iby4arAdhfOdmNxP1AbpZyBUVKb
 pLv1cao3xXaRi4lE001Fb7qdLekHI4HHiuDqQ5Wrfa0y3gDlIELCBx+EClIhY3KneXbZdsWZrUg
 zN76CjzEmRoVUZhnK0HBnMtPUOq46CljhYao5Tar5Fwfq
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr8196477wrm.229.1637060956897; 
 Tue, 16 Nov 2021 03:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTgah4x2G9O8O+iUz5EmWC3uhlRWC07X48xzTEYzOUA98ZreV80VeBn9mcy5hBafA5uvas47+J9y5b040RUo4=
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr8196441wrm.229.1637060956649; 
 Tue, 16 Nov 2021 03:09:16 -0800 (PST)
MIME-Version: 1.0
References: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
 <CACO55tuDQ9UC2rr=_Hsowvujk49oNK1zWfHj3jMnhEqsTAnh0Q@mail.gmail.com>
 <CABvMjLSFLpG4=+tE3Sr2wfRsEuKLXMm++Xx+JNmA8YXptgzkmw@mail.gmail.com>
In-Reply-To: <CABvMjLSFLpG4=+tE3Sr2wfRsEuKLXMm++Xx+JNmA8YXptgzkmw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 16 Nov 2021 12:09:05 +0100
Message-ID: <CACO55tu5V1pF-Ox937Auq6vSreFTfz3gkaz0zg6Zk+ydyVpZwg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/core: fix the uninitialized use in
 nvkm_ioctl_map()
To: Yizhuo Zhai <yzhai003@ucr.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 6:58 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
>
> Hi Karol:
> Thanks for the feedback, the patch might be too old to apply to the
> latest code tree. Let me check and get back to you soon.
>

sorry, that's not what I meant. It used whitespaces instead of tabs
and the headers were also a bit broken. I just suspect that when
sending it something went wrong or so.

> On Sat, Nov 13, 2021 at 12:22 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > something seems to have messed with the patch so it doesn't apply correctly.
> >
> > On Thu, Jun 17, 2021 at 9:39 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
> > >
> > > In function nvkm_ioctl_map(), the variable "type" could be
> > > uninitialized if "nvkm_object_map()" returns error code,
> > > however, it does not check the return value and directly
> > > use the "type" in the if statement, which is potentially
> > > unsafe.
> > >
> > > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > index d777df5a64e6..7f2e8482f167 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
> > >                 ret = nvkm_object_map(object, data, size, &type,
> > >                                       &args->v0.handle,
> > >                                       &args->v0.length);
> > > +               if (ret)
> > > +                       return ret;
> > >                 if (type == NVKM_OBJECT_MAP_IO)
> > >                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
> > >                 else
> > > --
> > > 2.17.1
> > >
> >
>
>
> --
> Kind Regards,
>
> Yizhuo Zhai
>
> Computer Science, Graduate Student
> University of California, Riverside
>

