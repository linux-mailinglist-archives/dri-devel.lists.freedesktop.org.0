Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B8D3D3C43
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 17:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020AF6FB92;
	Fri, 23 Jul 2021 15:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A703E6FB92
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627053356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hg7Wgll5Dqrto/c+cLJ/aZ8SYqDsqKJnk73SqfFyHqc=;
 b=fK3be8SkaWr/YhEko135ewzdb4KTwsW2WDb+qGEmtoBXGItPAh3efTUnDYcbF+EQm7Lm/J
 tIqZmLFHjVQQcdqcNccTyIj7ZHDRCZrDpkgO3XUCUV5ev/fprFgn8/EnfjfIMXf6z+1QvI
 C26NVxnG0gU9Ol4l+onk6WlP3J8q0/4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-q1ZALtPWPImbzSNRpL_SIA-1; Fri, 23 Jul 2021 11:15:55 -0400
X-MC-Unique: q1ZALtPWPImbzSNRpL_SIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f10-20020a7bcc0a0000b0290229a389ceb2so1531208wmh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hg7Wgll5Dqrto/c+cLJ/aZ8SYqDsqKJnk73SqfFyHqc=;
 b=CBrY+nb6Ag/KxwrFSXgGwCC5myp1rWh1pIBvaBj1tDEPzbyM9M/BLYcApfDPqmdRNJ
 qyfCPHaQ5zgI8O/j6QGJ3vM35B/vErK9lm8zQMthQvTUod6hW7KeRDlbPYnuxGGBQD3S
 GrRUs1vaxC1rt7WrXdS7IF7iJeupKD3vgcYb7OS0cjp0hKReSwjjde4sl27ELsku9BXW
 4bwCC0lAZW6FhcgVVgTqb6DmlBer8w0W1ML3no9Qqnfili6A9LNCUF2TQNkewWbOyHHu
 LnCT3mVWGzuvVtQg6D6UgpkgJfwwKNkqeAttQLMJWOii0n3iNeMggdh/N2hLHvslMNkl
 xucA==
X-Gm-Message-State: AOAM5323zA4yzRLR6631eCSfq3d7Rc5xlI3PJOr9MY0v2xmxNkafS3IF
 2yfdA69LuPYxol0HstZDib+LeL9UgU4GNNAE7pjwYoTJZeDwMEfnfKCswl390SYroPTUJkQmKNb
 dmMRROfWdUTU1/P7IGuA61OefhV1D7msht5XwjGWc4cvu
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr5053745wmk.1.1627053354281; 
 Fri, 23 Jul 2021 08:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY8WT3or1Lwpu7iDbVDMw0gke7BYDmxM+rPUnWUEewCC1YlfLrsOiH2H5OFIGSgEJGHI7Q/9Go9PH9zpc3t5c=
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr5053718wmk.1.1627053354043; 
 Fri, 23 Jul 2021 08:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091534.1730564-1-arnd@kernel.org>
 <a618e29a-e4b7-bda4-a3e0-7dfd67d64e92@infradead.org>
In-Reply-To: <a618e29a-e4b7-bda4-a3e0-7dfd67d64e92@infradead.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 23 Jul 2021 17:15:43 +0200
Message-ID: <CACO55tvQoCnjQWRJhrJ+8TzY5MuDDSUSnwd5AU8G1qsQYCSCBg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 5:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 7/23/21 2:15 AM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When the backlight support is disabled, the driver fails to build:
> >
> > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouveau_connector' has no member named 'backlight'
> >  1665 |         struct nouveau_backlight *backlight = nv_connector->backlight;
> >       |                                                           ^~
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of undefined type 'struct nouveau_backlight'
> >  1670 |         if (backlight && backlight->uses_dpcd) {
> >       |                                   ^~
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of undefined type 'struct nouveau_backlight'
> >  1671 |                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> >       |                                                                ^~
> >
> > The patch that introduced the problem already contains some #ifdef
> > checks, so just add another one that makes it build again.
> >
> > Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index 093e1f7163b3..fcf53e24db21 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -1659,20 +1659,23 @@ static void
> >  nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
> >  {
> >       struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
> > -     struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> >       struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
> >       struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
> > -     struct nouveau_backlight *backlight = nv_connector->backlight;
> >       struct drm_dp_aux *aux = &nv_connector->aux;
> > -     int ret;
> >       u8 pwr;
> >
> > +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> > +     struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> > +     struct nouveau_backlight *backlight = nv_connector->backlight;
> > +
> >       if (backlight && backlight->uses_dpcd) {
> > -             ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> > +             int ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> > +
> >               if (ret < 0)
> >                       NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
> >                                nv_connector->base.base.id, nv_connector->base.name, ret);
> >       }
> > +#endif
> >
> >       if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
> >               int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
> >
>
> Hm, only Lyude Paul replied to this patch:
>
> https://lore.kernel.org/lkml/20210714171523.413-1-rdunlap@infradead.org/
>

what's actually the use case of compiling with
CONFIG_DRM_NOUVEAU_BACKLIGHT=n anyway?

>
>
> --
> ~Randy
>

