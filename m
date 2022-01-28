Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB854A0142
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6911910E239;
	Fri, 28 Jan 2022 19:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0257B10E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643399892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=coCa9J+GhEzNyejkCKSC7tpX70/70zSfnqE1h06XrJU=;
 b=Okr+mH46d3jI40+/t+hxlGTQbclv9sv0ItHRazV2XJWhvWZLN1Bk05/lLPx/wiEflFwOfW
 kRluS0b/rP0SsUPSCIloEyA2M6giSU9PGQJgSVpmXn+q9jvB+StMB+9DYouYfnc0mIVQsb
 nIB4Pw1tgvmx75BVMaqV8VRV5oOW9Hc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613--fbWLKotN5CwaBcGi1I1gA-1; Fri, 28 Jan 2022 14:58:08 -0500
X-MC-Unique: -fbWLKotN5CwaBcGi1I1gA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a1ca503000000b0035056b042deso3436920wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coCa9J+GhEzNyejkCKSC7tpX70/70zSfnqE1h06XrJU=;
 b=2G+lncSQOPIGMcXR3PYCEtDVZruhH5OLVv3NCVNVNpvQKrhqloZuU1Ezy8Fw9/txxe
 1fKPO81Y+Ss8bqzJcVTQDuGQ4njxtebDzF9I1ymqfxq+mdKFz7VoNcD6fdHo4WIENIHg
 fXPx1HMp3C5GYsS8cqq2V5yPmSCKDahPzKzeUI99B/IHfyuH5K1cRGhpR12coYVwyTeX
 H3bLveEC78ikfRnyV7TeJXn/4rru579d63WDVLsuZ5xcWmDGXhclj0crGattfe8eRdwZ
 KDGOVfq4IwuklpCWBnK0ujKoyPORlCfGCWFqnLqhXsjPr8YJFEy85kymfhw8mHpk9aFu
 pHRg==
X-Gm-Message-State: AOAM532Vd2/MZ/agK3QLE7w8k4DAhjMcCbqPiyE7lQluuMBm2n0P9DPI
 nGeircd4yMxi6iGXYn3hMmD0xNmYurRfJKOzD6K0hPbKLTF9BzoKsdLCOlOxTabMLe7to5ALaTj
 mXO2TBF28Ql6w7SjFXYCdAakcu/7+jcNVzwmauI/1XAXj
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr17301236wmi.74.1643399887649; 
 Fri, 28 Jan 2022 11:58:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzO0BXUM+1aQ82/ST9VCeZw7PtSnkB3W5IUl/VvfjMagzhYYe6iU+54S1WO7PVXjD+mUK3GvsW3MVLGJienj1g=
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr17301215wmi.74.1643399887368; 
 Fri, 28 Jan 2022 11:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
 <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
 <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
In-Reply-To: <CADnq5_MtMPNHbs92OMHEzvPYSHGt=nPJMdrny6Siuvj3SYTAXQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 28 Jan 2022 20:57:56 +0100
Message-ID: <CACO55tt4P+beifvS=jcDsfwybFynngc8DHLR0n3BseeDJNrHyw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 8:54 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Fri, Jan 28, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
> >
> > Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
> > I pushed this already but I will go ahead and send a revert for this patch.
> > Will cc you on it as well.
>
> This seems short-sighted.  If the patch is valid I see no reason to
> not accept it.  I'm not trying to downplay the mess umn got into, but
> as long as the patch is well scrutinized and fixes a valid issue, it
> should be applied rather than leaving potential bugs in place.
>
> Alex
>

Even though knowing that malicious code can be introduced via
perfectly fine looking patches, and sometimes one will never spot the
problem, this patch isn't all that bad tbh.

So should we reject patches out of "policies" or should we just be
extra careful? But not addressing the concerns as Greg pointed out is
also kind of a bad move, but also not knowing what the state of
resolving this mess is anyway.

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
> > > >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
> > > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > index 667fa016496e..a6ea89a5d51a 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > > > @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const
> > > > char *name, int ver,
> > > >
> > > >         hsfw->imem_size = desc->code_size;
> > > >         hsfw->imem_tag = desc->start_tag;
> > > > -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> > > > -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> > > > -
> > > > +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> > > > GFP_KERNEL);
> > > >         nvkm_firmware_put(fw);
> > > > -       return 0;
> > > > +       if (!hsfw->imem)
> > > > +               return -ENOMEM;
> > > > +       else
> > > > +               return 0;
> > > >  }
> > > >
> > > >  int
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > As stated before, umn.edu is still not allowed to contribute to the
> > > Linux kernel.  Please work with your administration to resolve this
> > > issue.
> > >
> >
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >
>

